From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: add support for hdmi to exynos4
Date: Mon, 28 Jan 2013 12:25:27 +0530
Message-ID: <CAPdUM4Mx=Wq1pRshWBF-L=+AUbhBOL-N+0VU4QjUkxuZcLYf5Q@mail.gmail.com>
References: <1359110384-28402-1-git-send-email-rahul.sharma@samsung.com>
	<1359110384-28402-2-git-send-email-rahul.sharma@samsung.com>
	<CAJuYYwSHDoc40obSnPZwvS3LFxZEbrhHx6-Vd-yLKPGOnXxmoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:42504 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752571Ab3A1Gz2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 01:55:28 -0500
Received: by mail-wg0-f51.google.com with SMTP id 8so1459986wgl.18
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jan 2013 22:55:27 -0800 (PST)
In-Reply-To: <CAJuYYwSHDoc40obSnPZwvS3LFxZEbrhHx6-Vd-yLKPGOnXxmoQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com

Hi Thomas,

On Fri, Jan 25, 2013 at 11:10 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:
> On 25 January 2013 02:39, Rahul Sharma <rahul.sharma@samsung.com> wrote:
>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>>
>> Conflicts:
>>         arch/arm/mach-exynos/mach-exynos4-dt.c
>> ---
>>  arch/arm/boot/dts/exynos4.dtsi         | 7 +++++++
>>  arch/arm/mach-exynos/mach-exynos4-dt.c | 2 ++
>>  2 files changed, 9 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
>> index e1347fc..6c2c79d 100644
>> --- a/arch/arm/boot/dts/exynos4.dtsi
>> +++ b/arch/arm/boot/dts/exynos4.dtsi
>> @@ -289,4 +289,11 @@
>>                         interrupts = <0 34 0>;
>>                 };
>>         };
>> +
>> +       hdmi {
>> +               compatible = "samsung,exynos4-hdmi14";
>> +               reg = <0x12D00000 0x70000>;
>> +               interrupts = <0 95 0>;
>> +               hpd-gpio = <&gpx3 7 0xf 1 3>;
>
> This is using the older gpio dt bindings but exynos4 has started using
> the pinctrl bindings. So this is not sufficient to do the
> pinmux/pinconfig settings on Exynos4.
>
> Thanks,
> Thomas.
>

I have chosen this as exynos5 DT using it in same way and parsed by common code
in driver for exy4 and 5. Secondly, one-time initial configuration is
sufficient for
hdmi hpd-gpio. Please share your opinion.

regards,
Rahul Sharma.

>> +       };
>>  };
>> diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
>> index ab1dacc..24f72a5 100644
>> --- a/arch/arm/mach-exynos/mach-exynos4-dt.c
>> +++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
>> @@ -80,6 +80,8 @@ static const struct of_dev_auxdata exynos4_auxdata_lookup[] __initconst = {
>>         OF_DEV_AUXDATA("arm,pl330", EXYNOS4_PA_MDMA1, "dma-pl330.2", NULL),
>>         OF_DEV_AUXDATA("samsung,exynos4210-tmu", EXYNOS4_PA_TMU,
>>                                 "exynos-tmu", NULL),
>> +       OF_DEV_AUXDATA("samsung,exynos4-hdmi14", EXYNOS4_PA_HDMI,
>> +                               "exynos4-hdmi", NULL),
>>         {},
>>  };
>>
>> --
>> 1.8.0
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
