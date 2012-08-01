From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH] ASoC: Samsung: Update Kconfig for Exynos5250 and Exynos4412
Date: Wed, 1 Aug 2012 19:01:28 +0530
Message-ID: <CAAgF-BfmVfiPZozRd_d5h0DHCypDrmk-5kN2N9un_UEN=qQmDQ@mail.gmail.com>
References: <1343218351-30577-1-git-send-email-padma.v@samsung.com>
	<030901cd6f92$b5fc6da0$21f548e0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:49388 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752285Ab2HANb3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Aug 2012 09:31:29 -0400
Received: by lahd3 with SMTP id d3so4659386lah.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Aug 2012 06:31:28 -0700 (PDT)
In-Reply-To: <030901cd6f92$b5fc6da0$21f548e0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, rcsekar@samsung.com, sbkim73@samsung.com, sangsu4u.park@samsung.com, ben-linux@fluff.org, olofj@google.com, thutt@chromium.org, joshi@samsung.com

Hi,

On Wed, Aug 1, 2012 at 8:36 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Padmavathi Venna wrote:
>>
>> Update Kconfig file to support the Exynos5250 and Exynos4412
>>
>> Signed-off-by: Sangsu Park <sangsu4u.park@samsung.com>
>> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
>> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
>> ---
>>  sound/soc/samsung/Kconfig |    8 ++++----
>>  1 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
>> index fe3995c..d54e400 100644
>> --- a/sound/soc/samsung/Kconfig
>> +++ b/sound/soc/samsung/Kconfig
>> @@ -1,6 +1,6 @@
>>  config SND_SOC_SAMSUNG
>>       tristate "ASoC support for Samsung"
>> -     depends on ARCH_S3C24XX || ARCH_S3C64XX || ARCH_S5PC100 ||
>> ARCH_S5PV210 || ARCH_S5P64X0 || ARCH_EXYNOS4
>> +     depends on PLAT_SAMSUNG
>>       select S3C64XX_DMA if ARCH_S3C64XX
>>       select S3C2410_DMA if ARCH_S3C24XX
>>       help
>> @@ -63,7 +63,7 @@ config SND_SOC_SAMSUNG_SMDK_WM8580
>>
>>  config SND_SOC_SAMSUNG_SMDK_WM8994
>>       tristate "SoC I2S Audio support for WM8994 on SMDK"
>> -     depends on SND_SOC_SAMSUNG && (MACH_SMDKV310 || MACH_SMDKC210 ||
>> MACH_SMDK4212)
>> +     depends on SND_SOC_SAMSUNG && (MACH_SMDKV310 || MACH_SMDKC210 ||
>> MACH_SMDK4212 || MACH_SMDK4412 || SOC_EXYNOS5250)
>
> Well, do you think _really_ all board which has a EXYNOS5250 SoC is needed
> this config?
>
> I don't think so?
Yes. It is not required on all boards which has EXYNOS5250 SoC. I will
change this.
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
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
