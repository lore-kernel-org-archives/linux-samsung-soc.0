From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 12/16] clk: samsung: pll: Add support for rate
 configuration of PLL46xx
Date: Wed, 21 Aug 2013 14:44:41 +0200
Message-ID: <14520108.LqsSBuPVXk@amdc1227>
References: <1377019903-14614-1-git-send-email-t.figa@samsung.com>
 <1377019903-14614-13-git-send-email-t.figa@samsung.com>
 <CAKew6eU4ofumk64fwZSK-R-UUBQos6UU1TLDdVRDE-bvOrbitw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:10261 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751511Ab3HUMop (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Aug 2013 08:44:45 -0400
In-reply-to: <CAKew6eU4ofumk64fwZSK-R-UUBQos6UU1TLDdVRDE-bvOrbitw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Doug Anderson <dianders@chromium.org>, Kumar Gala <galak@codeaurora.org>, Kyungmin Park <kyungmin.park@samsung.com>

On Wednesday 21 of August 2013 18:02:16 Yadwinder Singh Brar wrote:
> > +       con0 |= (rate->mdiv << PLL46XX_MDIV_SHIFT) |
> > +                       (rate->pdiv << PLL46XX_PDIV_SHIFT) |
> > +                       (rate->sdiv << PLL46XX_SDIV_SHIFT) |
> > +                       (rate->vsel << PLL46XX_VSEL_SHIFT);
> > +
> > +       /* Set PLL AFC, MFR and MRR values. */
> 
> This comments seems to be miss match with below code.

Hmm, looks like a copy/paste error. Thanks for spotting.

> > +       con1 = __raw_readl(pll->con_reg + 0x4);
> > +       con1 &= ~((PLL46XX_KDIV_MASK << PLL46XX_KDIV_SHIFT) |
> > +                       (PLL46XX_MFR_MASK << PLL46XX_MFR_SHIFT) |
> > +                       (PLL46XX_MRR_MASK << PLL46XX_MRR_SHIFT));
> > +       con1 |= (rate->kdiv << PLL46XX_KDIV_SHIFT) |
> > +                       (rate->mfr << PLL46XX_MFR_SHIFT) |
> > +                       (rate->mrr << PLL46XX_MRR_SHIFT);
> > +
> 
> <snip>
> 
> > --- a/drivers/clk/samsung/clk-pll.h
> > +++ b/drivers/clk/samsung/clk-pll.h
> > @@ -51,6 +51,28 @@ enum samsung_pll_type {
> > 
> >                 .afc    =       (_afc),                         \
> >         
> >         }
> > 
> > +#define PLL_4600_RATE(_rate, _m, _p, _s, _k, _vsel)            \
> > +       {                                                       \
> > +               .rate   =       (_rate),                        \
> > +               .mdiv   =       (_m),                           \
> > +               .pdiv   =       (_p),                           \
> > +               .sdiv   =       (_s),                           \
> > +               .kdiv   =       (_k),                           \
> > +               .vsel   =       (_vsel),                        \
> > +       }
> > +
> > +#define PLL_4650_RATE(_rate, _m, _p, _s, _k, _mfr, _mrr, _vsel)       
> > \ +       {                                                       \ + 
> >              .rate   =       (_rate),                        \ +      
> >         .mdiv   =       (_m),                           \ +           
> >    .pdiv   =       (_p),                           \ +              
> > .sdiv   =       (_s),                           \ +              
> > .kdiv   =       (_k),                           \ +               .mfr
> >    =       (_mfr),                         \ +               .mrr    =
> >       (_mrr),                         \ +               .vsel   =     
> >  (_vsel),                        \ +       }
> > +
> > 
> >  /* NOTE: Rate table should be kept sorted in descending order. */
> >  
> >  struct samsung_pll_rate_table {
> > 
> > @@ -60,6 +82,9 @@ struct samsung_pll_rate_table {
> > 
> >         unsigned int sdiv;
> >         unsigned int kdiv;
> >         unsigned int afc;
> > 
> > +       unsigned int mfr;
> > +       unsigned int mrr;
> > +       unsigned int vsel;
> > 
> >  };
> 
> This struct seems to be expanding too much.

I don't think it's a problem. How many bytes such tables can occupy in a 
system?

> Can we re-think on options for using bit map same as register
> definition? It can reduce code in set_rate also little bit.

IMHO it is more clear what the code does when accessing a single 
coefficient at once.

In addition you still would need to preserve bitfields that are not changed 
by the driver and also unpack some of the coefficients anyway, like pdiv 
that is used to calculate lock time.

Best regards,
Tomasz
