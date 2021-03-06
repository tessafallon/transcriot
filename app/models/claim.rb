  class Claim < ActiveRecord::Base
  # attr_accessible :claim_date, :incident_date, :resolution_date, :claim_number, :record_number, :incident_address, :incident_address_type, :total_claimed, :total_awarded

  has_many :people
  has_many :claim_examiners
  has_many :examiners, :through => :claim_examiners


  validates :incident_address_type,
    :inclusion => { :in => ["Home", "Workplace", "Other", "", nil],
    :message => "%{value} is not one of the stated options of home, workplace, or other."}

  def claimant
    Person.where(:claim_id=>self.id, :role=>"claimant").first
  end

  def claimant_attr(attribute)
    self.claimant.send(attribute.to_sym) if self.claimant
  end

  def update_claimant(person_params)
    person = self.claimant
    if person
      person.update_attributes(person_params)
    else
      person = Person.create(person_params)
    end
  end

  def update_examiner(examiner_params)
    unless examiner_params[:id].to_i == 0
      examiner = Examiner.find(examiner_params[:id])
      examiner.update_attributes(examiner_params)
      examiner.claims << self unless self.examiners.include? examiner
    else
      examiner = Examiner.new(examiner_params)
      examiner.claims << self
    end
    examiner.save
  end

  def first_examiner_attr(attribute)
    self.examiners.first.send(attribute.to_sym) if self.examiners.first
  end


end