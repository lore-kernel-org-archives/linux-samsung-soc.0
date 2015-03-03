From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [GIT PULL 1/2] Samsung fixes-1 for v4.0
Date: Tue, 03 Mar 2015 16:48:39 +0100
Message-ID: <1651242.NSDETIvUSP@amdc1032>
References: <54F4B250.5080200@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:29276 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756344AbbCCPta convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Mar 2015 10:49:30 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NKN00E577YFDA90@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 04 Mar 2015 00:49:27 +0900 (KST)
In-reply-to: <54F4B250.5080200@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Russell King <rmk+kernel@arm.linux.org.uk>


Hi,

On Tuesday, March 03, 2015 03:56:16 AM Kukjin Kim wrote:
> The following changes since commit c517d838eb7d07bbe9507871fab3931dec=
cff539:
>=20
>   Linux 4.0-rc1 (2015-02-22 18:21:14 -0800)
>=20
> are available in the git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.g=
it
> tags/samsung-fixes-1
>=20
> for you to fetch changes up to 8a68de64e984cfc49ecc22ac18155a7fe6dbbf=
af:
>=20
>   ARM: EXYNOS: fix exynos randconfig build error (2015-03-03 03:37:57=
 +0900)
>=20
> ----------------------------------------------------------------
> Samsung fixes for v4.0
>=20
> - fix exynos randconfig build error with SMP=3Dn
> - fix wrong hwirq of RTC interrupt for exynos3250
> - fix usage of LDREX and STREX after disabling cache coherency
>=20
> ----------------------------------------------------------------
> Chanwoo Choi (1):
>       ARM: EXYNOS: Fix wrong hwirq of RTC interrupt for Exynos3250 So=
C
>=20
> Krzysztof Kozlowski (1):
>       ARM: EXYNOS: Don't use LDREX and STREX after disabling cache co=
herency
>=20
> Russell King (1):
>       ARM: EXYNOS: fix exynos randconfig build error

Has anyone actually tested this patch with SMP=3Dn && PM_SLEEP=3Dy
or SMP=3Dn && CONFIG_ARM_EXYNOS_CPUIDLE=3Dy?

The patch is just insufficient as it prevents build of
arch/arm/mach-exynos/pm.o and arch/arm/mach-exynos/sleep.o
for SMP=3Dn.  Both files are needed for PM_SLEEP=3Dy code that
resides in arch/arm/mach-exynos/suspend.c:

  LD      init/built-in.o
arch/arm/mach-exynos/built-in.o: In function `exynos_save_cp15':
/home/bzolnier/sam/linux-sprc/arch/arm/mach-exynos/firmware.c:36: undef=
ined reference to `exynos_cpu_resume_ns'
/home/bzolnier/sam/linux-sprc/arch/arm/mach-exynos/firmware.c:36: undef=
ined reference to `cp15_save_power'
/home/bzolnier/sam/linux-sprc/arch/arm/mach-exynos/firmware.c:36: undef=
ined reference to `cp15_save_diag'
arch/arm/mach-exynos/built-in.o: In function `exynos5420_pm_resume':
/home/bzolnier/sam/linux-sprc/arch/arm/mach-exynos/suspend.c:435: undef=
ined reference to `exynos_pm_central_resume'
arch/arm/mach-exynos/built-in.o: In function `__virt_to_phys':
/home/bzolnier/sam/linux-sprc/./arch/arm/include/asm/memory.h:228: unde=
fined reference to `exynos_cpu_resume'
/home/bzolnier/sam/linux-sprc/./arch/arm/include/asm/memory.h:228: unde=
fined reference to `exynos_cpu_resume'
arch/arm/mach-exynos/built-in.o: In function `exynos3250_pm_resume':
/home/bzolnier/sam/linux-sprc/arch/arm/mach-exynos/suspend.c:395: undef=
ined reference to `exynos_pm_central_resume'
/home/bzolnier/sam/linux-sprc/arch/arm/mach-exynos/suspend.c:405: undef=
ined reference to `exynos_cpu_restore_register'
arch/arm/mach-exynos/built-in.o: In function `exynos_pm_resume':
/home/bzolnier/sam/linux-sprc/arch/arm/mach-exynos/suspend.c:365: undef=
ined reference to `exynos_pm_central_resume'
/home/bzolnier/sam/linux-sprc/arch/arm/mach-exynos/suspend.c:382: undef=
ined reference to `exynos_cpu_restore_register'
arch/arm/mach-exynos/built-in.o: In function `exynos_pm_prepare':
/home/bzolnier/sam/linux-sprc/arch/arm/mach-exynos/suspend.c:253: undef=
ined reference to `exynos_cpu_resume'
arch/arm/mach-exynos/built-in.o: In function `exynos_pm_suspend':
/home/bzolnier/sam/linux-sprc/arch/arm/mach-exynos/suspend.c:322: undef=
ined reference to `exynos_pm_central_suspend'
/home/bzolnier/sam/linux-sprc/arch/arm/mach-exynos/suspend.c:329: undef=
ined reference to `exynos_cpu_save_register'
arch/arm/mach-exynos/built-in.o: In function `exynos5420_pm_suspend':
/home/bzolnier/sam/linux-sprc/arch/arm/mach-exynos/suspend.c:338: undef=
ined reference to `exynos_pm_central_suspend'
arch/arm/mach-exynos/built-in.o: In function `exynos_dt_machine_init':
/home/bzolnier/sam/linux-sprc/arch/arm/mach-exynos/exynos.c:284: undefi=
ned reference to `cpuidle_coupled_exynos_data'
arch/arm/mach-exynos/built-in.o:(.data+0x70): undefined reference to `e=
xynos_enter_aftr'
make: *** [vmlinux] Error 1

Moreover it still allows to select Exynos cpuidle support
(CONFIG_ARM_EXYNOS_CPUIDLE=3Dy) with SMP=3Dn which results in:

  LD      init/built-in.o
arch/arm/mach-exynos/built-in.o: In function `exynos_dt_machine_init':
/home/bzolnier/sam/linux-sprc/arch/arm/mach-exynos/exynos.c:284: undefi=
ned reference to `cpuidle_coupled_exynos_data'
arch/arm/mach-exynos/built-in.o:(.data+0x70): undefined reference to `e=
xynos_enter_aftr'
make: *** [vmlinux] Error 1


The full solution for issue that "ARM: EXYNOS: fix exynos randconfig
build error" patch attempted to fix has been posted by me on 4th of
=46ebruary (https://lkml.org/lkml/2015/2/4/521) and for completness is
also included below.  It fixes a v4.0-rc1 regression caused by
a recent addition of cpuidle coupled support for Exynos4210 SoC.
It makes only the new Exynos4210 coupled cpuidle support to be
dependent on SMP.  On UP cpuidle will use the old non-coupled code
for Exynos4210 which is an expected behavior (as it was in v3.19).
The patch has been tested on Exynos4210 Origen board with both SMP
and UP kernels and in both cases it worked fine.


=46rom: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] ARM: EXYNOS: cpuidle: Fix build breakage on !SMP

The Exynos cpuidle driver has coupled cpuidle built-in so it cannot be
built without SMP:

arch/arm/mach-exynos/pm.c: In function =E2=80=98exynos_cpu0_enter_aftr=E2=
=80=99:
arch/arm/mach-exynos/pm.c:246:4: error: implicit declaration of functio=
n =E2=80=98arch_send_wakeup_ipi_mask=E2=80=99 [-Werror=3Dimplicit-funct=
ion-declaration]
arch/arm/mach-exynos/built-in.o: In function `exynos_pre_enter_aftr':
=2E./arch/arm/mach-exynos/pm.c:300: undefined reference to `cpu_boot_re=
g_base'
arch/arm/mach-exynos/built-in.o: In function `exynos_cpu1_powerdown':
=2E./arch/arm/mach-exynos/pm.c:282: undefined reference to `exynos_cpu_=
power_down'

=46ix it by adding missing checks for SMP.

Reported-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 arch/arm/mach-exynos/exynos.c    |    2 +-
 arch/arm/mach-exynos/pm.c        |    2 ++
 drivers/cpuidle/cpuidle-exynos.c |    3 ++-
 3 files changed, 5 insertions(+), 2 deletions(-)

Index: b/arch/arm/mach-exynos/exynos.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- a/arch/arm/mach-exynos/exynos.c	2015-02-04 18:30:23.555819717 +0100
+++ b/arch/arm/mach-exynos/exynos.c	2015-02-04 18:43:23.539807815 +0100
@@ -211,7 +211,7 @@ static void __init exynos_dt_machine_ini
 	if (!IS_ENABLED(CONFIG_SMP))
 		exynos_sysram_init();
=20
-#ifdef CONFIG_ARM_EXYNOS_CPUIDLE
+#if defined(CONFIG_SMP) && defined(CONFIG_ARM_EXYNOS_CPUIDLE)
 	if (of_machine_is_compatible("samsung,exynos4210"))
 		exynos_cpuidle.dev.platform_data =3D &cpuidle_coupled_exynos_data;
 #endif
Index: b/arch/arm/mach-exynos/pm.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- a/arch/arm/mach-exynos/pm.c	2015-02-04 18:30:23.563819719 +0100
+++ b/arch/arm/mach-exynos/pm.c	2015-02-04 18:47:32.951804008 +0100
@@ -181,6 +181,7 @@ void exynos_enter_aftr(void)
 	cpu_pm_exit();
 }
=20
+#if defined(CONFIG_SMP) && defined(CONFIG_ARM_EXYNOS_CPUIDLE)
 static atomic_t cpu1_wakeup =3D ATOMIC_INIT(0);
=20
 static int exynos_cpu0_enter_aftr(void)
@@ -302,3 +303,4 @@ struct cpuidle_exynos_data cpuidle_coupl
 	.pre_enter_aftr		=3D exynos_pre_enter_aftr,
 	.post_enter_aftr		=3D exynos_post_enter_aftr,
 };
+#endif /* CONFIG_SMP && CONFIG_ARM_EXYNOS_CPUIDLE */
Index: b/drivers/cpuidle/cpuidle-exynos.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- a/drivers/cpuidle/cpuidle-exynos.c	2015-02-04 18:30:32.935819577 +0=
100
+++ b/drivers/cpuidle/cpuidle-exynos.c	2015-02-04 18:46:01.619805400 +0=
100
@@ -117,7 +117,8 @@ static int exynos_cpuidle_probe(struct p
 {
 	int ret;
=20
-	if (of_machine_is_compatible("samsung,exynos4210")) {
+	if (IS_ENABLED(CONFIG_SMP) &&
+	    of_machine_is_compatible("samsung,exynos4210")) {
 		exynos_cpuidle_pdata =3D pdev->dev.platform_data;
=20
 		ret =3D cpuidle_register(&exynos_coupled_idle_driver,
