From: Shaik Ameer Basha <shaik.samsung@gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: EXYNOS: Add Gscaler device from DT
Date: Wed, 1 Aug 2012 12:40:19 +0530
Message-ID: <CAOD6ATqCbwKH5F2=CmZ_SZHRewS1qbvjWdvF+0hp64MnBJd4fQ@mail.gmail.com>
References: <1342789723-3949-1-git-send-email-shaik.ameer@samsung.com>
	<1342789723-3949-3-git-send-email-shaik.ameer@samsung.com>
	<033301cd6fb0$7ac4af90$704e0eb0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:41211 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751578Ab2HAHKU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Aug 2012 03:10:20 -0400
Received: by vbbff1 with SMTP id ff1so6658448vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Aug 2012 00:10:19 -0700 (PDT)
In-Reply-To: <033301cd6fb0$7ac4af90$704e0eb0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Shaik Ameer Basha <shaik.ameer@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, sy0816.kang@samsung.com, olofj@google.com, thomas.ab@samsung.com, sylvester.nawrocki@gmail.com, sachin.kamat@linaro.org, joshi@samsung.com

Hi Kukjin Kim,


On Wed, Aug 1, 2012 at 12:10 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Shaik Ameer Basha wrote:
>>
>> This patch adds,
>> - 4 Gscaler devices to the DT device list
>> - Gscaler specific entries to the machine file
>> - binding documentation for Gscaler entries
>>
>> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
>> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
>> Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
>> ---
>>  .../devicetree/bindings/media/exynos5-gsc.txt      |   32
>> ++++++++++++++++++++
>>  arch/arm/boot/dts/exynos5250.dtsi                  |   28
> +++++++++++++++++
>>  arch/arm/mach-exynos/include/mach/map.h            |    3 ++
>>  arch/arm/mach-exynos/mach-exynos5-dt.c             |    8 +++++
>>  4 files changed, 71 insertions(+), 0 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/media/exynos5-
>> gsc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/media/exynos5-gsc.txt
>> b/Documentation/devicetree/bindings/media/exynos5-gsc.txt
>> new file mode 100644
>> index 0000000..1cb4ea0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/exynos5-gsc.txt
>> @@ -0,0 +1,32 @@
>> +* Samsung Exynos5 Gscaler device
>> +
>> +Gscaler is used for scaling and color space conversion on EXYNOS5 SoCs.
>> +
>> +Required properties:
>> +- compatible: should be "samsung,exynos5250-gsc"
>
> IMO, should be "samsung,exynos5-gsc" because upcoming EXYNOS5 SoCs can use
> same gscaler driver.
>

yes. thats true. i will change that.

>> +- reg: should contain Gscaler physical address location and length.
>> +- interrupts: should contain Gscaler interrupt number
>> +
>> +Example:
>> +
>> +gsc_0:  gsc@0x13e00000 {
>> +     compatible = "samsung,exynos5250-gsc";
>
> +       compatible = "samsung,exynos5-gsc";
>

ok. will update this accordingly.

>> +     reg = <0x13e00000 0x1000>;
>> +     interrupts = <0 85 0>;
>> +};
>> +
>
> [...]
>
>
>> diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-
>> exynos/include/mach/map.h
>> index c72b675..217e470 100644
>> --- a/arch/arm/mach-exynos/include/mach/map.h
>> +++ b/arch/arm/mach-exynos/include/mach/map.h
>> @@ -121,6 +121,9 @@
>>  #define EXYNOS4_PA_SYSMMU_MFC_L              0x13620000
>>  #define EXYNOS4_PA_SYSMMU_MFC_R              0x13630000
>>
>> +/* x = 0...3 */
>> +#define EXYNOS5_PA_GSC(x)            (0x13e00000 + ((x) * 0x10000))
>
> I think, separated definitions would be nice because the number of channel
> can be changed on other upcoming EXYNOS5 SoCs.
>
> +#define EXYNOS5_PA_GSC0                        0x13E00000
> +#define EXYNOS5_PA_GSC1                        0x13E10000
> +#define EXYNOS5_PA_GSC2                        0x13E20000
> +#define EXYNOS5_PA_GSC3                        0x13E30000

Ok. I will update as per your suggestion.

>
> [...]
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>

Thanks,
Shaik Ameer Basha
