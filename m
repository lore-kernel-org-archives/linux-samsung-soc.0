From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung devel for v3.3
Date: Tue, 17 Jan 2012 16:23:01 +0900
Message-ID: <001f01ccd4e8$d8456730$88d03590$%kim@samsung.com>
References: <018801ccca70$25f01260$71d03720$%kim@samsung.com>
 <CAOesGMhLE3wxM=F9OkHT-bQpsVp8Uc6eE8Uk+WN9pLuz5BRLBw@mail.gmail.com>
 <20120108204953.GA20043@sirena.org.uk>
 <CAOesGMjn5uQEWbxrJryC+jOf=3SYbAnPY4A71NUZKFBi=a0QjA@mail.gmail.com>
 <20120109082640.GI22134@opensource.wolfsonmicro.com>
 <CAOesGMiU+-wfxsfha7GTO3s7dHysP65gcrbJsLWhBpZNT9O+UQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:15421 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751459Ab2AQHXD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Jan 2012 02:23:03 -0500
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LXX00DTOLSWKTQ0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Jan 2012 16:23:01 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LXX00EQDLUDFK82@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 17 Jan 2012 16:23:01 +0900 (KST)
In-reply-to: <CAOesGMiU+-wfxsfha7GTO3s7dHysP65gcrbJsLWhBpZNT9O+UQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Olof Johansson wrote:
>=20
> Hi,
>=20
Hi Olof,

> On Mon, Jan 9, 2012 at 12:26 AM, Mark Brown
> <broonie@opensource.wolfsonmicro.com> wrote:
> > On Sun, Jan 08, 2012 at 05:21:02PM -0800, Olof Johansson wrote:
> >
> >> Mark, Kukjin, can either of you split out the fixes in a separate
> branch?
> >
> > Here's some of them, there were a few others I'm aware of that depe=
nded
> > on feature updates. =A0Ideally we'd actually get all the changes th=
at have
> > been in -next in.
> >
> > The following changes since commit
> 5f0a6e2d503896062f641639dacfe5055c2f593b:
> >
> > =A0Linux 3.2-rc7 (2011-12-23 21:51:06 -0800)
> >
> > are available in the git repository at:
> > =A0git://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git
> fixes/samsung
> >
> > Mark Brown (5):
> > =A0 =A0 =A0ARM: SAMSUNG: Fix GPIO space reservation for S3C64xx pla=
tforms
> > =A0 =A0 =A0ARM: S3C64XX: Correct reservation of GPIOs for CPU modul=
e on
> Cragganmore
>=20
> The above two don't seem to have been in the branch that was sent by
> Kukjin, it had:
>=20
>       ARM: EXYNOS: Invert VCLK polarity for framebuffer on ORIGEN
>       ARM: S3C64XX: Fix interrupt configuration for PCA935x on Cragga=
nmore
>       ARM: S3C64XX: Fix the memory mapped GPIOs on Cragganmore
>       ARM: S3C64XX: Remove hsmmc1 from Cragganmore
>       ARM: S3C64XX: Remove unconditional power domain disables
>       ARM: SAMSUNG: Declare struct platform_device in plat/s3c64xx-sp=
i.h
>       ARM: SAMSUNG: dma-ops.h needs mach/dma.h
>       ARM: SAMSUNG: Guard against multiple inclusion of plat/dma.h
>=20
> I've pulled the branch from him.
>=20
No, please drop it because above you said are in mainline now.

- commit 4ff13995("ARM: SAMSUNG: Fix GPIO space reservation for S3C64xx
platforms")=20
- commit aaed44e1("ARM: S3C64XX: Correct reservation of GPIOs for CPU m=
odule
on Cragganmore")

Seems to be merged via arm-soc/next/boards and there was some
mis-communications.
(Refer to the commit 8df97495 ("Merge branch 'samsung/board' into
next/boards"))

Sorry for bothering.

> Kukjin, please consider picking up the missing two patches above and
> send another pull request with those and any other needed fixes.
>=20
As I said, please ignore next-samsung-devel-samsung and Mark's
fixes/samsung.
I think, you can go ahead with my previous pull request, samsung-fixes.

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
