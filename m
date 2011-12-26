From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 3/4] ARM: S5PV210: Enable FIMC on SMDKV210
Date: Mon, 26 Dec 2011 22:42:12 +0530
Message-ID: <CAK9yfHw7_9_-_mHVOqqOodMDVS1OK8REfEAObXHivY8pkG_3Eg@mail.gmail.com>
References: <1324893613-5469-1-git-send-email-sachin.kamat@linaro.org>
	<1324893613-5469-4-git-send-email-sachin.kamat@linaro.org>
	<4EF8A08E.9070808@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:64558 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750834Ab1LZRMN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Dec 2011 12:12:13 -0500
Received: by qadc12 with SMTP id c12so6267818qad.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Dec 2011 09:12:12 -0800 (PST)
In-Reply-To: <4EF8A08E.9070808@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <snjw23@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

Hi Sylwester,

Thank you for your comments.

I did check Goni code and found that there was  s5p_device_fimc_md devi=
ce added.
But I could n't find much description about it and also initial
version did not have it enabled, hence I did not include it.
I will re-submit the patch after adding s5p_device_fimc_md in the devic=
e list.

Thanks and regards
Sachin


On 26 December 2011 21:57, Sylwester Nawrocki <snjw23@gmail.com> wrote:
> Hi Sachin,
>
> thanks for the patch.
>
> On 12/26/2011 11:00 AM, Sachin Kamat wrote:
>> This patch adds support for FIMC 0, 1 and 2 on SMDKV210 board.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>> =A0arch/arm/mach-s5pv210/Kconfig =A0 =A0 =A0 =A0 | =A0 =A03 +++
>> =A0arch/arm/mach-s5pv210/mach-smdkv210.c | =A0 =A03 +++
>> =A02 files changed, 6 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/K=
config
>> index 32893c7..66e1b3d 100644
>> --- a/arch/arm/mach-s5pv210/Kconfig
>> +++ b/arch/arm/mach-s5pv210/Kconfig
>> @@ -138,6 +138,9 @@ config MACH_SMDKV210
>> =A0 =A0 =A0 select S3C_DEV_I2C2
>> =A0 =A0 =A0 select S3C_DEV_RTC
>> =A0 =A0 =A0 select S3C_DEV_WDT
>> + =A0 =A0 select S5P_DEV_FIMC0
>> + =A0 =A0 select S5P_DEV_FIMC1
>> + =A0 =A0 select S5P_DEV_FIMC2
>> =A0 =A0 =A0 select S5P_DEV_MFC
>> =A0 =A0 =A0 select SAMSUNG_DEV_ADC
>> =A0 =A0 =A0 select SAMSUNG_DEV_BACKLIGHT
>> diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s=
5pv210/mach-smdkv210.c
>> index d50cacd..038fc5f 100644
>> --- a/arch/arm/mach-s5pv210/mach-smdkv210.c
>> +++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
>> @@ -226,6 +226,9 @@ static struct platform_device *smdkv210_devices[=
] __initdata =3D {
>> =A0 =A0 =A0 &s3c_device_rtc,
>> =A0 =A0 =A0 &s3c_device_ts,
>> =A0 =A0 =A0 &s3c_device_wdt,
>> + =A0 =A0 &s5p_device_fimc0,
>> + =A0 =A0 &s5p_device_fimc1,
>> + =A0 =A0 &s5p_device_fimc2,
>
> Sorry, this won't work, unless you add &s5p_device_fimc_md after all
> s5p_fimc_device? entries. s5p_device_fimc_md is a platform device for
> FIMC media device driver (/dev/media?), which registers all required
> video nodes (mem-to-mem and video capture).
> Complete board code for FIMC can be found in Goni (or Nuri) board fil=
es.
>
> Does the above really work for you with 3.2-rc7 kernel ?
>
> I've had prepared a patch adding s5p_device_fimc_md for the SMDK boar=
ds
> that already register FIMC devices, but got distracted by other tasks
> and finally I didn't send it for 3.2 :(
>
> BTW, is there anyone interested in s3c64xx (s3c24xx) CAMIF v4l2 drive=
r
> in the mainline kernel ? I've started some works on it and could carr=
y on
> with that if there is some interest, so we can have something which
> is in line with the mainline APIs.
>
> --
>
> Thanks,
> Sylwester



--=20
With warm regards,
Sachin
