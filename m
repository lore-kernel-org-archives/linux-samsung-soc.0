From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS4: Enable WM8994 MFD on I2S selection
Date: Wed, 25 May 2011 11:48:19 -0700
Message-ID: <4DDD4EF3.3000008@samsung.com>
References: <1306298370-24997-1-git-send-email-angus.ainslie@linaro.org>	<4DDD425A.1070202@samsung.com> <BANLkTik5pqAgJGznPi2PLSyXucgOoLNR9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:52488 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751011Ab1EYSsX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 May 2011 14:48:23 -0400
Received: by vws1 with SMTP id 1so6032887vws.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 May 2011 11:48:23 -0700 (PDT)
In-Reply-To: <BANLkTik5pqAgJGznPi2PLSyXucgOoLNR9w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Angus Ainslie <angus.ainslie@linaro.org>, linux-samsung-soc@vger.kernel.org, Giridhar Maruthy <giridhar.maruthy@linaro.org>, samsung@lists.linaro.org, patches@linaro.org, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com

On 05/25/11 11:15, Jassi Brar wrote:
>>> diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
>>> index a3fdfb6..a80eeb1 100644
>>> --- a/sound/soc/samsung/Kconfig
>>> +++ b/sound/soc/samsung/Kconfig
>>> @@ -65,6 +65,9 @@ config SND_SOC_SAMSUNG_SMDK_WM8994
>>>         tristate "SoC I2S Audio support for WM8994 on SMDK"
>>>         depends on SND_SOC_SAMSUNG&&    (MACH_SMDKV310 || MACH_SMDKC210)
>>>         select SND_SOC_WM8994
>>> +       select MFD_SUPPORT
>>> +       select I2C_S3C2410
>>> +       select MFD_WM8994
>>
>> I'm not sure about MFD configs, but if "select I2C_S3C2410" is required, it
>> should be moved into regarding Kconfig of arch/arm, because it is related to
>> dependency of ARCH. Maybe in this case, arch/arm/mach-exynos4/Kconfig?
>
> I2C here is a SMDK specific requirement and even if most devices need I2C,
> selecting I2C for every EXYNOS4210 based device is not ideal. IMO it'd better
> be tied to some SMDK specific config option.
>

Hi Jassi :)

How are you?

Hmm...need to think again because as you know, basically all of boards 
can be compiled with one exynos4_defconfig.

Ok, so you agreed it should be moved into some Kconfig of arch/arm/ :)
I will think again which one is more reasonable then let you know.

-- 
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
