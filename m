From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] watchdog: s3c2410_wdt: code clean up
Date: Mon, 22 Jul 2013 09:14:48 +0900
Message-ID: <002601ce8670$7a2901d0$6e7b0570$@samsung.com>
References: <1374224288-18963-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:34875 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753054Ab3GVAOu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 21 Jul 2013 20:14:50 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQB001SRA0OT460@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Jul 2013 09:14:48 +0900 (KST)
In-reply-to: <1374224288-18963-1-git-send-email-l.krishna@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Leela Krishna Amudala' <l.krishna@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, Jingoo Han <jg1.han@samsung.com>

On Friday, July 19, 2013 5:58 PM, Leela Krishna Amudala wrote:
> 
> This patch removes the global variables in the driver file and
> group them into a structure.

How about changing the subject as below?

[PATCH] watchdog: s3c2410_wdt: remove the global variables


[.....]

> -static struct device    *wdt_dev;	/* platform device attached to */
> -static struct resource	*wdt_mem;
> -static struct resource	*wdt_irq;
> -static struct clk	*wdt_clock;
> -static void __iomem	*wdt_base;
> -static unsigned int	 wdt_count;
> -static DEFINE_SPINLOCK(wdt_lock);
> +struct s3c2410_watchdog {
> +struct device		*dev;	/* platform device attached to */
> +struct clk		*clock;
> +void __iomem		*reg_base;
> +unsigned int		count;
> +spinlock_t		lock;
> +struct watchdog_device	wdt_device;
> +struct notifier_block	freq_transition;
> +};

'tab' is necessary as below:

+struct s3c2410_watchdog {
+	struct device		*dev;	/* platform device attached to */
+	struct clk		*clock;
+	void __iomem		*reg_base;
+	unsigned int		count;
+	spinlock_t		lock;
+	struct watchdog_device	wdt_device;
+	struct notifier_block	freq_transition;
+};

Best regards,
Jingoo Han
