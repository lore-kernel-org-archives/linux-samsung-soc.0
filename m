From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/3] i2c/busses: Select I2C bus support for S5PV210 and
	S5P6440.
Date: Wed, 21 Jul 2010 19:50:27 +0900
Message-ID: <009001cb28c2$8a0d6050$9e2820f0$%kim@samsung.com>
References: <1279285999-27555-1-git-send-email-kgene.kim@samsung.com>
 <1279285999-27555-4-git-send-email-kgene.kim@samsung.com>
 <AANLkTikqjZVKDgCIuZ0QCvzrzdrNmGUOq2YZyqb0TKZn@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:40083 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751005Ab0GUKuW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Jul 2010 06:50:22 -0400
In-reply-to: <AANLkTikqjZVKDgCIuZ0QCvzrzdrNmGUOq2YZyqb0TKZn@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, ben-linux@fluff.org, 'Naveen Krishna Ch' <ch.naveen@samsung.com>

Kyungmin Park wrote:
>=20
> On Fri, Jul 16, 2010 at 10:13 PM, Kukjin Kim <kgene.kim@samsung.com>
wrote:
> > From: Naveen Krishna Ch <ch.naveen@samsung.com>
> >
> > This patch is to select support I2C channels 0, 1 and 2 for S5PV210=
 and
> S5P6440.
> >
> > Signed-off-by: Naveen Krishna Ch <ch.naveen@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> > =A0drivers/i2c/busses/Kconfig | =A0 =A02 +-
> > =A01 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfi=
g
> > index bceafbf..e553fe8 100644
> > --- a/drivers/i2c/busses/Kconfig
> > +++ b/drivers/i2c/busses/Kconfig
> > @@ -523,7 +523,7 @@ config I2C_PXA_SLAVE
> >
> > =A0config I2C_S3C2410
> > =A0 =A0 =A0 =A0tristate "S3C2410 I2C Driver"
> > - =A0 =A0 =A0 depends on ARCH_S3C2410 || ARCH_S3C64XX
> > + =A0 =A0 =A0 depends on ARCH_S3C2410 || ARCH_S3C64XX || ARCH_S5PV2=
10 ||
> ARCH_S5P6440
>=20
> Are there any SoCs don't have i2c? If no, how about to just depends o=
n
> PLAT_SAMSUNG.
>=20
I thought about this again, but I'm not sure your suggestion is better.
Because as you said, there is no Samsung SoC that does not have
I2C...however it's true that this I2C driver cannot support/(is not tes=
ted
on) every Samsung SoCs now.

So, to add available SoC ARCH is better to us at the present.

> Thank you,
> Kyungmin Park
> > =A0 =A0 =A0 =A0help
> > =A0 =A0 =A0 =A0 =A0Say Y here to include support for I2C controller=
 in the
> > =A0 =A0 =A0 =A0 =A0Samsung S3C2410 based System-on-Chip devices.

Just need to modify help message...



Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
