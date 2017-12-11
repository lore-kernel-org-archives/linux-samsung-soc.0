From: Javier Martinez Canillas <javierm@redhat.com>
Subject: [RFT PATCH] ARM: dts: exynos: Enable Mixer node for Exynos5800 Peach Pi machine
Date: Mon, 11 Dec 2017 23:48:56 +0100
Message-ID: <20171211224856.29264-1-javierm@redhat.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:42858 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750836AbdLKWtC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Dec 2017 17:49:02 -0500
Received: by mail-wm0-f68.google.com with SMTP id b199so13671643wme.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Dec 2017 14:49:02 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Guillaume Tucker <guillaume.tucker@collabora.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Shuah Khan <shuahkh@osg.samsung.com>, Javier Martinez Canillas <javierm@redhat.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org

Commit 1cb686c08d12 ("ARM: dts: exynos: Add status property to Exynos 542x
Mixer nodes") disabled the Mixer node by default in the DTSI and enabled
for each Exynos 542x DTS. But unfortunately it missed to enable it for the
Exynos5800 Peach Pi machine, since the 5800 is also an 542x SoC variant.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

---

I believe this may cause the boot issues reported on Exynos5800 Peach Pi
from v4.15-rc3, the mentioned commit made to v4.15-rc1 but it seems that
didn't cause any harm until commit ("510353a63796 drm/bridge: analogix
dp: Fix runtime PM state in get_modes() callback") fixed the runtime PM
management in the DP driver.

I can't test right now, but I'm posting anyways as a RFT in case others
that have access to a Peach Pi can test it.

Best regards,
Javier

 arch/arm/boot/dts/exynos5800-peach-pi.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index b2b95ff205e8..0029ec27819c 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -664,6 +664,10 @@
 	status = "okay";
 };
 
+&mixer {
+	status = "okay";
+};
+
 /* eMMC flash */
 &mmc_0 {
 	status = "okay";
-- 
2.14.3
