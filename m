From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: Re: [PATCH v2] irqchip: exynos-combiner: remove hard-coded irq_base value
Date: Mon, 25 Nov 2013 12:07:49 +0530
Message-ID: <CANuQgHFSNMV=RF8SHdZf3=gyNoXJWXEcevQ=DAOqUuZXSeugrQ@mail.gmail.com>
References: <1379937815-21746-1-git-send-email-chander.kashyap@linaro.org>
	<02c701ceba75$f95b1900$ec114b00$@org>
	<1949846.N3fAUHQ1Nx@flatron>
	<526444E5.5000405@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:55591 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752044Ab3KYGhu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Nov 2013 01:37:50 -0500
Received: by mail-ob0-f176.google.com with SMTP id va2so3753183obc.35
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Nov 2013 22:37:49 -0800 (PST)
In-Reply-To: <526444E5.5000405@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "t.figa@samsung.com" <t.figa@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Thomas Abraham <thomas.abraham@linaro.org>, Thomas Gleixner <tglx@linutronix.de>

Hi Kikjin,

On 21 October 2013 02:32, Kukjin Kim <kgene.kim@samsung.com> wrote:
> On 10/18/13 02:53, Tomasz Figa wrote:
>>
>> Hi Kukjin,
>>
>> On Thursday 26 of September 2013 14:05:09 Kukjin Kim wrote:
>>>
>>> Chander Kashyap wrote:
>>>>
>>>> Replace irq_domain_add_simple with "irq_domain_add_linear" in order to
>>>> use linear irq domain, and to remove hardcoded irq_base_value.
>>>>
>>>> Signed-off-by: Chander Kashyap<chander.kashyap@linaro.org>
>>>> ---
>>>>
>>>> Changes since v1:
>>>>         - Replaced irq_domain_add_simple with irq_domain_add_linear,
>>>>
>>>>           as suggested by Tomasz
>>>>
>>>>   drivers/irqchip/exynos-combiner.c |   15 +++------------
>>>>   1 file changed, 3 insertions(+), 12 deletions(-)
>>
>> [snip]
>>>
>>>
>>> Looks nice to me, applied with Tomasz's review.
>>
>>
>> I don't see this patch in your tree. Did you apply it in the end?
>>
> Thanks for your gentle reminder.

I still can not see these patches in yours branches ?

>
> Applied.
> - Kukjin



-- 
with warm regards,
Chander Kashyap
