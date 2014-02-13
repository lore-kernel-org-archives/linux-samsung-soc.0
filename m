From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH 1/3] irqchip: exynos-combiner: call handle_bad_irq directly
Date: Thu, 13 Feb 2014 17:14:13 +0900
Message-ID: <52FC7ED5.1020403@samsung.com>
References: <1389321142-4073-1-git-send-email-pankaj.dubey@samsung.com>
 <52D01D96.8000401@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:32691 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751348AbaBMH6r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Feb 2014 02:58:47 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N0X00BTDCTR2A80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Feb 2014 16:58:39 +0900 (KST)
In-reply-to: <52D01D96.8000401@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, kgene.kim@samsung.com, catalin.marinas@arm.com, thomas.ab@samsung.com

On 01/11/2014 01:19 AM, Tomasz Figa wrote:
> Hi Pankaj,
>
> On 10.01.2014 03:32, Pankaj Dubey wrote:
>> This patch is inspired from following commit
>>   aec0095653: (irqchip: gic: Call handle_bad_irq() directly)
>>
>> Also this will help in removing unwanted inclusion
>> of header file "asm/mach/irq.h"
>>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> ---
>>   drivers/irqchip/exynos-combiner.c |    3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>
> Best regards,
> Tomasz
>

Ping.

Thanks,
Pankaj Dubey
