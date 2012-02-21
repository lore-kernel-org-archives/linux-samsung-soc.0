From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH V6 1/5] ARM: exynos: Add support AFTR mode on EXYNOS4210
Date: Tue, 21 Feb 2012 12:19:29 +0530
Message-ID: <4F433E79.2090309@linaro.org>
References: <1329805190-8874-1-git-send-email-amit.kachhap@linaro.org> <1329805190-8874-2-git-send-email-amit.kachhap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:64623 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751183Ab2BUGte (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Feb 2012 01:49:34 -0500
Received: by pbcun15 with SMTP id un15so7052673pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Feb 2012 22:49:34 -0800 (PST)
In-Reply-To: <1329805190-8874-2-git-send-email-amit.kachhap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Amit Daniel Kachhap <amit.kachhap@linaro.org>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, patches@linaro.org

Hi Amit,

On 02/21/2012 11:49 AM, Amit Daniel Kachhap wrote:
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
>  arch/arm/mach-exynos/cpuidle.c          |  147 ++++++++++++++++++++++++++++++-
>  arch/arm/mach-exynos/include/mach/pmu.h |    2 +
>  2 files changed, 146 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c

[ snip ]

> +static int exynos4_enter_core0_aftr(struct cpuidle_device *dev,
> +				struct cpuidle_driver *drv,
> +				int index)
> +{

[ snip ]

> +	scu_enable(S5P_VA_SCU);

#ifdef CONFIG_SMP
	scu_enable(S5P_VA_SCU);
#endif

Without this, if SMP is not enabled, I am getting following build error.

arch/arm/mach-exynos/built-in.o: In function `exynos4_enter_core0_aftr':
arch/arm/mach-exynos/cpuidle.c:131: undefined reference to `scu_enable'


-- 
Tushar Behera
