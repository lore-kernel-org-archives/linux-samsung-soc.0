From: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Subject: Re: [PATCH 12/16] clk: samsung: pll: Add support for rate
 configuration of PLL46xx
Date: Wed, 21 Aug 2013 18:42:40 +0530
Message-ID: <CAKew6eUGOgUWzgU7SnCjAenSHxwaOgFUhPWHbav3C8z=tS+EpA@mail.gmail.com>
References: <1377019903-14614-1-git-send-email-t.figa@samsung.com>
	<1377019903-14614-13-git-send-email-t.figa@samsung.com>
	<CAKew6eU4ofumk64fwZSK-R-UUBQos6UU1TLDdVRDE-bvOrbitw@mail.gmail.com>
	<14520108.LqsSBuPVXk@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:58714 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751463Ab3HUNMl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Aug 2013 09:12:41 -0400
In-Reply-To: <14520108.LqsSBuPVXk@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Doug Anderson <dianders@chromium.org>, Kumar Gala <galak@codeaurora.org>, Kyungmin Park <kyungmin.park@samsung.com>

>> <snip>
>>
>> > --- a/drivers/clk/samsung/clk-pll.h
>> > +++ b/drivers/clk/samsung/clk-pll.h
>> > @@ -51,6 +51,28 @@ enum samsung_pll_type {
>> >
>> >                 .afc    =       (_afc),                         \
>> >
>> >         }
>> >
>> > +#define PLL_4600_RATE(_rate, _m, _p, _s, _k, _vsel)            \
>> > +       {                                                       \
>> > +               .rate   =       (_rate),                        \
>> > +               .mdiv   =       (_m),                           \
>> > +               .pdiv   =       (_p),                           \
>> > +               .sdiv   =       (_s),                           \
>> > +               .kdiv   =       (_k),                           \
>> > +               .vsel   =       (_vsel),                        \
>> > +       }
>> > +
>> > +#define PLL_4650_RATE(_rate, _m, _p, _s, _k, _mfr, _mrr, _vsel)
>> > \ +       {                                                       \ +
>> >              .rate   =       (_rate),                        \ +
>> >         .mdiv   =       (_m),                           \ +
>> >    .pdiv   =       (_p),                           \ +
>> > .sdiv   =       (_s),                           \ +
>> > .kdiv   =       (_k),                           \ +               .mfr
>> >    =       (_mfr),                         \ +               .mrr    =
>> >       (_mrr),                         \ +               .vsel   =
>> >  (_vsel),                        \ +       }
>> > +
>> >
>> >  /* NOTE: Rate table should be kept sorted in descending order. */
>> >
>> >  struct samsung_pll_rate_table {
>> >
>> > @@ -60,6 +82,9 @@ struct samsung_pll_rate_table {
>> >
>> >         unsigned int sdiv;
>> >         unsigned int kdiv;
>> >         unsigned int afc;
>> >
>> > +       unsigned int mfr;
>> > +       unsigned int mrr;
>> > +       unsigned int vsel;
>> >
>> >  };
>>
>> This struct seems to be expanding too much.
>
> I don't think it's a problem. How many bytes such tables can occupy in a
> system?
>

no doubt comparing with memory size its negligible..
but comparing only struct size and coding lines it seems costlier :) .

>> Can we re-think on options for using bit map same as register
>> definition? It can reduce code in set_rate also little bit.
>
> IMHO it is more clear what the code does when accessing a single
> coefficient at once.
>
> In addition you still would need to preserve bitfields that are not changed
> by the driver

Sorry, I can't see any such problem, it will OR only the required bits.

> and also unpack some of the coefficients anyway, like pdiv
> that is used to calculate lock time.

Agree, but cases of unpacking will always be less than cases of
shifting and packing.

Anyways, its only MHO :).

Regards,
Yadwinder
