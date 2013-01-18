From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] arch/arm/mach-s5pv210: adding ifdef CONFIG_CPU_S5PV210
 to fix compiling issue
Date: Thu, 17 Jan 2013 16:14:27 -0800
Message-ID: <001c01cdf510$c89c9800$59d5c800$@samsung.com>
References: <50EA972E.3040404@asianux.com> <50EAC016.6090707@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:18724 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753880Ab3ARAOl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jan 2013 19:14:41 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGS003OMOOAL9H0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 09:14:40 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGS00AKSOODXN90@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 09:14:39 +0900 (KST)
In-reply-to: <50EAC016.6090707@asianux.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Chen Gang' <gang.chen@asianux.com>, linux@arm.linux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Chen Gang wrote:
> 
Firstly, thanks for your posting.

But there are some comments.

For subject:
Please see the git log before your commit, it should be helpful to you.
In this case, 'ARM: S5PV210: ...' is used.

> 
>   if not define CONFIG_CPU_S5PV210
> 
>     it will define NULL in common.h for:
>       s5pv210_map_io, s5pv210_init_clocks, s5pv210_init,
s5pv210_init_uarts
> 
>     so need using #ifdef CONFIG_CPU_S5PV210 for them too, in common.c.
>       or compiling issue will occur.
> 
I don't think so, because common.c in mach-s5pv210 should be built with
selecting CONFIG_CPU_S5PV210, actually it depends on CONFIG_ARCH_S5PV210
though.

Any concerns, please let me know.

> 
> Signed-off-by: Chen Gang <gang.chen@asianux.com>
> ---
>  arch/arm/mach-s5pv210/common.c |    9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/mach-s5pv210/common.c b/arch/arm/mach-
> s5pv210/common.c
> index 9dfe93e..5c88f88 100644
> --- a/arch/arm/mach-s5pv210/common.c
> +++ b/arch/arm/mach-s5pv210/common.c
> @@ -167,6 +167,8 @@ void __init s5pv210_init_io(struct map_desc
> *mach_desc, int size)
>  	s3c_init_cpu(samsung_cpu_id, cpu_ids, ARRAY_SIZE(cpu_ids));
>  }
> 
> +#ifdef CONFIG_CPU_S5PV210
> +
>  void __init s5pv210_map_io(void)
>  {
>  	/* initialise device information early */
> @@ -209,6 +211,9 @@ void __init s5pv210_init_clocks(int xtal)
>  	s5pv210_setup_clocks();
>  }
> 
> +#endif /* CONFIG_CPU_S5PV210 */
> +
> +

Generally, no need double empty lines here.

>  void __init s5pv210_init_irq(void)
>  {
>  	u32 vic[4];	/* S5PV210 supports 4 VIC */
> @@ -227,6 +232,8 @@ struct bus_type s5pv210_subsys = {
>  	.dev_name	= "s5pv210-core",
>  };
> 
> +#ifdef CONFIG_CPU_S5PV210
> +
>  static struct device s5pv210_dev = {
>  	.bus	= &s5pv210_subsys,
>  };
> @@ -249,3 +256,5 @@ void __init s5pv210_init_uarts(struct s3c2410_uartcfg
> *cfg, int no)
>  {
>  	s3c24xx_init_uartdevs("s5pv210-uart", s5p_uart_resources, cfg, no);
>  }
> +
> +#endif /* CONFIG_CPU_S5PV210 */
> --
> 1.7.10.4

Thanks.

- Kukjin
