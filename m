From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESUBMIT RFC PATCH v2 3/3] drivers: mfd: Add support for Exynos
 PMU driver
Date: Tue, 29 Apr 2014 10:27:23 +0100
Message-ID: <20140429092723.GG29462@lee--X1>
References: <1398687607-4554-1-git-send-email-pankaj.dubey@samsung.com>
 <1398687607-4554-4-git-send-email-pankaj.dubey@samsung.com>
 <20140428122646.GF21279@lee--X1>
 <535F5AA7.2050001@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:43684 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752134AbaD2J1a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Apr 2014 05:27:30 -0400
Received: by mail-wi0-f171.google.com with SMTP id bs8so871380wib.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2014 02:27:29 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <535F5AA7.2050001@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, t.figa@samsung.com, chow.kim@samsung.com, yg1004.jang@samsung.com, vikas.sajjan@samsung.com, b.zolnierkie@samsung.com, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>

> >>This patch moves Exynos PMU driver implementation from
> >>"arm/mach-exynos" to "drivers/mfd".
> >>This driver is mainly used for setting misc bits of register from P=
MU IP
> >>of Exynos SoC which will be required to configure before Suspend/Re=
sume.
> >>Currently all these settings are done in "arch/arm/mach-exynos/pmu.=
c" but
> >>moving ahead for ARM64 based SoC support, there is a need of DT bas=
ed
> >>implementation of PMU driver.
> >>This driver uses already existing DT binding information.
> >>
> >>CC: Sangbeom Kim <sbkim73@samsung.com>
> >>CC: Samuel Ortiz <sameo@linux.intel.com>
> >>CC: Lee Jones <lee.jones@linaro.org>
> >>Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> >>---
> >>  arch/arm/mach-exynos/Kconfig                           |    2 ++
> >>  arch/arm/mach-exynos/Makefile                          |    2 --
> >>  drivers/mfd/Kconfig                                    |    9 +++=
++++++
> >>  drivers/mfd/Makefile                                   |    1 +
> >>  arch/arm/mach-exynos/pmu.c =3D> drivers/mfd/exynos-pmu.c |    0
> >>  5 files changed, 12 insertions(+), 2 deletions(-)
> >>  rename arch/arm/mach-exynos/pmu.c =3D> drivers/mfd/exynos-pmu.c (=
100%)
> >So I just took a look at the code as zero changes looks suspicious t=
o
> >me. The driver can not simply be copied and pasted into the MFD
> >subsystem in its current state.
> >
> >The fundamental question is; is this chip actually an MFD? What does
> >it do besides Power Management?
>=20
> Exynos PMU chip controls different power states of Exynos, so mainly =
it
> does power management related stuff. Apart from this it has few regis=
ters
> which controls PHY of various IP blocks of Exynos such as USB, HDMI,
> ADC etc. But these phy controlling register are currently being acces=
sed
> via "syscon" driver provided regmap APIs. For same the same reason
> Exynos PMU has second compatibility string as "syscon".

I suggest that this is not suitable for the MFD subsystem then.

Try drivers/power.


--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
