From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v2 6/6] ARM: EXYNOS4: Limit usage of pl330 device instance
 to non-dt build
Date: Thu, 8 Sep 2011 14:40:13 +0530
Message-ID: <CAJuYYwSB3f8BPQx1jgsSykKKMMGsbeCCj7zSLp2-+gtonBrdVw@mail.gmail.com>
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
Received: from mail-yw0-f46.google.com ([209.85.213.46]:64669 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932413Ab1IHJKO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Sep 2011 05:10:14 -0400
Received: by ywf7 with SMTP id 7so471932ywf.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Sep 2011 02:10:14 -0700 (PDT)
In-Reply-To: <001901cc6b8b$0f450730$2dcf1590$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, robherring2@gmail.com, vinod.koul@intel.com, patches@linaro.org, jassisinghbrar@gmail.com, boojin.kim@samsung.com

Dear Mr. Kim,

On 5 September 2011 10:47, Kukjin Kim <kgene.kim@samsung.com> wrote:
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
>
> If any problems, let me know.

While trying out your suggestion, I found a issue with this patch
related to compiling a kernel with both dt and non-dt board files
included in the build.

When compiling a single kernel image with mach-smdkv310.c file and
exynos4 device tree enabled machine file, since CONFIG_OF is enabled,
dma platform data does not get compiled which is required for
mach-smdkv310. So, I would like to resubmit this patch and the updated
diff is listed below. Could you please review the following diff.


diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kcon=
fig
index d4d401c..953ead7 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -21,6 +21,11 @@ config EXYNOS4_MCT
 	help
 	  Use MCT (Multi Core Timer) as kernel timers

+config EXYNOS4_DEV_DMA
+	bool
+	help
+	  Compile in amba device definitions for DMA controller
+
 config EXYNOS4_DEV_AHCI
 	bool
 	help
@@ -129,6 +134,7 @@ config MACH_SMDKC210
 	select EXYNOS4_SETUP_FIMD0
 	select EXYNOS4_SETUP_I2C1
 	select EXYNOS4_SETUP_SDHCI
+	select EXYNOS4_DEV_DMA
 	help
 	  Machine support for Samsung SMDKC210

@@ -153,6 +159,7 @@ config MACH_SMDKV310
 	select EXYNOS4_SETUP_I2C1
 	select EXYNOS4_SETUP_KEYPAD
 	select EXYNOS4_SETUP_SDHCI
+	select EXYNOS4_DEV_DMA
 	help
 	  Machine support for Samsung SMDKV310

@@ -191,6 +198,7 @@ config MACH_UNIVERSAL_C210
 	select EXYNOS4_SETUP_I2C3
 	select EXYNOS4_SETUP_I2C5
 	select EXYNOS4_SETUP_SDHCI
+	select EXYNOS4_DEV_DMA
 	help
 	  Machine support for Samsung Mobile Universal S5PC210 Reference
 	  Board.
@@ -215,6 +223,7 @@ config MACH_NURI
 	select EXYNOS4_SETUP_USB_PHY
 	select SAMSUNG_DEV_PWM
 	select SAMSUNG_DEV_ADC
+	select EXYNOS4_DEV_DMA
 	help
 	  Machine support for Samsung Mobile NURI Board.

diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-exynos4/Mak=
efile
index 929262a..a2f33dc 100644
--- a/arch/arm/mach-exynos4/Makefile
+++ b/arch/arm/mach-exynos4/Makefile
@@ -14,7 +14,8 @@ obj-				:=3D

 obj-$(CONFIG_CPU_EXYNOS4210)	+=3D cpu.o init.o clock.o irq-combiner.o
-obj-$(CONFIG_CPU_EXYNOS4210)	+=3D setup-i2c0.o irq-eint.o dma.o pmu.o
+obj-$(CONFIG_CPU_EXYNOS4210)	+=3D setup-i2c0.o irq-eint.o pmu.o
+obj-$(CONFIG_EXYNOS4_DEV_DMA)	+=3D dma.o
 obj-$(CONFIG_PM)		+=3D pm.o sleep.o
 obj-$(CONFIG_CPU_IDLE)		+=3D cpuidle.o



Thanks,
Thomas.
