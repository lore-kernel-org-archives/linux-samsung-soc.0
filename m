From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2/7] Samsung cleanup for v3.14
Date: Sun, 22 Dec 2013 14:03:38 -0800
Message-ID: <20131222220338.GB13365@quad.lixom.net>
References: <52AE0F4E.5070309@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:35416 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751227Ab3LVWFq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Dec 2013 17:05:46 -0500
Received: by mail-pa0-f42.google.com with SMTP id lj1so4687352pab.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Dec 2013 14:05:46 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <52AE0F4E.5070309@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Mon, Dec 16, 2013 at 05:21:34AM +0900, Kukjin Kim wrote:
> The following changes since commit 6ce4eac1f600b34f2f7f58f9cd8f0503d79e42ae:
> 
>   Linux 3.13-rc1 (2013-11-22 11:30:55 -0800)
> 
> are available in the git repository at:
> 

> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-cleanup
> 
> for you to fetch changes up to 7c394e7be4d267c02eaaac8fa197a7c1b023c99b:
> 
>   ARM: EXYNOS: Constify clksrc immutable register restore tables
> (2013-12-12 07:09:33 +0900)
> 
> ----------------------------------------------------------------
> Samsung cleanup for v3.14
> - remove unused SAMSUNG_GPIOLIB_4BIT and IRQF_DISABLED
> - constify immutable PMU data table and PM clksrc register
> - make const struct for sleep_save
> 
> ----------------------------------------------------------------
> Daniel Kurtz (3):
>       ARM: EXYNOS: Constify data tables for pmu
>       ARM: SAMSUNG: Let s3c_pm_do_restore_*() take const sleep_save
>       ARM: EXYNOS: Constify clksrc immutable register restore tables
> 
> Michael Opdenacker (2):
>       ARM: SAMSUNG: remove unused SAMSUNG_GPIOLIB_4BIT Kconfig parameter
>       ARM: SAMSUNG: remove IRQF_DISABLED

Pulled into next/cleanup. Please be consistent in patch subjects like
other platforms, so "ARM: samsung: .." or "ARM: exynos: ...".


-Olof
