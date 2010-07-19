From: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH 3/3] i2c/busses: Select I2C bus support for S5PV210 and
	S5P6440.
Date: Mon, 19 Jul 2010 09:24:54 +0900
Message-ID: <000101cb26d8$d2c74fe0$7855efa0$%kim@samsung.com>
References: <1279285999-27555-1-git-send-email-kgene.kim@samsung.com>
 <1279285999-27555-4-git-send-email-kgene.kim@samsung.com>
 <AANLkTikqjZVKDgCIuZ0QCvzrzdrNmGUOq2YZyqb0TKZn@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <AANLkTikqjZVKDgCIuZ0QCvzrzdrNmGUOq2YZyqb0TKZn-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-language: ko
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Kyungmin Park' <kmpark-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, 'Naveen Krishna Ch' <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Kyungmin Park wrote:
>=20
> On Fri, Jul 16, 2010 at 10:13 PM, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
wrote:
> > From: Naveen Krishna Ch <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >
> > This patch is to select support I2C channels 0, 1 and 2 for S5PV210=
 and
> S5P6440.
> >
> > Signed-off-by: Naveen Krishna Ch <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > Signed-off-by: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
Looks good..will change it.

Thanks for your suggestion.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
