From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C24XX: Correct NR_IRQS definition for s3c2440
Date: Mon, 08 Apr 2013 18:45:20 +0900
Message-ID: <2cd501ce343d$c8efc810$5acf5830$%kim@samsung.com>
References: <1365366170-9682-1-git-send-email-s.nawrocki@samsung.com>
 <201304072235.02218.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:28587 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935325Ab3DHJpY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Apr 2013 05:45:24 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MKX004XRKFJY9T0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Apr 2013 18:45:23 +0900 (KST)
In-reply-to: <201304072235.02218.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Tomasz Figa' <tomasz.figa@gmail.com>

Heiko St=C3=BCbner wrote:
>=20
> Am Sonntag, 7. April 2013, 22:22:50 schrieb Sylwester Nawrocki:
> > Due to NR_IRQS being incorrectly defined not all IRQ domains can
> > be registered for S3C2440. It causes following errors on a s3c2440
> > SoC based board:
> >
> > NR_IRQS:89
> > S3C2440: IRQ Support
> > irq: clearing pending status 00000002
> > ------------[ cut here ]------------
> > WARNING: at kernel/irq/irqdomain.c:234 0xc0056ed0()
> > ...
> > irq: could not create irq-domain
> > ...
> > s3c2410-wdt s3c2410-wdt: failed to install irq (-22)
> > s3c2410-wdt: probe of s3c2410-wdt failed with error -22
> > ...
> > samsung-uart s3c2440-uart.0: cannot get irq 74
> >
> > Fix this by increasing NR_IRQS to at least (IRQ_S3C2443_AC97 + 1)
> > if CPU_S3C2440 is selected, so the subintc IRQ domain gets properly
> > registered.
> >
> > Cc: Heiko St=C3=BCbner <heiko@sntech.de>
> > Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> > Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>=20
> Thanks for testing the irq changes on another subarchitecture and fix=
ing
> the
> glitch.
>=20
> Acked-by: Heiko Stuebner <heiko@sntech.de>
>=20
>=20
Thanks for you guys' effort.

Applied.

- Kukjin
