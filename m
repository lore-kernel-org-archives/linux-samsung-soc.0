From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 1/2] phy: samsung: add simple phys for exynos5250 SoC
Date: Mon, 21 Apr 2014 11:28:00 +0530
Message-ID: <CAPdUM4Mh8wv54k=wsOF8thSt_=5mne9OkMGq9n=54Y-igyMhWw@mail.gmail.com>
References: <1397988495-29376-1-git-send-email-rahul.sharma@samsung.com>
	<1397988495-29376-2-git-send-email-rahul.sharma@samsung.com>
	<CAK9yfHxn=7FqsvwKbxJERWQQFCyqKzZvK=uxu=gg_Vw7zTkt0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:59864 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750780AbaDUF6D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Apr 2014 01:58:03 -0400
Received: by mail-wi0-f170.google.com with SMTP id bs8so1427130wib.5
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Apr 2014 22:58:01 -0700 (PDT)
In-Reply-To: <CAK9yfHxn=7FqsvwKbxJERWQQFCyqKzZvK=uxu=gg_Vw7zTkt0g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "ABRAHAM, KISHON VIJAY" <kishon@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, sunil joshi <joshi@samsung.com>, PANKAJ KUMAR DUBEY <pankaj.dubey@samsung.com>

Thanks Sachin,

On 21 April 2014 11:24, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Hi Rahul,
>
> On 20 April 2014 15:38, Rahul Sharma <rahul.sharma@samsung.com> wrote:
>> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>>
>> Extend the support for simple phys for exynos5250 SoC
>> in simple phy driver.
>>
>> Change-Id: I39e7745e01ae4b1cf5063dce8a29ebdc37180130
>> ---
>>  .../devicetree/bindings/phy/samsung-phy.txt        |   22 ++++++++++++++++++++
>>  drivers/phy/exynos-simple-phy.c                    |    9 ++++++++
>>  2 files changed, 31 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt b/Documentation/devicetree/bindings/phy/samsung-phy.txt
>> index f97c4c3..f469099 100644
>> --- a/Documentation/devicetree/bindings/phy/samsung-phy.txt
>> +++ b/Documentation/devicetree/bindings/phy/samsung-phy.txt
>> @@ -122,6 +122,7 @@ Required properties:
>>  - compatible : should be one of the listed compatibles:
>>         - "samsung,exynos4210-simple-phy"
>>         - "samsung,exynos4412-simple-phy"
>> +       - "samsung,exynos5250-simple-phy"
>>  - reg : offset and length of the register set;
>>  - #phy-cells : from the generic phy bindings, must be 1;
>>
>> @@ -138,3 +139,24 @@ the PHY specifier identifies the PHY and its meaning is as follows:
>>    0 - HDMI PHY,
>>    1 - ADC PHY,
>>
>> +For "samsung,exynos5250-simple-phy" compatible PHYs the second cell in
>> +the PHY specifier identifies the PHY and its meaning is as follows:
>> +  0 - HDMI PHY,
>> +  1 - ADC PHY,
>> +  2 - ADC PHY,
>
> What is the difference between 1 and 2? Probably it should be SATA?
>

yea correct. it is Sata.

>> +
>> +Example:
>> +Simple PHY provider node:
>> +
>> +       simplephys: simple-phys@10040000 {
>> +               compatible = "samsung,exynos5250-simple-phy";
>> +               reg = <0x10040000 0x10000>;
>> +               #phy-cells = <1>;
>> +       };
>> +
>> +Other nodes accessing simple PHYs:
>> +
>> +       hdmi {
>> +               phys = <&simplephys 0>;
>> +               phy-names = "hdmiphy";
>> +       };
>> diff --git a/drivers/phy/exynos-simple-phy.c b/drivers/phy/exynos-simple-phy.c
>> index 57ad338..187f6b1 100644
>> --- a/drivers/phy/exynos-simple-phy.c
>> +++ b/drivers/phy/exynos-simple-phy.c
>> @@ -64,11 +64,20 @@ static const u32 exynos4412_offsets[] = {
>>         ~0, /* end mark */
>>  };
>>
>> +static const u32 exynos5250_offsets[] = {
>> +       0x0700, /* HDMI_PHY */
>> +       0x0718, /* ADC_PHY */
>> +       0x0724, /* SATA_PHY */
>> +       ~0, /* end mark */
>> +};
>> +
>
>
>
> --
> With warm regards,
> Sachin
