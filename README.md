# docker-rmagick-ipafont

rmagick and ipafont installed docker container.


## Sample

```
docker run --rm -v $PWD:/work -ti manabu/rmagick:2.15.4 ruby sample.rb --src /work/no-date-0.png --dst  /work/with-date-0.png --text $(date
-Iseconds)
```

# 参考

[rubyで画像処理できるRMagickの紹介をするよ ヽ(ﾟｰﾟ*ヽ)(ﾉ*ﾟｰﾟ)ﾉわぁい - Qiita](http://qiita.com/scleen_x_x/items/14a80fd52e41dfcfb660)
