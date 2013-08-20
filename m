From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: fix PL330 MDMA1 address in DT for Universal
 C210 board
Date: Tue, 20 Aug 2013 14:13:04 +0200
Message-ID: <1448881.nvIAFtzzXr@amdc1227>
References: <8667689.9TcYbn9cHO@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:28841 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750934Ab3HTMNI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Aug 2013 08:13:08 -0400
In-reply-to: <8667689.9TcYbn9cHO@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>, devicetree@vger.kernel.org

Hi Bart,

On Tuesday 20 of August 2013 13:22:45 Bartlomiej Zolnierkiewicz wrote:
> Revision 0 of Exynos4210 SoC (used on Universal C210 board) requires
> 'secure' PL330 MDMA1 address (0x12840000) instead of 'non-secure' one
> (0x12850000). Fix it by overriding the default PL330 MDMA1 address in
> exynos4210-universal_c210.dts.
> 
> This is a Device Tree (DT) version of commit 91280e7 ("ARM: EXYNOS:
> PL330 MDMA1 fix for revision 0 of Exynos4210 SOC") and fixes recent
> regression caused by conversion to DT-only setup on ARM EXYNOS.
> 
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4210-universal_c210.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts
> b/arch/arm/boot/dts/exynos4210-universal_c210.dts index 889cdad..d2e3f5f
> 100644
> --- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
> +++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
> @@ -350,3 +350,7 @@
>  		status = "okay";
>  	};
>  };
> +
> +&mdma1 {
> +	reg = <0x12840000 0x1000>;
> +};

Acked-by: Tomasz Figa <t.figa@samsung.com>

As a side note for other reviewers, Universal C210 is the only board based 
on Exynos4210 rev0, so board-level dts is the right place for such 
override.

Best regards,
Tomasz
