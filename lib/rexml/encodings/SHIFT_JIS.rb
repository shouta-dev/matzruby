begin
	require 'uconv'

	module REXML
		module Encoding
			def to_shift_jis content
				Uconv::u8tosjis(content)
			end

			def from_shift_jis(str)
				Uconv::sjistou8(str)
			end
		end
	end
rescue LoadError
	raise "uconv is required for Japanese encoding support."
end
