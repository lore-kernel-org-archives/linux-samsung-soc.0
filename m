From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v12 0/18] Add Analogix Core Display Port Driver
Date: Sun, 17 Jan 2016 15:25:14 +0100
Message-ID: <1670568.VBNHbJuGkf@phil>
References: <1450873538-18304-1-git-send-email-ykk@rock-chips.com>
 <2322926.s1viZ6tSS3@phil>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart2126652.cPgU9h5xXi"
Content-Transfer-Encoding: 7Bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <2322926.s1viZ6tSS3@phil>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Yakir Yang <ykk@rock-chips.com>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-rockchip@lists.infradead.org, Jingoo Han <jingoohan1@gmail.com>, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>, javier@osg.samsung.com, Rob Herring <robh+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, Thierry Reding <treding@nvidia.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.

--nextPart2126652.cPgU9h5xXi
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Yakir,

Am Mittwoch, 13. Januar 2016, 15:59:51 schrieb Heiko Stuebner:
> Am Mittwoch, 23. Dezember 2015, 20:25:38 schrieb Yakir Yang:
> >    The Samsung Exynos eDP controller and Rockchip RK3288 eDP controller
> > 
> > share the same IP, so a lot of parts can be re-used. I split the common
> > code into bridge directory, then rk3288 and exynos only need to keep
> > some platform code. Cause I can't find the exact IP name of exynos dp
> > controller, so I decide to name dp core driver with "analogix" which I
> > find in rk3288 eDP TRM
> 
> could you rebase your patches on top of Dave's drm-next branch [0] please?
> The exynos part got some const attributes for the *_func_ops structs and
> drm_encoder_init got an additional parameter.
> I'm still hoping that we can get this finally committed once 4.5-rc1 is
> released in 1.5 weeks :-) .
> 
> I did try to merge things together [1], the system at least comes up and
> detects the panel (EDID is read correctly and it turns the backlight on)
> but I don't see any output on the display - hdmi works fine though and
> X11 is claiming everything to be fine in both cases.
> 
> So I don't know yet if I made a mistake when putting this together or
> there is an issue on the driver-side.

I was able to debug this a bit more, and it seems the encoder_helper_funcs 
don't like the prepare/commit callbacks and like enable better.

So when I do something similar to Marks patch a8eef71d38da ("drm/rockchip: 
dw_hdmi: use encoder enable function"), like in the attached patch (to be 
folded into the original addition of those functions), I get display output 
again.


Heiko

> [0] http://cgit.freedesktop.org/~airlied/linux/log/?h=drm-next
> [1] https://github.com/mmind/linux-rockchip/tree/tmp/analogixdp_v12-veyron
> I left out patch16, per your talk with Jingoo and me not seeing any AUX
> CH errors without it.

--nextPart2126652.cPgU9h5xXi
Content-Disposition: attachment; filename="0001-analogix_dp-rockchip-use-.enable-instead-of-preprare.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="0001-analogix_dp-rockchip-use-.enable-instead-of-preprare.patch"

>From 46e5badf6cf9b07461fc72279fe4617b644f8589 Mon Sep 17 00:00:00 2001
From: Heiko Stuebner <heiko@sntech.de>
Date: Sun, 17 Jan 2016 15:16:29 +0100
Subject: [PATCH] analogix_dp-rockchip: use .enable instead of preprare/commit
 in encoder_helper_funcs

---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 7cb3f6b..15619c5 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -108,7 +108,7 @@ static void rockchip_dp_drm_encoder_mode_set(struct drm_encoder *encoder,
 	/* do nothing */
 }
 
-static void rockchip_dp_drm_encoder_prepare(struct drm_encoder *encoder)
+static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder)
 {
 	struct rockchip_dp_device *dp = to_dp(encoder);
 	int ret;
@@ -161,8 +161,7 @@ static void rockchip_dp_drm_encoder_nop(struct drm_encoder *encoder)
 static const struct drm_encoder_helper_funcs rockchip_dp_encoder_helper_funcs = {
 	.mode_fixup = rockchip_dp_drm_encoder_mode_fixup,
 	.mode_set = rockchip_dp_drm_encoder_mode_set,
-	.prepare = rockchip_dp_drm_encoder_prepare,
-	.commit = rockchip_dp_drm_encoder_nop,
+	.enable = rockchip_dp_drm_encoder_enable,
 	.disable = rockchip_dp_drm_encoder_nop,
 };
 
-- 
2.6.4


--nextPart2126652.cPgU9h5xXi
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--nextPart2126652.cPgU9h5xXi--
