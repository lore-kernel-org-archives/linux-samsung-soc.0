From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung fixes-1 for 3.16
Date: Sun, 22 Jun 2014 20:50:32 +0200
Message-ID: <6202115.rEhZ2ZRvNc@wuerfel>
References: <53A69238.5070709@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:60863 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751743AbaFVSuh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Jun 2014 14:50:37 -0400
In-Reply-To: <53A69238.5070709@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: "arm@kernel.org" <arm@kernel.org>, 'Olof Johansson' <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Sunday 22 June 2014 17:22:16 Kukjin Kim wrote:
> The following changes since commit 7171511eaec5bf23fb06078f59784a3a0626b38f:
> 
>    Linux 3.16-rc1 (2014-06-15 17:45:28 -1000)
> 
> are available in the git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
> tags/samsung-fixes-1
> 
> for you to fetch changes up to 7cbcb9d46f9194eb1f88c253a08c0292b2883acc:
> 
>    ARM: EXYNOS: Don't rely on firmware's secondary_cpu_start for mcpm 
> (2014-06-21 19:30:53 +0900)
> 
> ----------------------------------------------------------------
> Samsung fixes for 3.16
> 
> - use WFI macro in platform_do_lowpower because exynos cpuhotplug
>    includes a hardcoded WFI instruction and it causes compile error
>    in Thumb-2 mode.
> - fix GIC reg sizes for exynos4 SoCs
> - remove reset timer counter value during boot and resume for mct
>    to fix a big jump in printk timestamps
> - fix pm code to check cortex-A9 for another exynos SoCs
> - don't rely on firmware's secondary_cpu_start for mcpm
> 

Pulled into fixes branch, thanks!

	Arnd
