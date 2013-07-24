From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH 1/1] ARM: EXYNOS: Cleanup common.h file
Date: Wed, 24 Jul 2013 11:31:06 +0900
Message-ID: <0dfc01ce8815$d95aa450$8c0fecf0$@org>
References: <1373533047-4509-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:36377 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750901Ab3GXCbI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jul 2013 22:31:08 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQF000BZ5MLTOE0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 11:31:06 +0900 (KST)
In-reply-to: <1373533047-4509-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> Remove unused declarations that got left behind subsequent to
> making Exynos a DT-only platform.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-exynos/common.h |   41
-------------------------------------
> ----
>  1 file changed, 41 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
> index c4abde2..7318e62 100644
> --- a/arch/arm/mach-exynos/common.h
> +++ b/arch/arm/mach-exynos/common.h
> @@ -17,7 +17,6 @@
> 
>  void mct_init(void __iomem *base, int irq_g0, int irq_l0, int irq_l1);
>  void exynos_init_time(void);
> -extern unsigned long xxti_f, xusbxti_f;
> 
>  struct map_desc;
>  void exynos_init_io(void);
> @@ -25,54 +24,14 @@ void exynos4_restart(enum reboot_mode mode, const char
> *cmd);
>  void exynos5_restart(enum reboot_mode mode, const char *cmd);
>  void exynos_init_late(void);
> 
> -/* ToDo: remove these after migrating legacy exynos4 platforms to dt */
> -void exynos4_clk_init(struct device_node *np, int is_exynos4210, void
> __iomem *reg_base, unsigned long xom);
> -void exynos4_clk_register_fixed_ext(unsigned long, unsigned long);
> -
>  void exynos_firmware_init(void);
> 
> -void exynos_set_timer_source(u8 channels);
> -
>  #ifdef CONFIG_PM_GENERIC_DOMAINS
>  int exynos_pm_late_initcall(void);
>  #else
>  static inline int exynos_pm_late_initcall(void) { return 0; }
>  #endif
> 
> -#ifdef CONFIG_ARCH_EXYNOS4
> -void exynos4_register_clocks(void);
> -void exynos4_setup_clocks(void);
> -
> -#else
> -#define exynos4_register_clocks()
> -#define exynos4_setup_clocks()
> -#endif
> -
> -#ifdef CONFIG_ARCH_EXYNOS5
> -void exynos5_register_clocks(void);
> -void exynos5_setup_clocks(void);
> -
> -#else
> -#define exynos5_register_clocks()
> -#define exynos5_setup_clocks()
> -#endif
> -
> -#ifdef CONFIG_CPU_EXYNOS4210
> -void exynos4210_register_clocks(void);
> -
> -#else
> -#define exynos4210_register_clocks()
> -#endif
> -
> -#ifdef CONFIG_SOC_EXYNOS4212
> -void exynos4212_register_clocks(void);
> -
> -#else
> -#define exynos4212_register_clocks()
> -#endif
> -
> -struct device_node;
> -
>  extern struct smp_operations exynos_smp_ops;
> 
>  extern void exynos_cpu_die(unsigned int cpu);
> --
> 1.7.9.5

Looks good to me, applied into -cleanup.

Thanks,
Kukjin
