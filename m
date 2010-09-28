From: =?utf-8?B?TWljaGHFgiBOYXphcmV3aWN6?= <m.nazarewicz@samsung.com>
Subject: Re: [PATCH] ARM: S5PV310: Optimize interrupt source searching code
Date: Tue, 28 Sep 2010 15:01:01 +0200
Message-ID: <op.vjqufzs47p4s8u@pikus>
References: <1285637510-16740-1-git-send-email-kgene.kim@samsung.com>
 <4CA1E387.709@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed	delsp=yes
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:10361 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753274Ab0I1M7E convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Sep 2010 08:59:04 -0400
Received: from eu_spt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L9G0052QK2B9860@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Sep 2010 13:58:59 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L9G00705K2AV3@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Sep 2010 13:58:59 +0100 (BST)
In-reply-to: <4CA1E387.709@ru.mvista.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Sergei Shtylyov <sshtylyov@mvista.com>
Cc: linux-samsung-soc@vger.kernel.org, Changhwan Youn <chaos.youn@samsung.com>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

On Tue, 28 Sep 2010 14:45:59 +0200, Sergei Shtylyov <sshtylyov@mvista.c=
om> wrote:

> Hello.
>
> On 28-09-2010 5:31, Kukjin Kim wrote:
>
>> From: Changhwan Youn<chaos.youn@samsung.com>
>
>> It is reported by Junseok Jung that using clz instruction is
>> better instead of using for-loop to find the interrupt source.
>> This patch modifies interrupt source searching code using __fls().
>> The __fls() is implemented using clz instruction.
>
>> Suggested-by: Junseok Jung<jundols.jung@samsung.com>
>> Signed-off-by: Changhwan Youn<chaos.youn@samsung.com>
>> Signed-off-by: Kukjin Kim<kgene.kim@samsung.com>
>> ---
>>   arch/arm/mach-s5pv310/irq-combiner.c |    6 +-----
>>   1 files changed, 1 insertions(+), 5 deletions(-)
>
>> diff --git a/arch/arm/mach-s5pv310/irq-combiner.c b/arch/arm/mach-s5=
pv310/irq-combiner.c
>> index 0f70521..39e3647 100644
>> --- a/arch/arm/mach-s5pv310/irq-combiner.c
>> +++ b/arch/arm/mach-s5pv310/irq-combiner.c
>> @@ -66,11 +66,7 @@ static void combiner_handle_cascade_irq(unsigned =
int irq, struct irq_desc *desc)
>>   	if (status =3D=3D 0)
>>   		goto out;
>>
>> -	for (combiner_irq =3D 0; combiner_irq<  32; combiner_irq++) {
>> -		if (status & 0x1)
>> -			break;
>> -		status>>=3D 1;
>> -	}
>> +	combiner_irq =3D __fls(status);
>
>     But the loop finds the *first* set bit, not the last...

__ffs than?

--=20
Best regards,                                        _     _
| Humble Liege of Serenely Enlightened Majesty of  o' \,=3D./ `o
| Computer Science,  Micha=C5=82 "mina86" Nazarewicz       (o o)
+----[mina86*mina86.com]---[mina86*jabber.org]----ooO--(_)--Ooo--
