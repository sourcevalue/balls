function hex_dump(buf)
      for i=1,math.ceil(#buf/16) * 16 do
         if (i-1) % 16 == 0 then io.write(string.format('%08X  ', i-1)) end
         io.write( i > #buf and '   ' or string.format('%02X ', buf:byte(i)) )
         if i %  8 == 0 then io.write(' ') end
         if i % 16 == 0 then io.write( buf:sub(i-16+1, i):gsub('%c','.'), '\n' ) end
      end
   end

   function hex_dump(buf)
      for byte=1, #buf, 16 do
         local chunk = buf:sub(byte, byte+15)
         io.write(string.format('%08X  ',byte-1))
         chunk:gsub('.', function (c) io.write(string.format('%02X ',string.byte(c))) end)
         io.write(string.rep(' ',3*(16-#chunk)))
         io.write(' ',chunk:gsub('%c','.'),"\n") 
      end
   end

   -- [first] begin dump at 16 byte-aligned offset containing 'first' byte
   -- [last] end dump at 16 byte-aligned offset containing 'last' byte
   function hex_dump(buf,first,last)
      local function align(n) return math.ceil(n/16) * 16 end
      for i=(align((first or 1)-16)+1),align(math.min(last or #buf,#buf)) do
         if (i-1) % 16 == 0 then io.write(string.format('%08X  ', i-1)) end
         io.write( i > #buf and '   ' or string.format('%02X ', buf:byte(i)) )
         if i %  8 == 0 then io.write(' ') end
         if i % 16 == 0 then io.write( buf:sub(i-16+1, i):gsub('%c','.'), '\n' ) end
         end
      end
