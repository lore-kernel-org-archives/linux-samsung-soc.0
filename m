From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 5/5] ARM: dts: Update watchdog node name in exynos5440.dtsi
Date: Fri, 23 May 2014 15:45:52 +0900
Message-ID: <002001cf7652$a42be650$ec83b2f0$%han@samsung.com>
References: <1400825338-1272-1-git-send-email-sachin.kamat@linaro.org>
 <1400825338-1272-5-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:9808 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751930AbaEWGp4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 02:45:56 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N6000J1HLGIRIE0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 May 2014 15:45:54 +0900 (KST)
In-reply-to: <1400825338-1272-5-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>

On Friday, May 23, 2014 3:09 PM, Sachin Kamat wrote:
> 
> Made it as per DT node naming convention <name@reg_addr>.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  arch/arm/boot/dts/exynos5440.dtsi |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
> index 84f77c2fe4d4..ae3a17c791f6 100644
> --- a/arch/arm/boot/dts/exynos5440.dtsi
> +++ b/arch/arm/boot/dts/exynos5440.dtsi
> @@ -176,7 +176,7 @@
>  		clock-names = "i2c";
>  	};
> 
> -	watchdog {
> +	watchdog@110000 {
>  		compatible = "samsung,s3c2410-wdt";
>  		reg = <0x110000 0x1000>;
>  		interrupts = <0 1 0>;
> --
> 1.7.9.5
