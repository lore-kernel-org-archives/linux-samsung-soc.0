From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 6/7] Samsung DT for v3.14
Date: Sun, 22 Dec 2013 14:15:48 -0800
Message-ID: <20131222221548.GG13365@quad.lixom.net>
References: <52AE0F9A.3010407@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:55555 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754262Ab3LVWR4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Dec 2013 17:17:56 -0500
Received: by mail-pa0-f43.google.com with SMTP id bj1so4666464pad.30
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Dec 2013 14:17:56 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <52AE0F9A.3010407@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Mon, Dec 16, 2013 at 05:22:50AM +0900, Kukjin Kim wrote:
> The following changes since commit 6ce4eac1f600b34f2f7f58f9cd8f0503d79e42ae:
> 
>   Linux 3.13-rc1 (2013-11-22 11:30:55 -0800)
> 
> are available in the git repository at:
> 

> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-dt
> 
> for you to fetch changes up to e0b51c2eae8ebf10d80530b7a306818252206325:
> 
>   ARM: dts: Update Samsung sysreg binding document (2013-12-16
> 04:47:38 +0900)
> 
> ----------------------------------------------------------------
> Samsung DT updates for v3.14
> - Add support Octa Cores for exynos5420
>   : populate CPU node entries to 8 Cores
>   : extend mct to support 8 local interrupts
> - Update dwmmc nodes for exynos5250 and exynos5420
>   : change status property of dwmmc nodes for exynos5250
>   : move dwmmc nodes from exynos5 to exynos5250 because
>     it's different between exynos5250 and exynos5420
>   : rename mmc nodes from dwmmc for exynos5 SoCs
>   : add dwmmc nodes for exynos5420
> - Add G-Scaler nodes for exynos5420
> - Add HS-i2c nodes in exynos5420
>   : High Speed I2C 7 channels (4 to 10)
> - Update sysreg binding and node name in exynos4
> - Update min voltage on exynos5250-arndale
> - Move fifo-depth property from boards to exynos5250 SoC
>   : because the fifo-depth property is SoC specific

Shouldn't some of these patches be fixes instead, i.e. the vdd_arm change for
Arndale, the sysreg node fix, etc?

I've merged this in, but this I considered not doing it since it also contains
new platform development. As I mentioned in the pull request for the 'dev'
branch: We need to see exynos converted to multiplatform before we pick up any
more non-multiplatform support.

Merged into next/dt.

Regards,

-Olof
