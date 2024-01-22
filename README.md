## github packagesへの公開（更新）手順  
1. イメージのビルド  
`docker image build --platform linux/amd64 . -t postgres13_including_pgbigm:latest`
   
2. アクセストークンの作成  
下記リンクから作成（repoの権限を付与しないため）  
https://github.com/settings/tokens/new?scopes=write:packages

3. 認証  
発行したアクセストークンを使用して、ログイン  
`export CR_PAT={PersonalAccessToken}`  
`echo $CR_PAT | docker login ghcr.io -u {username} --password-stdin`
   
4. タグを付け替える  
`docker tag postgres13_including_pgbigm ghcr.io/{公開先のorganization or username}/postgres13_including_pgbigm`

5. リポジトリにpush  
`docker push ghcr.io/{公開先のorganization or username}/postgres13_including_pgbigm`
