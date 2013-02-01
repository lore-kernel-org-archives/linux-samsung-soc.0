From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH v2 3/5] ARM: dts: Add FIMD node and display timing node to
 exynos4412-origen.dts
Date: Fri, 01 Feb 2013 16:52:54 +0900
Message-ID: <001301ce0051$24495620$6cdc0260$%han@samsung.com>
References: <1359547167-16560-1-git-send-email-vikas.sajjan@linaro.org>
 <1359547167-16560-4-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:42912 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754598Ab3BAHw6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Feb 2013 02:52:58 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHJ00JH4784QYQ0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Feb 2013 16:52:54 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.120.99])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHJ0022E785V3B0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Feb 2013 16:52:54 +0900 (KST)
In-reply-to: <1359547167-16560-4-git-send-email-vikas.sajjan@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vikas Sajjan' <vikas.sajjan@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, thomas.abraham@linaro.org, sachin.kamat@linaro.org, t.figa@samsung.com, sylvester.nawrocki@gmail.com, 'Jingoo Han' <jg1.han@samsung.com>

On Wednesday, January 30, 2013 8:59 PM, Vikas Sajjan wrote
> 
> Adds FIMD DT support to Origen quad board
> 
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4412-origen.dts |   22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
> index 4eba374..de877c5 100644
> --- a/arch/arm/boot/dts/exynos4412-origen.dts
> +++ b/arch/arm/boot/dts/exynos4412-origen.dts
> @@ -44,6 +44,28 @@
>  		status = "okay";
>  	};
> 
> +       fimd@11c00000 {
> +		samsung,power-domain = <&pd_lcd0>;
> +		pinctrl-0 = <&lcd_sync &lcd_clk &lcd_en &lcd0_data &pwm1_out>;

lcd0_data is the same with lcd_data24.
How about using lcd_data24 instead of lcd0_data?


> +		pinctrl-names = "default";
> +		status = "okay";
> +	};
> +
> +	display-timings {
> +                native-mode = <&timing0>;
> +                timing0: timing@0 {
Please replace spaces with tabs.

> +			clock-frequency = <50000>;
> +			hactive = <1024>;
> +			vactive = <600>;
> +			hfront-porch = <64>;
> +			hback-porch = <16>;
> +			hsync-len = <48>;
> +			vback-porch = <64>;
> +			vfront-porch = <16>;
> +			vsync-len = <3>;
> +                };
> +        };
Please replace spaces with tabs.

> +
>  	serial@13800000 {
>  		status = "okay";
>  	};
> --
> 1.7.9.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
