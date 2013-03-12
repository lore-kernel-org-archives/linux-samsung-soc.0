From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 4/4] clk: samsung: add infrastructure to add separate aliases
Date: Tue, 12 Mar 2013 16:18:52 +0530
Message-ID: <CAJuYYwR4mBmuytzZCovncEjmKQX=O4FFAJJ5vZ-tmyDpavh2hQ@mail.gmail.com>
References: <201303120042.09633.heiko@sntech.de>
	<201303120045.25824.heiko@sntech.de>
	<CAJuYYwQ+-NhP+t-WEUhZxCN3AQFUzLSqt9aFWu5K0uwL_jO20A@mail.gmail.com>
	<201303121104.38251.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f180.google.com ([209.85.210.180]:52128 "EHLO
	mail-ia0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932699Ab3CLKsx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Mar 2013 06:48:53 -0400
Received: by mail-ia0-f180.google.com with SMTP id f27so4753270iae.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Mar 2013 03:48:52 -0700 (PDT)
In-Reply-To: <201303121104.38251.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, t.figa@samsung.com

On 12 March 2013 15:34, Heiko St=FCbner <heiko@sntech.de> wrote:
> Am Dienstag, 12. M=E4rz 2013, 10:57:30 schrieb Thomas Abraham:
>> On 12 March 2013 05:15, Heiko St=FCbner <heiko@sntech.de> wrote:
>> > The current code adds aliases, if necessary, directly when adding =
the
>> > clock, limiting the number of possible aliases to one.
>> >
>> > Some platforms need more than one alias, like the hsmmc pclocks on
>> > s3c2416 which need a "hsmmc" and "mmc_busclk.0" alias for the s3c-=
sdhci
>> > driver.
>> >
>> > Therefore add the possibility to separately add clock aliases for
>> > previously created clocks.
>> >
>> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>> > ---
>> > change since the discussion: removed the list->alias check
>> >
>> >  drivers/clk/samsung/clk.c |   33 ++++++++++++++++++++++++++++++++=
+
>> >  drivers/clk/samsung/clk.h |   21 +++++++++++++++++++++
>> >  2 files changed, 54 insertions(+), 0 deletions(-)
>> >
>> > diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
>> > index 7c943f8..20ec566 100644
>> > --- a/drivers/clk/samsung/clk.c
>> > +++ b/drivers/clk/samsung/clk.c
>> > @@ -94,6 +94,39 @@ void samsung_clk_add_lookup(struct clk *clk, un=
signed
>> > int id)
>> >
>> >                 clk_table[id] =3D clk;
>> >
>> >  }
>> >
>> > +/* register a list of aliases */
>> > +void __init samsung_clk_register_alias(struct samsung_clock_alias=
 *list,
>> > +                                       unsigned int nr_clk)
>> > +{
>> > +       struct clk *clk;
>> > +       unsigned int idx, ret;
>> > +
>> > +       if (!clk_table) {
>> > +               pr_err("%s: clock table missing\n", __func__);
>> > +               return;
>> > +       }
>> > +
>> > +       for (idx =3D 0; idx < nr_clk; idx++, list++) {
>> > +               if (!list->id) {
>> > +                       pr_err("%s: clock id missing for index %d\=
n",
>> > __func__, +                               idx);
>> > +                       continue;
>> > +               }
>> > +
>> > +               clk =3D clk_table[list->id];
>> > +               if (!clk) {
>> > +                       pr_err("%s: failed to find clock %d\n", __=
func__,
>> > +                               list->id);
>> > +                       continue;
>> > +               }
>> > +
>> > +               ret =3D clk_register_clkdev(clk, list->alias,
>> > list->dev_name); +               if (ret)
>> > +                       pr_err("%s: failed to register lookup %s\n=
",
>> > +                                       __func__, list->alias);
>> > +       }
>> > +}
>> > +
>> >
>> >  /* register a list of fixed clocks */
>> >  void __init samsung_clk_register_fixed_rate(
>> >
>> >                 struct samsung_fixed_rate_clock *list, unsigned in=
t
>> >                 nr_clk)
>> >
>> > diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
>> > index 26a752b..6bacd6f 100644
>> > --- a/drivers/clk/samsung/clk.h
>> > +++ b/drivers/clk/samsung/clk.h
>> > @@ -23,6 +23,25 @@
>> >
>> >  #include <mach/map.h>
>> >
>> >  /**
>> >
>> > + * struct samsung_clock_alias: information about mux clock
>> > + * @id: platform specific id of the clock.
>> > + * @dev_name: name of the device to which this clock belongs.
>> > + * @alias: optional clock alias name to be assigned to this clock=
=2E
>> > + */
>> > +struct samsung_clock_alias {
>> > +       unsigned int            id;
>> > +       const char              *dev_name;
>> > +       const char              *alias;
>> > +};
>> > +
>> > +#define ALIAS(_id, dname, a)   \
>> > +       {                                                       \
>> > +               .id             =3D _id,                          =
\
>> > +               .dev_name       =3D dname,                        =
\
>> > +               .alias          =3D a,                            =
\
>> > +       }
>> > +
>> > +/**
>> >
>> >   * struct samsung_fixed_rate_clock: information about fixed-rate =
clock
>> >   * @id: platform specific id of the clock.
>> >   * @name: name of this fixed-rate clock.
>> >
>> > @@ -251,6 +270,8 @@ extern void __init samsung_clk_of_register_fix=
ed_ext(
>> >
>> >  extern void samsung_clk_add_lookup(struct clk *clk, unsigned int =
id);
>> >
>> > +extern void samsung_clk_register_alias(struct samsung_clock_alias=
 *list,
>> > +               unsigned int nr_clk);
>> >
>> >  extern void __init samsung_clk_register_fixed_rate(
>> >
>> >                 struct samsung_fixed_rate_clock *clk_list, unsigne=
d int
>> >                 nr_clk);
>> >
>> >  extern void __init samsung_clk_register_fixed_factor(
>> >
>> > --
>> > 1.7.2.3
>>
>> This change looks fine but as discussed on 3/4 patch of this series,
>> allocating clk_table for non-dt platforms would not be very helpful.
>
> But how would we look up the previously registered clk otherwise?
> Using clk_table for this lookup seemed like the best way to easily ac=
cess
> these clocks.

I did assume that the aliases for a clock are set when that clock is
registered. Are there any instances where the aliases have to be set
after a clock has been registered (using the samsung clock driver
helper functions)?

Thanks,
Thomas.

>
>
> Thanks
> Heiko
