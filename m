From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 3/5] clk/exynos5420: fix the order of parents of hdmi mux
Date: Fri, 21 Jun 2013 10:22:17 +0530
Message-ID: <CAPdUM4Of_WPHJs-krU8MCXs5kzdB5=FcT8X8vuCPB+A06sgoCA@mail.gmail.com>
References: <1371565998-3642-1-git-send-email-rahul.sharma@samsung.com>
	<1371565998-3642-4-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f54.google.com ([74.125.82.54]:42933 "EHLO
	mail-wg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757274Ab3FUEwS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Jun 2013 00:52:18 -0400
Received: by mail-wg0-f54.google.com with SMTP id n11so6282244wgh.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2013 21:52:17 -0700 (PDT)
In-Reply-To: <1371565998-3642-4-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, Mike Turquette <mturquette@linaro.org>

+Mike

On Tue, Jun 18, 2013 at 8:03 PM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> Listing sclk_hdmiphy at 0th position in the list of parents is
> causing wrong configuration in reg SRC_DISP10.
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5420.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index e8be481..193d25e 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -257,7 +257,7 @@ PNAME(audio2_p)     = { "fin_pll", "cdclk2", "sclk_dpll", "sclk_mpll",
>                   "sclk_spll", "sclk_ipll", "sclk_epll", "sclk_rpll" };
>  PNAME(spdif_p) = { "fin_pll", "dout_audio0", "dout_audio1", "dout_audio2",
>                   "spdif_extclk", "sclk_ipll", "sclk_epll", "sclk_rpll" };
> -PNAME(hdmi_p)  = { "sclk_hdmiphy", "dout_hdmi_pixel" };
> +PNAME(hdmi_p)  = { "dout_hdmi_pixel", "sclk_hdmiphy" };
>  PNAME(maudio0_p)       = { "fin_pll", "maudio_clk", "sclk_dpll", "sclk_mpll",
>                           "sclk_spll", "sclk_ipll", "sclk_epll", "sclk_rpll" };
>
> --
> 1.7.10.4
>
