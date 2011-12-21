From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2 0/4] Implement RTC support for S3C2443/S3C2416/S3C2450
Date: Wed, 21 Dec 2011 09:22:11 +0100
Message-ID: <201112210922.12300.heiko@sntech.de>
References: <201112121543.42299.heiko@sntech.de> <064801ccbfb1$c5d48e60$517dab20$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:49038 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751262Ab1LUIWn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Dec 2011 03:22:43 -0500
In-Reply-To: <064801ccbfb1$c5d48e60$517dab20$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: ben-linux@fluff.org, a.zummo@towertech.it, rtc-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Am Mittwoch, 21. Dezember 2011, 08:25:53 schrieb Kukjin Kim:
> Heiko St=FCbner wrote:
> > Similar to the ADC the RTC of S3C2443 and S3C2416/2450 has some sli=
ght
> > variances when compared to the existing types.
> >=20
> > This series adds support for those SoCs.
> >=20
> > As with the ADC patches, these changes where tested on S3C2416 hard=
ware.
> > The S3C2443 quirks are a subset of those and are done according to =
the
> > datasheet, but not tested on real hardware (as I do not own a S3C24=
43
> > device).
> >=20
> > changes since v1:
> > address comments from Thomas Abraham, reducing number of ifdefs and
> > duplicate code
> >=20
> > Heiko Stuebner (4):
> >   ARM: SAMSUNG: cleanup of rtc register definitions
> >   rtc-s3c: make room for more variants in devicetree block
> >   rtc-s3c: add variants for S3C2443 and S3C2416
> >   ARM: S3C2443/S3C2416: add s3c_rtc_setname and rename rtc devices
> > =20
> >  arch/arm/mach-s3c2416/s3c2416.c               |    2 +
> >  arch/arm/mach-s3c2443/s3c2443.c               |    2 +
> >  arch/arm/plat-samsung/include/plat/regs-rtc.h |   92
>=20
> +++++++++++++++------
>=20
> > ---
> >=20
> >  arch/arm/plat-samsung/include/plat/rtc-core.h |   27 +++++++
> >  drivers/rtc/rtc-s3c.c                         |   74
> >  ++++++++++++++++---- 5 files changed, 149 insertions(+), 48
> >  deletions(-)
> >  create mode 100644 arch/arm/plat-samsung/include/plat/rtc-core.h
> >=20
> > --
> > 1.7.5.4
>=20
> Hi Heiko,
>=20
> There were small comments on 1st patch and others looks ok to me.
> If you're ok on my comments, please re-send it so that I can request =
to
> pull this series to Alessandro or Andrew with my ack.

I'm on it now.=20

Who is Andrew and should I include him in the recipients? I only found=20
Alessandro Zummo in the MAINTAINERS file for rtc stuff and am lacking a=
ny=20
comment from the rtc-side until now.

Heiko
