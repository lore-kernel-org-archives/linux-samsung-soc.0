From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH v3 1/6] ARM: EXYNOS4: Increase NR_IRQS for devices with
 more IRQs
Date: Thu, 21 Jul 2011 14:43:10 +0900
Message-ID: <CAJ0PZbRez4KN+ZPvRsiWTQ8+aYTzpbRyKCQEACwGQcYqQUd_vg@mail.gmail.com>
References: <1309421729-11172-1-git-send-email-myungjoo.ham@samsung.com>
	<1309421729-11172-2-git-send-email-myungjoo.ham@samsung.com>
	<06c801cc46ff$29855330$7c8ff990$%kim@samsung.com>
Reply-To: myungjoo.ham@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f52.google.com ([209.85.161.52]:54825 "EHLO
	mail-fx0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750960Ab1GUFnM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jul 2011 01:43:12 -0400
Received: by fxd18 with SMTP id 18so2943401fxd.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2011 22:43:10 -0700 (PDT)
In-Reply-To: <06c801cc46ff$29855330$7c8ff990$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Changhwan Youn <chaos.youn@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, tushar.behera@linaro.org

On Thu, Jul 21, 2011 at 2:04 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> MyungJoo Ham wrote:
>>
>> MAX8997/17042, which are used by Exynos4-NURI, use additional IRQ
>> numbers after GPIO's IRQs. The patch creates some room for those
>> devices.
>>
>> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>> =C2=A0arch/arm/mach-exynos4/include/mach/irqs.h | =C2=A0 =C2=A02 +-
>> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos4/include/mach/irqs.h b/arch/arm/ma=
ch-
>> exynos4/include/mach/irqs.h
>> index 31f6bed..51b5db5 100644
>> --- a/arch/arm/mach-exynos4/include/mach/irqs.h
>> +++ b/arch/arm/mach-exynos4/include/mach/irqs.h
>> @@ -154,6 +154,6 @@
>> =C2=A0#define IRQ_GPIO_END =C2=A0 =C2=A0 =C2=A0 =C2=A0 (S5P_GPIOINT_=
BASE + S5P_GPIOINT_COUNT)
>>
>> =C2=A0/* Set the default NR_IRQS */
>> -#define NR_IRQS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(IRQ_GPIO_END)
>> +#define NR_IRQS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(IRQ_GPIO_END + 64)
>
> I applied but basically, we have to avoid using hard coded value like=
 64 on
> this. The NR_IRQS depends on CPU not board but this change is needed =
for
> supporting some specific board and if you need more interrupt numbers=
, will
> you increase it? It is not good way.
>
> We need to fix this up next time.
>
> Thanks.

OK.. Then, what about using "CONFIG_SPARSE_IRQ" and
"irq_alloc_descs()" at board files?

As long as NR_IRQS is large enough to cover all combiners
(IRQ_GPIO_END is large enough in that sense), it appears to be fine
for us (and tested to be ok).


Thank you.
- MyungJoo

>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>



--=20
MyungJoo Ham (=ED=95=A8=EB=AA=85=EC=A3=BC), Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
