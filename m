From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/3] irqchip: exynos-combiner: call handle_bad_irq directly
Date: Fri, 14 Feb 2014 07:25:50 +0900
Message-ID: <52FD466E.9060304@samsung.com>
References: <1389321142-4073-1-git-send-email-pankaj.dubey@samsung.com> <52D01D96.8000401@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:41224 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752020AbaBMW0A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Feb 2014 17:26:00 -0500
Received: by mail-pd0-f172.google.com with SMTP id p10so11067689pdj.31
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Feb 2014 14:25:59 -0800 (PST)
In-Reply-To: <52D01D96.8000401@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, tglx@linutronix.de, kgene.kim@samsung.com, thomas.ab@samsung.com

On 01/11/14 01:19, Tomasz Figa wrote:
> Hi Pankaj,
>
> On 10.01.2014 03:32, Pankaj Dubey wrote:
>> This patch is inspired from following commit
>> aec0095653: (irqchip: gic: Call handle_bad_irq() directly)
>>
>> Also this will help in removing unwanted inclusion
>> of header file "asm/mach/irq.h"
>>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> ---
>> drivers/irqchip/exynos-combiner.c | 3 +--
>> 1 file changed, 1 insertion(+), 2 deletions(-)
>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>
Applied, thanks.

- Kukjin
