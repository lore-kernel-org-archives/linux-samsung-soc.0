From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v2 2/5] ARM: S5P: Added default pll values for APLL
	800/1000MHz
Date: Sat, 17 Jul 2010 13:09:27 +0900
Message-ID: <AANLkTinyx2Abgda7L-Z0XDeuftNv4tOPQ5HMdSsp6yUd@mail.gmail.com>
References: <1279267277-6804-1-git-send-email-myungjoo.ham@samsung.com>
	<1279267277-6804-2-git-send-email-myungjoo.ham@samsung.com>
	<1279267277-6804-3-git-send-email-myungjoo.ham@samsung.com>
	<012f01cb24e1$85628920$90279b60$%kim@samsung.com>
	<AANLkTil5v3ypu0hZdzVmFCG7MsjQzTKPNgMtJQ-M6MHj@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:55028 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750699Ab0GQEJ2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 17 Jul 2010 00:09:28 -0400
Received: by pzk26 with SMTP id 26so853416pzk.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jul 2010 21:09:27 -0700 (PDT)
In-Reply-To: <AANLkTil5v3ypu0hZdzVmFCG7MsjQzTKPNgMtJQ-M6MHj@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, linux-arm-kernel@lists.infradead.org, myungjoo.ham@gmail.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

On Sat, Jul 17, 2010 at 12:43 PM, Jassi Brar <jassisinghbrar@gmail.com>=
 wrote:
> On Fri, Jul 16, 2010 at 9:22 PM, Kukjin Kim <kgene.kim@samsung.com> w=
rote:
>> MyungJoo Ham wrote:
>>>
>>> CPUFREQ of S5PV210 uses different APLL settings and we provide
>>> such values for CPUFREQ at pll.h. We have been using differently
>>> between EVT0 and EVT1 machines. Although this version of kernel
>>> assumes that the CPU is EVT1, users may use code for EVT0 later.
>>>
>>> Note that at 1GHz of ARMCLK, APLL should be 1GHz and for other lowe=
r
>>> ARMCLK, APLL should be 800MHz.
>>>
>>> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
>>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>>> ---
>>> =A0arch/arm/plat-s5p/include/plat/pll.h | =A0 =A08 ++++++++
>>> =A01 files changed, 8 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/arch/arm/plat-s5p/include/plat/pll.h
>> b/arch/arm/plat-s5p/include/plat/pll.h
>>> index 7db3227..3112aba 100644
>>> --- a/arch/arm/plat-s5p/include/plat/pll.h
>>> +++ b/arch/arm/plat-s5p/include/plat/pll.h
>>> @@ -21,6 +21,14 @@
>>>
>>> =A0#include <asm/div64.h>
>>>
>>> +#ifdef CONFIG_CPU_S5PC110_EVT0_ERRATA
>>
>> Actually, EVT0 is not real chip and not for mass production.
>> So don't use in here.
>
> That was my point in a thread few days ago when I suggested we
> be careful while pushing code upstream.
> Rather than flood mainline Samsung support with any hardware
> we can get our hands on, we need to strategically select
> SoCs (& their versions) and machines so that we have maximum
> overlap of features and, equally important, _users_ of that code.
> That will help us concentrate our efforts on support needed by most
> of the users and devices.

That's point of view from chip vendor. but in my side we made a
product using all chips from evt0, evt1, and fused evt1.
Some product used the evt0 chip already.

I don't say LSI need to support early chip. you focus on the your selec=
ted SoC.
The remaining will be done by us.

Thank you,
Kyungmin Park

> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
