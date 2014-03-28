From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 1/4] Samsung 3rd cleanup for v3.15
Date: Fri, 28 Mar 2014 17:54:35 +0900
Message-ID: <022001cf4a63$57f4c330$07de4990$@samsung.com>
References: <532B6BDC.6040806@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:46717 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750962AbaC1Iym (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Mar 2014 04:54:42 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N350056I22ZGMC0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Mar 2014 17:54:35 +0900 (KST)
In-reply-to: <532B6BDC.6040806@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Kevin Hilman' <khilman@linaro.org>, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Kukjin Kim wrote:
> 
> The following changes since commit
> 19a964644f1e655c3f67d539c1e99a9fbcc4588c:
> 
>    ARM: SAMSUNG: remove all custom uncompress.h (2014-03-11 22:05:18
+0900)
> 
> are available in the git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-cleanup-3
> 
> for you to fetch changes up to 1aa9c483d1be13831bc4e516ce4848d32ac3e944:
> 
>    ARM: EXYNOS: Remove hardware.h file (2014-03-21 04:49:03 +0900)
> 
> ----------------------------------------------------------------
> Samsung 3rd cleanup for v3.15
> 
> - Remove <mach/hardware.h> in mach-exynos
> - Remove invalid code from <mach/hardware.h> in mach-s3c24xx
> 
> Note that this is based on previous tags/samsung-cleanup-2
> 
> ----------------------------------------------------------------
> Sachin Kamat (3):
>        ARM: S3C24XX: Remove invalid code from hardware.h
>        ARM: SAMSUNG: Remove hardware.h inclusion
>        ARM: EXYNOS: Remove hardware.h file
> 
>   arch/arm/mach-exynos/include/mach/hardware.h  | 18 ------------------
>   arch/arm/mach-exynos/platsmp.c                |  2 --
>   arch/arm/mach-s3c24xx/include/mach/hardware.h | 14 +-------------
>   arch/arm/plat-samsung/clock.c                 |  1 -
>   arch/arm/plat-samsung/devs.c                  |  2 +-
>   arch/arm/plat-samsung/init.c                  |  2 --
>   arch/arm/plat-samsung/pm.c                    |  1 -
>   arch/arm/plat-samsung/s5p-dev-uart.c          |  1 -
>   8 files changed, 2 insertions(+), 39 deletions(-)
>   delete mode 100644 arch/arm/mach-exynos/include/mach/hardware.h

Hi,

Gentle reminder again ;-)

- Kukjin
