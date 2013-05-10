From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: Add display timing node to exynos5250-arndale.dts
Date: Fri, 10 May 2013 02:05:42 +0200
Message-ID: <4212940.hYf2k9NPUY@flatron>
References: <1367992894-20198-1-git-send-email-vikas.sajjan@linaro.org> <1367992894-20198-4-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f179.google.com ([209.85.215.179]:35677 "EHLO
	mail-ea0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755397Ab3EJAFs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 May 2013 20:05:48 -0400
Received: by mail-ea0-f179.google.com with SMTP id h14so1857470eaj.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 May 2013 17:05:46 -0700 (PDT)
In-Reply-To: <1367992894-20198-4-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, patches@linaro.org, linaro-kernel@lists.linaro.org

Hi Vikas,

On Wednesday 08 of May 2013 11:31:34 Vikas Sajjan wrote:
> Adds display timing node for a DP panel to Arndale Board DTS file
> 
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts |   16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts
> b/arch/arm/boot/dts/exynos5250-arndale.dts index f68b820..c831a5c
> 100644
> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -459,4 +459,20 @@
>  		samsung,lane-count = <4>;
>  	};
> 
> +	display-timings {
> +		native-mode = <&timing0>;
> +		timing0: timing@0 {
> +			/* 2560x1600 DP panel */
> +			clock-frequency = <50000>;
> +			hactive = <2560>;
> +			vactive = <1600>;
> +			hfront-porch = <48>;
> +			hback-porch = <80>;
> +			hsync-len = <32>;
> +			vback-porch = <16>;
> +			vfront-porch = <8>;
> +			vsync-len = <6>;
> +		};
> +	};

What display are those timings used for? Shouldn't they be placed inside 
node of that display?

Best regards,
Tomasz
