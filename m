From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 3/5] Samsung Exynos updates for 3.16
Date: Fri, 30 May 2014 21:40:11 -0700
Message-ID: <20140531044011.GC21917@quad.lixom.net>
References: <5388E32B.3010908@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:39725 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751214AbaEaEj7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 31 May 2014 00:39:59 -0400
Received: by mail-pd0-f181.google.com with SMTP id z10so1600674pdj.26
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 May 2014 21:39:59 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <5388E32B.3010908@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Sat, May 31, 2014 at 04:59:39AM +0900, Kukjin Kim wrote:
> The following changes since commit fced6dee29f6fb143fe16ea90331176ff77e6120:
> 
>   Merge branch 'v3.16-next/cleanup-samsung' into
> v3.16-next/platform-exynos (2014-05-31 02:36:49 +0900)
> 
> are available in the git repository at:
> 
> 

> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-exynos
> 
> for you to fetch changes up to 9dfa92ec4033c348aae6bafc1881e07229fabaa6:
> 
>   ARM: EXYNOS: Enable multi-platform build support (2014-05-31
> 02:43:51 +0900)
> 
> ----------------------------------------------------------------
> Samsung Exynos updates for 3.16
> 
> - add new SoCs support
>   : exynos3250, 5260, 5410 and 5800
> 
> - enable multi-platform on exynos
>   : consolidate exynos related Kconfig entries
> 
> Note that this requires tags/samsung-cleanup and tags/samsung-clk-2
> because of mostly migration exynos specific macros into mach-exynos
> and exynos related Kconfig entries.
> 
> One more merge conflict happens in arch/arm/Kconfig for ARCH_EXYNOS
> due to SRAM stuff, even though tried to sort them out. Since just
> resolving it would be better I think, please remove ARCH_EXYNOS in
> arch/arm/Kconfig when merge conflict happens.

Merged, thanks.


-Olof
