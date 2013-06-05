From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/5] ARM: dts: Remove duplicate and add missing G2D nodes
Date: Wed, 05 Jun 2013 21:30:18 +0900
Message-ID: <08f801ce61e8$7081ba20$51852e60$%kim@samsung.com>
References: <1366283719-9615-1-git-send-email-sachin.kamat@linaro.org>
 <1366283719-9615-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:21911 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752446Ab3FEMaU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Jun 2013 08:30:20 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MNX00ASK6QANHV0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Jun 2013 21:30:18 +0900 (KST)
In-reply-to: <1366283719-9615-2-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> G2D node got added twice in exynos4412-smdk4412.dts instead of
> getting added to exynos4412-origen.dts. Remove the duplicate entry
> and add it to exynos4412-origen.dts.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4412-origen.dts   |    4 ++++
>  arch/arm/boot/dts/exynos4412-smdk4412.dts |    4 ----
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-origen.dts
> b/arch/arm/boot/dts/exynos4412-origen.dts
> index 790a999..ca73c42 100644
> --- a/arch/arm/boot/dts/exynos4412-origen.dts
> +++ b/arch/arm/boot/dts/exynos4412-origen.dts
> @@ -98,6 +98,10 @@
>  		};
>  	};
> 
> +	g2d@10800000 {
> +		status = "okay";
> +	};
> +
>  	sdhci@12530000 {
>  		bus-width = <4>;
>  		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus4 &sd2_cd>;
> diff --git a/arch/arm/boot/dts/exynos4412-smdk4412.dts
> b/arch/arm/boot/dts/exynos4412-smdk4412.dts
> index c52b01f..a8ba195 100644
> --- a/arch/arm/boot/dts/exynos4412-smdk4412.dts
> +++ b/arch/arm/boot/dts/exynos4412-smdk4412.dts
> @@ -31,10 +31,6 @@
>  		status = "okay";
>  	};
> 
> -	g2d@10800000 {
> -		status = "okay";
> -	};
> -
>  	pinctrl@11000000 {
>  		keypad_rows: keypad-rows {
>  			samsung,pins = "gpx2-0", "gpx2-1", "gpx2-2";
> --
> 1.7.9.5

Ooops :(

The 2 to 5 patches look good to me.

Applied, btw, please make a cover 0/5 for series next time.

Thanks.

- Kukjin
