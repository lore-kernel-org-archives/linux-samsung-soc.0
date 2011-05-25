From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] ARM: EXYNOS4: Enable WM8994 MFD on I2S selection
Date: Wed, 25 May 2011 23:45:37 +0530
Message-ID: <BANLkTik5pqAgJGznPi2PLSyXucgOoLNR9w@mail.gmail.com>
References: <1306298370-24997-1-git-send-email-angus.ainslie@linaro.org>
	<4DDD425A.1070202@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:51667 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751601Ab1EYSPj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 May 2011 14:15:39 -0400
Received: by bwz15 with SMTP id 15so6602bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 May 2011 11:15:38 -0700 (PDT)
In-Reply-To: <4DDD425A.1070202@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Angus Ainslie <angus.ainslie@linaro.org>, linux-samsung-soc@vger.kernel.org, Giridhar Maruthy <giridhar.maruthy@linaro.org>, samsung@lists.linaro.org, patches@linaro.org, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com

>> diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
>> index a3fdfb6..a80eeb1 100644
>> --- a/sound/soc/samsung/Kconfig
>> +++ b/sound/soc/samsung/Kconfig
>> @@ -65,6 +65,9 @@ config SND_SOC_SAMSUNG_SMDK_WM8994
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0tristate "SoC I2S Audio support for WM899=
4 on SMDK"
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on SND_SOC_SAMSUNG&& =C2=A0(MACH_=
SMDKV310 || MACH_SMDKC210)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0select SND_SOC_WM8994
>> + =C2=A0 =C2=A0 =C2=A0 select MFD_SUPPORT
>> + =C2=A0 =C2=A0 =C2=A0 select I2C_S3C2410
>> + =C2=A0 =C2=A0 =C2=A0 select MFD_WM8994
>
> I'm not sure about MFD configs, but if "select I2C_S3C2410" is requir=
ed, it
> should be moved into regarding Kconfig of arch/arm, because it is rel=
ated to
> dependency of ARCH. Maybe in this case, arch/arm/mach-exynos4/Kconfig=
?

I2C here is a SMDK specific requirement and even if most devices need I=
2C,
selecting I2C for every EXYNOS4210 based device is not ideal. IMO it'd =
better
be tied to some SMDK specific config option.

Cheer!
Jassi
