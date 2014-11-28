From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 2/5] Samsung 2nd round of cleanup for v3.19
Date: Fri, 28 Nov 2014 13:11:40 +0100
Message-ID: <201411281311.40717.arnd@arndb.de>
References: <546F490F.1020601@kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:56307 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751046AbaK1MMN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Nov 2014 07:12:13 -0500
In-Reply-To: <546F490F.1020601@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene@kernel.org>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, arm@kernel.org

On Friday 21 November 2014, Kukjin Kim wrote:
> The following changes since commit 13cfa6c4f7facfc690ba9e99ec382c151fddaced:
> 
>   ARM: EXYNOS: Fix CPU idle clock down after CPU off (2014-10-21
> 00:06:22 +0900)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-cleanup-2
> 
> for you to fetch changes up to 9c50b2a98cf0ca70480b70a4490a87177519094c:
> 
>   ARM: EXYNOS: Remove unused static iomapping (2014-11-13 11:42:59 +0900)
> 
> ----------------------------------------------------------------
> Samsung 2nd cleanup for v3.19
> 
> - remove unused static iomapping for exynos SoCs
>   : remove unused static iomapping from exynos4/5_iodesc table,
>     and related macros from mach/map.h and plat/map-s5p.h.

Nice cleanup!

Applied to next/cleanup, thanks!

	Arnd
