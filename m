From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v5 1/3] ARM: dts: Fix the RTC DT node name for Exynos5250
 SoC
Date: Thu, 22 Aug 2013 14:27:04 +0200
Message-ID: <2478737.HBqGSWXzHv@amdc1227>
References: <1377171208-23515-1-git-send-email-vikas.sajjan@linaro.org>
 <1377171208-23515-2-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55652 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752580Ab3HVM1I (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Aug 2013 08:27:08 -0400
In-reply-to: <1377171208-23515-2-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, devicetree@vger.kernel.org, patches@linaro.org, linaro-kernel@lists.linaro.org

Hi Vikas,

On Thursday 22 of August 2013 17:03:26 Vikas Sajjan wrote:
> Fixes the RTC DT node name for Exynos5250 SoC as per the DT node naming
> convention.
> 
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5.dtsi    |    2 +-
>  arch/arm/boot/dts/exynos5250.dtsi |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5.dtsi
> b/arch/arm/boot/dts/exynos5.dtsi index 6afa57d..074739d 100644
> --- a/arch/arm/boot/dts/exynos5.dtsi
> +++ b/arch/arm/boot/dts/exynos5.dtsi
> @@ -95,7 +95,7 @@
>  		interrupts = <0 54 0>;
>  	};
> 
> -	rtc {
> +	rtc@101E0000 {
>  		compatible = "samsung,s3c6410-rtc";
>  		reg = <0x101E0000 0x100>;
>  		interrupts = <0 43 0>, <0 44 0>;
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> b/arch/arm/boot/dts/exynos5250.dtsi index 1eec646..b278b00 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -180,7 +180,7 @@
>  		clock-names = "mfc";
>  	};
> 
> -	rtc {
> +	rtc@101E0000 {
>  		clocks = <&clock 337>;
>  		clock-names = "rtc";
>  	};

This patch should also rename any other occurencies of rtc node in board 
dts files, because otherwise it breaks RTC support in bisections.

Otherwise the whole series looks fine to me.

Best regards,
Tomasz
