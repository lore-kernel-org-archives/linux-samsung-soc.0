From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: dts: Remove g2d_pd node for exynos5420
Date: Thu, 15 May 2014 04:09:11 +0900
Message-ID: <5373BF57.6040109@samsung.com>
References: <1399972526-20828-1-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f50.google.com ([209.85.160.50]:50410 "EHLO
	mail-pb0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750906AbaENTJR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 15:09:17 -0400
Received: by mail-pb0-f50.google.com with SMTP id ma3so2058049pbc.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2014 12:09:16 -0700 (PDT)
In-Reply-To: <1399972526-20828-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com, tushar.behera@linaro.org, shaik.ameer@samsung.com

On 05/13/14 18:15, Arun Kumar K wrote:
> G2D power domain also controls the CMU block of G2D.
> Since clock registers can be accessed anytime for viewing
> clk_summary, it can cause a system crash if g2d power domain
> is disabled.
>
> Signed-off-by: Arun Kumar K<arun.kk@samsung.com>
> ---
> Please also refer to the existing discussion on removal of
> mau_pd node.
> http://comments.gmane.org/gmane.linux.kernel.samsung-soc/29718
>
> This patch also fixes a similar issue of the power domian being
> linked to the CMU block. AFAIK, only MAU and G2D power domains
> has this problem in 5420.
>
> The issue is more critical now with the merging of following
> patches in Tomasz's clk tree -
> clk: samsung exynos5250/5420: Add gate clock for SSS module
> clk: exynos5420: update clocks for G2D and G3D blocks
>
> With these patches, I get the following crash on kernel booting -
> [8.971209] Unhandled fault: imprecise external abort (0x1406) at 0x00000000
> [8.993044] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000007
>
> For fixing this, either g2d_pd has to be removed or we need to make all
> GATE clocks touching the GATE_IP_G2D as CLK_IGNORE_UNUSED.
> I believe removing g2d_pd is the better solution as we get almost the
> same power saving by gating off these clocks and keeping the domain ON.
> ---
>   arch/arm/boot/dts/exynos5420.dtsi |    6 ------
>   1 file changed, 6 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 2f6da50..47d3f17 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -242,11 +242,6 @@
>   		reg =<0x100440E0 0x20>;
>   	};
>
> -	g2d_pd: power-domain@10044100 {
> -		compatible = "samsung,exynos4210-pd";
> -		reg =<0x10044100 0x20>;
> -	};
> -
>   	msc_pd: power-domain@10044120 {
>   		compatible = "samsung,exynos4210-pd";
>   		reg =<0x10044120 0x20>;
> @@ -755,6 +750,5 @@
>   		interrupts =<0 112 0>;
>   		clocks =<&clock 471>;
>   		clock-names = "secss";
> -		samsung,power-domain =<&g2d_pd>;
>   	};
>   };

OK, applied.

Thanks,
Kukjin
