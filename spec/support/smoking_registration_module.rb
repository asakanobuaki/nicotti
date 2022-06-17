module SmokingRegistrationModule
  def smoking_registration
    find('#js-smoking-buttom').click
    expect(page).to have_content('喫煙しますか?')
    find('.swal2-confirm').click
    find('.swal2-confirm').click
  end
end