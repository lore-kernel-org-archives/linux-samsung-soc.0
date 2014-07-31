From: Humberto Naves <hsnaves@gmail.com>
Subject: Fwd: Role of PLL_ENABLE_BIT
Date: Thu, 31 Jul 2014 11:06:19 +0200
Message-ID: <CAEe5pB-OQe7sftMcveUAX+L7kkv+ZVBe3YufCr4jsHqv4V_HiQ@mail.gmail.com>
References: <2111968107.110151406781109677.JavaMail.weblogic@epmlwas02a>
 <CAKew6eUinuZ0gNu5EzH7+N2VQiXD6ujZ9FY9rwY-cqa=WkxZjA@mail.gmail.com> <CAEe5pB_3PfgaWMBA2nDF018p6oGtP3BTBp_dxt2V+hh192+dVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:46859 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932239AbaGaJGj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 05:06:39 -0400
Received: by mail-oi0-f46.google.com with SMTP id i138so1631943oig.33
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Jul 2014 02:06:39 -0700 (PDT)
In-Reply-To: <CAEe5pB_3PfgaWMBA2nDF018p6oGtP3BTBp_dxt2V+hh192+dVQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

---------- Forwarded message ----------
From: Humberto Naves <hsnaves@gmail.com>
Date: Thu, Jul 31, 2014 at 11:01 AM
Subject: Re: Role of PLL_ENABLE_BIT
To: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mike
Turquette <mturquette@linaro.org>, Tomasz Figa <t.figa@samsung.com>,
Vikas Sajjan <sajjan.linux@gmail.com>, Yadwinder Singh
<yadi.brar@samsung.com>


Hi Yadwinder,

So, the PLL that I am interested in is the VPLL, which is a PLL36XX
model. I just tested it again, and I read the address 0x10020140
before the kernel starts, and apparently it comes zeroed from U-boot.
I have no idea why this happens.

But in any case, since set_rate always enters an infinite loop if the
bit is not set, wouldn't it be more reasonable to just enable this bet
every time the rate function is called? I think this is a much more
robust solution that to expect this bit to be set previously by the
boot loader. And in all implementations of the PLL's I've seen for the
different exynos SoCs, none of them use the PLL gate functionality, as
they rely on muxes and other gates that attached in front of these
clocks. For instance, in my case, there is the mout_vpll that can
select from either the VPLL output fout_vpll or its source
mout_vpllsrc.

If you do not like this solution, there is an alternative solution. We
could add the enable/disable functions to all the PLLs, and at the
beginning of set_rate, we check if the clock is enabled. If not,
return an error code such as EINVAL or EBUSY. I strongly object to
this alternative, since it adds complexity to code and will not be
necessarily useful.

Best,
Humberto





On Thu, Jul 31, 2014 at 6:51 AM, Yadwinder Singh Brar
<yadi.brar01@gmail.com> wrote:
>
> Hi Humberto,
>
>
> > ------- Original Message -------
> > Sender : Humberto Naves<hsnaves@gmail.com>
> > Date : Jul 31, 2014 00:16 (GMT+09:00)
> > Title : Role of PLL_ENABLE_BIT
> >
> > Hi,
> >
> >
> > I am using an ODROID-XU board, and I was trying to change the rates of some PLL clocks for a while, but I could not. After a while, I realized that the cpu was trapped in an infinite loop waiting for the PLL35XX_LOCK_STAT bit to be set. Furthermore, I discovered that the reason was that the the PLL35XX_ENABLE_BIT was not set.
> >
> >
> > I wonder if this is really a driver problem, since in the set_rate functions, the ENABLE_BIT is not set. Can someone confirm if this is indeed the expected behavior of the driver?
> >
>
> hmm .. actually it doesn't clear also ENABLE_BIT, I wonder how its getting clear
> in your case since we don't have enable/disable() implemented yet.
>
> >
> >
> > By the way, In order to solve this issue, I changed the files according to the following diff
> >
> >
> > diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> > index b07fad2..9300274 100644
> > --- a/drivers/clk/samsung/clk-pll.c
> > +++ b/drivers/clk/samsung/clk-pll.c
> > @@ -131,14 +131,15 @@ static const struct clk_ops samsung_pll3000_clk_ops = {
> >  /* Maximum lock time can be 270 * PDIV cycles */
> >  #define PLL35XX_LOCK_FACTOR (270)
> >
> > -#define PLL35XX_MDIV_MASK       (0x3FF)
> > -#define PLL35XX_PDIV_MASK       (0x3F)
> > -#define PLL35XX_SDIV_MASK       (0x7)
> > +#define PLL35XX_MDIV_MASK (0x3FF)
> > +#define PLL35XX_PDIV_MASK (0x3F)
> > +#define PLL35XX_SDIV_MASK (0x7)
> >  #define PLL35XX_LOCK_STAT_MASK (0x1)
> > -#define PLL35XX_MDIV_SHIFT      (16)
> > -#define PLL35XX_PDIV_SHIFT      (8)
> > -#define PLL35XX_SDIV_SHIFT      (0)
> > +#define PLL35XX_MDIV_SHIFT (16)
> > +#define PLL35XX_PDIV_SHIFT (8)
> > +#define PLL35XX_SDIV_SHIFT (0)
> >  #define PLL35XX_LOCK_STAT_SHIFT (29)
> > +#define PLL35XX_ENABLE_SHIFT (31)
> >
> >  static unsigned long samsung_pll35xx_recalc_rate(struct clk_hw *hw,
> >   unsigned long parent_rate)
> > @@ -190,6 +191,7 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
> >   /* If only s change, change just s value only*/
> >   tmp &= ~(PLL35XX_SDIV_MASK << PLL35XX_SDIV_SHIFT);
> >   tmp |= rate->sdiv << PLL35XX_SDIV_SHIFT;
> > + tmp |= (1 << PLL35XX_ENABLE_SHIFT);
> >   __raw_writel(tmp, pll->con_reg);
> >
> >   return 0;
> > @@ -206,6 +208,7 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
> >   tmp |= (rate->mdiv << PLL35XX_MDIV_SHIFT) |
> >   (rate->pdiv << PLL35XX_PDIV_SHIFT) |
> >   (rate->sdiv << PLL35XX_SDIV_SHIFT);
> > + tmp |= (1 << PLL35XX_ENABLE_SHIFT);
>
> Ideally tmp should already have this bit set since we are not clearing it
> after doing tmp = __raw_readl(tmp);
>
> Can you please check value of tmp here ? and Is there anything else in
> your kernel clearing this bit ?
>
>
> Regards,
> Yadwinder
>
> >   __raw_writel(tmp, pll->con_reg);
> >
> >   /* wait_lock_time */
> > @@ -242,6 +245,7 @@ static const struct clk_ops samsung_pll35xx_clk_min_ops = {
> >  #define PLL36XX_SDIV_SHIFT (0)
> >  #define PLL36XX_KDIV_SHIFT (0)
> >  #define PLL36XX_LOCK_STAT_SHIFT (29)
> > +#define PLL36XX_ENABLE_SHIFT (31)
> >
> >  static unsigned long samsung_pll36xx_recalc_rate(struct clk_hw *hw,
> >   unsigned long parent_rate)
> > @@ -299,6 +303,7 @@ static int samsung_pll36xx_set_rate(struct clk_hw *hw, unsigned long drate,
> >   /* If only s change, change just s value only*/
> >   pll_con0 &= ~(PLL36XX_SDIV_MASK << PLL36XX_SDIV_SHIFT);
> >   pll_con0 |= (rate->sdiv << PLL36XX_SDIV_SHIFT);
> > + pll_con0 |= (1 << PLL36XX_ENABLE_SHIFT);
> >   __raw_writel(pll_con0, pll->con_reg);
> >
> >   return 0;
> > @@ -314,6 +319,7 @@ static int samsung_pll36xx_set_rate(struct clk_hw *hw, unsigned long drate,
> >   pll_con0 |= (rate->mdiv << PLL36XX_MDIV_SHIFT) |
> >   (rate->pdiv << PLL36XX_PDIV_SHIFT) |
> >   (rate->sdiv << PLL36XX_SDIV_SHIFT);
> > + pll_con0 |= (1 << PLL36XX_ENABLE_SHIFT);
> >   __raw_writel(pll_con0, pll->con_reg);
> >
> >   pll_con1 &= ~(PLL36XX_KDIV_MASK << PLL36XX_KDIV_SHIFT);
