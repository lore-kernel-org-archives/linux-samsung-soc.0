From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 3/3] ARM: SAMSUNG: i2c/busses: Add HAVE_S3C2410_I2C
	option to include I2C for Samsung SoCs
Date: Fri, 30 Jul 2010 13:25:37 +0900
Message-ID: <018801cb2f9f$457badf0$d07309d0$%kim@samsung.com>
References: <1280396565-21014-1-git-send-email-kgene.kim@samsung.com>
 <AANLkTikyOUyz+sNPgBvWU8FvYa8HvgRY4P2udhMY=eOw@mail.gmail.com>
 <015601cb2f83$0225bd00$06713700$%kim@samsung.com>
 <AANLkTimcZeZXoQ=i1rsbXiaU_FfSZSRi5NxMd7oYekj9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:47450 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751164Ab0G3EZb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Jul 2010 00:25:31 -0400
In-reply-to: <AANLkTimcZeZXoQ=i1rsbXiaU_FfSZSRi5NxMd7oYekj9@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, ben-linux@fluff.org, 'Naveen Krishna Ch' <ch.naveen@samsung.com>


> -----Original Message-----
> From: kyungmin78@gmail.com [mailto:kyungmin78@gmail.com] On Behalf Of
> Kyungmin Park
> Sent: Friday, July 30, 2010 11:43 AM
> To: Kukjin Kim
> Cc: linux-arm-kernel@lists.infradead.org;
linux-samsung-soc@vger.kernel.org;
> linux-i2c@vger.kernel.org; ben-linux@fluff.org; Naveen Krishna Ch
> Subject: Re: [PATCH v3 3/3] ARM: SAMSUNG: i2c/busses: Add
> HAVE_S3C2410_I2C option to include I2C for Samsung SoCs
>=20
> On Fri, Jul 30, 2010 at 10:03 AM, Kukjin Kim <kgene.kim@samsung.com>
wrote:
> > Kyungmin Park wrote:
> >>
> >> On Thu, Jul 29, 2010 at 6:42 PM, Kukjin Kim <kgene.kim@samsung.com=
>
wrote:
> >> > From: Naveen Krishna Ch <ch.naveen@samsung.com>
> >> >
> >> > This patch adds HAVE_S3C2410_I2C to control inclusion of I2C bus
driver
> >> > on Samsung SoCs and makes I2C bus driver dependency SoC specific
> instead
> >> > of machine specific. This will enalbe all machines using Samsung
> >> ARCH_S3C2410,
> >> > _S3C64XX, _S5P6440, _S5PC100, and _S5PV210 to select the I2C dri=
ver
by
> >> default
> >>
> >> What's the different from use PLAT_SAMSUNG?
> >>
> > Hi,
> >
> > Hmm..the difference?
> >
> > I remember, already said to you...
> > Anyway actually, there was a stuff in here about that.
> > Please refer to following...it may answer on your question.
> >
> > --- From Ben Dooks
> >
> >> =A0config RTC_DRV_S3C
> >> =A0 =A0 =A0 tristate "Samsung S3C series SoC RTC"
> >> - =A0 =A0 depends on ARCH_S3C2410
> >> + =A0 =A0 depends on ARCH_S3C2410 || ARCH_S3C64XX
> >
> > I wonder whether just making this depend on either S3C_DEV_RTC, or
simply
> > PLAT_SAMSUNG would just be a better choice.
> >
> > The S3C_DEV_RTC would mean that the drivers the core of the kernel
> > would be built, but means that we can't speculatively build drivers
> > if the kernel hasn't any machines using them.
> >
> > Making it depend on PLAT_SAMSUNG would mean it is available to all,
> > but would be selectable even if there isn't a machine supporting it
> > being built.
> >
> > The current situation would mean that we have to update driver Kcon=
fig
> > entries each time a new SoC turns up...
>=20
> In other word, It can make it workable when new SoCs arrives, even
> though depends on PLAT_SAMSUNG.
>=20
> If new chip has improved i2C IP then define new I2C drivers and modif=
y
> it as 'depends on PLAT_SAMUSNG if !NEW_IP_I2C'
> and use another i2c drivers. of course it's depends on PLAT_SAMSUNG o=
r
> PLAT_S5P if NEW_IP_I2C.
>=20
Hmm...if there is new IP driver for Samsung SoCs, why should I add extr=
a
option for new one like your suggestion?
As I said, just 'depends on HAVE_SAMSUNGNEWIPV2_I2C' is enough for it..=
=2E

I'm still thinking, this way is better to me...anything else?

> >
> > We could also have a HAVE_RTC_DRV_S3C so that all SoCs supporting t=
his
> > coudl select it independant of whether there is machine support.
> >
> > ---
> >
> > It doesn't mean that we should use HAVE_XXX in this case...
> > But this way is better _now_ and they used same method in several
drivers.
> > And if driver IP changes, we can use with HAVE_XXXV2...
> >
> >> config I2C_S3C2410
> >> =A0 =A0 =A0 =A0 tristate "S3C2410 I2C Driver"
> >> =A0 =A0 =A0 =A0 depends on PLAT_SAMSUNG
> >>
> >> Please don't populate the Kconfigs.
> >>
> >
> > I hope you stop talking same issue without alternative...
> >
> >> Thank you,
> >> Kyungmin Park
> >>
> >> >
> >> > Signed-off-by: Naveen Krishna Ch <ch.naveen@samsung.com>
> >> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> >> > Cc: Ben Dooks <ben-linux@fluff.org>
> >> > ---

(snip)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
