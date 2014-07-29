From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH V6 0/8] drm/exynos: few patches to enhance bridge chip
 support
Date: Tue, 29 Jul 2014 13:21:48 +0200
Message-ID: <53D783CC.2080108@suse.de>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>	<53D5435B.8030305@suse.de> <CAEC9eQPW-Z4craCC15M7oTp8eSD09AGxdTFEWaAWqn3Up4eJUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040406040706050300090904"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:42440 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752862AbaG2LVz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jul 2014 07:21:55 -0400
In-Reply-To: <CAEC9eQPW-Z4craCC15M7oTp8eSD09AGxdTFEWaAWqn3Up4eJUg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, inki.dae@samsung.com, thierry.reding@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

This is a multi-part message in MIME format.
--------------040406040706050300090904
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ajay,

Am 28.07.2014 08:13, schrieb Ajay kumar:
> On 7/27/14, Andreas Färber <afaerber@suse.de> wrote:
>> Am 25.07.2014 21:22, schrieb Ajay Kumar:
>>> This series is based on exynos-drm-next branch of Inki Dae's tree at:
>>> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
>>>
>>> I have tested this after adding few DT changes for exynos5250-snow,
>>> exynos5420-peach-pit and exynos5800-peach-pi boards.
>>
>> I'm trying to test this with a modified exynos5250-spring DT based off
>> kgene's for-next branch due to DT, and I run into the following:
>>
>>   CC      drivers/gpu/drm/bridge/ptn3460.o
>> drivers/gpu/drm/bridge/ptn3460.c: In function ‘ptn3460_post_encoder_init’:
>> drivers/gpu/drm/bridge/ptn3460.c:275:2: error: implicit declaration of
>> function ‘drm_connector_register’ [-Werror=implicit-function-declaration]
>>   drm_connector_register(&ptn_bridge->connector);
>>   ^
> Hope this might help:
> http://www.spinics.net/lists/dri-devel/msg60578.html

That fixed my build, thanks.

Unfortunately the most I got on Spring with attached DT was a blank
screen with a white horizontal line in the middle.

Do I need to specify a specific panel model for Spring?

For testing I re-applied your iommu patches (which btw fail now for 5420
due to disp_pd) but didn't know what to do about your panel-lvds
regulator patch now that it's gone.

If I don't apply this series, then commenting out the dp-controller node
gets me a working display with simplefb as before.

Regards,
Andreas

-- 
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imendörffer; HRB 16746 AG Nürnberg

--------------040406040706050300090904
Content-Type: text/x-patch;
 name="0001-ARM-dts-exynos5250-Add-eDP-LVDS-bridge-to-Spring.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename*0="0001-ARM-dts-exynos5250-Add-eDP-LVDS-bridge-to-Spring.patch"

>From 9172a26a8f0d0f0d170bd27e1c150ad204d8086a Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Date: Sun, 27 Jul 2014 21:58:06 +0200
Subject: [PATCH] ARM: dts: exynos5250: Add eDP/LVDS bridge to Spring
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
[AF: Redone for v6]
Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 arch/arm/boot/dts/exynos5250-spring.dts | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boot/dts/exynos5250-spring.dts
index 687dfab86bc8..517b1ff2bfdf 100644
--- a/arch/arm/boot/dts/exynos5250-spring.dts
+++ b/arch/arm/boot/dts/exynos5250-spring.dts
@@ -64,10 +64,14 @@
 		vdd_pll-supply = <&s5m_ldo8_reg>;
 	};
 
+	panel: panel {
+		compatible = "simple-panel";
+	};
+
 	dp-controller@145B0000 {
 		status = "okay";
 		pinctrl-names = "default";
-		pinctrl-0 = <&dp_hpd>;
+		pinctrl-0 = <&dp_hpd_gpio>;
 		samsung,color-space = <0>;
 		samsung,dynamic-range = <0>;
 		samsung,ycbcr-coeff = <0>;
@@ -75,6 +79,7 @@
 		samsung,link-rate = <0x0a>;
 		samsung,lane-count = <1>;
 		samsung,hpd-gpio = <&gpc3 0 0>;
+		bridge = <&ps8622>;
 	};
 
 	fixed-rate-clocks {
@@ -387,6 +392,17 @@
 	status = "okay";
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <66000>;
+
+	ps8622: ps8622-bridge@08 {
+		compatible = "parade,ps8622";
+		reg = <0x08>;
+		sleep-gpios = <&gpc3 6 0>;
+		reset-gpios = <&gpc3 1 0>;
+		lane-count = <1>;
+		panel = <&panel>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ps8622_gpios>;
+	};
 };
 
 &i2c_8 {
@@ -450,6 +466,20 @@
 		samsung,pin-pud = <0>;
 	};
 
+	dp_hpd_gpio: dp-hpd-gpio {
+		samsung,pins = "gpc3-0";
+		samsung,pin-function = <0>;
+		samsung,pin-pud = <3>;
+		samsung,pin-drv = <0>;
+	};
+
+	ps8622_gpios: ps8622-gpios {
+		samsung,pins = "gpc3-1", "gpc3-6";
+		samsung,pin-function = <1>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <0>;
+	};
+
 	s5m8767_dvs: s5m8767-dvs {
 		samsung,pins = "gpd1-0", "gpd1-1", "gpd1-2";
 		samsung,pin-function = <0>;
-- 
1.9.3


--------------040406040706050300090904--
