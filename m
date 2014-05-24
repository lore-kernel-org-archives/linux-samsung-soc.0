From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: exynos: Fix kernel panic when unplugging CPU1 on
 4210
Date: Sat, 24 May 2014 19:32:53 +0200
Message-ID: <5380D7C5.7080201@gmail.com>
References: <537FBE42.7050608@gmail.com> <1400952255-13750-1-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:36333 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750882AbaEXRc7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 24 May 2014 13:32:59 -0400
Received: by mail-we0-f174.google.com with SMTP id k48so6239659wev.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 24 May 2014 10:32:57 -0700 (PDT)
In-Reply-To: <1400952255-13750-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, rjw@rjwysocki.net, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, arnd.bergmann@linaro.org, sachin.kamat@linaro.org, heiko@sntech.de

Hi Daniel,

On 24.05.2014 19:24, Daniel Lezcano wrote:
> A look at the code reveals use of S5P_VA_SYSRAM macro, in case of certain SoC
> revisions, which is not valid any longer, after SYSRAM started to be mapped
> dynamically. The new dynamic mapping is stored in sysram_base_addr variable,
> which is declared static in platsmp.c
> 
> This fix makes sysram_base_addr non-static, declared it in common.h and used
> in pm.c instead of S5P_VA_SYSRAM.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Suggested-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  arch/arm/mach-exynos/common.h  |    1 +
>  arch/arm/mach-exynos/platsmp.c |    2 +-
>  arch/arm/mach-exynos/pm.c      |    4 ++--
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 

Looks good to me.

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
