From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH v3 2/8] ARM: S5PV310: Add new CPU initialization support
Date: Thu, 22 Jul 2010 11:49:36 +0900
Message-ID: <AANLkTimqDeC4eR-ds3cAuevj24YKLlr1G0RigA3UBjem@mail.gmail.com>
References: <1279627861-23047-1-git-send-email-kgene.kim@samsung.com>
	<AANLkTikYjSIZzT-WHpAYbaHC1R9DU2T89qUVoAYASEZv@mail.gmail.com>
	<009701cb28d4$0ead3040$2c0790c0$%kim@samsung.com>
	<AANLkTimQqAKUlCXgRFMWMvI_zVXlHJOFCx3c3lrU5kpP@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:59482 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751125Ab0GVCth convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Jul 2010 22:49:37 -0400
Received: by gyg10 with SMTP id 10so306801gyg.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Jul 2010 19:49:36 -0700 (PDT)
In-Reply-To: <AANLkTimQqAKUlCXgRFMWMvI_zVXlHJOFCx3c3lrU5kpP@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Changhwan Youn <chaos.youn@samsung.com>, Jongpill Lee <boyko.lee@samsung.com>, Jiseong Oh <jiseong.oh@samsung.com>

On Wed, Jul 21, 2010 at 10:29 PM, Kyungmin Park <kmpark@infradead.org> =
wrote:
> On Wed, Jul 21, 2010 at 9:55 PM, Kukjin Kim <kgene.kim@samsung.com> w=
rote:
>> Kyungmin Park wrote:
>>>
>>> On Tue, Jul 20, 2010 at 9:11 PM, Kukjin Kim <kgene.kim@samsung.com>=
 wrote:
>>> > From: Changhwan Youn <chaos.youn@samsung.com>
>>> >
>>> > This patch adds Samsung S5PV310/S5PC210 CPU support.
>>> > The S5PV310/S5PC210 integrates a ARM Cortex A9 multi-core.
>>> >
>>> > Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
>>> > Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
>>> > Signed-off-by: Jiseong Oh <jiseong.oh@samsung.com>
>>> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>>> > ---
>>> > Changes since v2:
>>> > - Re-model platsmp.c on the Versatile Express as per Russell King=
's
>> suggestion.
>>> > =A0And tested on the board.
>>> >
>>> > - Compared Versatile Express SMP code with Realview SMP code and
>> modified
>>> as needed.
>>> >
>>
>> Hi,
>>
>> (snip)
>>
>>> > +static void arch_detect_cpu(void)
>>> > +{
>>> > + =A0 =A0 =A0 /* we do not need to do any cpu detection here at t=
he moment. */
>>> > +
>>> > + =A0 =A0 =A0 fifo_mask =3D S5PV210_UFSTAT_TXMASK;
>>> > + =A0 =A0 =A0 fifo_max =3D 63 << S5PV210_UFSTAT_TXSHIFT;
>>>
>>> It's only valid when use the UART1. others 255 for UART0, 15 for ot=
hers.
>>
>> Ok..will fix it.
>>
>> (snip)
>>
>>> > +#define VMALLOC_END =A0 =A0 =A0(0xE0000000)
>>>
>>> Increase to 0xF000'0000. but it will be removed from Eric's patch.
>>>
>> Right now, the 0xE0000000 is no problem as default.
>> But I will check this is appropriate again.
> Since maybe you use the 2g/2g configuration. try to use the 3g/1g
> configuration with more the 512MiB.
>
>>
>> And according to his '[PATCH 08/13] [ARM] Make VMALLOC_END into a gl=
obal
>> variable if not defined',
>> it doesn't mean absolutely remove it. why did you say like that.
>>
>> +#ifndef VMALLOC_END
>> +extern unsigned long vmalloc_end;
>> +#define VMALLOC_END (vmalloc_end)
>> +#endif

It's intermediate patch, after merge, I or he will remove the global
VMALLOC_END and define it each boards.
At that case smdk use the 0xe000'0000 but aquila/goni will use the 0xf0=
00'0000.
>> +
>>
>> And if required modify it for some machine, you can do it later with
>> mach_desc after applying Eric's patch.
Why do  the work twice?

>> Or as Russell said, there is the way to do it is to specify a vmallo=
c=3D
>> parameter to the kernel.

Do you define the decreased vmalloc usage? android binder use the
vmalloc 1MiB at normal case.
If you decrease the vmalloc size, you only launch lower applications
even though there's enough system memory.

>
> I don't have confidence with HIGHMEM with VIPT (it's same as PIPT).
> So I want to use lowmem if possible,
>
>>
>> (snip)
>>
>>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
>>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Write the address of secondary=
 startup into the
>>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* system-wide flags register. Th=
e boot monitor waits
>>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* until it receives a soft inter=
rupt, and then the
>>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* secondary CPU branches to this=
 address.
>>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
>>> > + =A0 =A0 =A0 __raw_writel(BSYM(virt_to_phys(s5pv310_secondary_st=
artup)),
>>> S5P_INFORM0);
>>>
>>> Do you really use the INFORM0? historically it's used for sleep &
>>> wakeup. new SoC has several INFORM register. So I recommend to use
>>> others.
>>>
>>
>> It doesn't mean we should use INFORM0 for sleep & wakeup even though
>> historically used.
>> ...I mean it doesn't matter and as you know, just need to sync with
>> boot-loader for it.
> that's reason I said, we got unused INFORM{3,4,5,...} so if we use it=
,
> no problem.
>>
>> (snip)
>>
>>> > +void s3c_i2c0_cfg_gpio(struct platform_device *dev)
>>> > +{
>>> > +/* will be implemented later */
>>> > +}
>>>
>>> Remove it and send separate patch. e.g.,I2C support on s5pc210.
>>>
>> I think i2c0 is un-conditionally compiled. So need to add i2c0 suppo=
rt in
>> here.
> It mean all samsung SoC have i2c0. okay if you want it.
>>
>> (snip)
>>
>>> > +#define S5P_VA_COREPERI_BASE =A0 S3C_ADDR(0x00800000)
>>> > +#define S5P_VA_COREPERI(x) =A0 =A0 (S5P_VA_COREPERI_BASE + (x))
>>> > +#define S5P_VA_SCU =A0 =A0 =A0 =A0 =A0 =A0 S5P_VA_COREPERI(0x0)
>>> > +#define S5P_VA_GIC_CPU =A0 =A0 =A0 =A0 S5P_VA_COREPERI(0x100)
>>> > +#define S5P_VA_TWD =A0 =A0 =A0 =A0 =A0 =A0 S5P_VA_COREPERI(0x600=
)
>>> > +#define S5P_VA_GIC_DIST =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_VA_CO=
REPERI(0x1000)
>>> > +
>>> > +#define S5P_VA_L2CC =A0 =A0 =A0 =A0 =A0 =A0S3C_ADDR(0x00900000)
>>>
>>> I'm not sure it's proper prefix.
>>>
>> It's no problem.
>>
>> (snip)
>>
>>
>> Thanks.
>>
>> Best regards,
>> Kgene.
>> --
>> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
>> SW Solution Development Team, Samsung Electronics Co., Ltd.
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-sams=
ung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>
