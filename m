From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 1/5] ARM: dts: exynos5250-arndale: Add node entry for
 gpio-buttons
Date: Thu, 07 Feb 2013 15:10:27 +0530
Message-ID: <5113768B.90102@linaro.org>
References: <1360214129-4096-1-git-send-email-tushar.behera@linaro.org> <F3DBB1B3EF102E4994C89758CFCA32412C4E1A@DBDE01.ent.ti.com> <51134907.1050803@linaro.org> <CAKDJKT5xE9WWOC0pM8h1UWrF=OOtSr1D2WKPww9F6bhcO7VM_w@mail.gmail.com> <5113501D.5060603@linaro.org> <CAKrE-Ke1WZt-PqVReGdNwcD+R_-4iHKPhgkgtgS-LQAPbx34mQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f172.google.com ([209.85.210.172]:62776 "EHLO
	mail-ia0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756846Ab3BGJkg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Feb 2013 04:40:36 -0500
Received: by mail-ia0-f172.google.com with SMTP id u8so2702611iag.17
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Feb 2013 01:40:35 -0800 (PST)
In-Reply-To: <CAKrE-Ke1WZt-PqVReGdNwcD+R_-4iHKPhgkgtgS-LQAPbx34mQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Girish KS <girishks2000@gmail.com>
Cc: Manish Badarkhe <badarkhe.manish@gmail.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "patches@linaro.org" <patches@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "Kumar, Anil" <anilkumar.v@ti.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, david@protonic.nl, dtor@mail.ru

+CC: David Jander <david@protonic.nl>
+CC: Dmitry Torokhov <dtor@mail.ru>

On 02/07/2013 01:13 PM, Girish KS wrote:
>>>>>> +
>>>>>> +    gpio_keys {
>>>>>> +            compatible = "gpio-keys";
>>>>>> +            #address-cells = <1>;
>>>>>> +            #size-cells = <0>;
>>>>>
>>>>> Just want to understand why these properties are here?
>>>>> As these properties are for child dt node. But have not seen
>>>>> anyone is using here.
>>>>>
>>>>
>>>> That is how gpio_keys node entries are defined in other .dts files.
>>>
>>> I have gone through example for address-cells and size-cells in following link:
>>> http://devicetree.org/mediawiki/index.php?title=Device_Tree_Usage&stable=1#CPU_addressing
>>>
>>> which indicates that these fields are for child "reg".
>>> I think, here in child node there is no "reg". so there is no use
>>> of address-cells and size-cells propeties.
>>>
>>
>> Please check Documentation/devicetree/bindings/gpio/gpio_keys.txt
>>
>> And whether these properties are required or not, I will let device tree
>> experts to comment on that.
>>
>> As such, currently all node entries for gpio_keys use these properties.
> you can just verify by a simple test.
> delete the 2 lines. address-cells and size cells.
> this will have no affect.
> now with these 2 lines deleted lines add a dummy reg property with
> address and cell. dtb compiler will warn.
> So I think what manish reffered is right.
> There is also a reference of smdk4210 for kepads.

Right. Compilation is ok even after removing the address-cell and
size-cell properties.

But since this is used across all the instances, I would like to know
the view of the authors on this.

David, Dimitry,

Can you please let us know your opinion on this? If these properties are
not required, then we can remove them from the documentation and from
node entries in several other dts files.

>>
>> --
>> Tushar Behera
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


-- 
Tushar Behera
