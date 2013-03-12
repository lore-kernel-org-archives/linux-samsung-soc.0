From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 3/4] clk: samsung: always allocate the clk_table
Date: Tue, 12 Mar 2013 11:50:34 +0100
Message-ID: <201303121150.35223.heiko@sntech.de>
References: <201303120042.09633.heiko@sntech.de> <201303120044.29499.heiko@sntech.de> <CAJuYYwT183EcZZ20P8D7AP34CwXfKYLzsmZdoJz1ny7XznzyAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:45526 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753479Ab3CLKuj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Mar 2013 06:50:39 -0400
In-Reply-To: <CAJuYYwT183EcZZ20P8D7AP34CwXfKYLzsmZdoJz1ny7XznzyAg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, t.figa@samsung.com

Am Dienstag, 12. M=E4rz 2013, 10:54:47 schrieb Thomas Abraham:
> On 12 March 2013 05:14, Heiko St=FCbner <heiko@sntech.de> wrote:
> > This is needed to allow looking up previous created clocks when
> > adding separate aliases to them.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >=20
> >  drivers/clk/samsung/clk.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >=20
> > diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> > index 1a5de69..7c943f8 100644
> > --- a/drivers/clk/samsung/clk.c
> > +++ b/drivers/clk/samsung/clk.c
> > @@ -58,11 +58,11 @@ void __init samsung_clk_init(struct device_node=
 *np,
> > void __iomem *base,
> >=20
> >  {
> > =20
> >         reg_base =3D base;
> >=20
> > -#ifdef CONFIG_OF
> >=20
> >         clk_table =3D kzalloc(sizeof(struct clk *) * nr_clks, GFP_K=
ERNEL);
> >         if (!clk_table)
> >        =20
> >                 panic("could not allocate clock lookup table\n");
>=20
> This change is fine but one point that should be considered is that o=
n
> non-dt platforms, the memory allocation of clk_table cannot really be
> justified just because few clocks require two or more aliases.

hmm, at least on s3c24xx there are quite a lot of the clocks requiring =
more=20
than one alias. Also the clk_table is allocated on all dt platforms so =
these=20
platforms have to handle the (small) memory consumption in any case and=
 non-dt=20
platforms are supposed to die out in the not to distant future.

I.e. I'm working on s3c24xx dt support, Tomasz is working on s3c64xx dt=
=20
support, exynos5 already only has dt support and exynos4 will probably =
lose=20
non-dt support at some point. And if someone converts the other s5p SoC=
s to=20
the common clock framework they should already have the means to go to =
dt=20
directly by then.

So the non-dt common-clock path is merely a "short" intermediate step t=
o=20
support smooth transitions to dt making the memory argument in my opini=
on a=20
moot point :-)


Handling the aliases directly also requires adding quit a lot more=20
{MUX/DIV/...}_*A aliases for all the necessary combinations.

And in general I also find the readability of separate aliases a lot be=
tter -=20
as shown in the s3c2443 clk driver in the second series. And the remova=
l once=20
we only support dt will be a lot cleaner too.


Heiko

> Instead, the optional alias passed for divider/mux register functions
> can actually be a list of alias names, the list being terminated by a
> zero-length string. The clock register helper functions can then loop
> through that list and register all the aliases.


> > +#ifdef CONFIG_OF
> >=20
> >         clk_data.clks =3D clk_table;
> >         clk_data.clk_num =3D nr_clks;
> >         of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
> >=20
> > --
> > 1.7.2.3
