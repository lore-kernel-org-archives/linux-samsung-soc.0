From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] irqchip: exynos: cleanup non-DT stuff in exynos-combiner
Date: Mon, 22 Jul 2013 19:00:44 +0200
Message-ID: <8556897.hUyIfVfH2g@amdc1227>
References: <027401ce81d3$ad706570$08513050$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:15726 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754635Ab3GVRAt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 13:00:49 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MQC00GDPKL7N620@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Jul 2013 18:00:47 +0100 (BST)
In-reply-to: <027401ce81d3$ad706570$08513050$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, tglx@linutronix.de

On Tuesday 16 of July 2013 12:22:14 Kukjin Kim wrote:
> For EXYNOS SoCs, only can support for DT so removes non-DT stuff
> in exynos-combiner.
> 
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  drivers/irqchip/exynos-combiner.c |   44
> +------------------------------------ 1 file changed, 1 insertion(+), 43
> deletions(-)

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
