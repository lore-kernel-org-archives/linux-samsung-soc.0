From: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Subject: Re: Role of PLL_ENABLE_BIT
Date: Thu, 31 Jul 2014 10:36:57 +0545
Message-ID: <CAKew6eUinuZ0gNu5EzH7+N2VQiXD6ujZ9FY9rwY-cqa=WkxZjA@mail.gmail.com>
References: <2111968107.110151406781109677.JavaMail.weblogic@epmlwas02a>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:42381 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750975AbaGaEv6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 00:51:58 -0400
Received: by mail-ie0-f177.google.com with SMTP id at20so2948815iec.36
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Jul 2014 21:51:58 -0700 (PDT)
In-Reply-To: <2111968107.110151406781109677.JavaMail.weblogic@epmlwas02a>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, hsnaves@gmail.com
Cc: Mike Turquette <mturquette@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Vikas Sajjan <sajjan.linux@gmail.com>, Yadwinder Singh <yadi.brar@samsung.com>

Hi Humberto,


> ------- Original Message -------
> Sender : Humberto Naves<hsnaves@gmail.com>
> Date : Jul 31, 2014 00:16 (GMT+09:00)
> Title : Role of PLL_ENABLE_BIT
>
> Hi,
>
>
> I am using an ODROID-XU board, and I was trying to change the rates of some PLL clocks for a while, but I could not. After a while, I realized that the cpu was trapped in an infinite loop waiting for the PLL35XX_LOCK_STAT bit to be set. Furthermore, I discovered that the reason was that the the PLL35XX_ENABLE_BIT was not set.
>
>
> I wonder if this is really a driver problem, since in the set_rate functions, the ENABLE_BIT is not set. Can someone confirm if this is indeed the expected behavior of the driver?
>

hmm .. actually it doesn't clear also ENABLE_BIT, I wonder how its getting clear
in your case since we don't have enable/disable() implemented yet.

>
>
> By the way, In order to solve this issue, I changed the files according to the following diff
>
>
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> index b07fad2..9300274 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -131,14 +131,15 @@ static const struct clk_ops samsung_pll3000_clk_ops = {
>  /* Maximum lock time can be 270 * PDIV cycles */
>  #define PLL35XX_LOCK_FACTOR (270)
>
> -#define PLL35XX_MDIV_MASK       (0x3FF)
> -#define PLL35XX_PDIV_MASK       (0x3F)
> -#define PLL35XX_SDIV_MASK       (0x7)
> +#define PLL35XX_MDIV_MASK (0x3FF)
> +#define PLL35XX_PDIV_MASK (0x3F)
> +#define PLL35XX_SDIV_MASK (0x7)
>  #define PLL35XX_LOCK_STAT_MASK (0x1)
> -#define PLL35XX_MDIV_SHIFT      (16)
> -#define PLL35XX_PDIV_SHIFT      (8)
> -#define PLL35XX_SDIV_SHIFT      (0)
> +#define PLL35XX_MDIV_SHIFT (16)
> +#define PLL35XX_PDIV_SHIFT (8)
> +#define PLL35XX_SDIV_SHIFT (0)
>  #define PLL35XX_LOCK_STAT_SHIFT (29)
> +#define PLL35XX_ENABLE_SHIFT (31)
>
>  static unsigned long samsung_pll35xx_recalc_rate(struct clk_hw *hw,
>   unsigned long parent_rate)
> @@ -190,6 +191,7 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
>   /* If only s change, change just s value only*/
>   tmp &= ~(PLL35XX_SDIV_MASK << PLL35XX_SDIV_SHIFT);
>   tmp |= rate->sdiv << PLL35XX_SDIV_SHIFT;
> + tmp |= (1 << PLL35XX_ENABLE_SHIFT);
>   __raw_writel(tmp, pll->con_reg);
>
>   return 0;
> @@ -206,6 +208,7 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
>   tmp |= (rate->mdiv << PLL35XX_MDIV_SHIFT) |
>   (rate->pdiv << PLL35XX_PDIV_SHIFT) |
>   (rate->sdiv << PLL35XX_SDIV_SHIFT);
> + tmp |= (1 << PLL35XX_ENABLE_SHIFT);

Ideally tmp should already have this bit set since we are not clearing it
after doing tmp = __raw_readl(tmp);

Can you please check value of tmp here ? and Is there anything else in
your kernel clearing this bit ?


Regards,
Yadwinder

>   __raw_writel(tmp, pll->con_reg);
>
>   /* wait_lock_time */
> @@ -242,6 +245,7 @@ static const struct clk_ops samsung_pll35xx_clk_min_ops = {
>  #define PLL36XX_SDIV_SHIFT (0)
>  #define PLL36XX_KDIV_SHIFT (0)
>  #define PLL36XX_LOCK_STAT_SHIFT (29)
> +#define PLL36XX_ENABLE_SHIFT (31)
>
>  static unsigned long samsung_pll36xx_recalc_rate(struct clk_hw *hw,
>   unsigned long parent_rate)
> @@ -299,6 +303,7 @@ static int samsung_pll36xx_set_rate(struct clk_hw *hw, unsigned long drate,
>   /* If only s change, change just s value only*/
>   pll_con0 &= ~(PLL36XX_SDIV_MASK << PLL36XX_SDIV_SHIFT);
>   pll_con0 |= (rate->sdiv << PLL36XX_SDIV_SHIFT);
> + pll_con0 |= (1 << PLL36XX_ENABLE_SHIFT);
>   __raw_writel(pll_con0, pll->con_reg);
>
>   return 0;
> @@ -314,6 +319,7 @@ static int samsung_pll36xx_set_rate(struct clk_hw *hw, unsigned long drate,
>   pll_con0 |= (rate->mdiv << PLL36XX_MDIV_SHIFT) |
>   (rate->pdiv << PLL36XX_PDIV_SHIFT) |
>   (rate->sdiv << PLL36XX_SDIV_SHIFT);
> + pll_con0 |= (1 << PLL36XX_ENABLE_SHIFT);
>   __raw_writel(pll_con0, pll->con_reg);
>
>   pll_con1 &= ~(PLL36XX_KDIV_MASK << PLL36XX_KDIV_SHIFT);
