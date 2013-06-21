From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 5/5] clk/exynos5250: change parent to aclk200_disp1 for
 hdmi subsystem
Date: Fri, 21 Jun 2013 10:21:06 +0530
Message-ID: <CAPdUM4Nzhg=UC-ojFxZfMxfwK_5PQv=LoUjrYgUPhRkM+_F9dA@mail.gmail.com>
References: <1370862062-16680-1-git-send-email-rahul.sharma@samsung.com>
	<1370862062-16680-6-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:50253 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757274Ab3FUEvI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Jun 2013 00:51:08 -0400
Received: by mail-wi0-f180.google.com with SMTP id c10so218083wiw.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2013 21:51:06 -0700 (PDT)
In-Reply-To: <1370862062-16680-6-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, arun.kk@samsung.com, Mike Turquette <mturquette@linaro.org>

+Mike

On Mon, Jun 10, 2013 at 4:31 PM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> parent of hdmi and mixer block is mentioned as aclk200 which is
> not correct. It is clocked by the ouput of aclk200_disp1. Hence
> parent for mixer and hdmi clocks is changed to aclk200_disp1.
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5250.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
> index bb93d61..2075f5f 100644
> --- a/drivers/clk/samsung/clk-exynos5250.c
> +++ b/drivers/clk/samsung/clk-exynos5250.c
> @@ -468,8 +468,8 @@ struct samsung_gate_clock exynos5250_gate_clks[] __initdata = {
>         GATE(mie1, "mie1", "aclk200", GATE_IP_DISP1, 1, 0, 0),
>         GATE(dsim0, "dsim0", "aclk200", GATE_IP_DISP1, 3, 0, 0),
>         GATE(dp, "dp", "aclk200", GATE_IP_DISP1, 4, 0, 0),
> -       GATE(mixer, "mixer", "aclk200", GATE_IP_DISP1, 5, 0, 0),
> -       GATE(hdmi, "hdmi", "aclk200", GATE_IP_DISP1, 6, 0, 0),
> +       GATE(mixer, "mixer", "aclk200_disp1", GATE_IP_DISP1, 5, 0, 0),
> +       GATE(hdmi, "hdmi", "aclk200_disp1", GATE_IP_DISP1, 6, 0, 0),
>  };
>
>  static __initdata struct of_device_id ext_clk_match[] = {
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
