From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Remove useless codes on NURI board
Date: Thu, 06 Oct 2011 15:31:04 +0900
Message-ID: <00ed01cc83f1$865d7310$93185930$%kim@samsung.com>
References: <1313758894-31814-1-git-send-email-kgene.kim@samsung.com>
 <CAH9JG2Ufwg7+6rAsf4v_RJ-fccp=5-8ziNFZEDX5ToUP5MpJ4A@mail.gmail.com>
 <CAJ0PZbTHOKazY=x17nbPGg1djyw=1DRL7n5qrtHMiUqC+PcKUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:57657 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935243Ab1JFGbG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Oct 2011 02:31:06 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSM00CI0SRC93I0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Oct 2011 15:31:05 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSM00LYPSRSY250@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 06 Oct 2011 15:31:05 +0900 (KST)
In-reply-to: <CAJ0PZbTHOKazY=x17nbPGg1djyw=1DRL7n5qrtHMiUqC+PcKUg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'MyungJoo Ham' <myungjoo.ham@gmail.com>, 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

MyungJoo Ham wrote:
>=20
> 2011/8/19 Kyungmin Park <kmpark@infradead.org>:
> > Maybe charger manager codes are not merged. it's used for charger
managers.
> >
> > To Mr. Ham,
> > which patches are missing?
> >
> > Thank you,
> > Kyungmin Park
>=20
> The patch to register Charger-Manager in Nuri is missing in the file.
> In order to apply that, we will need to modify NTC driver (either
> update hwmon framework or seperate NTC driver into two parts
> (platorm-device + hwmon-device) first so that in-kernel modules can
> read values from NTC.
>=20
If missing some stuff will not be merged in this time, to apply this is
better to us to remove useless warning message during build and if requ=
ired,
we can add it later......

Is ok to you?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> >
> > On Fri, Aug 19, 2011 at 10:01 PM, Kukjin Kim <kgene.kim@samsung.com=
>
wrote:
> >> The 'nuri_cm_devices' is defined but not used.
> >>
> >> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> >> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> >> ---
> >> =A0arch/arm/mach-exynos4/mach-nuri.c | =A0 =A07 -------
> >> =A01 files changed, 0 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/arch/arm/mach-exynos4/mach-nuri.c
b/arch/arm/mach-exynos4/mach-
> nuri.c
> >> index 43be71b..65df994 100644
> >> --- a/arch/arm/mach-exynos4/mach-nuri.c
> >> +++ b/arch/arm/mach-exynos4/mach-nuri.c
> >> @@ -1037,13 +1037,6 @@ static struct platform_device
nuri_max8903_device
> =3D {
> >> =A0 =A0 =A0 =A0},
> >> =A0};
> >>
> >> -static struct device *nuri_cm_devices[] =3D {
> >> - =A0 =A0 =A0 &s3c_device_i2c5.dev,
> >> - =A0 =A0 =A0 &s3c_device_adc.dev,
> >> - =A0 =A0 =A0 NULL, /* Reserved for UART */
> >> - =A0 =A0 =A0 NULL,
> >> -};
> >> -
> >> =A0static void __init nuri_power_init(void)
> >> =A0{
> >> =A0 =A0 =A0 =A0int gpio;
> >> --
> >> 1.7.1
