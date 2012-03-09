From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [GIT PULL] Samsung Cleanup EXYNOS clock for v3.4
Date: Fri, 9 Mar 2012 16:06:15 +0900
Message-ID: <CAJ0PZbQebwvFrmXWn=-m7YH3Ri7t2fvm+E_EKZ45rD7cAyo2UA@mail.gmail.com>
References: <22926872.16671331267895327.JavaMail.weblogic@epml04>
Reply-To: myungjoo.ham@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:40196 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752454Ab2CIHGQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Mar 2012 02:06:16 -0500
Received: by iagz16 with SMTP id z16so1842645iag.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Mar 2012 23:06:16 -0800 (PST)
In-Reply-To: <22926872.16671331267895327.JavaMail.weblogic@epml04>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?EUC-KR?B?seixucH4?= <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, =?EUC-KR?B?udqw5rnO?= <kyungmin.park@samsung.com>

2012/3/9 =C7=D4=B8=ED=C1=D6 <myungjoo.ham@samsung.com>:
>> Hi Arnd, Olof,
>>
>> Here is cleanup clock part for EXYNOS SoCs from:
>>    git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung=
=2Egit
>> next/cleanup-exynos-clock
>>
>> Please pull and if any problems, please kindly let me know.
>
> Hello,
>
> It appears that some patches are missing in this branch; i.e., you se=
emed not to have pulled one required by this patchset: http://permalink=
=2Egmane.org/gmane.linux.kernel.samsung-soc/8474
>
> If the missing patches are included in another branch of yours and be=
ing pulled at somewhere else, please never mind. However, it doesn't ap=
pear so.
>
> Anyway, I'm rebasing the pull-requested branch upon most recent RC, s=
o it'll be available soon (in an hour?) at http://git.infradead.org/use=
rs/kmpark/linux-samsung/shortlog/refs/heads/devfreq-for-samsung
>
>
> Cheers!
> MyungJoo.
>

Hello, Kgene

I've rebased the branch that was pull-requested to Kgene based on this =
branch.

http://git.infradead.org/users/kmpark/linux-samsung/shortlog/refs/heads=
/devfreq-for-samsung


The following changes since commit e01127814c640f6cd06a5c06731c6d1ee8c4=
5101:

  PM / devfreq: update the name of EXYNOS clock register (2012-03-07
03:25:31 -0800)

are available in the git repository at:
  git://git.infradead.org / users/kmpark/linux-samsung devfreq-for-sams=
ung

MyungJoo Ham (4):
      ARM: EXYNOS4: Add DMC1, allow PPMU access for DMC.
      ARM: EXYNOS4: Add clock register addresses for Exynos4x12 bus
devfreq driver
      ARM Exynos4210-Nuri: support Exynos4210-bus Devfreq driver.
      PM / devfreq: update the name of EXYNOS clock registers that were=
 omitted.

 arch/arm/mach-exynos/common.c                  |    7 +++-
 arch/arm/mach-exynos/include/mach/map.h        |    1 +
 arch/arm/mach-exynos/include/mach/regs-clock.h |   42 ++++++++++++++++=
++++++++
 arch/arm/mach-exynos/mach-nuri.c               |   11 ++++--
 drivers/devfreq/exynos4_bus.c                  |    6 ++--
 5 files changed, 60 insertions(+), 7 deletions(-)



>>
>> The following changes since commit b01543dfe67bb1d191998e90d20534dc3=
54de059:
>>
>>    Linux 3.3-rc4 (2012-02-18 15:53:33 -0800)
>>
>> are available in the git repository at:
>>    git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung=
=2Egit
>> next/cleanup-exynos-clock
>>
>> Kukjin Kim (2):
>>        ARM: EXYNOS: cleanup clock part for new EXYNOS SoCs
>>        PM / devfreq: update the name of EXYNOS clock register
>>
>>   arch/arm/mach-exynos/Makefile                     |    3 +-
>>   arch/arm/mach-exynos/clock-exynos4.c              | 1564
>> +++++++++++++++++++++
>>   arch/arm/mach-exynos/clock-exynos4.h              |   32 +
>>   arch/arm/mach-exynos/clock-exynos4210.c           |   46 +-
>>   arch/arm/mach-exynos/clock-exynos4212.c           |   30 +-
>>   arch/arm/mach-exynos/clock.c                      | 1564
>> ---------------------
>>   arch/arm/mach-exynos/common.h                     |    9 +
>>   arch/arm/mach-exynos/include/mach/exynos4-clock.h |   43 -
>>   arch/arm/mach-exynos/include/mach/regs-clock.h    |  364 +++---
>>   arch/arm/mach-exynos/pm.c                         |   40 +-
>>   drivers/devfreq/exynos4_bus.c                     |  224 ++--
>>   11 files changed, 1959 insertions(+), 1960 deletions(-)
>>   create mode 100644 arch/arm/mach-exynos/clock-exynos4.c
>>   create mode 100644 arch/arm/mach-exynos/clock-exynos4.h
>>   delete mode 100644 arch/arm/mach-exynos/clock.c
>>   delete mode 100644 arch/arm/mach-exynos/include/mach/exynos4-clock=
=2Eh
>>



--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab, DMC Business, Samsung Electronics
