From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v5 5/5] ARM: EXYNOS: Move PMU specific definitions from
 common.h
Date: Mon, 30 Jun 2014 19:15:46 +0200
Message-ID: <53B19B42.1040006@samsung.com>
References: <1403705032-14835-1-git-send-email-pankaj.dubey@samsung.com>
 <1403705032-14835-6-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38783 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753807AbaF3RQP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 13:16:15 -0400
In-reply-to: <1403705032-14835-6-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, vikas.sajjan@samsung.com, joshi@samsung.com, naushad@samsung.com, thomas.ab@samsung.com, chow.kim@samsung.com

Hi Pankaj,

On 25.06.2014 16:03, Pankaj Dubey wrote:
> This patch moves PMU specific definitions into a new file
> as exynos-pmu.h.
> This will help in reducing dependency of common.h in pmu.c.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/common.h     |   17 -----------------
>  arch/arm/mach-exynos/exynos-pmu.h |   31 +++++++++++++++++++++++++++++++
>  arch/arm/mach-exynos/pm.c         |    1 +
>  arch/arm/mach-exynos/pmu.c        |    2 +-
>  4 files changed, 33 insertions(+), 18 deletions(-)
>  create mode 100644 arch/arm/mach-exynos/exynos-pmu.h
> 
> diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
> index 296c6e1..0326ca2 100644
> --- a/arch/arm/mach-exynos/common.h
> +++ b/arch/arm/mach-exynos/common.h
> @@ -135,23 +135,6 @@ extern struct smp_operations exynos_smp_ops;
>  
>  extern void exynos_cpu_die(unsigned int cpu);
>  
> -/* PMU(Power Management Unit) support */
> -
> -#define PMU_TABLE_END	(-1U)
> -
> -enum sys_powerdown {
> -	SYS_AFTR,
> -	SYS_LPA,
> -	SYS_SLEEP,
> -	NUM_SYS_POWERDOWN,
> -};
> -
> -struct exynos_pmu_conf {
> -	unsigned int offset;
> -	unsigned int val[NUM_SYS_POWERDOWN];
> -};

While at it, I'd say this struct could be moved to pmu.c, along with the
PMU_TABLE_END macro as they are both private to this file.

Best regards,
Tomasz
