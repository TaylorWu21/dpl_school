class School < ActiveRecord::Base
	has_many :classrooms, dependent: :destroy
	#Dependent destroy will delete all record
	#in the has many association
	#THIS IS BEST PRACTICE
	has_one :address, dependent: :destroy

	#validations go here
	#second line of defense for bad data
	validates_presence_of :name #most used
	validates_uniqueness_of :name #most used
	#validates :name, inclusion: {in ['DLP', 'CodesSchool', 'DevMountain']}
	#size
	#length
	# validates :name, length: {minimum: 2, maximum: 50}
	#numericality
	# validates :year_built, numericality: {only_integer: true}
	#uniqueness

	before_create :default_year_built
	#callbacks go here
	private

	def default_year_built
		self.year_built = '2016' unless self.year_built
	end
end
