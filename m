From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 12/12] ARM: restart: S3C24XX: use new restart hook
Date: Tue, 03 Jan 2012 15:08:54 +0900
Message-ID: <00e201ccc9de$2ca008f0$85e01ad0$%kim@samsung.com>
References: <1324385316-6052-1-git-send-email-kgene.kim@samsung.com>
 <201201021414.17551.heiko@sntech.de> <20120102132631.GC18443@sirena.org.uk>
 <201201021433.57356.heiko@sntech.de>
 <20120102133906.GP4300@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:45834 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750821Ab2ACGI7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jan 2012 01:08:59 -0500
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LX700KDLL24YK30@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 03 Jan 2012 15:08:58 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LX700JXSL2U3LI1@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 03 Jan 2012 15:08:57 +0900 (KST)
In-reply-to: <20120102133906.GP4300@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, =?iso-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Mark Brown wrote:
>=20
> On Mon, Jan 02, 2012 at 02:33:57PM +0100, Heiko St=FCbner wrote:
> > Am Montag, 2. Januar 2012, 14:26:31 schrieb Mark Brown:
> > > On Mon, Jan 02, 2012 at 02:14:16PM +0100, Heiko St?bner wrote:
>=20
> > > > Therefore I'm introducing a new s3c2443-pm-common.c. Question n=
ow
is,
> > > > should this move directly to plat-samsung?
>=20
> > > If it's s3c2443 specific I'd expect it'd end up in the relevant m=
ach
> > > directory?
>=20
> > nope, it's specific to 2443, 2416 and 2450. These three SoCs seem t=
o
> share a
> > lot of features and it seems other common code (i.e. plat-
> s3c24xx/s3c2443-
> > clock.c) has got its name from the first SoC that had this feature =
(the
> > S3C2443 in 2007).
>=20
> Oh, right - that's not terribly clear but I guess.

Heiko, I think your file can be placed in plat-s3c24xx/ now and if requ=
ired,
I will move them into plat-samsung or just mach-s3c24xx. I mean I'm sor=
ting
out the mach-s3c2410/, mach-s3c2412/, mach-s3c2416/, mach-s3c2440/ and
mach-s3c2443 directories too.

As a note, the working of one plat-samsung will be finished next time f=
or
v3.4.

Happy New Year.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
