From: Manish Badarkhe <badarkhe.manish@gmail.com>
Subject: Re: [PATCH 1/5] ARM: dts: exynos5250-arndale: Add node entry for gpio-buttons
Date: Thu, 7 Feb 2013 12:06:25 +0530
Message-ID: <CAKDJKT5xE9WWOC0pM8h1UWrF=OOtSr1D2WKPww9F6bhcO7VM_w@mail.gmail.com>
References: <1360214129-4096-1-git-send-email-tushar.behera@linaro.org>
	<F3DBB1B3EF102E4994C89758CFCA32412C4E1A@DBDE01.ent.ti.com>
	<51134907.1050803@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:48430 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750973Ab3BGGg1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Feb 2013 01:36:27 -0500
Received: by mail-wg0-f49.google.com with SMTP id 15so1776457wgd.16
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Feb 2013 22:36:26 -0800 (PST)
In-Reply-To: <51134907.1050803@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: "Kumar, Anil" <anilkumar.v@ti.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "patches@linaro.org" <patches@linaro.org>

Hi Tushar

On Thu, Feb 7, 2013 at 11:56 AM, Tushar Behera <tushar.behera@linaro.org> wrote:
> On 02/07/2013 11:47 AM, Kumar, Anil wrote:
>> On Thu, Feb 07, 2013 at 10:45:25, Tushar Behera wrote:
>>> Added GPIO buttons DT node to Arndale board file.
>>>
>>> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
>>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>>> ---
>>> This series is based on for-next branch of Kukjin Kim's tree
>>> and added on top of the below patch:
>>> https://patchwork.kernel.org/patch/2042451/
>>> ---
>>>  arch/arm/boot/dts/exynos5250-arndale.dts |   48 ++++++++++++++++++++++++++++++
>>>  1 files changed, 48 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
>>> index 63572f9..9ce40df 100644
>>> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
>>> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
>>> @@ -119,4 +119,52 @@
>>>      spi_2: spi@12d40000 {
>>>              status = "disabled";
>>>      };
>>> +
>>> +    gpio_keys {
>>> +            compatible = "gpio-keys";
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>
>> Just want to understand why these properties are here?
>> As these properties are for child dt node. But have not seen
>> anyone is using here.
>>
>
> That is how gpio_keys node entries are defined in other .dts files.

I have gone through example for address-cells and size-cells in following link:
http://devicetree.org/mediawiki/index.php?title=Device_Tree_Usage&stable=1#CPU_addressing

which indicates that these fields are for child "reg".
I think, here in child node there is no "reg". so there is no use
of address-cells and size-cells propeties.

Correct me if I am wrong here?

Thanks
Manish Badarkhe
