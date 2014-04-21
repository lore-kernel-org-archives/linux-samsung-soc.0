From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 1/2] phy: samsung: add simple phys for exynos5250 SoC
Date: Mon, 21 Apr 2014 11:21:20 +0530
Message-ID: <CAPdUM4Oq0fb-E6P4BGz8ZiPK+0wnKhQvbC90B-nw=8ecd-T2cw@mail.gmail.com>
References: <1397988495-29376-1-git-send-email-rahul.sharma@samsung.com>
	<1397988495-29376-2-git-send-email-rahul.sharma@samsung.com>
	<53546B67.3000308@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46]:65131 "EHLO
	mail-wg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750780AbaDUFvW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Apr 2014 01:51:22 -0400
Received: by mail-wg0-f46.google.com with SMTP id b13so2309796wgh.17
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Apr 2014 22:51:20 -0700 (PDT)
In-Reply-To: <53546B67.3000308@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, sunil joshi <joshi@samsung.com>

oops. Sorry, I will change that.

On 21 April 2014 06:20, Pankaj Dubey <pankaj.dubey@samsung.com> wrote:
> Hi Rahul,
>
>
> On 04/20/2014 07:08 PM, Rahul Sharma wrote:
>>
>> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>>
>> Extend the support for simple phys for exynos5250 SoC
>> in simple phy driver.
>>
>> Change-Id: I39e7745e01ae4b1cf5063dce8a29ebdc37180130
>
> Change-Id should be removed. Missing Signed-off-by.
>
>> ---
>>   .../devicetree/bindings/phy/samsung-phy.txt        |   22
>> ++++++++++++++++++++
>>   drivers/phy/exynos-simple-phy.c                    |    9 ++++++++
>>   2 files changed, 31 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt
>> b/Documentation/devicetree/bindings/phy/samsung-phy.txt
>> index f97c4c3..f469099 100644
>> --- a/Documentation/devicetree/bindings/phy/samsung-phy.txt
>> +++ b/Documentation/devicetree/bindings/phy/samsung-phy.txt
>> @@ -122,6 +122,7 @@ Required properties:
>>   - compatible : should be one of the listed compatibles:
>>         - "samsung,exynos4210-simple-phy"
>>         - "samsung,exynos4412-simple-phy"
>> +       - "samsung,exynos5250-simple-phy"
>>   - reg : offset and length of the register set;
>>   - #phy-cells : from the generic phy bindings, must be 1;
>>   @@ -138,3 +139,24 @@ the PHY specifier identifies the PHY and its
>> meaning is as follows:
>>     0 - HDMI PHY,
>>     1 - ADC PHY,
>>   +For "samsung,exynos5250-simple-phy" compatible PHYs the second cell in
>> +the PHY specifier identifies the PHY and its meaning is as follows:
>> +  0 - HDMI PHY,
>> +  1 - ADC PHY,
>> +  2 - ADC PHY,
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
>> diff --git a/drivers/phy/exynos-simple-phy.c
>> b/drivers/phy/exynos-simple-phy.c
>> index 57ad338..187f6b1 100644
>> --- a/drivers/phy/exynos-simple-phy.c
>> +++ b/drivers/phy/exynos-simple-phy.c
>> @@ -64,11 +64,20 @@ static const u32 exynos4412_offsets[] = {
>>         ~0, /* end mark */
>>   };
>>   +static const u32 exynos5250_offsets[] = {
>> +       0x0700, /* HDMI_PHY */
>> +       0x0718, /* ADC_PHY */
>> +       0x0724, /* SATA_PHY */
>> +       ~0, /* end mark */
>> +};
>> +
>>   static const struct of_device_id exynos_phy_of_match[] = {
>>         { .compatible = "samsung,exynos4210-simple-phy",
>>           .data = exynos4210_offsets},
>>         { .compatible = "samsung,exynos4412-simple-phy",
>>           .data = exynos4412_offsets},
>> +       { .compatible = "samsung,exynos5250-simple-phy",
>> +         .data = exynos5250_offsets},
>>         { },
>>   };
>>   MODULE_DEVICE_TABLE(of, exynos_phy_of_match);
>
>
>
> --
> Best Regards,
> Pankaj Dubey
>
