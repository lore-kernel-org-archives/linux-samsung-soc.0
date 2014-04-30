From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH v3 15/16] clk: exynos5420: create clock ID for mout_sclk_vpll
Date: Wed, 30 Apr 2014 19:24:39 +0530
Message-ID: <CAGOxZ50ZQ9NkwmBGv2M1wgHJyAnWtF8MA3QA6pen0teUHkuKog@mail.gmail.com>
References: <1398344632-18623-1-git-send-email-shaik.ameer@samsung.com> <1398344632-18623-16-git-send-email-shaik.ameer@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f53.google.com ([209.85.213.53]:53152 "EHLO
	mail-yh0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759153AbaD3NzU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Apr 2014 09:55:20 -0400
In-Reply-To: <1398344632-18623-16-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shaik Ameer Basha <shaik.ameer@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Ameer Basha Shaik <shaik.samsung@gmail.com>, Mike Turquette <mturquette@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>

Hi Shaik

On Thu, Apr 24, 2014 at 6:33 PM, Shaik Ameer Basha
<shaik.ameer@samsung.com> wrote:
> This patch adds clock ID for mout_sclk_vpll clock
>
> Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5420.c   |    2 +-
>  include/dt-bindings/clock/exynos5420.h |    1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 944ff20..33a48d2 100755
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -437,7 +437,7 @@ static struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
>                         SRC_TOP5, 28, 1),
>
>         MUX(0, "mout_sclk_mpll", mout_mpll_p, SRC_TOP6, 0, 1),
> -       MUX(0, "mout_sclk_vpll", mout_vpll_p, SRC_TOP6, 4, 1),
> +       MUX(CLK_MOUT_VPLL, "mout_sclk_vpll", mout_vpll_p, SRC_TOP6, 4, 1),
Any perticular reason for just this change??

>         MUX(0, "mout_sclk_spll", mout_spll_p, SRC_TOP6, 8, 1),
>         MUX(0, "mout_sclk_ipll", mout_ipll_p, SRC_TOP6, 12, 1),
>         MUX(0, "mout_sclk_rpll", mout_rpll_p, SRC_TOP6, 16, 1),
> diff --git a/include/dt-bindings/clock/exynos5420.h b/include/dt-bindings/clock/exynos5420.h
> index b2410bc..7c80443 100755
> --- a/include/dt-bindings/clock/exynos5420.h
> +++ b/include/dt-bindings/clock/exynos5420.h
> @@ -190,6 +190,7 @@
>  #define CLK_MOUT_HDMI          640
>  #define CLK_MOUT_MAUDIO0       642
>  #define CLK_MOUT_G3D           643
> +#define CLK_MOUT_VPLL          644
>
>  /* divider clocks */
>  #define CLK_DOUT_PIXEL         768
> --
> 1.7.9.5
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



-- 
Regards,
Alim
