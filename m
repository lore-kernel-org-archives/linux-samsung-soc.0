From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 1/3] ARM: dts: Add DT node for DP controller for Arndale
 Board
Date: Mon, 13 May 2013 10:20:13 +0900
Message-ID: <000701ce4f78$04bf9fa0$0e3edee0$@samsung.com>
References: <1367992894-20198-1-git-send-email-vikas.sajjan@linaro.org>
 <1367992894-20198-2-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:60284 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752052Ab3EMBUO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 12 May 2013 21:20:14 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MMP006GCQANWA90@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 May 2013 10:20:13 +0900 (KST)
In-reply-to: <1367992894-20198-2-git-send-email-vikas.sajjan@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vikas Sajjan' <vikas.sajjan@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, patches@linaro.org, linaro-kernel@lists.linaro.org, Jingoo Han <jg1.han@samsung.com>

On Wednesday, May 08, 2013 3:02 PM, Vikas Sajjan wrote:
> 
> Add DT node for DP controller to exynos5250 based Arndale Board
> 
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>

Hi Vikas Sajjan,

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts |   10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
> index 02cfc76..f68b820 100644
> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -449,4 +449,14 @@
>  			clock-frequency = <24000000>;
>  		};
>  	};
> +
> +	dp-controller {
> +		samsung,color-space = <0>;
> +		samsung,dynamic-range = <0>;
> +		samsung,ycbcr-coeff = <0>;
> +		samsung,color-depth = <1>;
> +		samsung,link-rate = <0x0a>;
> +		samsung,lane-count = <4>;
> +	};
> +
>  };
> --
> 1.7.9.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
