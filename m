From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [RFC PATCH 1/4] ARM: S3C24XX: move s3c24xx-irq to drivers/irqchip
Date: Mon, 12 Nov 2012 19:15:39 +0100
Message-ID: <201211121915.41722.heiko@sntech.de>
References: <201211121446.30167.heiko@sntech.de> <201211121447.49977.heiko@sntech.de> <50A12C63.2000609@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:47037 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750988Ab2KLSPu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Nov 2012 13:15:50 -0500
In-Reply-To: <50A12C63.2000609@wwwdotorg.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Am Montag, 12. November 2012, 18:05:39 schrieb Stephen Warren:
> On 11/12/2012 06:47 AM, Heiko St=FCbner wrote:
> > Removes another part from plat-s3c24xx and also enables further
> > improvements happening in the correct location.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >=20
> >  arch/arm/Kconfig                                   |    1 +
> >  arch/arm/plat-s3c24xx/Makefile                     |    1 -
> >  drivers/irqchip/Kconfig                            |    3 +++
> >  drivers/irqchip/Makefile                           |    1 +
> >  .../irq.c =3D> drivers/irqchip/irq-s3c24xx.c         |    0
> >  5 files changed, 5 insertions(+), 1 deletions(-)
> >  rename arch/arm/plat-s3c24xx/irq.c =3D> drivers/irqchip/irq-s3c24x=
x.c
> >  (100%)
>=20
> Presumably there's a header file somewhere that defines the interface=
 to
> irq-s3c24xx.c that other code in arch/arm/plat-s3c24xx is using to
> initialize it. That header should be moved somewhere public (i.e.
> outside {mach,plat}-*/include/{mach,plat}). However, you then end up
> with a header file per IRQ driver in that public location. So, Thomas
>=20
> Petazzoni started working on a solution for that:
> > http://lists.arm.linux.org.uk/lurker/message/20121027.164514.11eb86=
db.en.
> > html

cool, thanks for the pointer :-) .

=46or the headers, yes they are present and still in mach/plat. My inte=
ntion was=20
to first clean it up and then move the remaing necessary header.

I'm not sure what is the policy for adding stuff to drivers/irqchip (dt=
-
only?), because _all_ s3c24xx subtypes using devicetree seems very very=
 far in=20
the future, if at all.

So when thinking a bit more about it, it might be better to keep the ir=
q code=20
in arch/arm for the time being?

Because non-dt init code will probably be necessary for a lot more time=
=2E


Heiko
