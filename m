From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 4/5] clk/exynos5420: add hdmi mux to change parents in
 hdmi driver
Date: Fri, 21 Jun 2013 10:22:40 +0530
Message-ID: <CAPdUM4PJpsAS6q5Z2a92MkL0LN-HxAmww_R7LuyKUs6r7-07nQ@mail.gmail.com>
References: <1371565998-3642-1-git-send-email-rahul.sharma@samsung.com>
	<1371565998-3642-5-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f53.google.com ([74.125.82.53]:49960 "EHLO
	mail-wg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757274Ab3FUEwl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Jun 2013 00:52:41 -0400
Received: by mail-wg0-f53.google.com with SMTP id y10so6116940wgg.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2013 21:52:40 -0700 (PDT)
In-Reply-To: <1371565998-3642-5-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, Mike Turquette <mturquette@linaro.org>

+Mike

On Tue, Jun 18, 2013 at 8:03 PM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> hdmi driver needs to change the parent of hdmi clock
> to pixel clock or hdmiphy clock, based on the stability
> of hdmiphy. This patch is exposing the mux for changing
> the parent.
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  Documentation/devicetree/bindings/clock/exynos5420-clock.txt |    5 +++++
>  drivers/clk/samsung/clk-exynos5420.c                         |    5 ++++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
> index f0b1ce0..c7a319d 100644
> --- a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
> @@ -182,6 +182,11 @@ clock which they consume.
>    g3d                  501
>    smmu_tv              502
>
> +  Mux                  ID
> +  ----------------------------
> +
> +  mout_hdmi            1024
> +
>  Example 1: An example of a clock controller node is listed below.
>
>         clock: clock-controller@0x10010000 {
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 193d25e..59cf177 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -111,6 +111,9 @@ enum exynos5420_clks {
>         aclk333_g2d = 480, g2d, aclk333_432_gscl = 490, smmu_3aa, smmu_fimcl0,
>         smmu_fimcl1, smmu_fimcl3, fimc_lite3, aclk_g3d = 500, g3d, smmu_tv,
>
> +       /* mux clocks */
> +       mout_hdmi = 1024,
> +
>         nr_clks,
>  };
>
> @@ -371,7 +374,7 @@ struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
>         MUX(none, "mout_mipi1", group2_p, SRC_DISP10, 16, 3),
>         MUX(none, "mout_dp1", group2_p, SRC_DISP10, 20, 3),
>         MUX(none, "mout_pixel", group2_p, SRC_DISP10, 24, 3),
> -       MUX(none, "mout_hdmi", hdmi_p, SRC_DISP10, 28, 1),
> +       MUX(mout_hdmi, "mout_hdmi", hdmi_p, SRC_DISP10, 28, 1),
>
>         /* MAU Block */
>         MUX(none, "mout_maudio0", maudio0_p, SRC_MAU, 28, 3),
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
