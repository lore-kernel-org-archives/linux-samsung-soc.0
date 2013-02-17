From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 00/12] ARM: samsung-time: Prepare for multiplatform support
Date: Sun, 17 Feb 2013 17:13:52 +0100
Message-ID: <2491436.7RNovL0hQ1@flatron>
References: <1361033044-27629-1-git-send-email-tomasz.figa@gmail.com> <201302170005.08300.heiko@sntech.de> <201302171705.55706.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f48.google.com ([74.125.83.48]:44557 "EHLO
	mail-ee0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750994Ab3BQQN4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 17 Feb 2013 11:13:56 -0500
Received: by mail-ee0-f48.google.com with SMTP id t10so2497308eei.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Feb 2013 08:13:55 -0800 (PST)
In-Reply-To: <201302171705.55706.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, kyungmin.park@samsung.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, Mark Rutland <mark.rutland@arm.com>

Hi Heiko,

On Sunday 17 of February 2013 17:05:54 Heiko St=FCbner wrote:
> Am Sonntag, 17. Februar 2013, 00:05:07 schrieb Heiko St=FCbner:
> > Am Samstag, 16. Februar 2013, 17:43:52 schrieb Tomasz Figa:
> > > This series is an attempt to make the samsung-time clocksource
> > > driver
> > > ready for multiplatform kernels. It moves the driver to
> > > drivers/clocksource, cleans it up from uses of static
> > > platform-specific
> > > definitions, simplifies timer interrupt handling and adds Device
> > > Tree
> > > support.
> > >=20
> > > Tested on a Tiny6410 board (Mini6410-compatible) both with and
> > > without
> > > Devicee Tree (with my DT patches for S3C64xx). Compile tested for
> > > other
> > > related SoCs.
> > >=20
> > > Changes since v1:
> > > (http://thread.gmane.org/gmane.linux.kernel.samsung-soc/16005)
> > >=20
> > >  - Addressed comments from Mark Rutland
> > >  - Documented struct samsung_timer_variant
> > >  - Dropped inactive mail addresses from CC
> > >=20
> > > Tomasz Figa (12):
> > >   ARM: SAMSUNG: Move samsung-time to drivers/clocksource
> > >   clocksource: samsung-time: Set platform-specific parameters at
> > >   runtime
> > >   clocksource: samsung-time: Drop useless defines from public hea=
der
> > >   ARM: SAMSUNG: Move samsung-time.h header to inlude/clocksource
> > >   clocksource: samsung-time: Use local register definitions
> > >   clocksource: samsung-time: Remove use of static register mappin=
g
> > >   clocksource: samsung-time: Use clk_get_sys for getting clocks
> > >   ARM: SAMSUNG: devs: Drop unnecessary IRQ resources of timer
> > >   devices
> > >   clocksource: samsung-time: Do not use static IRQ definition
> > >   clocksource: samsung-time: Move IRQ mask/ack handling to the
> > >   driver
> > >   ARM: SAMSUNG: Remove unused PWM timer IRQ chip code
> > >   clocksource: samsung-time: Add Device Tree support
> >=20
> > on a non-dt s3c2416 based board
> > Tested-by: Heiko Stuebner <heiko@sntech.de>
> >=20
> >=20
> > once I've ported my s3c2416 dt patches to all the recent changes, I
> > will also test the dt side.
>=20
> also on my upcoming s3c2416 dt patches the clocksource works like a
> charm, so to update:
>=20
> on a s3c2416 based board both with and without devicetree
> Tested-by: Heiko Stuebner <heiko@sntech.de>

Thank you for your testing.

Best regards,
Tomasz
