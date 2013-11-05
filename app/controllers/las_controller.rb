class LasController < InheritedResources::Base
	def index
    @lol = La.search(params[:search])
    @correo = Correo.new
    @reports = La.all

    @frecuencias = Hash.new(0)
    @reports.each {|u| @frecuencias[u.summoner] += 1 }
    @frecuencias = @frecuencias.sort_by {|a,b| b}
    @frecuencias.reverse!
    @frecuencias.each { |summoner, frecuencia|   }
    @users = La.all
 
  end

end
