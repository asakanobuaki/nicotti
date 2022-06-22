module ApplicationHelper
  def default_meta_tags
    {
      site: 'NICOTTI',
      title: '育成型喫煙管理アプリ',
      reverse: true,
      charset: 'utf-8',
      description: 'NICOTTIは減煙を目的とした喫煙管理アプリです。NICOTTIを育てながら喫煙を管理し健康を手に入れましょう！',
      keywords: 'NICOTTI, nicotti, ニコッチ, 喫煙, 喫煙管理, 減煙, タバコ',
      canonical: request.original_url,
      separator: ':',
      icon: [
        { href: image_url('favicon.png') },
        { href: image_url('favicon.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' }
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('twitter-card-img.jpg'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        image: image_url('twitter-card-img.jpg')
      }
    }
  end
end
