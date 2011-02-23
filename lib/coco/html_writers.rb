module Coco

  # I prepare the directory for html files.
  class HtmlDirectory
    def initialize
      @coverage_dir = 'coverage'
      @css = File.join($COCO_PATH, 'template/coco.css')
    end
    
    def clean
      FileUtils.remove_dir @coverage_dir if File.exist? @coverage_dir
    end
    
    def setup
      FileUtils.makedirs @coverage_dir
      FileUtils.copy @css, @coverage_dir
    end
  end
  
  # I populate the html directory with files if any.
  class HtmlFilesWriter
  
    # @param [Hash] html_files Key is filename, value is html content
    def initialize html_files
      @html_files = html_files
      @html_dir = HtmlDirectory.new
    end
    
    def write
      @html_dir.clean
      if @html_files.size > 0
        @html_dir.setup
        write_each_file
      end
    end
    
    private
    
    def write_each_file
      @html_files.each do |filename, html|
        name = File.join('coverage', filename.sub(Dir.pwd, '').tr('/\\', '_') + '.html')
        FileWriter.write name, html
      end
    end
    
  end
  
  # I write one file.
  class FileWriter
    def FileWriter.write filename, content
      file = File.new(filename, "w")
      file.write content
      file.close
    end
  end
  
  # I build and write the html index.
  # @todo bad, class do 2 things !
  class HtmlIndexWriter
  
  end
  
end