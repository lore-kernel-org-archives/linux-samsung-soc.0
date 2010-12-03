From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH 1/4] mach-s5pv210: Add platform definitions for mipi-csis
Date: Fri, 3 Dec 2010 14:30:43 +0900
Message-ID: <AANLkTi=bARGdX2Y4Ea-YP8qQRcjAXme8NW9Mp-0dTxgZ@mail.gmail.com>
References: <1291307862-8125-1-git-send-email-s.nawrocki@samsung.com>
	<1291307862-8125-2-git-send-email-s.nawrocki@samsung.com>
	<012301cb92a1$a7020af0$f50620d0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:62844 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750709Ab0LCFap convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Dec 2010 00:30:45 -0500
Received: by gwj20 with SMTP id 20so4585432gwj.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Dec 2010 21:30:44 -0800 (PST)
In-Reply-To: <012301cb92a1$a7020af0$f50620d0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, m.szyprowski@samsung.com

On Fri, Dec 3, 2010 at 1:22 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> Sylwester Nawrocki wrote:
>>
>> Added resource definitions for mipi-csis interface, naming
>> changed for consistency with s5pv310 where there are two
>> instances of the device.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>> =A0arch/arm/mach-s5pv210/include/mach/irqs.h =A0 =A0 =A0 | =A0 =A02 =
+-
>> =A0arch/arm/mach-s5pv210/include/mach/map.h =A0 =A0 =A0 =A0| =A0 =A0=
4 ++++
>> =A0arch/arm/mach-s5pv210/include/mach/regs-clock.h | =A0 =A05 +----
>> =A03 files changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/arm/mach-s5pv210/include/mach/irqs.h b/arch/arm/ma=
ch-
>> s5pv210/include/mach/irqs.h
>> index 119b95f..8b5994c 100644
>> --- a/arch/arm/mach-s5pv210/include/mach/irqs.h
>> +++ b/arch/arm/mach-s5pv210/include/mach/irqs.h
>> @@ -65,7 +65,7 @@
>> =A0#define IRQ_HSMMC0 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC1(26)
>> =A0#define IRQ_HSMMC1 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC1(27)
>> =A0#define IRQ_HSMMC2 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC1(28)
>> -#define IRQ_MIPICSI =A0 =A0 =A0 =A0 =A0S5P_IRQ_VIC1(29)
>> +#define IRQ_MIPICSI0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC1(29)
>
> Firstly don't use directly IRQ_MIPICSI0 which is used in platform dev=
ice.
> Because it can be confused that there would be another MIPICSI such a=
s
> MIPICSI1.
> In that case, just use like following. For example,
Hi,

=46irst respect others work.
my impression is that you forced the developers to work as you want.

okay who summit this code? If you think name is odd, then you check it
before you submitted.
When you commit the code is okay, but other should be considered as you=
rs.

>
> ---
> @@ -132,5 +132,6 @@
> =A0#define IRQ_LCD_FIFO =A0 =A0 =A0 =A0 =A0 IRQ_LCD0
> =A0#define IRQ_LCD_VSYNC =A0 =A0 =A0 =A0 =A0IRQ_LCD1
> =A0#define IRQ_LCD_SYSTEM =A0 =A0 =A0 =A0 IRQ_LCD2
> +#define IRQ_MIPI_CSIS0 =A0 =A0 =A0 =A0 IRQ_MIPICSI
>
> =A0#endif /* ASM_ARCH_IRQS_H */
> ---
>
> And I'm confused about the name of MIPI-CSI...
> Hmm...used MIPICSI or MIPI_CSI, sometimes MIPICSIS or MIPI_CSIS.
>
> Maybe the meaning is Camera Serial Interface Slave...
> So...how about to use just one such as "IRQ_MIPI_CSIS" and
> "S5PV210_PA_MIPI_CSIS".

I think it's better use the common word, CSI. I can't find CSIS word
at googling.

>
> ---
> @@ -65,7 +65,7 @@
> =A0#define IRQ_HSMMC0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC1(26)
> =A0#define IRQ_HSMMC1 =A0 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC1(27)
> =A0#define IRQ_HSMMC2 =A0 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC1(28)
> -#define IRQ_MIPICSI =A0 =A0 =A0 =A0 =A0 =A0S5P_IRQ_VIC1(29)
> +#define IRQ_MIPI_CSIS =A0 =A0 =A0 =A0 =A0S5P_IRQ_VIC1(29)
> =A0#define IRQ_MIPIDSI =A0 =A0 =A0 =A0 =A0 =A0S5P_IRQ_VIC1(30)
> =A0#define IRQ_ONENAND_AUDI =A0 =A0 =A0 S5P_IRQ_VIC1(31)
>
> @@ -132,5 +132,6 @@
> =A0#define IRQ_LCD_FIFO =A0 =A0 =A0 =A0 =A0 IRQ_LCD0
> =A0#define IRQ_LCD_VSYNC =A0 =A0 =A0 =A0 =A0IRQ_LCD1
> =A0#define IRQ_LCD_SYSTEM =A0 =A0 =A0 =A0 IRQ_LCD2
> +#define IRQ_MIPI_CSIS0 =A0 =A0 =A0 =A0 IRQ_MIPI_CSIS

In this case, I can't find any good reason since it's first used.
as s3c series used the different names compare to s5p series. it's
okay make these wrapper.
but it's new one and not used previous time.

Thank you,
Kyungmin Park
>
> =A0#endif /* ASM_ARCH_IRQS_H */
> ---
>
>> =A0#define IRQ_MIPIDSI =A0 =A0 =A0 =A0 =A0S5P_IRQ_VIC1(30)
>> =A0#define IRQ_ONENAND_AUDI =A0 =A0 S5P_IRQ_VIC1(31)
>>
>> diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mac=
h-
>> s5pv210/include/mach/map.h
>> index 861d7fe..8f376f1 100644
>> --- a/arch/arm/mach-s5pv210/include/mach/map.h
>> +++ b/arch/arm/mach-s5pv210/include/mach/map.h
>> @@ -107,6 +107,9 @@
>> =A0#define S5PV210_PA_DMC0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF0000000)
>> =A0#define S5PV210_PA_DMC1 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF1400000)
>>
>> +/* MIPI CSI */
>
> No need comment.
>
>> +#define S5PV210_PA_CSIS =A0 =A0 =A0 =A0 =A0 =A0 =A00xFA600000
>> +
>> =A0/* compatibiltiy defines. */
>> =A0#define S3C_PA_UART =A0 =A0 =A0 =A0 =A0S5PV210_PA_UART
>> =A0#define S3C_PA_HSMMC0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV210_PA_H=
SMMC(0)
>> @@ -123,6 +126,7 @@
>> =A0#define S5P_PA_FIMC0 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC0
>> =A0#define S5P_PA_FIMC1 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC1
>> =A0#define S5P_PA_FIMC2 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC2
>> +#define S5P_PA_CSIS0 =A0 =A0 =A0 =A0 S5PV210_PA_CSIS
>>
> Same as above.
>
>> =A0#define SAMSUNG_PA_ADC =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_ADC
>> =A0#define SAMSUNG_PA_CFCON =A0 =A0 S5PV210_PA_CFCON
>> diff --git a/arch/arm/mach-s5pv210/include/mach/regs-clock.h
> b/arch/arm/mach-
>> s5pv210/include/mach/regs-clock.h
>> index ebaabe0..4c45b74 100644
>> --- a/arch/arm/mach-s5pv210/include/mach/regs-clock.h
>> +++ b/arch/arm/mach-s5pv210/include/mach/regs-clock.h
>> @@ -161,7 +161,7 @@
>> =A0#define S5P_MDNIE_SEL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKREG(0=
x7008)
>> =A0#define S5P_MIPI_PHY_CON0 =A0 =A0S5P_CLKREG(0x7200)
>> =A0#define S5P_MIPI_PHY_CON1 =A0 =A0S5P_CLKREG(0x7204)
>> -#define S5P_MIPI_CONTROL =A0 =A0 S5P_CLKREG(0xE814)
>> +#define S5P_MIPI_DPHY_CONTROL =A0 =A0 =A0 =A0S5P_CLKREG(0xE814)
>>
>> =A0#define S5P_IDLE_CFG_TL_MASK (3 << 30)
>> =A0#define S5P_IDLE_CFG_TM_MASK (3 << 28)
>> @@ -195,9 +195,6 @@
>> =A0#define S5P_OTHERS_RET_UART =A0 =A0 =A0 =A0 =A0(1 << 28)
>> =A0#define S5P_OTHERS_USB_SIG_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 << =
16)
>>
>> -/* MIPI */
>> -#define S5P_MIPI_DPHY_EN =A0 =A0 =A0 =A0 =A0 =A0 (3)
>> -
>
> Great.
>
>> =A0/* S5P_DAC_CONTROL */
>> =A0#define S5P_DAC_ENABLE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 (1)
>> =A0#define S5P_DAC_DISABLE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
(0)
>> --
>
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
