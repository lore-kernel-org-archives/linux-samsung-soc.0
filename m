From: Seungwhan Youn <claude.youn@gmail.com>
Subject: Re: [PATCH 5/6] ARM: SAMSUNG: Add clkdev support for exynos4
Date: Sat, 19 Mar 2011 18:42:33 +0900
Message-ID: <AANLkTindOcMNP+HzdsAjf9z80GLCJYKDM2t+mYAw4djD@mail.gmail.com>
References: <1300521019-13612-1-git-send-email-thomas.ab@samsung.com>
	<1300521019-13612-6-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:35980 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755180Ab1CSJme convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Mar 2011 05:42:34 -0400
Received: by wya21 with SMTP id 21so4526262wya.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Mar 2011 02:42:33 -0700 (PDT)
In-Reply-To: <1300521019-13612-6-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

Hi,

On Sat, Mar 19, 2011 at 4:50 PM, Thomas Abraham <thomas.ab@samsung.com>=
 wrote:
> Add clkdev support for Samsung's exynos4 platforms.
>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> ---
> =C2=A0arch/arm/mach-exynos4/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | =C2=A0 =C2=A01 +
> =C2=A0arch/arm/mach-exynos4/clock.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | =C2=A0 57 +++++++++++++++++++++++++++
> =C2=A0arch/arm/mach-exynos4/include/mach/clkdev.h | =C2=A0 =C2=A07 ++=
+
> =C2=A0arch/arm/mach-exynos4/time.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0arch/arm/plat-samsung/pwm-clock.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 10 +++++
> =C2=A05 files changed, 77 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 arch/arm/mach-exynos4/include/mach/clkdev.h
>
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kc=
onfig
> index a021b52..58451c3 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -110,6 +110,7 @@ config MACH_SMDKC210
> =C2=A0config MACH_SMDKV310
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bool "SMDKV310"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0select CPU_EXYNOS4210
> + =C2=A0 =C2=A0 =C2=A0 select CLKDEV_LOOKUP

IMHO, 'clkdev' features, in this patch, seems to be applied to all
EXYNOS4 architecture, not to only SMDKV310 machine. So, I think that
this 'CLKDEV_LOOKUP' may be added into 'arch/arm/Kconfig', not this
file('arch/arm/mach-exynos4/Kconfig').

Something like belows...

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index eed07ea..1069dc1 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -768,6 +768,7 @@ config ARCH_EXYNOS4
        select ARCH_SPARSEMEM_ENABLE
        select GENERIC_GPIO
        select HAVE_CLK
+       select CLKDEV_LOOKUP
        select ARCH_HAS_CPUFREQ
        select GENERIC_CLOCKEVENTS
        select HAVE_S3C_RTC if RTC_CLASS


Thanks,
Claude
