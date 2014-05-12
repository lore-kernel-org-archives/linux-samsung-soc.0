From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH v3 1/4] ARM: dts: enable fimd for exynos5250 based snow
 board
Date: Mon, 12 May 2014 13:50:31 +0900
Message-ID: <001501cf6d9d$b3ed4c40$1bc7e4c0$%han@samsung.com>
References: <1399630186-22610-1-git-send-email-rahul.sharma@samsung.com>
 <1399630186-22610-2-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:54902 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750721AbaELEvJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 May 2014 00:51:09 -0400
In-reply-to: <1399630186-22610-2-git-send-email-rahul.sharma@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Rahul Sharma' <rahul.sharma@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, 'Jingoo Han' <jg1.han@samsung.com>

On Friday, May 09, 2014 7:10 PM, Rahul Sharma wrote:
> 
> From: Rahul Sharma <Rahul.Sharma@samsung.com>
> 
> Enable fimd node for snow board.
> 
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  arch/arm/boot/dts/exynos5250-snow.dts |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
> index 1ce1088..796954c 100644
> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> @@ -206,4 +206,10 @@
>  			clock-frequency = <24000000>;
>  		};
>  	};
> +
> +	fimd@14400000 {
> +		status = "okay";
> +		samsung,invert-vclk;
> +	};
> +
>  };
> --
> 1.7.9.5
