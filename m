From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2] irqchip: exynos-combiner: remove hard-coded irq_base
 value
Date: Mon, 21 Oct 2013 06:02:29 +0900
Message-ID: <526444E5.5000405@samsung.com>
References: <1379937815-21746-1-git-send-email-chander.kashyap@linaro.org> <02c701ceba75$f95b1900$ec114b00$@org> <1949846.N3fAUHQ1Nx@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:39995 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751783Ab3JTVCf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 Oct 2013 17:02:35 -0400
In-Reply-To: <1949846.N3fAUHQ1Nx@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linux-kernel@vger.kernel.org, 'Chander Kashyap' <chander.kashyap@linaro.org>, Kukjin Kim <kgene@kernel.org>, thomas.abraham@linaro.org, tglx@linutronix.de

On 10/18/13 02:53, Tomasz Figa wrote:
> Hi Kukjin,
>
> On Thursday 26 of September 2013 14:05:09 Kukjin Kim wrote:
>> Chander Kashyap wrote:
>>> Replace irq_domain_add_simple with "irq_domain_add_linear" in order to
>>> use linear irq domain, and to remove hardcoded irq_base_value.
>>>
>>> Signed-off-by: Chander Kashyap<chander.kashyap@linaro.org>
>>> ---
>>>
>>> Changes since v1:
>>> 	- Replaced irq_domain_add_simple with irq_domain_add_linear,
>>> 	
>>> 	  as suggested by Tomasz
>>>
>>>   drivers/irqchip/exynos-combiner.c |   15 +++------------
>>>   1 file changed, 3 insertions(+), 12 deletions(-)
> [snip]
>>
>> Looks nice to me, applied with Tomasz's review.
>
> I don't see this patch in your tree. Did you apply it in the end?
>
Thanks for your gentle reminder.

Applied.
- Kukjin
