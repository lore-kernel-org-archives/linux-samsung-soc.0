From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/2] ARM: S3C24XX: Move s3c2443-clock.c to mach-s3c24xx
Date: Wed, 22 Feb 2012 18:28:52 +0100
Message-ID: <201202221828.53363.heiko@sntech.de>
References: <201202212221.41744.heiko@sntech.de> <201202212226.01189.heiko@sntech.de> <201202221718.01137.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:41841 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752209Ab2BVR3C convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Feb 2012 12:29:02 -0500
In-Reply-To: <201202221718.01137.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>

Am Mittwoch 22 Februar 2012, 18:18:00 schrieb Arnd Bergmann:
> On Tuesday 21 February 2012, Heiko St=FCbner wrote:
> > S3C-SoCs starting with the S3C2443 can share a lot of functionality=
=2E
> > The file can collect more common code of these SocS later on and
> > therefore gets a new name to reflect this future purpose.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >=20
> >  arch/arm/mach-s3c24xx/Kconfig          |   14 +-
> >  arch/arm/mach-s3c24xx/Makefile         |    4 +
> >  arch/arm/mach-s3c24xx/common-s3c2443.c |  644
> >  ++++++++++++++++++++++++++++++++ arch/arm/plat-s3c24xx/Kconfig    =
    =20
> >  |    6 -
> >  arch/arm/plat-s3c24xx/Makefile         |    1 -
> >  arch/arm/plat-s3c24xx/s3c2443-clock.c  |  635
> >  -------------------------------
>=20
> No objections on the patch, but please use 'git format-patch -M' when
> moving files so that we can see which parts have changed in the proce=
ss.
the results of -M look really nice, thanks for the hint and I will try =
to=20
remember it :-)

Heiko
