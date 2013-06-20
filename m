From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 06/10] Samsung non-DT EXYNOS for v3.11
Date: Thu, 20 Jun 2013 22:53:46 +0200
Message-ID: <201306202253.47163.arnd@arndb.de>
References: <51C0BC62.3000605@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:54429 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161225Ab3FTUyV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 16:54:21 -0400
In-Reply-To: <51C0BC62.3000605@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>

On Tuesday 18 June 2013, Kukjin Kim wrote:
> The following changes since commit 317ddd256b9c24b0d78fa8018f80f1e495481a10:
> 
>    Linux 3.10-rc5 (2013-06-08 17:41:04 -0700)
> 
> are available in the git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
> tags/remove-nondt-exynos-3
> 
> for you to fetch changes up to 564d06b1266ee62c9b47eab8305755e5ff6e38d5:
> 
>    ARM: EXYNOS: Remove remaining dead code after non-DT support removal 
> (2013-06-19 01:37:53 +0900)
> 
> ----------------------------------------------------------------
> cleanup and removing dead code for only support DT for exynos
> - remove board file for exynos
> - remove legacy files which are not used anymore
> - decouple ARCH_EXYNOS from PLAT_S5P

Pulled into next/soc, thanks!

	Arnd
