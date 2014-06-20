From: Tushar Behera <tushar.b-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/2] ASoC: samsung: Extend snow driver to support MAX98091
Date: Fri, 20 Jun 2014 13:33:16 +0530
Message-ID: <1403251396-17487-2-git-send-email-tushar.b@samsung.com>
References: <1403251396-17487-1-git-send-email-tushar.b@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403251396-17487-1-git-send-email-tushar.b-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tiwai-l3A5Bk7waGM@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, trblinux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Peach-pi board has MAX98091 CODEC. Extend snow machine driver to support
this board.

Signed-off-by: Tushar Behera <tushar.b-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 Documentation/devicetree/bindings/sound/snow.txt |    1 +
 sound/soc/samsung/snow.c                         |    1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/snow.txt b/Documentation/devicetree/bindings/sound/snow.txt
index 678b191..e0b7a82 100644
--- a/Documentation/devicetree/bindings/sound/snow.txt
+++ b/Documentation/devicetree/bindings/sound/snow.txt
@@ -3,6 +3,7 @@ Audio Binding for Snow boards
 Required properties:
 - compatible : Can be one of the following,
 			"google,snow-audio-max98090" or
+			"google,snow-audio-max98091" or
 			"google,snow-audio-max98095"
 - samsung,i2s-controller: The phandle of the Samsung I2S controller
 - samsung,audio-codec: The phandle of the audio codec
diff --git a/sound/soc/samsung/snow.c b/sound/soc/samsung/snow.c
index 014c177..8bbd348 100644
--- a/sound/soc/samsung/snow.c
+++ b/sound/soc/samsung/snow.c
@@ -103,6 +103,7 @@ static int snow_probe(struct platform_device *pdev)
 
 static const struct of_device_id snow_of_match[] = {
 	{ .compatible = "google,snow-audio-max98090", },
+	{ .compatible = "google,snow-audio-max98091", },
 	{ .compatible = "google,snow-audio-max98095", },
 	{},
 };
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
