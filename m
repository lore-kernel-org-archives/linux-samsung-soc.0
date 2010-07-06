From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: S5P: Add PMU device
Date: Tue, 6 Jul 2010 09:50:52 +0900
Message-ID: <AANLkTik3WGvkUsvKHllgSlj9fJJy90y7L4me4tywCoE0@mail.gmail.com>
References: <1278294411-5104-1-git-send-email-jy0922.shim@samsung.com>
	<4C31C47C.1050905@gmail.com>
	<006c01cb1c41$a0af5c10$e20e1430$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:33174 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756752Ab0GFAux convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Jul 2010 20:50:53 -0400
Received: by pxi14 with SMTP id 14so1863492pxi.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jul 2010 17:50:52 -0700 (PDT)
In-Reply-To: <006c01cb1c41$a0af5c10$e20e1430$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Maurus Cuelenaere <mcuelenaere@gmail.com>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

On Mon, Jul 5, 2010 at 9:57 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> Maurus Cuelenaere wrote:
>>
>> =A0Op 05-07-10 03:46, Joonyoung Shim schreef:
>> > This patch adds an initcall for the s5p platforms so that they reg=
ister
>> > their PMU IRQs with the PMU framework in the Kernel.
>> >
>> > Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
>> > ---
>> > =A0arch/arm/mach-s5p6442/include/mach/irqs.h | =A0 =A02 +-
>> > =A0arch/arm/mach-s5pc100/include/mach/irqs.h | =A0 =A01 +
>> > =A0arch/arm/mach-s5pv210/include/mach/irqs.h | =A0 =A01 +
>> > =A0arch/arm/plat-s5p/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A01 +
>> > =A0arch/arm/plat-s5p/dev-pmu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 3=
7
>> +++++++++++++++++++++++++++++
>> > =A05 files changed, 41 insertions(+), 1 deletions(-)
>> > =A0create mode 100644 arch/arm/plat-s5p/dev-pmu.c
>>
>> Wouldn't it be better if this was in plat-samsung? I can see that th=
e S3C6410
>> datasheet mentions a PMU_IRQ_ENABLE bit in SYS_OTHERS so I suspect t=
hat it
>> has
>> the same functionality (even though there's no mention of which inte=
rrupt this
>> is).
>>
> Yes, I also found PMU_IRQ_ENABLE bit in System Others register of S3C=
6410 datasheet. But as your comments, could not found the interrupt num=
ber and any description...Actually, need to check whether it's availabl=
e or not.
>
> And S5P6440 has it.
> So Joonyoung, it would be helpful if you could add 6440 PMUIRQ (VIC1[=
23]) in this patch.

It's another story. Can you explain the difference between 6440 and 644=
2?
As I heard it's same chip and type is difference. If true, how about
to delete the 6442 directory?
It makes a single kernel simple.

Thank you,
Kyungmin Park


>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
