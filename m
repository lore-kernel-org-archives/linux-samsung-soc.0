From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH] ARM: SAMSUNG: s3c_set_clksrc returns for single parent
	clock.
Date: Mon, 18 Jan 2010 01:59:14 +0000
Message-ID: <20100118015914.GG10014@trinity.fluff.org>
References: <1263775097-16062-1-git-send-email-thomas.ab@samsung.com> <20100118011028.GC10014@trinity.fluff.org> <84c135f51001171734l3f731217gbee1fb482fafbe1d@mail.gmail.com> <20100118014630.GE10014@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:33803 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751281Ab0ARB7Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 17 Jan 2010 20:59:16 -0500
Content-Disposition: inline
In-Reply-To: <20100118014630.GE10014@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: Thomas Abraham <thomas.ab@samsung.com>, linux-samsung-soc@vger.kernel.org

On Mon, Jan 18, 2010 at 01:46:30AM +0000, Ben Dooks wrote:
> On Mon, Jan 18, 2010 at 10:34:29AM +0900, Thomas Abraham wrote:
> > Hi Ben,
> >=20
> > On Mon, Jan 18, 2010 at 10:10 AM, Ben Dooks <ben-linux@fluff.org> w=
rote:
> > > On Mon, Jan 18, 2010 at 09:38:17AM +0900, Thomas Abraham wrote:
> > >> The function s3c_set_clksrc should return if the clksrc_clk cloc=
k has
> > >> only one possible parent clock.
> > >
> > > Does this actually relate to a real bug or is this something that=
 you've
> > > come across whilst reading the code?
> >=20
> > This is required in cases where a clock has a divider but no mux. I=
n
> > s3c_register_clksrc function, after the default set of clock
> > operations are assigned, the parent clock set function s3c_set_clks=
rc
> > is called. For clocks that do not have mux, the call to s3c_set_clk=
src
> > is incorrect.
>=20
> If you have a look at s3c_set_clksrc() , you will find it already
> checks to see if clk->reg_src.reg is set. It also doesn't call the
> setparent directly either, as it only needs to set clk->clk.parent
> field before exiting.
>=20
>    132          u32 clksrc =3D 0;
>    133 =20
>    134          if (clk->reg_src.reg)
>    135                  clksrc =3D __raw_readl(clk->reg_src.reg);
>    136 =20
>    137          clksrc &=3D mask;
>    138          clksrc >>=3D clk->reg_src.shift;
>    139 =20
>    140          if (clksrc > srcs->nr_sources || !srcs->sources[clksr=
c]) {
>    141                  printk(KERN_ERR "%s: bad source %d\n",
>    142                         clk->clk.name, clksrc);
>    143                  return;
>    144          }
>    145 =20
>    146          clk->clk.parent =3D srcs->sources[clksrc];
>=20
> This allows us to do some basic verification that the clksrc's source=
s
> data is valud (such that srcs->nr_sources at least contains one sourc=
e
> and that it is not NULL).

=46rom IRL conversation, it seems the problem is that if we do not
have reg_src.reg set at line 134 then we assume that the clksrc has
a srcs array to check. We should change the regs_src.reg code to
check whether the clk->clk.parent is already set and either return
or print a warnign if it is not set.
 =20
> > >
> > > From arch/arm/plat-samnsung/clock-clksrc.c:
> > >
> > > =A0 181 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!c=
lksrc->reg_div.reg)
> > > =A0 182 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0clksrc->clk.ops =3D &clksrc_ops_nodiv;
> > > =A0 183 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else i=
f (!clksrc->reg_src.reg)
> > > =A0 184 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0clksrc->clk.ops =3D &clksrc_ops_nosrc;
> > > =A0 185 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> > > =A0 186 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0clksrc->clk.ops =3D &clksrc_ops;
> > >
> > > So we change the ops dependant on which register(s) we have avail=
albe.
> > >
> > >> Signed-of-by: =A0Thomas Abraham <thomas.ab@samsung.com>
> > >> ---
> > >> =A0arch/arm/plat-samsung/clock-clksrc.c | =A0 =A05 +++--
> > >> =A01 files changed, 3 insertions(+), 2 deletions(-)
> > >>
> > >> diff --git a/arch/arm/plat-samsung/clock-clksrc.c b/arch/arm/pla=
t-samsung/clock-clksrc.c
> > >> index 33c633a..80da4c4 100644
> > >> --- a/arch/arm/plat-samsung/clock-clksrc.c
> > >> +++ b/arch/arm/plat-samsung/clock-clksrc.c
> > >> @@ -131,9 +131,10 @@ void __init_or_cpufreq s3c_set_clksrc(struc=
t clksrc_clk *clk, bool announce)
> > >> =A0 =A0 =A0 u32 mask =3D bit_mask(clk->reg_src.shift, clk->reg_s=
rc.size);
> > >> =A0 =A0 =A0 u32 clksrc =3D 0;
> > >>
> > >> - =A0 =A0 if (clk->reg_src.reg)
> > >> - =A0 =A0 =A0 =A0 =A0 =A0 clksrc =3D __raw_readl(clk->reg_src.re=
g);
> > >> + =A0 =A0 if (!clk->reg_src.reg)
> > >> + =A0 =A0 =A0 =A0 =A0 =A0 return;
> > >>
> > >> + =A0 =A0 clksrc =3D __raw_readl(clk->reg_src.reg);
> > >> =A0 =A0 =A0 clksrc &=3D mask;
> > >> =A0 =A0 =A0 clksrc >>=3D clk->reg_src.shift;
> > >>
> > >> --
> > >> 1.6.3.3
> > >>
> > >
> > > --
> > > --
> > > Ben
> > >
> > > Q: =A0 =A0 =A0What's a light-year?
> > > A: =A0 =A0 =A0One-third less calories than a regular year.
> > >
> > > --
> > > To unsubscribe from this list: send the line "unsubscribe linux-s=
amsung-soc" in
> > > the body of a message to majordomo@vger.kernel.org
> > > More majordomo info at =A0http://vger.kernel.org/majordomo-info.h=
tml
> > >
> >=20
> >=20
> > Thanks,
> > Thomas.
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-sam=
sung-soc" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
> --=20
> --=20
> Ben
>=20
> Q:      What's a light-year?
> A:      One-third less calories than a regular year.
>=20

--=20
--=20
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
