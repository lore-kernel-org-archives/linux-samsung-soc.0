From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v4 0/5] move s3c24xx-irq to drivers/irqchip and add dt support
Date: Fri, 22 Mar 2013 22:21:17 +0100
Message-ID: <201303222221.18605.heiko@sntech.de>
References: <201303221843.37668.heiko@sntech.de> <201303222104.54225.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:44418 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1423269Ab3CVVVb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Mar 2013 17:21:31 -0400
In-Reply-To: <201303222104.54225.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Thomas Abraham <thomas.abraham@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Am Freitag, 22. M=C3=A4rz 2013, 22:04:54 schrieb Arnd Bergmann:
> On Friday 22 March 2013, Heiko St=C3=BCbner wrote:
> > As suggested by Rob Herring move back to get the parent releationsh=
ip
> > from dt like in the first versions, but set the handler from the
> > interrupt property rather than from a specific list.
> >=20
> > This version also implements (hopefully correctly) an idea from him=
 and
> > Arnd Bergmann to have the parent relationship not described in the
> > controller node but the device nodes instead.
> >=20
> > Therefore the main controller continues to use a two-cell descripto=
r to
> > set hwirq and trigger type but the sub-controller switches to a
> > three-cell descriptor where the third bit describes the hwirq of it=
s
> > parent irq in the main controller.
> >=20
> > As a result a serial node would then look like:
> >         serial@50000000 {
> >        =20
> >                 compatible =3D "samsung,s3c2410-uart";
> >                 reg =3D <0x50000000 0x4000>;
> >                 interrupt-parent =3D <&subintc>;
> >                 interrupts =3D <0 4 28>, <1 4 28>;
> >        =20
> >         };
> >=20
> > Tested on a s3c2416-based board.
> >=20
> > As it depends on changes already pending for 3.10 it should probabl=
y go
> > thru the samsung tree.
>=20
> Hi Heiko,
>=20
> I should probably read the original discussion thread again. I alread=
y
> commented on the binding here, but I may have missed something import=
ant
> that led to it being the way it is now.

Hi Arnd,

Not really ... it's only my current interpretation of your short sugges=
tion to=20
handle the parent relationship in the interrupt descriptor of the devic=
e node=20
and not in the controller node itself.

Your other mail did contain a lot of interesting thoughts on how to imp=
rove=20
the current state - thanks for them.


Heiko
