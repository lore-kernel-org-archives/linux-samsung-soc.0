From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: Re: [PATCH 2/2] arm: dt: Exynos5420: populate cpu node enteries to 8 cpus
Date: Thu, 5 Sep 2013 15:33:17 +0530
Message-ID: <CANuQgHGSAGhA_LzU1aP05J86wjjS0qibPTXZM8ka0O3jZz8Kpw@mail.gmail.com>
References: <1378373086-30676-1-git-send-email-chander.kashyap@linaro.org>
	<1378373086-30676-3-git-send-email-chander.kashyap@linaro.org>
	<3875313.jvPsk6a1oV@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f52.google.com ([209.85.219.52]:36702 "EHLO
	mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933097Ab3IEKDS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Sep 2013 06:03:18 -0400
Received: by mail-oa0-f52.google.com with SMTP id f4so1934424oah.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Sep 2013 03:03:17 -0700 (PDT)
In-Reply-To: <3875313.jvPsk6a1oV@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>

Hi Tomasz,

On 5 September 2013 15:25, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Chander,
>
> On Thursday 05 of September 2013 14:54:46 Chander Kashyap wrote:
>> Exynos5420 is octacore SoC from samsung.
>> Hence populate all the cpu node enteries.
>>
>> Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
>> ---
>>  arch/arm/boot/dts/exynos5420.dtsi |   28 ++++++++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5420.dtsi
>> b/arch/arm/boot/dts/exynos5420.dtsi index e97c87b..59489f6 100644
>> --- a/arch/arm/boot/dts/exynos5420.dtsi
>> +++ b/arch/arm/boot/dts/exynos5420.dtsi
>> @@ -57,6 +57,34 @@
>>                       reg = <0x3>;
>>                       clock-frequency = <1800000000>;
>>               };
>> +
>> +             cpu4: cpu@4 {
>
> I believe this is a typo. The @unit-address suffix should match the value
> of reg property.

No this is not typo. It is the MPIDR value of the cpu. (24 bits of
MPIDR register).

>
>> +                     device_type = "cpu";
>> +                     compatible = "arm,cortex-a7";
>> +                     reg = <0x100>;
>> +                     clock-frequency = <1000000000>;
>> +             };
>> +
>> +             cpu5: cpu@5 {
>
> Ditto.
>
>> +                     device_type = "cpu";
>> +                     compatible = "arm,cortex-a7";
>> +                     reg = <0x101>;
>> +                     clock-frequency = <1000000000>;
>> +             };
>> +
>> +             cpu6: cpu@6 {
>
> Ditto.
>
>> +                     device_type = "cpu";
>> +                     compatible = "arm,cortex-a7";
>> +                     reg = <0x102>;
>> +                     clock-frequency = <1000000000>;
>> +             };
>> +
>> +             cpu7: cpu@7 {
>
> Ditto.
>
>> +                     device_type = "cpu";
>> +                     compatible = "arm,cortex-a7";
>> +                     reg = <0x103>;
>> +                     clock-frequency = <1000000000>;
>> +             };
>>       };
>
> Best regards,
> Tomasz
>



-- 
with warm regards,
Chander Kashyap
