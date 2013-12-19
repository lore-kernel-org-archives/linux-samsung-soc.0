From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v2] ARM: dts: Add regulator entries to Exynos5420 SMDK board
Date: Thu, 19 Dec 2013 10:05:52 +0530
Message-ID: <CAK9yfHy8iKr8n5OVLm3QbiO3cL_hx-kr8f=gZ2VsBmuXLgHvgg@mail.gmail.com>
References: <1386236664-27763-1-git-send-email-sachin.kamat@linaro.org>
	<6615089.743e1d93MS@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:54361 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750866Ab3LSEfx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 23:35:53 -0500
Received: by mail-ob0-f179.google.com with SMTP id wm4so658607obc.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2013 20:35:52 -0800 (PST)
In-Reply-To: <6615089.743e1d93MS@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

Hi Tomasz,

On 18 December 2013 20:46, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Sachin,
>
> On Thursday 05 of December 2013 15:14:24 Sachin Kamat wrote:
>> Added regulator entries to Exynos5420 SMDK board.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>> Changes since v1:
>> Changed node name
>> ---
>>  arch/arm/boot/dts/exynos5420-smdk5420.dts |  216 +++++++++++++++++++++++++++++
>>  1 file changed, 216 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
>> index fb5a1e25c632..62e1ebe4e989 100644
>> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
>> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
>> @@ -120,4 +120,220 @@
>>                       reg = <0x50>;
>>               };
>>       };
>> +
>> +     hsi2c_4: i2c@12CA0000 {
>> +             status = "okay";
>> +
>> +             s2mps11_pmic@66 {
>
> Just pmic@66 is enough.

Please see my comment below.

>
>> +                     compatible = "samsung,s2mps11-pmic";
>> +                     reg = <0x66>;
>> +                     s2mps11,buck2-ramp-delay = <12>;
>> +                     s2mps11,buck34-ramp-delay = <12>;
>> +                     s2mps11,buck16-ramp-delay = <12>;
>> +                     s2mps11,buck6-ramp-enable = <1>;
>> +                     s2mps11,buck2-ramp-enable = <1>;
>> +                     s2mps11,buck3-ramp-enable = <1>;
>> +                     s2mps11,buck4-ramp-enable = <1>;
>> +
>> +                     s2mps11_osc: clocks {
>> +                             #clock-cells = <1>;
>> +                             clock-output-names = "s2mps11_ap",
>> +                                             "s2mps11_cp", "s2mps11_bt";
>> +                     };
>> +
>> +                     regulators {
>> +                             ldo1_reg: LDO1 {
>> +                                     regulator-name = "vdd_ldo1";
>
> Is this the name as written on the PCB or board schematics?
> + the same for all regulators below.

Yes, the schematic refers to these just as above (with no specific names).
Unless you have strong objections or a re-spin of this patch becomes
necessary, I
wouldn't want to change the name you pointed above. :)

-- 
With warm regards,
Sachin
