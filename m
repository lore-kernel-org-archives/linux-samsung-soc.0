From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2nd 2/5] Samsung cleanup for v3.14
Date: Sat, 28 Dec 2013 15:13:54 -0800
Message-ID: <20131228231354.GA22753@quad.lixom.net>
References: <52B5DCA2.6080107@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:34597 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751037Ab3L1XQA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 28 Dec 2013 18:16:00 -0500
Received: by mail-pd0-f172.google.com with SMTP id g10so10135645pdj.31
        for <linux-samsung-soc@vger.kernel.org>; Sat, 28 Dec 2013 15:16:00 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <52B5DCA2.6080107@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Sun, Dec 22, 2013 at 03:23:30AM +0900, Kukjin Kim wrote:
> The following changes since commit 7c394e7be4d267c02eaaac8fa197a7c1b023c99b:
> 
>   ARM: EXYNOS: Constify clksrc immutable register restore tables
> (2013-12-12 07:09:33 +0900)
> 
> are available in the git repository at:
> 

> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-cleanup-2
> 
> for you to fetch changes up to 1fd3cbccaf47aefbe3bfb026d310cd2f5d0685c6:
> 
>   ARM: EXYNOS: Kill exynos_pm_late_initcall() (2013-12-21 06:40:44 +0900)
> 
> ----------------------------------------------------------------
> Samsung cleanup 2nd for v3.14
> - remove <mach/regs-clock.h> for exynos
> - remove <mach/regs-irq.h> for exynos
> - local <mach/regs-pmu.h> into mach-exynos
> - select PM_GENERIC_DOMAINS for ARCH_EXYNOS4
>   instead of each SOC_EXYNOS4XXX in Kconfig
> - call pm_genpd_poweroff_unused() instead of via
>   exynos_pm_late_initcall() because no need to
>   handle whether CONFIG_PM_GENERIC_DOMAINS is enalbed

Great! Merged into next/cleanup. See a separate comment on one of the patches
when they were posted regarding bisectability though.


-Olof
