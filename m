From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 5/5] clk/exynos5420: assign sclk_pixel id to pixel clock divider
Date: Tue, 18 Jun 2013 19:54:29 +0530
Message-ID: <CAPdUM4NUJv7E+KqrGgHsWHYnf89_2cbiMP_D6S1pWTW=XeZO+g@mail.gmail.com>
References: <1371565998-3642-1-git-send-email-rahul.sharma@samsung.com>
	<1371565998-3642-6-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46]:52605 "EHLO
	mail-wg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755725Ab3FROYa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 10:24:30 -0400
Received: by mail-wg0-f46.google.com with SMTP id c11so3449703wgh.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2013 07:24:29 -0700 (PDT)
In-Reply-To: <1371565998-3642-6-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com

With this patch, it is at par with Exynos5250 and Exynos4 clocks
where sclk_pixel ID is assigned to a divider clock but in real,
sclk_pixel is listed under gate clocks (enum value).

Alternate to this, I can allocate a new ID, div_pixel, listed under
new category of Divider Clocks for Exyno4, 5250 and 5420.
div_pixel ID can be assigned to pixel clock dividers for all 3 SoCs.
This ID can be accessed by hdmi driver as usual. While sclk_pixel
ID can be left unused for Exyno4, 5250 as there are no pixel clock
gates. And, For 5420, sclk_pixel can optionally be used to
enable/disable the pixel clock gate.

Regards,
Rahul Sharma.

On Tue, Jun 18, 2013 at 8:03 PM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> sclk_pixel is used to represent pixel clock divider on all exynos
> SoCs not as a gate clock. It is queried in driver to pass as the
> parent to hdmi clock while switching between parents. A new ID can
> be asssigned Pixel gate clock which is currently not in use. Pixel
> clock gate is default 'on'.
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5420.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 59cf177..edd0696 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -434,7 +434,7 @@ struct samsung_div_clock exynos5420_div_clks[] __initdata = {
>         DIV(none, "dout_fimd1", "mout_fimd1", DIV_DISP10, 0, 4),
>         DIV(none, "dout_mipi1", "mout_mipi1", DIV_DISP10, 16, 8),
>         DIV(none, "dout_dp1", "mout_dp1", DIV_DISP10, 24, 4),
> -       DIV(none, "dout_hdmi_pixel", "mout_pixel", DIV_DISP10, 28, 4),
> +       DIV(sclk_pixel, "dout_hdmi_pixel", "mout_pixel", DIV_DISP10, 28, 4),
>
>         /* Audio Block */
>         DIV(none, "dout_maudio0", "mout_maudio0", DIV_MAU, 20, 4),
> @@ -570,7 +570,7 @@ struct samsung_gate_clock exynos5420_gate_clks[] __initdata = {
>                 GATE_TOP_SCLK_DISP1, 3, CLK_SET_RATE_PARENT, 0),
>         GATE(sclk_hdmi, "sclk_hdmi", "mout_hdmi",
>                 GATE_TOP_SCLK_DISP1, 9, CLK_SET_RATE_PARENT, 0),
> -       GATE(sclk_pixel, "sclk_pixel", "dout_hdmi_pixel",
> +       GATE(none, "sclk_pixel", "dout_hdmi_pixel",
>                 GATE_TOP_SCLK_DISP1, 10, CLK_SET_RATE_PARENT, 0),
>         GATE(sclk_dp1, "sclk_dp1", "dout_dp1",
>                 GATE_TOP_SCLK_DISP1, 20, CLK_SET_RATE_PARENT, 0),
> --
> 1.7.10.4
>
