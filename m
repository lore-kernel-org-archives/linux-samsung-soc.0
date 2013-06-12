From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 5/6] remove non-DT for exynos
Date: Wed, 12 Jun 2013 16:31:36 -0700
Message-ID: <20130612233136.GB9067@quad.lixom.net>
References: <51B791EF.9070904@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:55149 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756952Ab3FLXbb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 19:31:31 -0400
Received: by mail-pa0-f46.google.com with SMTP id fa11so7337025pad.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2013 16:31:31 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <51B791EF.9070904@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Wed, Jun 12, 2013 at 06:09:03AM +0900, Kukjin Kim wrote:
> The following changes since commit 317ddd256b9c24b0d78fa8018f80f1e495481a10:
> 
>   Linux 3.10-rc5 (2013-06-08 17:41:04 -0700)
> 
> are available in the git repository at:
> 

> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/remove-nondt-exynos
> 
> for you to fetch changes up to 8661bc149b95b5d4298b4ffd55c298972c4820d1:
> 
>   ARM: exynos4_defconfig: remove non-DT configuration (2013-06-10
> 18:37:01 +0900)
> 
> ----------------------------------------------------------------
> remove non DT support for exynos
> 
> ----------------------------------------------------------------
> Kukjin Kim (2):
>       ARM: EXYNOS: no more support non-DT for EXYNOS SoCs
>       ARM: exynos4_defconfig: remove non-DT configuration
> 
>  arch/arm/configs/exynos4_defconfig |  68 --------
>  arch/arm/mach-exynos/Kconfig       | 320
> +-----------------------------------
>  arch/arm/mach-exynos/Makefile      |  26 ---
>  arch/arm/mach-exynos/common.c      |  10 --
>  arch/arm/mach-exynos/dev-ahci.c    | 255 -----------------------------
>  arch/arm/mach-exynos/dev-ohci.c    |  52 ------
>  arch/arm/mach-exynos/dma.c         | 322
> -------------------------------------
>  arch/arm/mach-exynos/pm_domains.c  |   7 -
>  8 files changed, 1 insertion(+), 1059 deletions(-)
>  delete mode 100644 arch/arm/configs/exynos4_defconfig
>  delete mode 100644 arch/arm/mach-exynos/dev-ahci.c
>  delete mode 100644 arch/arm/mach-exynos/dev-ohci.c
>  delete mode 100644 arch/arm/mach-exynos/dma.c

Kukjin,

What about the legacy board files? I don't see them removed (nor converted to
DT) here, so this is not a full removal.

Also, the argument to keep exynos4_defconfig was that it needed to enable
non-DT boards. I think we might as well just remove the defconfig and make sure
all the needed options are enabled in exynos_defconfig -- they should coexist
just fine.

I'll hold off pulling until the defconfig situation has been resolved, but
please follow up on the board file piece too.


-Olof
