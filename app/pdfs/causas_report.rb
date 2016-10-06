class CausasReport < Prawn::Document
	def initialize(causas)
		super()
		@totsal = 0
		@causas = causas
		header
		text_content
		table_content
		sumary
	end
	def header
		#This inserts an image in the pdf file and sets the size of the image
		#image "#{Rails.root}/app/assets/images/header.png", width: 530, height: 100
	end
	def text_content
		y_position = cursor - 50
		# The bounding_box takes the x and y coordinates for positioning its content and
		#some options to style it
		bounding_box([0, y_position], :width => 540, :height => 50) do
			text "Citizen", size: 15, style: :bold
			text "Listagem de Causas", size: 12, style: :bold
		end
	end
	def table_content
		table causa_rows do
			row(0).font_style = :bold
			self.header = true
			self.row_colors = ['DDDDDD', 'FFFFFF']
			self.column_widths = [90,200, 200, 50]
		end
	end
	def causa_rows
		[['id','titulo', 'descricao']] +
		@causas.map do |causa|
		[causa.id, causa.titulo, causa.descricao]
		end
	end

	def sumary
		@causas.each do |causa|
			@totsal += 1
		end

		y_position = cursor - 50
		bounding_box([0, y_position], :width => 540, :height => 50) do
			text "Numero de causas: #{@totsal} ", size: 15, style: :bold
		end
	end
end