From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] Move ARM Samsung cpufreq drivers to drivers/cpufreq/
Date: Thu, 2 Jun 2011 09:43:28 +0900
Message-ID: <BANLkTikWhqOO2dcXpp+f=1i1JWOoaYEY5A@mail.gmail.com>
References: <1306963102-12830-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1306963102-12830-1-git-send-email-kgene.kim@samsung.com>
Sender: cpufreq-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, cpufreq@vger.kernel.org, Dave Jones <davej@redhat.com>, =?UTF-8?B?6rmA64+Z6re8?= <dg77.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

I think you already saw the same patchs[1] at mailing list and even
worse you commented it[2]
One different is kconfig handling. and these can be handled easily as y=
ou did.

Please respect others works.

Thank you,
Kyungmin Park

1. http://www.gossamer-threads.com/lists/linux/kernel/1385739?page=3Dla=
st
2. http://www.spinics.net/lists/cpufreq/msg02262.html

On Thu, Jun 2, 2011 at 6:18 AM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> According to discussion of the ARM arch subsystem migration,
> ARM cpufreq drivers move to drivers/cpufreq. So this patch
> adds Kconfig.arm for ARM like x86 and adds Samsung S5PV210
> and EXYNOS4210 cpufreq driver compile in there.
> As a note, otherw will be moved.
>
> Cc: Dave Jones <davej@redhat.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-exynos4/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A01 -
> =A0arch/arm/mach-s5pv210/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A01 -
> =A0drivers/cpufreq/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0| =A0 =A05 ++++
> =A0drivers/cpufreq/Kconfig.arm =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 23 ++++++++++++++++++++
> =A0drivers/cpufreq/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 | =A0 =A02 +
> =A0.../cpufreq/exynos4210-cpufreq.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A03 +-
> =A0.../cpufreq.c =3D> drivers/cpufreq/s5pv210-cpufreq.c | =A0 =A03 +-
> =A07 files changed, 32 insertions(+), 6 deletions(-)
> =A0create mode 100644 drivers/cpufreq/Kconfig.arm
> =A0rename arch/arm/mach-exynos4/cpufreq.c =3D> drivers/cpufreq/exynos=
4210-cpufreq.c (99%)
> =A0rename arch/arm/mach-s5pv210/cpufreq.c =3D> drivers/cpufreq/s5pv21=
0-cpufreq.c (99%)
>
> diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-exynos4/M=
akefile
> index a9bb94f..0cebfa7 100644
> --- a/arch/arm/mach-exynos4/Makefile
> +++ b/arch/arm/mach-exynos4/Makefile
> @@ -15,7 +15,6 @@ obj- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0:=3D
> =A0obj-$(CONFIG_CPU_EXYNOS4210) =A0 +=3D cpu.o init.o clock.o irq-com=
biner.o
> =A0obj-$(CONFIG_CPU_EXYNOS4210) =A0 +=3D setup-i2c0.o irq-eint.o dma.=
o
> =A0obj-$(CONFIG_PM) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D pm.o sleep.o
> -obj-$(CONFIG_CPU_FREQ) =A0 =A0 =A0 =A0 +=3D cpufreq.o
> =A0obj-$(CONFIG_CPU_IDLE) =A0 =A0 =A0 =A0 +=3D cpuidle.o
>
> =A0obj-$(CONFIG_SMP) =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D platsmp.o headsm=
p.o
> diff --git a/arch/arm/mach-s5pv210/Makefile b/arch/arm/mach-s5pv210/M=
akefile
> index 50907ac..599a3c0 100644
> --- a/arch/arm/mach-s5pv210/Makefile
> +++ b/arch/arm/mach-s5pv210/Makefile
> @@ -15,7 +15,6 @@ obj- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0:=3D
> =A0obj-$(CONFIG_CPU_S5PV210) =A0 =A0 =A0+=3D cpu.o init.o clock.o dma=
=2Eo
> =A0obj-$(CONFIG_CPU_S5PV210) =A0 =A0 =A0+=3D setup-i2c0.o
> =A0obj-$(CONFIG_S5PV210_PM) =A0 =A0 =A0 +=3D pm.o sleep.o
> -obj-$(CONFIG_CPU_FREQ) =A0 =A0 =A0 =A0 +=3D cpufreq.o
>
> =A0# machine support
>
> diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
> index 9fb8485..e898215 100644
> --- a/drivers/cpufreq/Kconfig
> +++ b/drivers/cpufreq/Kconfig
> @@ -184,5 +184,10 @@ depends on X86
> =A0source "drivers/cpufreq/Kconfig.x86"
> =A0endmenu
>
> +menu "ARM CPU frequency scaling drivers"
> +depends on ARM
> +source "drivers/cpufreq/Kconfig.arm"
> +endmenu
> +
> =A0endif
> =A0endmenu
> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.ar=
m
> new file mode 100644
> index 0000000..fafdbb8
> --- /dev/null
> +++ b/drivers/cpufreq/Kconfig.arm
> @@ -0,0 +1,23 @@
> +#
> +# ARM CPU Frequency scaling drivers
> +#
> +
> +config ARM_S5PV210_CPUFREQ
> + =A0 =A0 =A0 bool "Samsung S5PV210 and S5PC110"
> + =A0 =A0 =A0 depends on CPU_S5PV210
> + =A0 =A0 =A0 default y
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 This adds the CPUFreq driver for Samsung S5PV210 an=
d
> + =A0 =A0 =A0 =A0 S5PC110 SoCs.
> +
> + =A0 =A0 =A0 =A0 If in doubt, say N.
> +
> +config ARM_EXYNOS4210_CPUFREQ
> + =A0 =A0 =A0 bool "Samsung EXYNOS4210"
> + =A0 =A0 =A0 depends on CPU_EXYNOS4210
> + =A0 =A0 =A0 default y
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 This adds the CPUFreq driver for Samsung EXYNOS4210
> + =A0 =A0 =A0 =A0 SoC (S5PV310 or S5PC210).
> +
> + =A0 =A0 =A0 =A0 If in doubt, say N.
> diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
> index e2fc2d2..864a27c 100644
> --- a/drivers/cpufreq/Makefile
> +++ b/drivers/cpufreq/Makefile
> @@ -41,3 +41,5 @@ obj-$(CONFIG_X86_CPUFREQ_NFORCE2) =A0 =A0 +=3D cpuf=
req-nforce2.o
>
> =A0# ARM SoC drivers
> =A0obj-$(CONFIG_UX500_SOC_DB8500) =A0 =A0 =A0 =A0 +=3D db8500-cpufreq=
=2Eo
> +obj-$(CONFIG_ARM_S5PV210_CPUFREQ) =A0 =A0 =A0+=3D s5pv210-cpufreq.o
> +obj-$(CONFIG_ARM_EXYNOS4210_CPUFREQ) =A0 +=3D exynos4210-cpufreq.o
> diff --git a/arch/arm/mach-exynos4/cpufreq.c b/drivers/cpufreq/exynos=
4210-cpufreq.c
> similarity index 99%
> rename from arch/arm/mach-exynos4/cpufreq.c
> rename to drivers/cpufreq/exynos4210-cpufreq.c
> index a1bd258..54025fc 100644
> --- a/arch/arm/mach-exynos4/cpufreq.c
> +++ b/drivers/cpufreq/exynos4210-cpufreq.c
> @@ -1,5 +1,4 @@
> -/* linux/arch/arm/mach-exynos4/cpufreq.c
> - *
> +/*
> =A0* Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
> =A0* =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> =A0*
> diff --git a/arch/arm/mach-s5pv210/cpufreq.c b/drivers/cpufreq/s5pv21=
0-cpufreq.c
> similarity index 99%
> rename from arch/arm/mach-s5pv210/cpufreq.c
> rename to drivers/cpufreq/s5pv210-cpufreq.c
> index 22046e2..c482fc8 100644
> --- a/arch/arm/mach-s5pv210/cpufreq.c
> +++ b/drivers/cpufreq/s5pv210-cpufreq.c
> @@ -1,5 +1,4 @@
> -/* linux/arch/arm/mach-s5pv210/cpufreq.c
> - *
> +/*
> =A0* Copyright (c) 2010 Samsung Electronics Co., Ltd.
> =A0* =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> =A0*
> --
> 1.7.4.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
