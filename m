From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: Re: [PATCH 2/2] ARM: dts: Exynos5420: Add dt support for gscaler
Date: Wed, 16 Oct 2013 15:38:15 +0530
Message-ID: <CAL1wa8c2vkAh5zgOxiAJDPcP5DL52rNPqvyhiS42KV5RpTsEpw@mail.gmail.com>
References: <1381836054-6590-1-git-send-email-l.krishna@samsung.com>
 <1381836054-6590-3-git-send-email-l.krishna@samsung.com> <1455132.3iFLDg6lah@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:53714 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760543Ab3JPKIh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Oct 2013 06:08:37 -0400
In-Reply-To: <1455132.3iFLDg6lah@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Leela Krishna Amudala <l.krishna@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, devicetree@vger.kernel.org, khw0178.kim@samsung.com, prathyush.k@samsung.com, cpgs@samsung.com

Hi Tomasz,

On Wed, Oct 16, 2013 at 12:21 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Leela,
>
> On Tuesday 15 of October 2013 16:50:54 Leela Krishna Amudala wrote:
>> Adds G-Scaler devices to the DT device list
>>
>> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos5420.dtsi |   20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5420.dtsi
>> b/arch/arm/boot/dts/exynos5420.dtsi index 7f0296c..f86aeea 100644
>> --- a/arch/arm/boot/dts/exynos5420.dtsi
>> +++ b/arch/arm/boot/dts/exynos5420.dtsi
>> @@ -31,6 +31,8 @@
>>               i2c1 = &i2c_1;
>>               i2c2 = &i2c_2;
>>               i2c3 = &i2c_3;
>> +             gsc0 = &gsc_0;
>> +             gsc1 = &gsc_1;
>
> Do you really need these aliases?
>

Yes, without these aliases probe function fails saying
[    1.040000] exynos-gsc 13e00000.gsc: Invalid platform device id: 65517
[    1.045000] exynos-gsc: probe of 13e00000.gsc failed with error -22

>>       };
>>
>>       cpus {
>> @@ -313,4 +315,22 @@
>>               clocks = <&clock 431>, <&clock 143>;
>>               clock-names = "mixer", "sclk_hdmi";
>>       };
>> +
>> +     gsc_0:  gsc@0x13e00000 {
>
> coding style: There should be no 0x in node name and the name should
> be more meaningful, e.g. video-scaler.
>

Okay, will change it and post next version of this patch.

Best Wishes,
Leela Krishna.

> Best regards,
> Tomasz
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
