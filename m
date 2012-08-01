From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/3] ARM: exynos: Save combiner registers on suspend
Date: Wed, 01 Aug 2012 20:38:55 +0900
Message-ID: <038e01cd6fda$3bba6f40$b32f4dc0$%kim@samsung.com>
References: <1342808076-29985-1-git-send-email-kliegs@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:55799 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751818Ab2HALi5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Aug 2012 07:38:57 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M8200DLRR0WPJV0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Aug 2012 20:38:56 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M820024KR0VBR40@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Aug 2012 20:38:55 +0900 (KST)
In-reply-to: <1342808076-29985-1-git-send-email-kliegs@chromium.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jonathan Kliegman' <kliegs@chromium.org>, linux-samsung-soc@vger.kernel.org

Jonathan Kliegman wrote:
> 
> The interupt combiner registers need to be saved on suspend resume
> or its interrupts (trackpad and keyboard most noticeably) won't work
> after resume.
> 
> Signed-off-by: Jonathan Kliegman <kliegs@chromium.org>
> ---
>  arch/arm/mach-exynos/common.c |   74
> +++++++++++++++++++++++++++++++++++++----
>  1 files changed, 67 insertions(+), 7 deletions(-)

[...]

> +#ifdef CONFIG_PM

#ifdef CONFIG_CPU_PM?

> +static void combiner_save(void)
> +{
> +	int i;
> +
> +	for (i = 0; i < rt_max_combiner_nr; i++) {
> +		if (combiner_data[i].irq_mask &
> +		    __raw_readl(combiner_data[i].base +
COMBINER_ENABLE_SET))
> {
> +			combiner_data[i].saved_on = true;
> +		} else {
> +			combiner_data[i].saved_on = false;
> +		}
> +	}
> +}
> +
> +static void combiner_restore(void)
> +{
> +	int i;
> +
> +	for (i = 0; i < rt_max_combiner_nr; i++) {
> +		if (!combiner_data[i].saved_on)
> +			continue;
> +
> +		__raw_writel(combiner_data[i].irq_mask,
> +			     combiner_data[i].base + COMBINER_ENABLE_SET);
> +	}
> +}
> +
> +

No need double empty lines :)

> +static int combiner_notifier(struct notifier_block *self, unsigned long
> cmd,
> +			     void *v)
> +{
> +	switch (cmd) {
> +	case CPU_PM_ENTER:

Should be CPU_CLUSTER_PM_ENTER?

> +		combiner_save();
> +		break;
> +	case CPU_PM_EXIT:

CPU_CLUSTER_PM_EXIT?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
