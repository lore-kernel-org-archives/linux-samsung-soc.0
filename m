From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 7/7] ARM: EXYNOS: Defconfig changes for v4.6
Date: Wed, 24 Feb 2016 14:33:01 -0800
Message-ID: <20160224223301.GY10126@localhost>
References: <1455496446-23779-1-git-send-email-k.kozlowski@samsung.com>
 <1455496446-23779-8-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:34921 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759014AbcBXW7G (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Feb 2016 17:59:06 -0500
Received: by mail-pa0-f43.google.com with SMTP id ho8so21049453pac.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Feb 2016 14:59:06 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1455496446-23779-8-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Pankaj Dubey <pankaj.dubey@samsung.com>, Pavel Fedin <p.fedin@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>

On Mon, Feb 15, 2016 at 09:34:06AM +0900, Krzysztof Kozlowski wrote:
> Hi Arnd, Kevin and Olof,
> 
> Defconfig changes, pulling also a tag from RTC tree (merge
> of max77802 into max77686 RTC driver).
> 
> Kind regards,
> Krzysztof
> 
> 
> The following changes since commit 92e963f50fc74041b5e9e744c330dca48e04f08d:
> 
>   Linux 4.5-rc1 (2016-01-24 13:06:47 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-4.6
> 
> for you to fetch changes up to 5d51f1dde207f2d5d43158da75c6608f7bfcec03:
> 
>   ARM: multi_v7_defconfig: Remove MAX77802 RTC Kconfig symbol (2016-02-05 09:11:32 +0900)
> 
> ----------------------------------------------------------------
> Defconfig (exynos and multi_v7) changes for Exynos based boards for v4.6:
> 1. exynos defconfig:
>    a. Enable NEON and accelerated crypto,
>    b. Enable s5p-secss driver (Security SubSystem block for accelerating
>       some cryptographic operations),
> 2. exynos and multi_v7: Remove MAX77802 RTC Kconfig because the driver
>    was combined into existing rtc-max77686 driver. This depends on changes
>    from RTC tree.

Merged, thanks.


-Olof
