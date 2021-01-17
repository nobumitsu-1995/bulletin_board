const new_user = document.getElementById("new_user");
const login_user = document.getElementById("login_user");
const form = document.getElementById("user_form");
const subject = document.getElementById("exampleModalLabel")

new_user.addEventListener('click', () => {
  form.innerHTML = `
    <form class="text-center" action="/users" accept-charset="UTF-8" method="post"><input type="hidden" name="authenticity_token" value="o1oWsoby2pTW4EBdCf4Y_TBq_6t44kYTYOJrLAbUfO9JyCod69u7RHxfjsbxEm3zkuyyg1ZqxMF78BmRyl5o9g">
      <div class="modal-body">
        <label for="name">名前</label><br>
        <input type="text" name="name" id="name"><br>
        <label for="email">メールアドレス</label><br>
        <input type="text" name="email" id="email"><br>
        <label for="password">パスワード</label><br>
        <input type="text" name="password" id="password"><br>
        <label for="password_confirmation">※パスワードをもう一度入力してください。</label><br>
        <input type="text" name="password_confirmation" id="password_confirmation"><br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
        <input type="submit" name="commit" value="新規登録" class="btn btn-primary" data-disable-with="">
      </div>
    </form>
  `;
  subject.innerHTML = "新規登録"
});

login_user.addEventListener('click', () => {
  form.innerHTML = `
    <form class="text-center" action="/users/login" accept-charset="UTF-8" method="post"><input type="hidden" name="authenticity_token" value="EY2_h0n5ThHWBG_yhfmDtO5QHJ48mYvLpfUIZCBrvxD7H4MoJNAvwXy7oWl9Ffa6TNZRthIRCRm-53rZ7OGrCQ">
      <div class="modal-body">
        <label for="email">メールアドレス</label><br>
        <input type="text" name="email" id="email"><br>
        <label for="password">パスワード</label><br>
        <input type="text" name="password" id="password"><br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
        <input type="submit" name="commit" value="ログイン" class="btn btn-primary" data-data-dismiss="modal" data-disable-with="">
      </div>
    </form>
  `;
  subject.innerHTML = "ログイン"
});
