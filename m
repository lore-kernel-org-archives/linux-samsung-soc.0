From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 2/4] mach-s5pv310: Add resource definitions for mipi-csis
Date: Fri, 3 Dec 2010 13:59:34 +0900
Message-ID: <AANLkTimEEf5eD+q-qx7gw21ryFp1bbQ084Lo=eX+Bqjz@mail.gmail.com>
References: <1291307862-8125-1-git-send-email-s.nawrocki@samsung.com>
	<1291307862-8125-3-git-send-email-s.nawrocki@samsung.com>
	<012401cb92a3$a46443b0$ed2ccb10$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:59508 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758416Ab0LCE7j convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Dec 2010 23:59:39 -0500
Received: by bwz15 with SMTP id 15so7982969bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Dec 2010 20:59:37 -0800 (PST)
In-Reply-To: <012401cb92a3$a46443b0$ed2ccb10$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com

On Fri, Dec 3, 2010 at 1:36 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> Sylwester Nawrocki wrote:
>>
>> Add IRQ and register base address definitions for mipi-csis devices.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>> =C2=A0arch/arm/mach-s5pv310/include/mach/irqs.h | =C2=A0 =C2=A03 +++
>> =C2=A0arch/arm/mach-s5pv310/include/mach/map.h =C2=A0| =C2=A0 =C2=A0=
5 +++++
>> =C2=A02 files changed, 8 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-s5pv310/include/mach/irqs.h b/arch/arm/ma=
ch-
>> s5pv310/include/mach/irqs.h
>> index 99e7dad..db63773 100644
>> --- a/arch/arm/mach-s5pv310/include/mach/irqs.h
>> +++ b/arch/arm/mach-s5pv310/include/mach/irqs.h
>> @@ -83,6 +83,9 @@
>> =C2=A0#define IRQ_HSMMC2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 COMBINER=
_IRQ(29, 2)
>> =C2=A0#define IRQ_HSMMC3 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 COMBINER=
_IRQ(29, 3)
>>
>> +#define IRQ_MIPICSI0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 COMBINER_IRQ(30, 0=
)
>> +#define IRQ_MIPICSI1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 COMBINER_IRQ(30, 1=
)
>> +
>> =C2=A0#define IRQ_ONENAND_AUDI =C2=A0 =C2=A0 COMBINER_IRQ(34, 0)
>>
>> =C2=A0#define IRQ_EINT4 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0COM=
BINER_IRQ(37, 0)
>> diff --git a/arch/arm/mach-s5pv310/include/mach/map.h b/arch/arm/mac=
h-
>> s5pv310/include/mach/map.h
>> index 7acf4e7..9905bfe 100644
>> --- a/arch/arm/mach-s5pv310/include/mach/map.h
>> +++ b/arch/arm/mach-s5pv310/include/mach/map.h
>> @@ -56,6 +56,9 @@
>> =C2=A0#define S5PV310_PA_GPIO2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (0x11000000)
>> =C2=A0#define S5PV310_PA_GPIO3 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (0x03860000)
>>
>> +#define S5PV310_PA_CSIS0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
(0x11880000)
>> +#define S5PV310_PA_CSIS1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
(0x11890000)

Let us please not contain constants in brackets.
