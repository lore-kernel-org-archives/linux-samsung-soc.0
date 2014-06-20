From: Tushar Behera <tushar.b-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/2] ASoC: max98090: Add max98091 compatible string
Date: Fri, 20 Jun 2014 13:33:15 +0530
Message-ID: <1403251396-17487-1-git-send-email-tushar.b@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tiwai-l3A5Bk7waGM@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, trblinux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Wonjoon Lee <woojoo.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Wonjoon Lee <woojoo.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

The MAX98091 CODEC is the same as MAX98090 CODEC, but with an extra
microphone. Existing driver for MAX98090 CODEC already has support
for MAX98091 CODEC. Adding proper compatible string so that MAX98091
CODEC can be specified from device tree.

Signed-off-by: Wonjoon Lee <woojoo.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Tushar Behera <tushar.b-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---

Picked from https://chromium-review.googlesource.com/#/c/184091/

 .../devicetree/bindings/sound/max98090.txt         |    2 +-
 sound/soc/codecs/max98090.c                        |    2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/max98090.txt b/Documentation/devicetree/bindings/sound/max98090.txt
index a5e63fa..c454e67 100644
--- a/Documentation/devicetree/bindings/sound/max98090.txt
+++ b/Documentation/devicetree/bindings/sound/max98090.txt
@@ -4,7 +4,7 @@ This device supports I2C only.
 
 Required properties:
 
-- compatible : "maxim,max98090".
+- compatible : "maxim,max98090" or "maxim,max98091".
 
 - reg : The I2C address of the device.
 
diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index f5fccc7..4f5534d 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2460,12 +2460,14 @@ static const struct dev_pm_ops max98090_pm = {
 
 static const struct i2c_device_id max98090_i2c_id[] = {
 	{ "max98090", MAX98090 },
+	{ "max98091", MAX98091 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max98090_i2c_id);
 
 static const struct of_device_id max98090_of_match[] = {
 	{ .compatible = "maxim,max98090", },
+	{ .compatible = "maxim,max98091", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, max98090_of_match);
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
