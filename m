From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH v2 1/4] S3C: sdhci: Fix incorrect clock option for SDHCI base clock.
Date: Thu, 15 Oct 2009 22:44:28 +0100
Message-ID: <20091015214428.GS28849@trinity.fluff.org>
References: <1255585698-31029-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:47795 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758360AbZJOVpG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Oct 2009 17:45:06 -0400
Content-Disposition: inline
In-Reply-To: <1255585698-31029-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

On Thu, Oct 15, 2009 at 02:48:18PM +0900, Thomas Abraham wrote:
> The third base clock option for SDHCI controller in S3C64XX is
> mout_epll. This patch removes mmc_bus clock and uses mout_epll
> as the third clock option for SDHCI base clock.

I thought the MMC bus clock was the one that was gated through the
SCLK_MMC0 and the CLKSRC_MMC0 divider system which takes not only the
mout_epll, but dout_epll, fin_epll and the 27m clock, as so:

static struct clk *clkset_spi_mmc_list[] = {
        &clk_mout_epll.clk,
        &clk_dout_mpll,
        &clk_fin_epll,
        &clk_27m,
};

So I don't think this change is the right one but I don't have any
docummentation to hand as I'm currently attending ELC09.

> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> ---
>  arch/arm/mach-s3c6410/setup-sdhci.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c6410/setup-sdh2Aci.c b/arch/arm/mach-s3c6410/setup-sdhci.c
> index 20666f3..aaac505 100644
> --- a/arch/arm/mach-s3c6410/setup-sdhci.c
> +++ b/arch/arm/mach-s3c6410/setup-sdhci.c
> @@ -29,7 +29,7 @@
>  char *s3c6410_hsmmc_clksrcs[4] = {
>  	[0] = "hsmmc",
>  	[1] = "hsmmc",
> -	[2] = "mmc_bus",
> +	[2] = "mout_epll",
>  	/* [3] = "48m", - note not succesfully used yet */
>  };
>  
> -- 
> 1.5.3.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
