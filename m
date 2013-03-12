From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 3/4] clk: samsung: always allocate the clk_table
Date: Tue, 12 Mar 2013 16:56:45 +0530
Message-ID: <CAJuYYwQK2HUO4xkVbBTgpX+6X7CL3sYCVY6N02_UgXjwfURSTw@mail.gmail.com>
References: <201303120042.09633.heiko@sntech.de>
	<201303120044.29499.heiko@sntech.de>
	<CAJuYYwT183EcZZ20P8D7AP34CwXfKYLzsmZdoJz1ny7XznzyAg@mail.gmail.com>
	<201303121150.35223.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f181.google.com ([209.85.210.181]:37968 "EHLO
	mail-ia0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932893Ab3CLL0q convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Mar 2013 07:26:46 -0400
Received: by mail-ia0-f181.google.com with SMTP id w33so4617264iag.40
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Mar 2013 04:26:45 -0700 (PDT)
In-Reply-To: <201303121150.35223.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, t.figa@samsung.com

On 12 March 2013 16:20, Heiko St=FCbner <heiko@sntech.de> wrote:
> Am Dienstag, 12. M=E4rz 2013, 10:54:47 schrieb Thomas Abraham:
>> On 12 March 2013 05:14, Heiko St=FCbner <heiko@sntech.de> wrote:
>> > This is needed to allow looking up previous created clocks when
>> > adding separate aliases to them.
>> >
>> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>> > ---
>> >
>> >  drivers/clk/samsung/clk.c |    2 +-
>> >  1 files changed, 1 insertions(+), 1 deletions(-)
>> >
>> > diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
>> > index 1a5de69..7c943f8 100644
>> > --- a/drivers/clk/samsung/clk.c
>> > +++ b/drivers/clk/samsung/clk.c
>> > @@ -58,11 +58,11 @@ void __init samsung_clk_init(struct device_nod=
e *np,
>> > void __iomem *base,
>> >
>> >  {
>> >
>> >         reg_base =3D base;
>> >
>> > -#ifdef CONFIG_OF
>> >
>> >         clk_table =3D kzalloc(sizeof(struct clk *) * nr_clks, GFP_=
KERNEL);
>> >         if (!clk_table)
>> >
>> >                 panic("could not allocate clock lookup table\n");
>>
>> This change is fine but one point that should be considered is that =
on
>> non-dt platforms, the memory allocation of clk_table cannot really b=
e
>> justified just because few clocks require two or more aliases.
>
> hmm, at least on s3c24xx there are quite a lot of the clocks requirin=
g more
> than one alias. Also the clk_table is allocated on all dt platforms s=
o these
> platforms have to handle the (small) memory consumption in any case a=
nd non-dt
> platforms are supposed to die out in the not to distant future.
>
> I.e. I'm working on s3c24xx dt support, Tomasz is working on s3c64xx =
dt
> support, exynos5 already only has dt support and exynos4 will probabl=
y lose
> non-dt support at some point. And if someone converts the other s5p S=
oCs to
> the common clock framework they should already have the means to go t=
o dt
> directly by then.
>
> So the non-dt common-clock path is merely a "short" intermediate step=
 to
> support smooth transitions to dt making the memory argument in my opi=
nion a
> moot point :-)
>
>
> Handling the aliases directly also requires adding quit a lot more
> {MUX/DIV/...}_*A aliases for all the necessary combinations.
>
> And in general I also find the readability of separate aliases a lot =
better -
> as shown in the s3c2443 clk driver in the second series. And the remo=
val once
> we only support dt will be a lot cleaner too.

True, I agree on your comments.

=46or this patch,
Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>

>
>
> Heiko
>
>> Instead, the optional alias passed for divider/mux register function=
s
>> can actually be a list of alias names, the list being terminated by =
a
>> zero-length string. The clock register helper functions can then loo=
p
>> through that list and register all the aliases.
>
>
>> > +#ifdef CONFIG_OF
>> >
>> >         clk_data.clks =3D clk_table;
>> >         clk_data.clk_num =3D nr_clks;
>> >         of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data)=
;
>> >
>> > --
>> > 1.7.2.3
>
