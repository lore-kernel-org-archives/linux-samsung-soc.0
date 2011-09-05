From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v2 6/6] ARM: EXYNOS4: Limit usage of pl330 device instance
 to non-dt build
Date: Mon, 5 Sep 2011 15:44:36 +0530
Message-ID: <CAJuYYwQ5eC-OXQv9t1hw6WOs1oJfYQLvzy8nwe5JZS=pBwy5ZA@mail.gmail.com>
References: <1314867882-11755-1-git-send-email-thomas.abraham@linaro.org>
	<1314867882-11755-2-git-send-email-thomas.abraham@linaro.org>
	<1314867882-11755-3-git-send-email-thomas.abraham@linaro.org>
	<1314867882-11755-4-git-send-email-thomas.abraham@linaro.org>
	<1314867882-11755-5-git-send-email-thomas.abraham@linaro.org>
	<1314867882-11755-6-git-send-email-thomas.abraham@linaro.org>
	<1314867882-11755-7-git-send-email-thomas.abraham@linaro.org>
	<001901cc6b8b$0f450730$2dcf1590$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:40657 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752182Ab1IEKOh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Sep 2011 06:14:37 -0400
Received: by ywf7 with SMTP id 7so3264167ywf.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Sep 2011 03:14:37 -0700 (PDT)
In-Reply-To: <001901cc6b8b$0f450730$2dcf1590$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, robherring2@gmail.com, vinod.koul@intel.com, patches@linaro.org, jassisinghbrar@gmail.com, boojin.kim@samsung.com

Dear Mr. Kim,

On 5 September 2011 10:47, Kukjin Kim <kgene.kim@samsung.com> wrote:
>> -----Original Message-----
>> From: Thomas Abraham [mailto:thomas.abraham@linaro.org]
>> Sent: Thursday, September 01, 2011 6:05 PM
>> To: devicetree-discuss@lists.ozlabs.org
>> Cc: grant.likely@secretlab.ca; linux-arm-kernel@lists.infradead.org;
> linux-samsung-
>> soc@vger.kernel.org; kgene.kim@samsung.com; robherring2@gmail.com;
>> vinod.koul@intel.com; patches@linaro.org; jassisinghbrar@gmail.com;
>> boojin.kim@samsung.com
>> Subject: [PATCH v2 6/6] ARM: EXYNOS4: Limit usage of pl330 device in=
stance
> to
>> non-dt build
>>
>> The pl330 device instances and associated platform data is required =
only
>> for non-device-tree builds. With device tree, all of this informatio=
n is
>> obtained from the device tree.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> =A0arch/arm/mach-exynos4/Kconfig =A0| =A0 =A07 +++++++
>> =A0arch/arm/mach-exynos4/Makefile | =A0 =A03 ++-
>> =A02 files changed, 9 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/K=
config
>> index d4d401c..3edbf37 100644
>> --- a/arch/arm/mach-exynos4/Kconfig
>> +++ b/arch/arm/mach-exynos4/Kconfig
>> @@ -21,6 +21,13 @@ config EXYNOS4_MCT
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Use MCT (Multi Core Timer) as kernel timers
>>
>> +config EXYNOS4_DEV_DMA
>> + =A0 =A0 bool
>> + =A0 =A0 default y if !OF
>> + =A0 =A0 help
>> + =A0 =A0 =A0 Compile in amba device definitions for DMA controller =
if OF
>> + =A0 =A0 =A0 is not enabled.
>> +
>> =A0config EXYNOS4_DEV_AHCI
>> =A0 =A0 =A0 bool
>> =A0 =A0 =A0 help
>> diff --git a/arch/arm/mach-exynos4/Makefile
> b/arch/arm/mach-exynos4/Makefile
>> index d2bf5bf..a2f33dc 100644
>> --- a/arch/arm/mach-exynos4/Makefile
>> +++ b/arch/arm/mach-exynos4/Makefile
>> @@ -13,7 +13,8 @@ obj- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0:=3D
>> =A0# Core support for EXYNOS4 system
>>
>> =A0obj-$(CONFIG_CPU_EXYNOS4210) +=3D cpu.o init.o clock.o irq-combin=
er.o
>> -obj-$(CONFIG_CPU_EXYNOS4210) +=3D setup-i2c0.o irq-eint.o dma.o
>> pmu.o
>> +obj-$(CONFIG_CPU_EXYNOS4210) +=3D setup-i2c0.o irq-eint.o pmu.o
>> +obj-$(CONFIG_EXYNOS4_DEV_DMA) =A0 =A0 =A0 =A0+=3D dma.o
>
> Do we need _really_ EXYNOS4_DEV_DMA here?
> How about to use like following?
>
> +obj-$(!CONFIG_OF) =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D dma.o

Thanks for the suggestion. I will try it and resubmit the patch.

Thanks,
Thomas.

>
> If any problems, let me know.
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
>> =A0obj-$(CONFIG_PM) =A0 =A0 =A0 =A0 =A0 =A0 +=3D pm.o sleep.o
>> =A0obj-$(CONFIG_CPU_IDLE) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D cpuidle.o
>>
>> --
>> 1.6.6.rc2
>
>
