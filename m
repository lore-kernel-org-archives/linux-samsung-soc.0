From: Girish KS <girishks2000@gmail.com>
Subject: Re: [PATCH 1/5] ARM: dts: exynos5250-arndale: Add node entry for gpio-buttons
Date: Wed, 6 Feb 2013 23:43:12 -0800
Message-ID: <CAKrE-Ke1WZt-PqVReGdNwcD+R_-4iHKPhgkgtgS-LQAPbx34mQ@mail.gmail.com>
References: <1360214129-4096-1-git-send-email-tushar.behera@linaro.org>
	<F3DBB1B3EF102E4994C89758CFCA32412C4E1A@DBDE01.ent.ti.com>
	<51134907.1050803@linaro.org>
	<CAKDJKT5xE9WWOC0pM8h1UWrF=OOtSr1D2WKPww9F6bhcO7VM_w@mail.gmail.com>
	<5113501D.5060603@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f169.google.com ([209.85.223.169]:59350 "EHLO
	mail-ie0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752021Ab3BGHnN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Feb 2013 02:43:13 -0500
Received: by mail-ie0-f169.google.com with SMTP id 13so3154092iea.28
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Feb 2013 23:43:13 -0800 (PST)
In-Reply-To: <5113501D.5060603@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: Manish Badarkhe <badarkhe.manish@gmail.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "patches@linaro.org" <patches@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "Kumar, Anil" <anilkumar.v@ti.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Wed, Feb 6, 2013 at 10:56 PM, Tushar Behera <tushar.behera@linaro.org> wrote:
> On 02/07/2013 12:06 PM, Manish Badarkhe wrote:
>> Hi Tushar
>>
>> On Thu, Feb 7, 2013 at 11:56 AM, Tushar Behera <tushar.behera@linaro.org> wrote:
>>> On 02/07/2013 11:47 AM, Kumar, Anil wrote:
>>>> On Thu, Feb 07, 2013 at 10:45:25, Tushar Behera wrote:
>>>>> Added GPIO buttons DT node to Arndale board file.
>>>>>
>>>>> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
>>>>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>>>>> ---
>>>>> This series is based on for-next branch of Kukjin Kim's tree
>>>>> and added on top of the below patch:
>>>>> https://patchwork.kernel.org/patch/2042451/
>>>>> ---
>>>>>  arch/arm/boot/dts/exynos5250-arndale.dts |   48 ++++++++++++++++++++++++++++++
>>>>>  1 files changed, 48 insertions(+), 0 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
>>>>> index 63572f9..9ce40df 100644
>>>>> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
>>>>> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
>>>>> @@ -119,4 +119,52 @@
>>>>>      spi_2: spi@12d40000 {
>>>>>              status = "disabled";
>>>>>      };
>>>>> +
>>>>> +    gpio_keys {
>>>>> +            compatible = "gpio-keys";
>>>>> +            #address-cells = <1>;
>>>>> +            #size-cells = <0>;
>>>>
>>>> Just want to understand why these properties are here?
>>>> As these properties are for child dt node. But have not seen
>>>> anyone is using here.
>>>>
>>>
>>> That is how gpio_keys node entries are defined in other .dts files.
>>
>> I have gone through example for address-cells and size-cells in following link:
>> http://devicetree.org/mediawiki/index.php?title=Device_Tree_Usage&stable=1#CPU_addressing
>>
>> which indicates that these fields are for child "reg".
>> I think, here in child node there is no "reg". so there is no use
>> of address-cells and size-cells propeties.
>>
>
> Please check Documentation/devicetree/bindings/gpio/gpio_keys.txt
>
> And whether these properties are required or not, I will let device tree
> experts to comment on that.
>
> As such, currently all node entries for gpio_keys use these properties.
you can just verify by a simple test.
delete the 2 lines. address-cells and size cells.
this will have no affect.
now with these 2 lines deleted lines add a dummy reg property with
address and cell. dtb compiler will warn.
So I think what manish reffered is right.
There is also a reference of smdk4210 for kepads.
>
> --
> Tushar Behera
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
