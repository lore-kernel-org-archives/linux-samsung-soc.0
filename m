From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 09/10] Samsung exynos_defconfig for v3.11
Date: Thu, 20 Jun 2013 22:53:27 +0200
Message-ID: <201306202253.27477.arnd@arndb.de>
References: <51C0BC7B.908@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:56199 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1422696Ab3FTUyC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 16:54:02 -0400
In-Reply-To: <51C0BC7B.908@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tushar Behera <tushar.behera@linaro.org>

On Tuesday 18 June 2013, Kukjin Kim wrote:
> The following changes since commit 317ddd256b9c24b0d78fa8018f80f1e495481a10:
> 
>    Linux 3.10-rc5 (2013-06-08 17:41:04 -0700)
> 
> are available in the git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
> tags/samsung-defconfig-1
> 
> for you to fetch changes up to 85964af2cd7950c875048e3089c0bf7e2a89ed5b:
> 
>    ARM: exynos_defconfig: Enable GPIO buttons and RTC drivers 
> (2013-06-19 00:35:14 +0900)
> 
> ----------------------------------------------------------------
> update exynos_defconfig
> - enable GPIO buttons and RTC drivers
> 
> ----------------------------------------------------------------
> Tushar Behera (1):
>        ARM: exynos_defconfig: Enable GPIO buttons and RTC drivers
> 
>   arch/arm/configs/exynos_defconfig | 3 +++
>   1 file changed, 3 insertions(+)
> 

Pulled into next/soc, thanks!

	Arnd
