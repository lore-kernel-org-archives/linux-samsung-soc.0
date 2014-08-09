From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v5][next-20140804] ARM: EXYNOS: Fix suspend/resume
 sequences
Date: Sat, 9 Aug 2014 08:24:52 -0700
Message-ID: <20140809152452.GC5053@quad.lixom.net>
References: <6342975.PHG2cX2jjn@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:44542 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751700AbaHIPYW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 9 Aug 2014 11:24:22 -0400
Received: by mail-pd0-f169.google.com with SMTP id y10so8532651pdj.28
        for <linux-samsung-soc@vger.kernel.org>; Sat, 09 Aug 2014 08:24:22 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <6342975.PHG2cX2jjn@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org

On Tue, Aug 05, 2014 at 02:43:10PM +0200, Bartlomiej Zolnierkiewicz wrote:
> From: Tomasz Figa <t.figa@samsung.com>
> 
> Due to recent consolidation of Exynos suspend and cpuidle code, some
> parts of suspend and resume sequences are executed two times, once from
> exynos_pm_syscore_ops and then from exynos_cpu_pm_notifier() and thus it
> breaks suspend, at least on Exynos4-based boards. In addition, simple
> core power down from a cpuidle driver could, in case of CPU 0 could
> result in calling functions that are specific to suspend and deeper idle
> states.
> 
> This patch fixes the issue by moving those operations outside the CPU PM
> notifier into suspend and AFTR code paths. This leads to a bit of code
> duplication, but allows additional code simplification, so in the end
> more code is removed than added.
> 
> Fixes: 85f9f90808b4 ("ARM: EXYNOS: Use the cpu_pm notifier for pm")
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: arm@kernel.org
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> [b.zolnierkie: ported patch over current changes]
> [b.zolnierkie: fixed exynos_aftr_finisher() return value]
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Applied to fixes.


-Olof
