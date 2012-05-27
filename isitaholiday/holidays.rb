module IsItAHoliday
  HOLIDAYS = {
    :cincodemayo => {
      :type => :month_day,
      :rules => {
        :month => 5,
        :day => 5
      },
      :name => 'Cinco de Mayo'
    },
    :halloween => {
      :type => :month_day,
      :rules => {
        :month => 10,
        :day => 31
      },
      :name => 'Halloween'
    },
    :memorial_day => {
      :type => :language,
      :rule => 'last monday',
      :reference => 'june 1st',
      :name => 'Memorial Day'
    },
    :thanksgiving => {
      :type => :language,
      :rule => '4th thursday in november',
      :name => 'Thanksgiving'
    },
    :christmas => {
      :type => :month_day,
      :rules => {
        :month => 12,
        :day => 25
      },
      :name => 'Christmas'
    }
  }
end