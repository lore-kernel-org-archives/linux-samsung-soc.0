From: Thomas Abraham <thomas.ab@samsung.com>
Subject: Re: [RFC][PATCH v2 0/7] Add clkdev support for Samsung platforms
Date: Fri, 27 May 2011 20:56:51 +0530
Message-ID: <BANLkTinJ4vzqLRoCc+Xw7Lt0HY_oF21syQ@mail.gmail.com>
References: <1306509996-30280-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:50925 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752935Ab1E0P0v convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 May 2011 11:26:51 -0400
Received: by gxk21 with SMTP id 21so730212gxk.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 May 2011 08:26:51 -0700 (PDT)
In-Reply-To: <1306509996-30280-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

On Fri, May 27, 2011 at 8:56 PM, Thomas Abraham <thomas.ab@samsung.com>=
 wrote:
> This patch series adds clkdev support for all Samsung platforms. clkd=
ev
> support is a prerequisite for adding device tree and common clock
> features on Samsung platforms.

This patch series is based on the latest
git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git master

and has been tested on the following boards.

SMDK2416, SMDK2440, SMDK2450, SMDK6410, SMDK6440, SMDK6450,
SMDKC100, SMDKV210 and SMDKV310.

>
> Changes since v1:
>
> 1. Removed the clock id field from clock instances.
> 2. Fixed incorrect naming of guards in mach/clkdev.h files.
>
> Thomas Abraham (7):
> =A0ARM: SAMSUNG: Add clkdev infrastructure
> =A0ARM: S3C24XX: Add clkdev support
> =A0ARM: S3C64XX: Add clkdev support
> =A0ARM: S5P64X0: Add clkdev support
> =A0ARM: S5PC100: Add clkdev support
> =A0ARM: S5PV210: Add clkdev support
> =A0ARM: Exynos4: Add clkdev support
>
> =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 =A06 +
> =A0arch/arm/mach-exynos4/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0178=
 +++++++++------------------
> =A0arch/arm/mach-exynos4/include/mach/clkdev.h | =A0 =A07 +
> =A0arch/arm/mach-exynos4/time.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +
> =A0arch/arm/mach-s3c2412/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 36=
 +-----
> =A0arch/arm/mach-s3c2416/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 10=
 +-
> =A0arch/arm/mach-s3c2440/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
3 -
> =A0arch/arm/mach-s3c2443/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 16=
 +--
> =A0arch/arm/mach-s3c64xx/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 86=
 ++++---------
> =A0arch/arm/mach-s3c64xx/include/mach/clkdev.h | =A0 =A07 +
> =A0arch/arm/mach-s5p64x0/clock-s5p6440.c =A0 =A0 =A0 | =A0 74 +++----=
----
> =A0arch/arm/mach-s5p64x0/clock-s5p6450.c =A0 =A0 =A0 | =A0 68 +++----=
----
> =A0arch/arm/mach-s5p64x0/include/mach/clkdev.h | =A0 =A07 +
> =A0arch/arm/mach-s5pc100/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0163=
 ++++++------------------
> =A0arch/arm/mach-s5pc100/include/mach/clkdev.h | =A0 =A07 +
> =A0arch/arm/mach-s5pv210/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0130=
 ++++++--------------
> =A0arch/arm/mach-s5pv210/include/mach/clkdev.h | =A0 =A07 +
> =A0arch/arm/plat-s3c24xx/clock-dclk.c =A0 =A0 =A0 =A0 =A0| =A0 =A04 -
> =A0arch/arm/plat-s3c24xx/include/mach/clkdev.h | =A0 =A07 +
> =A0arch/arm/plat-s3c24xx/s3c2410-clock.c =A0 =A0 =A0 | =A0 21 +---
> =A0arch/arm/plat-s3c24xx/s3c2443-clock.c =A0 =A0 =A0 | =A0 39 +-----
> =A0arch/arm/plat-s5p/s5p-time.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A09 ++
> =A0arch/arm/plat-samsung/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 98=
 +--------------
> =A0arch/arm/plat-samsung/include/plat/clock.h =A0| =A0 =A03 +
> =A0arch/arm/plat-samsung/pwm-clock.c =A0 =A0 =A0 =A0 =A0 | =A0 10 ++
> =A0arch/arm/plat-samsung/time.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +
> =A026 files changed, 300 insertions(+), 700 deletions(-)
> =A0create mode 100644 arch/arm/mach-exynos4/include/mach/clkdev.h
> =A0create mode 100644 arch/arm/mach-s3c64xx/include/mach/clkdev.h
> =A0create mode 100644 arch/arm/mach-s5p64x0/include/mach/clkdev.h
> =A0create mode 100644 arch/arm/mach-s5pc100/include/mach/clkdev.h
> =A0create mode 100644 arch/arm/mach-s5pv210/include/mach/clkdev.h
> =A0create mode 100644 arch/arm/plat-s3c24xx/include/mach/clkdev.h
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
