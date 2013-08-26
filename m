From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [GIT PULL 3/3] 2nd Round Samsung mach-exynos for v3.12
Date: Mon, 26 Aug 2013 12:06:48 +0200
Message-ID: <3145165.ZB7l3vNJ7a@amdc1032>
References: <1f7701cea1f1$431f2d30$c95d8790$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:15286 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751732Ab3HZKHK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Aug 2013 06:07:10 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MS40075KURWQX51@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Aug 2013 19:07:08 +0900 (KST)
In-reply-to: <1f7701cea1f1$431f2d30$c95d8790$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, arm@kernel.org, linux-arm-kernel@lists.infradead.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, Amit Daniel Kachhap <amit.daniel@samsung.com>


Hi,

On Monday, August 26, 2013 09:14:42 AM Kukjin Kim wrote:
> The following changes since commit ad81f0545ef01ea651886dddac4bef6cec930092:
> 
>   Linux 3.11-rc1 (2013-07-14 15:18:27 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-mach-exynos
> 
> for you to fetch changes up to f52616f4233d71d0fb00f06f86d046d18d2b7f3b:
> 
>   ARM: EXYNOS: always enable PM domains support for EXYNOS4X12 (2013-08-19
> 05:05:16 +0900)
> 
> ----------------------------------------------------------------
> update mach-exynos
> - enable ARCH_HAS_BANDGAP for exynos SoCs
> - skip C1 cpuidle for exynos5440 because non-supporting
> - always enable PM domains for exynos4x12
> 
> ----------------------------------------------------------------
> Amit Daniel Kachhap (2):
>       ARM: EXYNOS: enable ARCH_HAS_BANDGAP
>       ARM: EXYNOS: Skip C1 cpuidle state for exynos5440

The patch "ARM: EXYNOS: Skip C1 cpuidle state for exynos5440":

--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -210,7 +210,7 @@ static int __init exynos4_init_cpuidle(void)
                device->cpu = cpu_id;
 
                /* Support IDLE only */
-               if (cpu_id != 0)
+               if (soc_is_exynos5440() || cpu_id != 0)
                        device->state_count = 1;
 
                ret = cpuidle_register_device(device);

is incorrect as noted a month ago in:

http://lists.infradead.org/pipermail/linux-arm-kernel/2013-July/186355.html

[ Because of the deficiency in the core cpuidle core (device->state_count
  not being used by governors' code) only sysfs entries for C1 state will be
  disabled and EXYNOS cpuidle driver will still attempt to use C1 state.

also non-working device->state_count is planned to be removed by:

http://permalink.gmane.org/gmane.linux.power-management.general/37390


To disable C1 state on EXYNOS5440 something like:

	static int __init exynos4_init_cpuidle(void)
	{
	...
		if (soc_is_exynos5440())
			exynos4_idle_driver.state_count = 1;
	...
	}

should be done instead.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
