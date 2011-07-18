From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v4 0/9] TV driver for Samsung S5P platform (platform-part)
Date: Mon, 18 Jul 2011 18:04:40 +0900
Message-ID: <CAH9JG2UDTpZVLOcnPuV7YkX_XPh3r4Km0F+VjmvRq0dzEO668w@mail.gmail.com>
References: <1306326564-21858-1-git-send-email-t.stanislaws@samsung.com>
	<037a01cc4387$904504b0$b0cf0e10$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:55299 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753720Ab1GRJEl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jul 2011 05:04:41 -0400
Received: by vxh35 with SMTP id 35so1469924vxh.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Jul 2011 02:04:40 -0700 (PDT)
In-Reply-To: <037a01cc4387$904504b0$b0cf0e10$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Tomasz Stanislawski <t.stanislaws@samsung.com>, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, ben-linux@fluff.org

On Sat, Jul 16, 2011 at 4:11 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Tomasz Stanislawski wrote:
>>
>> Hello Everyone,
>> This patchset introduce TV devices to Samsung S5P platform. It inclu=
des
> Goni
>> (S5PV210 machine) and Universal (Exynos4 machine) boards. The patchs=
et is
>> dedicated for 2.6.39 kernel. Moreover, the patchset adds following
> auxiliary
>> entities and features:
>> - I2C controllers for HDMI physical interface
>> - power regulators
>> - TV clocks, include ops for fout_vpll clock
>> - fixes to power domain driver (only for Exynos4)
>> - dependecies between TV and Power Domain devices (only for Exynos4)
>>
>> Please refer to post 'TV driver for Samsung S5P platform (media part=
)' for
>> sources of the TV driver.
>>
>> The most recent changes:
>> - TV becomes S5P platform device
>> - support for Universal-c210 and Goni boards
>> - code cleanup after Kukjin Kim's review
>>
>> Tomasz Stanislawski (9):
>> =A0 arm: exynos4: pd: fixes block gating and code cleanup
>> =A0 i2c-s3c2410: fix I2C dedicated for hdmiphy
>> =A0 arm: exynos4: i2c: add controller 8 (HDMIPHY)
>> =A0 arm: s5pv210: i2c: add controller 3 (HDMIPHY)
>> =A0 arm: plat-s5p: add TV support
>> =A0 arm: exynos4: add TV support
>> =A0 arm: exynos4: universal_c210: add TV support
>> =A0 arm: s5pv210: add TV support
>> =A0 arm: s5pv210: goni: add TV support
>>
>> =A0arch/arm/mach-exynos4/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A03 +
>> =A0arch/arm/mach-exynos4/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0223
>> ++++++++++++++++++++++-
>> =A0arch/arm/mach-exynos4/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A07 +
>> =A0arch/arm/mach-exynos4/dev-pd.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 93 +++++++---
>> =A0arch/arm/mach-exynos4/include/mach/irqs.h =A0 =A0 =A0 | =A0 =A08 =
+
>> =A0arch/arm/mach-exynos4/include/mach/map.h =A0 =A0 =A0 =A0| =A0 27 =
+++
>> =A0arch/arm/mach-exynos4/include/mach/regs-clock.h | =A0 =A08 +
>> =A0arch/arm/mach-exynos4/include/mach/regs-pmu.h =A0 | =A0 =A06 +
>> =A0arch/arm/mach-exynos4/mach-universal_c210.c =A0 =A0 | =A0 80 ++++=
++++
>> =A0arch/arm/mach-s5pv210/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A08 +
>> =A0arch/arm/mach-s5pv210/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A01 +
>> =A0arch/arm/mach-s5pv210/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0169
>> ++++++++++++++++--
>> =A0arch/arm/mach-s5pv210/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A06 +
>> =A0arch/arm/mach-s5pv210/include/mach/irqs.h =A0 =A0 =A0 | =A0 =A02 =
+-
>> =A0arch/arm/mach-s5pv210/include/mach/map.h =A0 =A0 =A0 =A0| =A0 19 =
++
>> =A0arch/arm/mach-s5pv210/include/mach/regs-clock.h | =A0 =A07 +-
>> =A0arch/arm/mach-s5pv210/mach-goni.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A09 +
>> =A0arch/arm/mach-s5pv210/setup-i2c3.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 27 +++
>> =A0arch/arm/plat-s5p/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A05 +
>> =A0arch/arm/plat-s5p/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 =A01 +
>> =A0arch/arm/plat-s5p/dev-tv.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0100 ++++++++++
>> =A0arch/arm/plat-samsung/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A05 +
>> =A0arch/arm/plat-samsung/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A01 +
>> =A0arch/arm/plat-samsung/dev-i2c8.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 68 +++++++
>> =A0arch/arm/plat-samsung/include/plat/devs.h =A0 =A0 =A0 | =A0 =A06 =
+
>> =A0arch/arm/plat-samsung/include/plat/iic-core.h =A0 | =A0 14 ++
>> =A0arch/arm/plat-samsung/include/plat/iic.h =A0 =A0 =A0 =A0| =A0 =A0=
1 +
>> =A0arch/arm/plat-samsung/include/plat/pd.h =A0 =A0 =A0 =A0 | =A0 =A0=
1 +
>> =A0arch/arm/plat-samsung/include/plat/tv-core.h =A0 =A0| =A0 45 ++++=
+
>> =A0drivers/i2c/busses/i2c-s3c2410.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 36 ++++-
>> =A030 files changed, 947 insertions(+), 39 deletions(-)
>> =A0create mode 100644 arch/arm/mach-s5pv210/setup-i2c3.c
>> =A0create mode 100644 arch/arm/plat-s5p/dev-tv.c
>> =A0create mode 100644 arch/arm/plat-samsung/dev-i2c8.c
>> =A0create mode 100644 arch/arm/plat-samsung/include/plat/tv-core.h
>>
>> --
>> 1.7.5.1
>
> Hi,
>
> As I said on your previous patch, dev-i2c8 should not be used for HDM=
IPHY on
> EXYNOS4.
> It can be used for general i2c not specific HDMI.
Okay create the arch/arm/plat-samsung/dev-i2c-hdmi.c. since it's
dedicated i2c for hdmi. no need to stick on i2c8 anymore.
>
> This is needed to update based on current my for-next because to upda=
te
> clkdev is required.

As s5p-tv codes are merged for v3.1. it's time to merge the system part=
 also.

Thank you,
Kyungmin Park
>
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
