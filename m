From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [GIT PULL] Samsung fixes for 2.6.36-rc3
Date: Sat, 28 Aug 2010 14:55:27 +0900
Message-ID: <AANLkTi=+XnCQu6Cz0P+A=qhaeN2HKJ9gYdTx2jWe7sfH@mail.gmail.com>
References: <006d01cb45cd$0e4e3610$2aeaa230$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:48450 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750774Ab0H1Fz2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 28 Aug 2010 01:55:28 -0400
In-Reply-To: <006d01cb45cd$0e4e3610$2aeaa230$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri, Aug 27, 2010 at 6:48 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Hi Linus,
>
> Please pull Samsung fixes from:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> s5p-fixes-for-linus
>
> These things are for bug fix on 2.6.36-rc3.
> If any problems, please let me know.

Well nothing changed. only LSI codes and required things from LSI side
are merged.
And still need more patches for booting at s5pc210 (aka s5pv310).

Several thins are missed.
1. gpio_to_irq patch not included. it's basic gpiolib feature. Without
this patch, it can't use the generic gpiolib based drivers. e.g.,
gpio-keys.
http://marc.info/?l=3Dlinux-arm-kernel&m=3D128202435823832&w=3D2

2. Wrong UART level triggers.
At least s5pc110/s5pc210 has wrong UART trigger values compare to macro=
 name.
http://marc.info/?l=3Dlinux-arm-kernel&m=3D128218476209330&w=3D2

3. set correct gpio config at GPIO I at s5pc110
http://marc.info/?l=3Dlinux-arm-kernel&m=3D128202423923745&w=3D2


>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>
> The following changes since commit 76be97c1fc945db08aae1f1b746012662d=
643e97:
>
> =A0Linux 2.6.36-rc2 (2010-08-22 17:43:29 -0700)
>
> are available in the git repository at:
> =A0 git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung=
=2Egit
> s5p-fixes-for-linus
>
> Changhwan Youn (1):
> =A0 =A0 =A0ARM: S5PV310: Fix on Secondary CPU startup
>
> Jongpill Lee (4):
> =A0 =A0 =A0ARM: S5PV310: Fix on PLL setting for S5PV310
> =A0 =A0 =A0ARM: S5PV310: Should be clk_sclk_apll not clk_mout_apll
> =A0 =A0 =A0ARM: S5PV310: Fix missed uart clocks
> =A0 =A0 =A0ARM: S5PV310: Bug fix on uclk1 and sclk_pwm
>
> Kukjin Kim (4):
> =A0 =A0 =A0ARM: SAMSUNG: Fix on build warning regarding VMALLOC_END t=
ype
> =A0 =A0 =A0ARM: S5PV310: Fix on default ZRELADDR of ARCH_S5PV310
> =A0 =A0 =A0ARM: S5PV310: Fix on typo irqs.h of S5PV310
> =A0 =A0 =A0ARM: S5PV310: Add CMU block for S5PV310 Clock
>
> Kyungmin Park (2):
> =A0 =A0 =A0ARM: S5P: VMALLOC_END should be unsigned long
> =A0 =A0 =A0ARM: S5PV310: Fix on GPIO base addresses
>
> =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0| =A0 =A03 +-
> =A0arch/arm/mach-s3c2410/include/mach/vmalloc.h =A0 =A0| =A0 =A02 +-
> =A0arch/arm/mach-s3c64xx/include/mach/vmalloc.h =A0 =A0| =A0 =A02 +-
> =A0arch/arm/mach-s5p6440/include/mach/vmalloc.h =A0 =A0| =A0 =A02 +-
> =A0arch/arm/mach-s5p6442/include/mach/vmalloc.h =A0 =A0| =A0 =A02 +-
> =A0arch/arm/mach-s5pv210/include/mach/vmalloc.h =A0 =A0| =A0 =A02 +-
> =A0arch/arm/mach-s5pv310/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 82
> +++++++++++++++++-----
> =A0arch/arm/mach-s5pv310/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 10 +++
> =A0arch/arm/mach-s5pv310/include/mach/irqs.h =A0 =A0 =A0 | =A0 11 ++-
> =A0arch/arm/mach-s5pv310/include/mach/map.h =A0 =A0 =A0 =A0| =A0 16 +=
+++-
> =A0arch/arm/mach-s5pv310/include/mach/regs-clock.h | =A0 59 ++++++++-=
-------
> =A0arch/arm/mach-s5pv310/include/mach/vmalloc.h =A0 =A0| =A0 =A02 +-
> =A0arch/arm/mach-s5pv310/platsmp.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A02 +-
> =A0arch/arm/plat-s5p/include/plat/map-s5p.h =A0 =A0 =A0 =A0| =A0 =A02=
 +
> =A014 files changed, 135 insertions(+), 62 deletions(-)
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
