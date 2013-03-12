From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 2/4] clk: samsung: remove np check in clock init
Date: Tue, 12 Mar 2013 10:17:49 +0100
Message-ID: <201303121017.49655.heiko@sntech.de>
References: <201303120042.09633.heiko@sntech.de> <CAJuYYwSU_pFoyHkzt=sP6AfN03F9V1_Rx+3o1ekbLHD4jC5SpA@mail.gmail.com> <201303121002.56535.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:44423 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932346Ab3CLJRy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Mar 2013 05:17:54 -0400
In-Reply-To: <201303121002.56535.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, t.figa@samsung.com

Am Dienstag, 12. M=E4rz 2013, 10:02:55 schrieb Heiko St=FCbner:
> Am Dienstag, 12. M=E4rz 2013, 09:53:00 schrieb Thomas Abraham:
> > On 12 March 2013 05:14, Heiko St=FCbner <heiko@sntech.de> wrote:
> > > This let to the suspend init never being reached on non-DT platfo=
rms.
> > >=20
> > > Signed-off-by: Heiko Stueber <heiko@sntech.de>
> > > ---
> > >=20
> > >  drivers/clk/samsung/clk.c |    2 --
> > >  1 files changed, 0 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.=
c
> > > index d36cdd5..1a5de69 100644
> > > --- a/drivers/clk/samsung/clk.c
> > > +++ b/drivers/clk/samsung/clk.c
> > > @@ -57,8 +57,6 @@ void __init samsung_clk_init(struct device_node=
 *np,
> > > void __iomem *base,
> > >=20
> > >                 unsigned long nr_rdump)
> > > =20
> > >  {
> > > =20
> > >         reg_base =3D base;
> > >=20
> > > -       if (!np)
> > > -               return;
> >=20
> > Hi Heiko,
> >=20
> > Sorry, I did not understand the need for this. Could you please add
> > few more details on this change.
>=20
> Hi Thomas,
>=20
> On non-dt platforms the init would stop here, therefore never reachin=
g the
> code that inits the syscore ops below to save the register values on
> suspend and restores them on resume.
>=20
> I might be overlooking something, but I think we want to save/restore=
 the
> register values on both dt and non-dt platforms.

ok, I did overlook something :-)

The register saving seems to be done separately on non-dt platforms (ma=
ch-
exynos/pm.c for example). So I probably need to redo patch 2 and 3.


Heiko


> > >  #ifdef CONFIG_OF
> > > =20
> > >         clk_table =3D kzalloc(sizeof(struct clk *) * nr_clks,
> > >         GFP_KERNEL);
> > >=20
> > > --
> > > 1.7.2.3
