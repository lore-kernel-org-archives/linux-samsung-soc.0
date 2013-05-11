From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v5] pinctrl: Add pinctrl-s3c24xx driver
Date: Sun, 12 May 2013 00:28:50 +0900
Message-ID: <067401ce4e5c$3cee48d0$b6cada70$%kim@samsung.com>
References: <201305031552.45410.heiko@sntech.de>
 <046401ce4d15$ccba0c80$662e2580$%kim@samsung.com>
 <201305111726.49491.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:37605 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753063Ab3EKP2y convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 11 May 2013 11:28:54 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MMN007NB4C4F570@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 12 May 2013 00:28:52 +0900 (KST)
In-reply-to: <201305111726.49491.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>
Cc: linus.walleij@linaro.org, thomas.abraham@linaro.org, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=C3=BCbner wrote:
>=20
> Am Freitag, 10. Mai 2013, 02:32:05 schrieb Kukjin Kim:
> > Heiko St=C3=BCbner wrote:
> > > The s3c24xx pins follow a similar pattern as the other Samsung So=
Cs
> and
> > > can therefore reuse the already introduced infrastructure.
> > >
> > > The s3c24xx SoCs have one design oddity in that the first 4 exter=
nal
> > > interrupts do not reside in the eint pending register but in the =
main
> > > interrupt controller instead. We solve this by forwarding the ext=
ernal
> > > interrupt from the main controller into the irq domain of the pin=
 bank.
> > > The masking/acking of these interrupts is handled in the same way=
=2E
> > >
> > > Furthermore the S3C2412/2413 SoCs contain another oddity in that =
they
> > > keep the same 4 eints in the main interrupt controller and eintpe=
nd
> > > register and requiring ack operations to happen in both. This is
> solved
> > > by using different compatible properties for the wakeup eint node
> which
> > > set a property accordingly.
> > >
> > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> > > Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Looks good to me.
> >
> > Linus, if you want me to take into samsung tree, please let me know=
=2E
>=20
> in v4 Linus said:
>=20
> "Are you taking this through the Samsung tree?"
>=20
> This would also enable me to put the s3c2416 devicetree support on to=
p of
> it
> in this cycle, which of course needs the pinctrl driver.
>=20
OK, will apply into samsung tree.

Thanks.

- Kukjin
