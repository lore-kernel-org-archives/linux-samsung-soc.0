From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/8] S3C24XX: remove global plat/s3c24??.h SoC-headers
Date: Sat, 07 Jan 2012 21:11:52 +0900
Message-ID: <010b01cccd35$8a45c210$9ed14630$%kim@samsung.com>
References: <201201070022.40431.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:19662 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752425Ab2AGML4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 7 Jan 2012 07:11:56 -0500
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LXF00IC0GJQDM10@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 07 Jan 2012 21:11:54 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LXF00CBOGJS0650@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sat, 07 Jan 2012 21:11:54 +0900 (KST)
In-reply-to: <201201070022.40431.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?iso-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=FCbner wrote:
>=20
> The plat-samsung/s3c24??.h headers contain function declarations that=
 are
> mostly private to the relevant SoCs.
>=20
> This patchset follows the work started by Kukjin Kim for newer Samsun=
g-
> SoCs
> and moves them from a global space to their SoC directories as common=
=2Eh .
>=20
> The the only non-mach user of these files is plat-s3c24xx/cpu.c . It
> seemes
> to have been built to generalize the init of S3C24XX-SoCs, but in rea=
lity
> its savings are rather low and introduce ifdef-voodoo to distinguish
> between S3C2412 and S3C2416.
>=20
> Therefore the series introduces common.c files for these SoCs, that n=
ow
> contain the SoC-specific cpu-init - the relevant parts of the cpu.c c=
ode.
> cpu.c is completely removed at the end of the series.
>=20
> The number of lines add + deleted is mostly equal and the positive
> diffstat
> results from the added GPL headers to the common.c files for the most
part.
> Another sign of low savings in the cpu.c abstraction.
>=20
> As always, each patch is compile-tested individually and correctnes o=
f the
> move was tested on s3c2416 hardware - so hopefully I did not break an=
y
> other
> of the touched SoCs.
>=20
> As with the newer SoCs more common code can move into the common.c fi=
les
> later on.
>=20
> The series is based on the linux-samsung/for-next branch of 2012-01-0=
2,
> as it needs the restart patches, that create the common.h for some So=
Cs.
>=20
Hi Heiko,

This approach looks good to me but since I was thinking we need to merg=
e
various mach-s3c24{1,4}{0,2,6,0,3} directories to just one mach-s3c24xx
directory without plat-s3c24xx which can split into plat-samsung for al=
l of
Samsung stuff and into mach-s3c24xx only for s3c24xx stuff, I didn't cr=
eate
common.[ch] in each mach-s3c24xx directories. But now this could be goo=
d to
us...I think, we can make better output together about that. Let me bac=
k on
this after this merge window.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.


> Heiko Stuebner (8):
>   S3C24XX: Remove extern declaration of clk_msysclk
>   S3C24XX: move common S3C2443 clock definitions to clock.h
>   S3C2410: move s3c2410_baseclk_add to clock.h
>   S3C2416: move io-init to SoC specific files
>   S3C2443: move io-init to SoC specific files
>   S3C2440: move io-init to SoC specific files
>   S3C2412: move io-init to SoC specific files
>   S3C2410: move io-init to SoC specific files
>=20
>  arch/arm/mach-s3c2410/Makefile               |    2 +-
>  arch/arm/mach-s3c2410/common.c               |   80 ++++++++++
>  arch/arm/mach-s3c2410/common.h               |   11 ++
>  arch/arm/mach-s3c2410/mach-amlm5900.c        |    2 +-
>  arch/arm/mach-s3c2410/mach-bast.c            |    2 +-
>  arch/arm/mach-s3c2410/mach-h1940.c           |    2 +-
>  arch/arm/mach-s3c2410/mach-n30.c             |    3 +-
>  arch/arm/mach-s3c2410/mach-otom.c            |    3 +-
>  arch/arm/mach-s3c2410/mach-qt2410.c          |    2 +-
>  arch/arm/mach-s3c2410/mach-smdk2410.c        |    2 +-
>  arch/arm/mach-s3c2410/mach-tct_hammer.c      |    2 +-
>  arch/arm/mach-s3c2410/mach-vr1000.c          |    2 +-
>  arch/arm/mach-s3c2410/s3c2410.c              |    3 +-
>  arch/arm/mach-s3c2412/Makefile               |    2 +-
>  arch/arm/mach-s3c2412/clock.c                |    3 +-
>  arch/arm/mach-s3c2412/common.c               |   79 ++++++++++
>  arch/arm/mach-s3c2412/common.h               |   30 ++++
>  arch/arm/mach-s3c2412/mach-jive.c            |    5 +-
>  arch/arm/mach-s3c2412/mach-smdk2413.c        |    6 +-
>  arch/arm/mach-s3c2412/mach-vstms.c           |    5 +-
>  arch/arm/mach-s3c2412/pm.c                   |    2 +-
>  arch/arm/mach-s3c2412/s3c2412.c              |    3 +-
>  arch/arm/mach-s3c2416/Makefile               |    2 +-
>  arch/arm/mach-s3c2416/clock.c                |    4 +-
>  arch/arm/mach-s3c2416/common.c               |   70 +++++++++
>  arch/arm/mach-s3c2416/common.h               |   30 ++++
>  arch/arm/mach-s3c2416/mach-smdk2416.c        |    6 +-
>  arch/arm/mach-s3c2416/s3c2416.c              |    3 +-
>  arch/arm/mach-s3c2440/Makefile               |    2 +-
>  arch/arm/mach-s3c2440/common.c               |  100 ++++++++++++
>  arch/arm/mach-s3c2440/common.h               |   20 +++
>  arch/arm/mach-s3c2440/dsc.c                  |    2 +-
>  arch/arm/mach-s3c2440/mach-anubis.c          |    2 +-
>  arch/arm/mach-s3c2440/mach-at2440evb.c       |    2 +-
>  arch/arm/mach-s3c2440/mach-gta02.c           |    2 +-
>  arch/arm/mach-s3c2440/mach-mini2440.c        |    2 +-
>  arch/arm/mach-s3c2440/mach-nexcoder.c        |    4 +-
>  arch/arm/mach-s3c2440/mach-osiris.c          |    2 +-
>  arch/arm/mach-s3c2440/mach-rx1950.c          |    2 +-
>  arch/arm/mach-s3c2440/mach-rx3715.c          |    2 +-
>  arch/arm/mach-s3c2440/mach-smdk2440.c        |    4 +-
>  arch/arm/mach-s3c2440/s3c2440.c              |    3 +-
>  arch/arm/mach-s3c2440/s3c2442.c              |    3 +-
>  arch/arm/mach-s3c2440/s3c244x.c              |    4 +-
>  arch/arm/mach-s3c2443/Makefile               |    2 +-
>  arch/arm/mach-s3c2443/clock.c                |    3 +-
>  arch/arm/mach-s3c2443/common.c               |   70 +++++++++
>  arch/arm/mach-s3c2443/common.h               |   31 ++++
>  arch/arm/mach-s3c2443/mach-smdk2443.c        |    6 +-
>  arch/arm/mach-s3c2443/s3c2443.c              |    3 +-
>  arch/arm/plat-s3c24xx/Makefile               |    1 -
>  arch/arm/plat-s3c24xx/cpu.c                  |  208
--------------------------
>  arch/arm/plat-s3c24xx/s3c2410-clock.c        |    1 -
>  arch/arm/plat-s3c24xx/s3c2443-clock.c        |    1 -
>  arch/arm/plat-samsung/include/plat/clock.h   |   22 +++
>  arch/arm/plat-samsung/include/plat/cpu.h     |    2 -
>  arch/arm/plat-samsung/include/plat/s3c2410.h |   33 ----
>  arch/arm/plat-samsung/include/plat/s3c2412.h |   32 ----
>  arch/arm/plat-samsung/include/plat/s3c2416.h |   33 ----
>  arch/arm/plat-samsung/include/plat/s3c2443.h |   54 -------
>  arch/arm/plat-samsung/include/plat/s3c244x.h |   42 -----
>  61 files changed, 603 insertions(+), 463 deletions(-)
>  create mode 100644 arch/arm/mach-s3c2410/common.c
>  create mode 100644 arch/arm/mach-s3c2412/common.c
>  create mode 100644 arch/arm/mach-s3c2412/common.h
>  create mode 100644 arch/arm/mach-s3c2416/common.c
>  create mode 100644 arch/arm/mach-s3c2416/common.h
>  create mode 100644 arch/arm/mach-s3c2440/common.c
>  create mode 100644 arch/arm/mach-s3c2443/common.c
>  create mode 100644 arch/arm/mach-s3c2443/common.h
>  delete mode 100644 arch/arm/plat-s3c24xx/cpu.c
>  delete mode 100644 arch/arm/plat-samsung/include/plat/s3c2410.h
>  delete mode 100644 arch/arm/plat-samsung/include/plat/s3c2412.h
>  delete mode 100644 arch/arm/plat-samsung/include/plat/s3c2416.h
>  delete mode 100644 arch/arm/plat-samsung/include/plat/s3c2443.h
>  delete mode 100644 arch/arm/plat-samsung/include/plat/s3c244x.h
>=20
> --
> 1.7.5.4
