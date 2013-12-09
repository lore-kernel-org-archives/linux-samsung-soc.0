From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 6/7] clk/samsung: add support for pll2650xx
Date: Mon, 9 Dec 2013 13:39:18 +0530
Message-ID: <CAK9yfHzVv0097HEcRiJjvhANE-ev133+1fHTYgvOgd-0E6MfAQ@mail.gmail.com>
References: <1386345391-23482-1-git-send-email-rahul.sharma@samsung.com>
	<1386345391-23482-7-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:47249 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760968Ab3LIIJS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 03:09:18 -0500
Received: by mail-oa0-f44.google.com with SMTP id m1so3474806oag.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Dec 2013 00:09:18 -0800 (PST)
In-Reply-To: <1386345391-23482-7-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, PANKAJ KUMAR DUBEY <pankaj.dubey@samsung.com>, Young-Gun Jang <yg1004.jang@samsung.com>, Arun Kumar <arun.kk@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>

Hi Rahul,

On 6 December 2013 21:26, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> Add support for pll2650xx in samsung pll file. This pll variant
> is close to pll36xx but uses CON2 registers instead of CON1.
>
> Aud_pll in Exynos5260 is pll2650xx and uses this code.
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  drivers/clk/samsung/clk-pll.c |  101 +++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/samsung/clk-pll.h |    2 +-
>  2 files changed, 102 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> index 237a889..60c5679 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -811,6 +811,101 @@ static const struct clk_ops samsung_pll2550xx_clk_min_ops = {
>         .recalc_rate = samsung_pll2550xx_recalc_rate,
>  };
>
> +/*
> + * PLL2650XX Clock Type
> + */
> +
> +/* Maximum lock time can be 3000 * PDIV cycles */
> +#define PLL2650XX_LOCK_FACTOR (3000)
> +
> +#define PLL2650XX_MDIV_SHIFT           (9)
> +#define PLL2650XX_PDIV_SHIFT           (3)
> +#define PLL2650XX_SDIV_SHIFT           (0)
> +#define PLL2650XX_KDIV_SHIFT           (0)
> +#define PLL2650XX_MDIV_MASK            (0x1ff)
> +#define PLL2650XX_PDIV_MASK            (0x3f)
> +#define PLL2650XX_SDIV_MASK            (0x7)
> +#define PLL2650XX_KDIV_MASK            (0xffff)
> +#define PLL2650XX_PLL_ENABLE_SHIFT     (23)
> +#define PLL2650XX_PLL_LOCKTIME_SHIFT   (21)
> +#define PLL2650XX_PLL_FOUTMASK_SHIFT   (31)

nit: Braces are unnecessary.

-- 
With warm regards,
Sachin
