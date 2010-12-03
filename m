From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH 2/4] mach-s5pv310: Add resource definitions for mipi-csis
Date: Fri, 3 Dec 2010 14:34:23 +0900
Message-ID: <AANLkTiksQM8V9QeF+P2qvCQ1uOgcq-yzKp-kgnPVmMsJ@mail.gmail.com>
References: <1291307862-8125-1-git-send-email-s.nawrocki@samsung.com>
	<1291307862-8125-3-git-send-email-s.nawrocki@samsung.com>
	<012401cb92a3$a46443b0$ed2ccb10$%kim@samsung.com>
	<AANLkTimEEf5eD+q-qx7gw21ryFp1bbQ084Lo=eX+Bqjz@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:43336 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750709Ab0LCFeY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Dec 2010 00:34:24 -0500
Received: by ywl5 with SMTP id 5so4581593ywl.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Dec 2010 21:34:23 -0800 (PST)
In-Reply-To: <AANLkTimEEf5eD+q-qx7gw21ryFp1bbQ084Lo=eX+Bqjz@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, m.szyprowski@samsung.com

On Fri, Dec 3, 2010 at 1:59 PM, Jassi Brar <jassisinghbrar@gmail.com> w=
rote:
> On Fri, Dec 3, 2010 at 1:36 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
>> Sylwester Nawrocki wrote:
>>>
>>> Add IRQ and register base address definitions for mipi-csis devices=
=2E
>>>
>>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>>> ---
>>> =A0arch/arm/mach-s5pv310/include/mach/irqs.h | =A0 =A03 +++
>>> =A0arch/arm/mach-s5pv310/include/mach/map.h =A0| =A0 =A05 +++++
>>> =A02 files changed, 8 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/arch/arm/mach-s5pv310/include/mach/irqs.h b/arch/arm/m=
ach-
>>> s5pv310/include/mach/irqs.h
>>> index 99e7dad..db63773 100644
>>> --- a/arch/arm/mach-s5pv310/include/mach/irqs.h
>>> +++ b/arch/arm/mach-s5pv310/include/mach/irqs.h
>>> @@ -83,6 +83,9 @@
>>> =A0#define IRQ_HSMMC2 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(29, 2)
>>> =A0#define IRQ_HSMMC3 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(29, 3)
>>>
>>> +#define IRQ_MIPICSI0 =A0 =A0 =A0 =A0 COMBINER_IRQ(30, 0)
>>> +#define IRQ_MIPICSI1 =A0 =A0 =A0 =A0 COMBINER_IRQ(30, 1)
>>> +
>>> =A0#define IRQ_ONENAND_AUDI =A0 =A0 COMBINER_IRQ(34, 0)
>>>
>>> =A0#define IRQ_EINT4 =A0 =A0 =A0 =A0 =A0 =A0COMBINER_IRQ(37, 0)
>>> diff --git a/arch/arm/mach-s5pv310/include/mach/map.h b/arch/arm/ma=
ch-
>>> s5pv310/include/mach/map.h
>>> index 7acf4e7..9905bfe 100644
>>> --- a/arch/arm/mach-s5pv310/include/mach/map.h
>>> +++ b/arch/arm/mach-s5pv310/include/mach/map.h
>>> @@ -56,6 +56,9 @@
>>> =A0#define S5PV310_PA_GPIO2 =A0 =A0 =A0 =A0 =A0 =A0 (0x11000000)
>>> =A0#define S5PV310_PA_GPIO3 =A0 =A0 =A0 =A0 =A0 =A0 (0x03860000)
>>>
>>> +#define S5PV310_PA_CSIS0 =A0 =A0 =A0 =A0 =A0 =A0 (0x11880000)
>>> +#define S5PV310_PA_CSIS1 =A0 =A0 =A0 =A0 =A0 =A0 (0x11890000)
>
> Let us please not contain constants in brackets.

I think consistency is more higher than your comment normally.

if you think these, then make a cleanup first.

> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
