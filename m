From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung non-critical fixes for v3.15
Date: Tue, 18 Mar 2014 16:07:42 +0100
Message-ID: <201403181607.42503.arnd@arndb.de>
References: <5327CB4C.9070905@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.131]:51155 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755298AbaCRPHy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Mar 2014 11:07:54 -0400
In-Reply-To: <5327CB4C.9070905@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Tuesday 18 March 2014, Kukjin Kim wrote:
> The following changes since commit 38dbfb59d1175ef458d006556061adeaa8751b72:
> 
>    Linus 3.14-rc1 (2014-02-02 16:42:13 -0800)
> 
> are available in the git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
> tags/samsung-fixes
> 
> for you to fetch changes up to baf64abc468c7583592f67197ae23fa31414b4db:
> 
>    ARM: S3C64XX: mach-crag6410-module.c is not modular (2014-02-16 
> 02:05:44 +0900)
> 
> ----------------------------------------------------------------
> Samsung non-critical fixes for v3.15
> - fix typo CONFIG_CPU_S3C2443 in Kconfig
> - fix G3D regulator on because of entering low power mode
>    for exynos5250-arndale
> - fix CONFIG_USB_EHCI_EXYNOS for exynos_defconfig
> - fix initcall of mach-crag6410-module.c

Pulled into next/fixes-non-critical, thanks!

	Arnd
