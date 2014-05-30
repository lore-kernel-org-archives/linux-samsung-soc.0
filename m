From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: dts: exynos4: Fix reg sizes of GIC
Date: Fri, 30 May 2014 13:41:07 +0200
Message-ID: <53886E53.70206@gmail.com>
References: <1400855960-22033-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f170.google.com ([74.125.82.170]:53243 "EHLO
	mail-we0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752746AbaE3LlZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 May 2014 07:41:25 -0400
Received: by mail-we0-f170.google.com with SMTP id u57so1913930wes.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 May 2014 04:41:24 -0700 (PDT)
In-Reply-To: <1400855960-22033-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi,

On 23.05.2014 16:39, Tomasz Figa wrote:
> This patch fixes reg entry sizes in GIC node that were not large enough
> to cover whole regions.
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index b8ece4b..fbaf426 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -113,7 +113,7 @@
>  		compatible = "arm,cortex-a9-gic";
>  		#interrupt-cells = <3>;
>  		interrupt-controller;
> -		reg = <0x10490000 0x1000>, <0x10480000 0x100>;
> +		reg = <0x10490000 0x10000>, <0x10480000 0x10000>;
>  	};
>  
>  	combiner: interrupt-controller@10440000 {
> 

Ping.

Best regards,
Tomasz
