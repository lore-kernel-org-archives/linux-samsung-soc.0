From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 05/20] ARM: EXYNOS: Redefine IRQ_MCT_L0,1 definition
Date: Mon, 4 Jun 2012 13:26:35 +0530
Message-ID: <CAJuYYwRFzyzB8+VVt05NJyXBLju-2WHu1AxocK8jK2cZ=zFQHw@mail.gmail.com>
References: <1335813270-13083-1-git-send-email-thomas.abraham@linaro.org>
	<1335813270-13083-6-git-send-email-thomas.abraham@linaro.org>
	<CAH9JG2VwwXBWMvnK3ZYK37Gvsv9ORV7pqwM5rYtP-UEAxk_u-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:38361 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752823Ab2FDH4g convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jun 2012 03:56:36 -0400
Received: by wgbdr13 with SMTP id dr13so3800737wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Jun 2012 00:56:35 -0700 (PDT)
In-Reply-To: <CAH9JG2VwwXBWMvnK3ZYK37Gvsv9ORV7pqwM5rYtP-UEAxk_u-Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, Changhwan Youn <chaos.youn@samsung.com>, =?UTF-8?B?7LWc7LCs7Jqw?= <cw00.choi@samsung.com>

Dear Mr. Park,

On 27 May 2012 06:59, Kyungmin Park <kmpark@infradead.org> wrote:
> Hi,
>
> On Tue, May 1, 2012 at 4:14 AM, Thomas Abraham
> <thomas.abraham@linaro.org> wrote:
>> From: Changhwan Youn <chaos.youn@samsung.com>
>>
>> Redefine IRQ_MCT_L0,1 irq definition as it is changed in rev1 of EXY=
NOS5.
>>
>> Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>> ---
>> =A0arch/arm/mach-exynos/include/mach/irqs.h | =A0 =A04 ++--
>> =A0arch/arm/mach-exynos/mct.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 17 +=
++++++++++------
>> =A02 files changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/include/mach/irqs.h b/arch/arm/mac=
h-exynos/include/mach/irqs.h
>> index 591e7852..ef52f61 100644
>> --- a/arch/arm/mach-exynos/include/mach/irqs.h
>> +++ b/arch/arm/mach-exynos/include/mach/irqs.h
>> @@ -331,6 +331,8 @@
>> =A0#define EXYNOS5_IRQ_SATA =A0 =A0 =A0 =A0 =A0 =A0 =A0 IRQ_SPI(115)
>> =A0#define EXYNOS5_IRQ_NFCON =A0 =A0 =A0 =A0 =A0 =A0 =A0IRQ_SPI(116)
>>
>> +#define EXYNOS5_IRQ_MCT_L0 =A0 =A0 =A0 =A0 =A0 =A0 IRQ_SPI(120)
>> +#define EXYNOS5_IRQ_MCT_L1 =A0 =A0 =A0 =A0 =A0 =A0 IRQ_SPI(121)
>> =A0#define EXYNOS5_IRQ_MMC44 =A0 =A0 =A0 =A0 =A0 =A0 =A0IRQ_SPI(123)
>> =A0#define EXYNOS5_IRQ_MDMA1 =A0 =A0 =A0 =A0 =A0 =A0 =A0IRQ_SPI(124)
>> =A0#define EXYNOS5_IRQ_FIMC_LITE0 =A0 =A0 =A0 =A0 IRQ_SPI(125)
>> @@ -410,8 +412,6 @@
>> =A0#define EXYNOS5_IRQ_FIMD1_SYSTEM =A0 =A0 =A0 COMBINER_IRQ(18, 6)
>>
>> =A0#define EXYNOS5_IRQ_EINT0 =A0 =A0 =A0 =A0 =A0 =A0 =A0COMBINER_IRQ=
(23, 0)
>> -#define EXYNOS5_IRQ_MCT_L0 =A0 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(23,=
 1)
>> -#define EXYNOS5_IRQ_MCT_L1 =A0 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(23,=
 2)
>> =A0#define EXYNOS5_IRQ_MCT_G0 =A0 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(2=
3, 3)
>> =A0#define EXYNOS5_IRQ_MCT_G1 =A0 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(2=
3, 4)
>> =A0#define EXYNOS5_IRQ_MCT_G2 =A0 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(2=
3, 5)
>> diff --git a/arch/arm/mach-exynos/mct.c b/arch/arm/mach-exynos/mct.c
>> index 897d9a9..b601fb8 100644
>> --- a/arch/arm/mach-exynos/mct.c
>> +++ b/arch/arm/mach-exynos/mct.c
>> @@ -388,6 +388,7 @@ static int __cpuinit exynos4_local_timer_setup(s=
truct clock_event_device *evt)
>> =A0{
>> =A0 =A0 =A0 =A0struct mct_clock_event_device *mevt;
>> =A0 =A0 =A0 =A0unsigned int cpu =3D smp_processor_id();
>> + =A0 =A0 =A0 int mct_lx_irq;
>>
>> =A0 =A0 =A0 =A0mevt =3D this_cpu_ptr(&percpu_mct_tick);
>> =A0 =A0 =A0 =A0mevt->evt =3D evt;
>> @@ -414,14 +415,18 @@ static int __cpuinit exynos4_local_timer_setup=
(struct clock_event_device *evt)
>>
>> =A0 =A0 =A0 =A0if (mct_int_type =3D=3D MCT_INT_SPI) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (cpu =3D=3D 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mct_lx_irq =3D soc_is_=
exynos4210() ? EXYNOS4_IRQ_MCT_L0 :
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS5_IRQ_MCT_L0;
> Does it still valid for exynos4x12?. It means exynos4x12 uses
> EXYNOS5_IRQ_MCT_L0?

=46or Exynos4x12, PPI interrupts are used for the MCT local timer irqs
and hence the condition check "mct_int_type =3D=3D MCT_INT_SPI" above w=
ill
ensure that this code portion is skipped for Exynos4x12.

>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mct_tick0_event_irq.d=
ev_id =3D mevt;
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 evt->irq =3D EXYNOS4_I=
RQ_MCT_L0;
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 setup_irq(EXYNOS4_IRQ_=
MCT_L0, &mct_tick0_event_irq);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 evt->irq =3D mct_lx_ir=
q;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 setup_irq(mct_lx_irq, =
&mct_tick0_event_irq);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} else {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mct_lx_irq =3D soc_is_=
exynos4210() ? EXYNOS4_IRQ_MCT_L1 :
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS5_IRQ_MCT_L1;
> ditto
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mct_tick1_event_irq.d=
ev_id =3D mevt;
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 evt->irq =3D EXYNOS4_I=
RQ_MCT_L1;
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 setup_irq(EXYNOS4_IRQ_=
MCT_L1, &mct_tick1_event_irq);
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq_set_affinity(EXYNO=
S4_IRQ_MCT_L1, cpumask_of(1));
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 evt->irq =3D mct_lx_ir=
q;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 setup_irq(mct_lx_irq, =
&mct_tick1_event_irq);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq_set_affinity(mct_l=
x_irq, cpumask_of(1));
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>> =A0 =A0 =A0 =A0} else {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0enable_percpu_irq(EXYNOS_IRQ_MCT_LOCA=
LTIMER, 0);

This else portion is applicable for Exynos4x12 and uses PPI interrupts.

>> @@ -473,7 +478,7 @@ static void __init exynos4_timer_resources(void)
>>
>> =A0static void __init exynos4_timer_init(void)
>> =A0{
>> - =A0 =A0 =A0 if (soc_is_exynos4210())
>> + =A0 =A0 =A0 if ((soc_is_exynos4210()) || (soc_is_exynos5250()))
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mct_int_type =3D MCT_INT_SPI;
>> =A0 =A0 =A0 =A0else
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mct_int_type =3D MCT_INT_PPI;
>
> BTW exynos4x12 uses MCT_INT_PPI?

Yes, PPI interrupts are used for 4x12. The mct local timer irqs can be
routed to either combiner or PPI. Since routing via combiner incurs
overhead in demuxing the interrupt, PPI is used for mct local timer
irq.

Thanks,
Thomas.
