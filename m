From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [GIT PULL 10/10] devel-samsung for v3.10
Date: Mon, 08 Apr 2013 22:10:57 +0200
Message-ID: <51632451.3050801@gmail.com>
References: <51630A55.6030703@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f50.google.com ([74.125.83.50]:43302 "EHLO
	mail-ee0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935889Ab3DHULD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Apr 2013 16:11:03 -0400
Received: by mail-ee0-f50.google.com with SMTP id e53so2597236eek.23
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Apr 2013 13:11:01 -0700 (PDT)
In-Reply-To: <51630A55.6030703@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On 04/08/2013 08:20 PM, Kukjin Kim wrote:
> The following changes since commit
> 6dbe51c251a327e012439c4772097a13df43c5b8:
>
> Linux 3.9-rc1 (2013-03-03 15:11:05 -0800)
>
> are available in the git repository at:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/devel-samsung-for-v3.10
>
> for you to fetch changes up to 298591f89fd0f3f779a77e589ce2f1c28e9788ed:
>
> ARM: EXYNOS: replace cpumask by the corresponding macro (2013-04-09
> 00:44:35 +0900)
>
> ----------------------------------------------------------------
> including various development for samsung for v3.10
>
> ----------------------------------------------------------------
> Charles Keepax (2):
> ARM: S3C64XX: Clear DMA flags on channel request
> ARM: S3C64XX: Slow down mic detection rate for wm5102
>
> Daniel Lezcano (3):
> ARM: EXYNOS: factor out the idle states
> ARM: EXYNOS: handle properly the return values
> ARM: EXYNOS: replace cpumask by the corresponding macro
>
> Inderpal Singh (2):
> ARM: EXYNOS: Add support for rtc wakeup
> ARM: SAMSUNG: check processor type before cache restoration in resume
>
> Jonathan Kliegman (2):
> ARM: EXYNOS: Remove hardcode wakeup unmask for EINT_0
> ARM: EXYNOS: Clear ENABLE_WAKEUP_SW bit when entering suspend
>
> Sylwester Nawrocki (2):
> ARM: SAMSUNG: Export MIPI CSIS/DSIM PHY control functions

This one was supposed to be a fix for 3.8-rc IIRC. But anyway the whole
file this patch touches is going to be removed in 3.11.

> ARM: S3C24XX: Correct NR_IRQS definition for s3c2440

And this one is needed for 3.9, sorry for not mentioning it in the patch's
description. Together with [1] it makes my s3c2440 SoC based test board
booting again with 3.9-rc6.

[1] http://www.spinics.net/lists/arm-kernel/msg236643.html

Thanks,
Sylwester
