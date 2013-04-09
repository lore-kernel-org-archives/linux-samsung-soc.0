From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 04/10] clk-exynos for v3.10
Date: Tue, 9 Apr 2013 22:31:18 +0200
Message-ID: <201304092231.18314.arnd@arndb.de>
References: <51630A02.4080905@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:54755 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933489Ab3DIUbZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Apr 2013 16:31:25 -0400
In-Reply-To: <51630A02.4080905@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Monday 08 April 2013, Kukjin Kim wrote:
> The following changes since commit 07961ac7c0ee8b546658717034fe692fd12eefa9:
> 
>    Linux 3.9-rc5 (2013-03-31 15:12:43 -0700)
> 
> are available in the git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
> tags/clk-exynos-for-v3.10
> 
> for you to fetch changes up to da821eb7d42935b0f7056d98c75fd1150f6636f4:
> 
>    Merge commit 'v3.9-rc5' into next/clk-exynos (2013-04-09 01:10:13 +0900)
> 
> ----------------------------------------------------------------
> 
> add suppport common clock framework for exynos

I got a build warning, probably because of this patch:

>       ARM: dts: Add MSHC node for exynos4412-origen DT

Fixed up as below, please check.

Pulled into the next/drivers tree.

	Arnd

diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index 15dc0a3..53bc8bf 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -39,6 +39,8 @@
        };
 
        mshc@12550000 {
+               #address-cells = <1>;
+               #size-cells = <0>;
                pinctrl-0 = <&sd4_clk &sd4_cmd &sd4_bus4 &sd4_bus8>;
                pinctrl-names = "default";
                status = "okay";
diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index a5478bd..1fecf76 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -45,6 +45,8 @@
        };
 
        mshc@12550000 {
+               #address-cells = <1>;
+               #size-cells = <0>;
                pinctrl-0 = <&sd4_clk &sd4_cmd &sd4_bus4 &sd4_bus8>;
                pinctrl-names = "default";
                status = "okay";
