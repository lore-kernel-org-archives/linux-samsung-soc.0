From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [GIT PULL v2] Samsung-fixes for v3.12
Date: Fri, 18 Oct 2013 07:15:01 -0700
Message-ID: <87ppr2wtqy.fsf@linaro.org>
References: <525DC20D.4080302@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:41862 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753739Ab3JROPF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Oct 2013 10:15:05 -0400
Received: by mail-pa0-f53.google.com with SMTP id kq14so4616189pab.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Oct 2013 07:15:04 -0700 (PDT)
In-Reply-To: <525DC20D.4080302@samsung.com> (Kukjin Kim's message of "Wed, 16
	Oct 2013 07:30:37 +0900")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, arm@kernel.org

Kukjin Kim <kgene.kim@samsung.com> writes:

> The following changes since commit 272b98c6455f00884f0350f775c5342358ebb73f:
>
>   Linux 3.12-rc1 (2013-09-16 16:17:51 -0400)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-fixes-v2
>
> for you to fetch changes up to 22c98592094e6c149b05cc13d4d6ec495e6f5879:
>
>   ARM: dts: fix PL330 MDMA1 address in DT for Universal C210 board
> (2013-10-16 07:25:41 +0900)
>
> ----------------------------------------------------------------
> Fixes for v3.12
> - correct typo 'samsung,pin-drv'
> - correct typo 'earlyprintk'
> - cpufreq regulator lookup for exynos4210-origen and trats
> - fix PL330 MDMA1 address for universal c210 board

These don't appear to be regressions, so since it's a bit late, I'm
queuing these up in fixes-non-critical.

Kevin
