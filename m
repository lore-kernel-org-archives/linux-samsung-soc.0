From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH] ARM: dts: Modify SPI nodes according generic DMA DT bindings
Date: Tue, 5 Mar 2013 15:49:48 +0530
Message-ID: <CAAgF-BfUZOrXjY1demxMnWz3B+eR2VFKf4FGKBNhB7G=hR3UZw@mail.gmail.com>
References: <1362477862-352-1-git-send-email-padma.v@samsung.com>
	<CAK9yfHwmjwN4ceCQ719Y2DY9keTEX8mt65bHkoHcTTRJc5p9rA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f179.google.com ([209.85.223.179]:52667 "EHLO
	mail-ie0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750827Ab3CEKTs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Mar 2013 05:19:48 -0500
Received: by mail-ie0-f179.google.com with SMTP id k11so7471137iea.24
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Mar 2013 02:19:48 -0800 (PST)
In-Reply-To: <CAK9yfHwmjwN4ceCQ719Y2DY9keTEX8mt65bHkoHcTTRJc5p9rA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, arnd@arndb.de, vinod.koul@intel.com, grant.likely@secretlab.ca

On Tue, Mar 5, 2013 at 3:36 PM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> On 5 March 2013 15:34, Padmavathi Venna <padma.v@samsung.com> wrote:
>> This patch removes custom way of adding spi dma channels and
>> adds according to new generic DMA DT bindings on samsung exynos4
>> and exynos5440 platforms.
>>
>> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos4.dtsi    |   15 +++++++++------
>>  arch/arm/boot/dts/exynos5440.dtsi |    5 +++--
>>  2 files changed, 12 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
>> index 1a62bcf..2449651 100644
>> --- a/arch/arm/boot/dts/exynos4.dtsi
>> +++ b/arch/arm/boot/dts/exynos4.dtsi
>> @@ -235,8 +235,9 @@
>>                 compatible = "samsung,exynos4210-spi";
>>                 reg = <0x13920000 0x100>;
>>                 interrupts = <0 66 0>;
>> -               tx-dma-channel = <&pdma0 7>; /* preliminary */
>> -               rx-dma-channel = <&pdma0 6>; /* preliminary */
>> +               dmas = <&pdma0 7
>> +                       &pdma0 6>;
>> +               dma-names = "tx", "rx";
>>                 #address-cells = <1>;
>>                 #size-cells = <0>;
>>                 status = "disabled";
>> @@ -246,8 +247,9 @@
>>                 compatible = "samsung,exynos4210-spi";
>>                 reg = <0x13930000 0x100>;
>>                 interrupts = <0 67 0>;
>> -               tx-dma-channel = <&pdma1 7>; /* preliminary */
>> -               rx-dma-channel = <&pdma1 6>; /* preliminary */
>> +               dmas = <&pdma0 7
>> +                       &pdma0 6>;
>
> Shouldn't these be pdma1 as was earlier?

Oops, It's my mistake. Will repost this.

Thanks
Padma
