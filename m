From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] Fix s3c24xx build error if !CONFIG_PM
Date: Fri, 21 Oct 2011 18:37:30 +0900
Message-ID: <016f01cc8fd5$0dbe40c0$293ac240$%kim@samsung.com>
References: <20111018105215.GA10230@glitch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:53581 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753472Ab1JUJhn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Oct 2011 05:37:43 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LTE00LOBTEIWZK0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Oct 2011 18:37:31 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LTE005Y1TEIEA40@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 21 Oct 2011 18:37:30 +0900 (KST)
In-reply-to: <20111018105215.GA10230@glitch>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Domenico Andreoli' <cavokz@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Domenico Andreoli wrote:
> 
> s3c2440.c fails to build if !CONFIG_PM because in such case
> s3c2410_pm_syscore_ops is not defined. Same error should happen also
> in s3c2410.c and s3c2442.c
> 
> This patch fixes all of them.
> 
> Signed-off-by: Domenico Andreoli <cavokz@gmail.com>
> 
> ---
>  arch/arm/mach-s3c2410/s3c2410.c |    2 ++
>  arch/arm/mach-s3c2440/s3c2440.c |    2 ++
>  arch/arm/mach-s3c2440/s3c2442.c |    2 ++
>  3 files changed, 6 insertions(+)
> 
> Index: b/arch/arm/mach-s3c2410/s3c2410.c
> =============================================================
> ======
> --- a/arch/arm/mach-s3c2410/s3c2410.c
> +++ b/arch/arm/mach-s3c2410/s3c2410.c
> @@ -170,8 +170,10 @@ int __init s3c2410_init(void)
>  {
>  	printk("S3C2410: Initialising architecture\n");
> 
> +#ifdef CONFIG_PM
>  	register_syscore_ops(&s3c2410_pm_syscore_ops);
>  	register_syscore_ops(&s3c24xx_irq_syscore_ops);

I think, basically we don't need condition for "s3c24xx_irq_syscore_ops",
since it will be built without CONFIG_PM.

> +#endif
> 
>  	return sysdev_register(&s3c2410_sysdev);
>  }
> Index: b/arch/arm/mach-s3c2440/s3c2440.c
> =============================================================
> ======
> --- a/arch/arm/mach-s3c2440/s3c2440.c
> +++ b/arch/arm/mach-s3c2440/s3c2440.c
> @@ -55,9 +55,11 @@ int __init s3c2440_init(void)
> 
>  	/* register suspend/resume handlers */
> 
> +#ifdef CONFIG_PM
>  	register_syscore_ops(&s3c2410_pm_syscore_ops);
>  	register_syscore_ops(&s3c244x_pm_syscore_ops);

Same as above.

>  	register_syscore_ops(&s3c24xx_irq_syscore_ops);

Same as above.

> +#endif
> 
>  	/* register our system device for everything else */
> 
> Index: b/arch/arm/mach-s3c2440/s3c2442.c
> =============================================================
> ======
> --- a/arch/arm/mach-s3c2440/s3c2442.c
> +++ b/arch/arm/mach-s3c2440/s3c2442.c
> @@ -169,9 +169,11 @@ int __init s3c2442_init(void)
>  {
>  	printk("S3C2442: Initialising architecture\n");
> 
> +#ifdef CONFIG_PM
>  	register_syscore_ops(&s3c2410_pm_syscore_ops);
>  	register_syscore_ops(&s3c244x_pm_syscore_ops);

Same as above.

>  	register_syscore_ops(&s3c24xx_irq_syscore_ops);

Same as above.

> +#endif
> 
>  	return sysdev_register(&s3c2442_sysdev);
>  }

Err...happend following build error without CONFIG_PM on 3.1-rc10.

arch/arm/mach-s3c2410/built-in.o: In function `s3c2410_init':
arch/arm/mach-s3c2410/s3c2410.c:177: undefined reference to
`s3c2410_pm_syscore_ops'
arch/arm/mach-s3c2412/built-in.o: In function `s3c2412_init':
arch/arm/mach-s3c2412/s3c2412.c:252: undefined reference to
`s3c2412_pm_syscore_ops'
arch/arm/mach-s3c2416/built-in.o: In function `s3c2416_init':
arch/arm/mach-s3c2416/s3c2416.c:104: undefined reference to
`s3c2416_pm_syscore_ops'
arch/arm/mach-s3c2440/built-in.o: In function `s3c2440_init':
arch/arm/mach-s3c2440/s3c2440.c:65: undefined reference to
`s3c2410_pm_syscore_ops'
arch/arm/mach-s3c2440/built-in.o: In function `s3c2442_init':
arch/arm/mach-s3c2440/s3c2442.c:177: undefined reference to
`s3c2410_pm_syscore_ops'

So this should be following?

diff --git a/arch/arm/mach-s3c2410/s3c2410.c
b/arch/arm/mach-s3c2410/s3c2410.c
index f1d3bd8..343a540 100644
--- a/arch/arm/mach-s3c2410/s3c2410.c
+++ b/arch/arm/mach-s3c2410/s3c2410.c
@@ -170,7 +170,9 @@ int __init s3c2410_init(void)
 {
 	printk("S3C2410: Initialising architecture\n");

+#ifdef CONFIG_PM
 	register_syscore_ops(&s3c2410_pm_syscore_ops);
+#endif
 	register_syscore_ops(&s3c24xx_irq_syscore_ops);

 	return sysdev_register(&s3c2410_sysdev);
diff --git a/arch/arm/mach-s3c2412/s3c2412.c
b/arch/arm/mach-s3c2412/s3c2412.c
index ef0958d..57a1e01 100644
--- a/arch/arm/mach-s3c2412/s3c2412.c
+++ b/arch/arm/mach-s3c2412/s3c2412.c
@@ -245,7 +245,9 @@ int __init s3c2412_init(void)
 {
 	printk("S3C2412: Initialising architecture\n");

+#ifdef CONFIG_PM
 	register_syscore_ops(&s3c2412_pm_syscore_ops);
+#endif
 	register_syscore_ops(&s3c24xx_irq_syscore_ops);

 	return sysdev_register(&s3c2412_sysdev);
diff --git a/arch/arm/mach-s3c2416/s3c2416.c
b/arch/arm/mach-s3c2416/s3c2416.c
index 494ce91..20b3fdf 100644
--- a/arch/arm/mach-s3c2416/s3c2416.c
+++ b/arch/arm/mach-s3c2416/s3c2416.c
@@ -97,7 +97,9 @@ int __init s3c2416_init(void)

 	s3c_fb_setname("s3c2443-fb");

+#ifdef CONFIG_PM
 	register_syscore_ops(&s3c2416_pm_syscore_ops);
+#endif
 	register_syscore_ops(&s3c24xx_irq_syscore_ops);

 	return sysdev_register(&s3c2416_sysdev);
diff --git a/arch/arm/mach-s3c2440/s3c2440.c
b/arch/arm/mach-s3c2440/s3c2440.c
index ce99ff7..2270d33 100644
--- a/arch/arm/mach-s3c2440/s3c2440.c
+++ b/arch/arm/mach-s3c2440/s3c2440.c
@@ -55,7 +55,9 @@ int __init s3c2440_init(void)

 	/* register suspend/resume handlers */

+#ifdef CONFIG_PM
 	register_syscore_ops(&s3c2410_pm_syscore_ops);
+#endif
 	register_syscore_ops(&s3c244x_pm_syscore_ops);
 	register_syscore_ops(&s3c24xx_irq_syscore_ops);

diff --git a/arch/arm/mach-s3c2440/s3c2442.c
b/arch/arm/mach-s3c2440/s3c2442.c
index 9ad99f8..6f2b65e 100644
--- a/arch/arm/mach-s3c2440/s3c2442.c
+++ b/arch/arm/mach-s3c2440/s3c2442.c
@@ -169,7 +169,9 @@ int __init s3c2442_init(void)
 {
 	printk("S3C2442: Initialising architecture\n");

+#ifdef CONFIG_PM
 	register_syscore_ops(&s3c2410_pm_syscore_ops);
+#endif
 	register_syscore_ops(&s3c244x_pm_syscore_ops);
 	register_syscore_ops(&s3c24xx_irq_syscore_ops);


However, hmm....I think, we need to sort out regarding s3c24xx PM codes'
structure.

Anyway, Domenico, if you're ok with above, could you please re-submit?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
