From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/1] ARM: dts: Remove combiner IRQ node from exynos4x12.dtsi
Date: Wed, 05 Jun 2013 21:39:47 +0900
Message-ID: <08f901ce61e9$c3a15ed0$4ae41c70$%kim@samsung.com>
References: <1366710888-11059-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35209 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753323Ab3FEMju (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Jun 2013 08:39:50 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MNX0055X76C2PT0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Jun 2013 21:39:48 +0900 (KST)
In-reply-to: <1366710888-11059-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: arnd@arndb.de, patches@linaro.org

Sachin Kamat wrote:
> 
> These nodes have separately been added to 4212 and 4412 dtsi
> files by commit 30269ddff1 ("ARM: exynos: add missing properties
> for combiner IRQs"). The existing node also contained a few
> incorrect entries.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
> Patch based on linux-next tree (20130423)
> ---
>  arch/arm/boot/dts/exynos4x12.dtsi |    8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4x12.dtsi
> b/arch/arm/boot/dts/exynos4x12.dtsi
> index ede3f9b..675c221 100644
> --- a/arch/arm/boot/dts/exynos4x12.dtsi
> +++ b/arch/arm/boot/dts/exynos4x12.dtsi
> @@ -28,14 +28,6 @@
>  		pinctrl3 = &pinctrl_3;
>  	};
> 
> -	combiner:interrupt-controller@10440000 {
> -		interrupts = <0 0 0>, <0 1 0>, <0 2 0>, <0 3 0>,
> -			     <0 4 0>, <0 5 0>, <0 6 0>, <0 7 0>,
> -			     <0 8 0>, <0 9 0>, <0 10 0>, <0 11 0>,
> -			     <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>,
> -			     <0 16 0>, <0 17 0>, <0 18 0>, <0 19 0>;
> -	};
> -
>  	clock: clock-controller@0x10030000 {
>  		compatible = "samsung,exynos4412-clock";
>  		reg = <0x10030000 0x20000>;
> --
> 1.7.9.5

Applied, thanks.

- Kukjin
