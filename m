From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v5 7/7] irqchip: s3c24xx: add devicetree support
Date: Tue, 26 Mar 2013 08:38:42 +0100
Message-ID: <201303260838.42804.heiko@sntech.de>
References: <201303252226.21402.heiko@sntech.de> <201303252234.21314.heiko@sntech.de> <201303252200.46258.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:52099 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752825Ab3CZHin convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Mar 2013 03:38:43 -0400
In-Reply-To: <201303252200.46258.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Thomas Abraham <thomas.abraham@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Arnd,

thanks again for taking the time to look at the changes.


Am Montag, 25. M=E4rz 2013, 23:00:46 schrieb Arnd Bergmann:
> On Monday 25 March 2013, Heiko St=FCbner wrote:
> > Add the necessary code to initialize the interrupt controller
> > thru devicetree data using the irqchip infrastructure.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>=20
> The binding looks fine now. I have a few detail comments but am happy
> with the series otherwise.
>=20
> > +Required properties:
> > +- compatible: Compatible property value should be "samsung,s3c24xx=
-irq"
> > +  for non s3c2416 machines and "samsung,s3c2416-irq" for s3c2416
> > machines
>=20
> We try to avoid wildcards in the "compatible" properties. Better use
> the name of the first SoC that had this controller, and let the other
> ones mark themselves as compatible with that one.
>=20
> I guess "samsung,s3c2410-irq" would be the right identifier here.

ok, sounds sensible


> > +- #interrupt-cells : Specifies the number of cells needed to encod=
e an
> > +  interrupt source. The value shall be 4 and interrupt descriptor =
shall
> > +  have the following format:
> > +      <ctrl_num ctrl_irq parent_irq type>
> > +
> > +  ctrl_num contains the controller to use:
> > +      - 0 ... main controller
> > +      - 1 ... sub controller
> > +      - 2 ... second main controller on s3c2416 and s3c2450
> > +  ctrl_irq contains the interrupt bit of the controller
> > +  parent_irq contains the parent bit in the main controller and wi=
ll be
> > +             ignored in main controllers
>=20
> I expected the second and third cell to be in the opposite order, so
> the meaning of the second cell is always the same.

ok, so we do <ctrl_num parent_irq ctrl_irq type>, right? ... As it only=
=20
involves exchanging the intspec values, that's easy :-)


> > +	/* we're using individual domains for the non-dt case
> > +	 * and one big domain for the dt case where the subintc
> > +	 * starts at hwirq number 32.
> > +	 */
> > +	offset =3D (intc->domain->of_node) ? 32 : 0;
>=20
> Wouldn't it be easier to always use the same setup for the domains he=
re?

nope ... the non-dt domains are not uniform (different lengths and star=
t-irqs)=20
to recreate the static irq mappings that are still needed. For the non-=
dt case=20
it also implement the handling of the external interrupts that is not p=
art of=20
the interrupt-controller itself but comes from the gpio-registers and w=
ill=20
move to pinctrl for dt machines.

My hope is still to move to dt in a "reasonable" time, so this stuff ca=
n go=20
away then altogether.


Heiko
