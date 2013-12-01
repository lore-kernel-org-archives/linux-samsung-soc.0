From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2] irqchip: exynos-combiner: remove hard-coded irq_base
 value
Date: Mon, 02 Dec 2013 07:37:31 +0900
Message-ID: <529BBA2B.3080408@samsung.com>
References: <1379937815-21746-1-git-send-email-chander.kashyap@linaro.org>	<02c701ceba75$f95b1900$ec114b00$@org>	<1949846.N3fAUHQ1Nx@flatron>	<526444E5.5000405@samsung.com> <CANuQgHFSNMV=RF8SHdZf3=gyNoXJWXEcevQ=DAOqUuZXSeugrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:34268 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751412Ab3LAWhh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 Dec 2013 17:37:37 -0500
In-Reply-To: <CANuQgHFSNMV=RF8SHdZf3=gyNoXJWXEcevQ=DAOqUuZXSeugrQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chander Kashyap <chander.kashyap@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "t.figa@samsung.com" <t.figa@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Thomas Abraham <thomas.abraham@linaro.org>, Thomas Gleixner <tglx@linutronix.de>

On 11/25/13 15:37, Chander Kashyap wrote:
> Hi Kikjin,
>
Hi Chander,

> On 21 October 2013 02:32, Kukjin Kim<kgene.kim@samsung.com>  wrote:
>> On 10/18/13 02:53, Tomasz Figa wrote:
>>>
>>> Hi Kukjin,
>>>
>>> On Thursday 26 of September 2013 14:05:09 Kukjin Kim wrote:
>>>>
>>>> Chander Kashyap wrote:
>>>>>
>>>>> Replace irq_domain_add_simple with "irq_domain_add_linear" in order to
>>>>> use linear irq domain, and to remove hardcoded irq_base_value.
>>>>>
>>>>> Signed-off-by: Chander Kashyap<chander.kashyap@linaro.org>
>>>>> ---
>>>>>
>>>>> Changes since v1:
>>>>>          - Replaced irq_domain_add_simple with irq_domain_add_linear,
>>>>>
>>>>>            as suggested by Tomasz
>>>>>
>>>>>    drivers/irqchip/exynos-combiner.c |   15 +++------------
>>>>>    1 file changed, 3 insertions(+), 12 deletions(-)
>>>
>>> [snip]
>>>>
>>>>
>>>> Looks nice to me, applied with Tomasz's review.
>>>
>>>
>>> I don't see this patch in your tree. Did you apply it in the end?
>>>
>> Thanks for your gentle reminder.
>
> I still can not see these patches in yours branches ?
>
Oops, sorry for missing. This should be queued in next.

Thanks.
Kukjin
