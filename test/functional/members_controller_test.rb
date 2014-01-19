require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  setup do
    @member = members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member" do
    assert_difference('Member.count') do
      post :create, member: { comment: @member.comment, id: @member.id, join_date: @member.join_date, name_en: @member.name_en, name_ja: @member.name_ja, name_ja_yomi: @member.name_ja_yomi, number: @member.number, status: @member.status }
    end

    assert_redirected_to member_path(assigns(:member))
  end

  test "should show member" do
    get :show, id: @member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @member
    assert_response :success
  end

  test "should update member" do
    put :update, id: @member, member: { comment: @member.comment, id: @member.id, join_date: @member.join_date, name_en: @member.name_en, name_ja: @member.name_ja, name_ja_yomi: @member.name_ja_yomi, number: @member.number, status: @member.status }
    assert_redirected_to member_path(assigns(:member))
  end

  test "should destroy member" do
    assert_difference('Member.count', -1) do
      delete :destroy, id: @member
    end

    assert_redirected_to members_path
  end
end
