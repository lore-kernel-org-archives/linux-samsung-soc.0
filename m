From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH V5 1/5] ARM: exynos: Add support AFTR mode on EXYNOS4210
Date: Wed, 01 Feb 2012 17:07:30 +0530
Message-ID: <4F2923FA.8080301@linaro.org>
References: <1325737525-12869-1-git-send-email-amit.kachhap@linaro.org> <1325737525-12869-2-git-send-email-amit.kachhap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:61082 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753786Ab2BALhf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Feb 2012 06:37:35 -0500
Received: by iacb35 with SMTP id b35so1389751iac.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Feb 2012 03:37:35 -0800 (PST)
In-Reply-To: <1325737525-12869-2-git-send-email-amit.kachhap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Amit Daniel Kachhap <amit.kachhap@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, patches@linaro.org

Hi Amit,

On 01/05/2012 09:55 AM, Amit Daniel Kachhap wrote:
> This patch adds support AFTR(ARM OFF TOP RUNNING) mode in
> cpuidle driver. L2 cache keeps their data in this mode.
> This patch ports the code to the latest interfaces to
> save/restore CPU state inclusive of CPU PM notifiers, l2
> resume and cpu_suspend/resume.
> 
> Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Signed-off-by: Amit Daniel Kachhap <amit.kachhap@linaro.org>
> ---
>  arch/arm/mach-exynos/cpuidle.c          |  149 ++++++++++++++++++++++++++++++-
>  arch/arm/mach-exynos/include/mach/pmu.h |    2 +
>  2 files changed, 148 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c

-- snip --

> +static int exynos4_enter_core0_aftr(struct cpuidle_device *dev,
> +				struct cpuidle_driver *drv,
> +				int index)
> +{

-- snip --

> +
> +	scu_enable(S5P_VA_SCU);

#ifdef CONFIG_SMP
	scu_enable(S5P_VA_SCU);
#endif

This is required when compiling without SMP support.


-- 
Tushar Behera
