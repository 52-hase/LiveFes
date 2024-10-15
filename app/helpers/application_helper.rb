module ApplicationHelper
  def default_meta_tags
    {
      site: "Live Fes",
      title: "音楽ライブ・フェスの余韻を共有できるサービス",
      reverse: true,
      charset: "utf-8",
      description: 'Live Fesでは、音楽ライブやフェスの"余韻"や"喪失感"を参加者同士で共有し、感想や思い出を語り合うことができます。',
      keywords: "音楽,ライブ,フェス,余韻,喪失感,共有",
      canonical: "https://www.live-fes.com/",
      separator: "|",
      og: {
        site_name: "Live Fes",
        title: "音楽ライブ・フェスの余韻を共有できるサービス",
        description: 'Live Fesでは、音楽ライブやフェスの"余韻"や"喪失感"を参加者同士で共有し、感想や思い出を語り合うことができます。',
        type: "website",
        url: "https://www.live-fes.com/",
        image: image_url("ogp.png"),
        local: "ja-JP"
      },
      twitter: {
        card: "summary_large_image",
        site: "@obvyamdrss",
        image: image_url("ogp.png")
      }
    }
  end
end
