From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/3] irqchip: exynos-combiner: call handle_bad_irq directly
Date: Fri, 10 Jan 2014 17:19:34 +0100
Message-ID: <52D01D96.8000401@samsung.com>
References: <1389321142-4073-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:51662 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757892AbaAJQTn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jan 2014 11:19:43 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MZ7002GM1CT4N70@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jan 2014 16:19:41 +0000 (GMT)
In-reply-to: <1389321142-4073-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: tglx@linutronix.de, kgene.kim@samsung.com, catalin.marinas@arm.com, thomas.ab@samsung.com

Hi Pankaj,

On 10.01.2014 03:32, Pankaj Dubey wrote:
> This patch is inspired from following commit
>   aec0095653: (irqchip: gic: Call handle_bad_irq() directly)
>
> Also this will help in removing unwanted inclusion
> of header file "asm/mach/irq.h"
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>   drivers/irqchip/exynos-combiner.c |    3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
