From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 3/5] clk/exynos5250: add sclk_hdmiphy in the list of
 special clocks
Date: Fri, 21 Jun 2013 10:20:17 +0530
Message-ID: <CAPdUM4PkLjzCYNae5_zNNyi82zcCjuBGeg1T5b2MSOnz33cadA@mail.gmail.com>
References: <1370862062-16680-1-git-send-email-rahul.sharma@samsung.com>
	<1370862062-16680-4-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f53.google.com ([74.125.82.53]:51421 "EHLO
	mail-wg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757274Ab3FUEuS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Jun 2013 00:50:18 -0400
Received: by mail-wg0-f53.google.com with SMTP id y10so6198125wgg.20
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2013 21:50:17 -0700 (PDT)
In-Reply-To: <1370862062-16680-4-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>, Mike Turquette <mturquette@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, arun.kk@samsung.com

+Mike

On Mon, Jun 10, 2013 at 4:31 PM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> hdmi driver needs hdmiphy clock which is one of the parent
> for hdmi mux clock. This is required while changing the parent
> of mux clock.
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  Documentation/devicetree/bindings/clock/exynos5250-clock.txt |    1 +
>  drivers/clk/samsung/clk-exynos5250.c                         |    3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
> index b337147..f333d61 100644
> --- a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
> @@ -59,6 +59,7 @@ clock which they consume.
>    sclk_spi0            154
>    sclk_spi1            155
>    sclk_spi2            156
> +  sclk_hdmiphy         157
>
>
>     [Peripheral Clock Gates]
> diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
> index 587d913..88cdb13 100644
> --- a/drivers/clk/samsung/clk-exynos5250.c
> +++ b/drivers/clk/samsung/clk-exynos5250.c
> @@ -87,6 +87,7 @@ enum exynos5250_clks {
>         sclk_mmc0, sclk_mmc1, sclk_mmc2, sclk_mmc3, sclk_sata, sclk_usb3,
>         sclk_jpeg, sclk_uart0, sclk_uart1, sclk_uart2, sclk_uart3, sclk_pwm,
>         sclk_audio1, sclk_audio2, sclk_spdif, sclk_spi0, sclk_spi1, sclk_spi2,
> +       sclk_hdmiphy,
>
>         /* gate clocks */
>         gscl0 = 256, gscl1, gscl2, gscl3, gscl_wa, gscl_wb, smmu_gscl0,
> @@ -199,7 +200,7 @@ struct samsung_fixed_rate_clock exynos5250_fixed_rate_ext_clks[] __initdata = {
>
>  /* fixed rate clocks generated inside the soc */
>  struct samsung_fixed_rate_clock exynos5250_fixed_rate_clks[] __initdata = {
> -       FRATE(none, "sclk_hdmiphy", NULL, CLK_IS_ROOT, 24000000),
> +       FRATE(sclk_hdmiphy, "sclk_hdmiphy", NULL, CLK_IS_ROOT, 24000000),
>         FRATE(none, "sclk_hdmi27m", NULL, CLK_IS_ROOT, 27000000),
>         FRATE(none, "sclk_dptxphy", NULL, CLK_IS_ROOT, 24000000),
>         FRATE(none, "sclk_uhostphy", NULL, CLK_IS_ROOT, 48000000),
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
