From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2 00/12] ARM: samsung-time: Prepare for multiplatform support
Date: Sun, 17 Feb 2013 17:05:54 +0100
Message-ID: <201302171705.55706.heiko@sntech.de>
References: <1361033044-27629-1-git-send-email-tomasz.figa@gmail.com> <201302170005.08300.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:60467 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750796Ab3BQQGE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 17 Feb 2013 11:06:04 -0500
In-Reply-To: <201302170005.08300.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, kyungmin.park@samsung.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, Mark Rutland <mark.rutland@arm.com>

Am Sonntag, 17. Februar 2013, 00:05:07 schrieb Heiko St=FCbner:
> Am Samstag, 16. Februar 2013, 17:43:52 schrieb Tomasz Figa:
> > This series is an attempt to make the samsung-time clocksource driv=
er
> > ready for multiplatform kernels. It moves the driver to
> > drivers/clocksource, cleans it up from uses of static platform-spec=
ific
> > definitions, simplifies timer interrupt handling and adds Device Tr=
ee
> > support.
> >=20
> > Tested on a Tiny6410 board (Mini6410-compatible) both with and with=
out
> > Devicee Tree (with my DT patches for S3C64xx). Compile tested for o=
ther
> > related SoCs.
> >=20
> > Changes since v1:
> > (http://thread.gmane.org/gmane.linux.kernel.samsung-soc/16005)
> >=20
> >  - Addressed comments from Mark Rutland
> >  - Documented struct samsung_timer_variant
> >  - Dropped inactive mail addresses from CC
> >=20
> > Tomasz Figa (12):
> >   ARM: SAMSUNG: Move samsung-time to drivers/clocksource
> >   clocksource: samsung-time: Set platform-specific parameters at ru=
ntime
> >   clocksource: samsung-time: Drop useless defines from public heade=
r
> >   ARM: SAMSUNG: Move samsung-time.h header to inlude/clocksource
> >   clocksource: samsung-time: Use local register definitions
> >   clocksource: samsung-time: Remove use of static register mapping
> >   clocksource: samsung-time: Use clk_get_sys for getting clocks
> >   ARM: SAMSUNG: devs: Drop unnecessary IRQ resources of timer devic=
es
> >   clocksource: samsung-time: Do not use static IRQ definition
> >   clocksource: samsung-time: Move IRQ mask/ack handling to the driv=
er
> >   ARM: SAMSUNG: Remove unused PWM timer IRQ chip code
> >   clocksource: samsung-time: Add Device Tree support
>=20
> on a non-dt s3c2416 based board
> Tested-by: Heiko Stuebner <heiko@sntech.de>
>=20
>=20
> once I've ported my s3c2416 dt patches to all the recent changes, I w=
ill
> also test the dt side.

also on my upcoming s3c2416 dt patches the clocksource works like a cha=
rm, so=20
to update:

on a s3c2416 based board both with and without devicetree
Tested-by: Heiko Stuebner <heiko@sntech.de>
