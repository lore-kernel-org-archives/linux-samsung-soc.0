From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 2/4] clk: samsung: remove np check in clock init
Date: Tue, 12 Mar 2013 10:54:17 +0100
Message-ID: <201303121054.17470.heiko@sntech.de>
References: <201303120042.09633.heiko@sntech.de> <201303121017.49655.heiko@sntech.de> <CAJuYYwQ_BTSCejXoX6F5NbdFBgBH+3QYLxkL2=QMusMpREERmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:44849 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755055Ab3CLJyX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Mar 2013 05:54:23 -0400
In-Reply-To: <CAJuYYwQ_BTSCejXoX6F5NbdFBgBH+3QYLxkL2=QMusMpREERmg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, t.figa@samsung.com

Am Dienstag, 12. M=E4rz 2013, 10:36:54 schrieb Thomas Abraham:
> On 12 March 2013 14:47, Heiko St=FCbner <heiko@sntech.de> wrote:
> > Am Dienstag, 12. M=E4rz 2013, 10:02:55 schrieb Heiko St=FCbner:
> >> Am Dienstag, 12. M=E4rz 2013, 09:53:00 schrieb Thomas Abraham:
> >> > On 12 March 2013 05:14, Heiko St=FCbner <heiko@sntech.de> wrote:
> >> > > This let to the suspend init never being reached on non-DT
> >> > > platforms.
> >> > >=20
> >> > > Signed-off-by: Heiko Stueber <heiko@sntech.de>
> >> > > ---
> >> > >=20
> >> > >  drivers/clk/samsung/clk.c |    2 --
> >> > >  1 files changed, 0 insertions(+), 2 deletions(-)
> >> > >=20
> >> > > diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/c=
lk.c
> >> > > index d36cdd5..1a5de69 100644
> >> > > --- a/drivers/clk/samsung/clk.c
> >> > > +++ b/drivers/clk/samsung/clk.c
> >> > > @@ -57,8 +57,6 @@ void __init samsung_clk_init(struct device_n=
ode
> >> > > *np, void __iomem *base,
> >> > >=20
> >> > >                 unsigned long nr_rdump)
> >> > > =20
> >> > >  {
> >> > > =20
> >> > >         reg_base =3D base;
> >> > >=20
> >> > > -       if (!np)
> >> > > -               return;
> >> >=20
> >> > Hi Heiko,
> >> >=20
> >> > Sorry, I did not understand the need for this. Could you please =
add
> >> > few more details on this change.
> >>=20
> >> Hi Thomas,
> >>=20
> >> On non-dt platforms the init would stop here, therefore never reac=
hing
> >> the code that inits the syscore ops below to save the register val=
ues
> >> on suspend and restores them on resume.
> >>=20
> >> I might be overlooking something, but I think we want to save/rest=
ore
> >> the register values on both dt and non-dt platforms.
> >=20
> > ok, I did overlook something :-)
> >=20
> > The register saving seems to be done separately on non-dt platforms
> > (mach- exynos/pm.c for example). So I probably need to redo patch 2=
 and
> > 3.
>=20
> The register saving is supposed to be done in the clock driver itself
> for both dt and non-dt platforms. So you are right in pointing out
> this issue.
>
> But in this patch, removing the check on 'np' is not right. Because,
> on builds were CONFIG_OF is enabled but kernel image executing on
> non-dt platforms, the allocation of clk_table should be avoided.
>=20
> So instead of removing the check on 'np', the code inside #ifdef
> CONFIG_PM_SLEEP should be placed after the assignment to reg_base. Th=
e
> check on 'np' should then follow.

The following two patches do exactly that ... allocating the clk_table =
all the=20
time, to allow us to add separate aliases to clocks later.

So I'll wait until we talked about them :-) .


Thanks for looking thru the patches
Heiko
