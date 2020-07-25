module GraphicsHelper
    def display_helper(result)
        count = 1
        str = ""
        result.each do |gif|
          if count == 1
            str << "<tr><td><img src = #{gif['images']['fixed_height_downsampled']['url']} ></td>"
          else
            str << "<td><img src = #{gif['images']['fixed_height_downsampled']['url']} ></td>"
          end
          if count == 3
            count = 0
            str << "</tr>"
          end
          count = count +1
        end
        str
      end
end
