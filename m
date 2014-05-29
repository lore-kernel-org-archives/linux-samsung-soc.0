From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 3rd 1/3] Samsung Exynos cpuidle updates for 3.16
Date: Thu, 29 May 2014 11:21:52 -0700
Message-ID: <20140529182152.GB18481@quad.lixom.net>
References: <035601cf7897$6c959190$45c0b4b0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:60834 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750940AbaE2SVk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 May 2014 14:21:40 -0400
Received: by mail-pb0-f46.google.com with SMTP id rq2so781564pbb.33
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 May 2014 11:21:40 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <035601cf7897$6c959190$45c0b4b0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Kevin Hilman' <khilman@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Daniel Lezcano' <daniel.lezcano@linaro.org>

On Mon, May 26, 2014 at 01:03:17PM +0900, Kukjin Kim wrote:
> Note: merge conflict will be happened when pulling this for
> arch/arm/mach-exynos/cpuidle.
> You may just fixup with 'git rm arch/arm/mach-exynos/cpuidle.', it is due to
> 'removing inclusion of <plat/cpu.h>' before moving cpuidle driver into
> drivers/cpuidle...
> 
> - Kukjin
> 
> The following changes since commit 985326c9f65a4c1a3b5ab875e6ce0c97c39449ec:
> 
>   Merge branch 'v3.16-next/clk-samsung' into v3.16-next/cpuidle-exynos
> (2014-05-26 05:20:25 +0900)
> 
> are available in the git repository at:
> 
> 
>   http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/exynos-cpuidle
> 
> for you to fetch changes up to cd245f59aae5d6ef265f46aa6cea78354d61b629:
> 
>   ARM: EXYNOS: Fix kernel panic when unplugging CPU1 on exynos (2014-05-26
> 05:21:47 +0900)
> 
> ----------------------------------------------------------------
> Samsung exynos-cpuidle updates for v3.16
> 
> - From Daniel Lezcano:
>  This patchset relies on the cpm_pm notifier to initiate the
>  powerdown sequence operations from pm.c instead cpuidle.c.
>  Thus the cpuidle driver is no longer dependent from arch
>  specific code as everything is called from the pm.c file.
> 
> Note, this is based on tags/exnos-mcpm and tags/samsung-clk

Merged into next/drivers.


-Olof
