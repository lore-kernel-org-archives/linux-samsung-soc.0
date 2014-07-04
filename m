From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH RESEND] ARM: EXYNOS: Do not calculate boot address twice
Date: Fri, 04 Jul 2014 17:41:15 +0900
Message-ID: <032901cf9763$b7733150$265993f0$@samsung.com>
References: <1403783163-28638-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:39213 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751232AbaGDIlR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 04:41:17 -0400
In-reply-to: <1403783163-28638-1-git-send-email-k.kozlowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Russell King' <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>, 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Tomasz Figa' <t.figa@samsung.com>

Krzysztof Kozlowski wrote:
> 
> Commit b3205dea8fbf ("ARM: EXYNOS: Map SYSRAM through generic DT
> bindings") introduced local variable boot_reg where boot address from
> cpu_boot_reg() call is stored. Re-use it instead calling cpu_boot_reg()
> again.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  arch/arm/mach-exynos/platsmp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
> index 1c8d31e39520..55ed2e6729c5 100644
> --- a/arch/arm/mach-exynos/platsmp.c
> +++ b/arch/arm/mach-exynos/platsmp.c
> @@ -155,7 +155,7 @@ static int exynos_boot_secondary(unsigned int cpu, struct task_struct *idle)
>  				ret = PTR_ERR(boot_reg);
>  				goto fail;
>  			}
> -			__raw_writel(boot_addr, cpu_boot_reg(phys_cpu));
> +			__raw_writel(boot_addr, boot_reg);
>  		}
> 
>  		call_firmware_op(cpu_boot, phys_cpu);
> @@ -242,7 +242,7 @@ static void __init exynos_smp_prepare_cpus(unsigned int max_cpus)
> 
>  			if (IS_ERR(boot_reg))
>  				break;
> -			__raw_writel(boot_addr, cpu_boot_reg(phys_cpu));
> +			__raw_writel(boot_addr, boot_reg);
>  		}
>  	}
>  }
> --
> 1.9.1

Oh, good catch. will apply :-)

Thanks,
Kukjin
