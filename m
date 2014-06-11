From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: [PATCH 2/2 v3] ARM: DTS: move "cs-gpio" from "controller-data" to
 under spi node
Date: Wed, 11 Jun 2014 16:59:08 +0530
Message-ID: <CAHfPSqC1SZ+Z1+vCdNPfUELWpfxxMeS9grpNtnG9yEn6AU9SXw@mail.gmail.com>
References: <1402468318-7342-1-git-send-email-ch.naveen@samsung.com>
 <1402468318-7342-2-git-send-email-ch.naveen@samsung.com> <53983BBF.4070408@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f179.google.com ([209.85.216.179]:60612 "EHLO
	mail-qc0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751049AbaFKL33 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jun 2014 07:29:29 -0400
In-Reply-To: <53983BBF.4070408@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, spi-devel-general@lists.sourceforge.net, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, broonie@kernel.org, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, Kukjin Kim <kgene.kim@samsung.com>, cpgs@samsung.com, devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, Tomasz Figa <t.figa@samsung.com>

Hello Javier,

On 11 June 2014 16:51, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> Hello Naveen,
>
> On 06/11/2014 08:31 AM, Naveen Krishna Chatradhi wrote:
>> This patch moves the "cs-gpio" field from "controller-data" child
>> node to under the spi device node.
>>
>
> Your patch looks good to me but I think that the commit message is inaccurate.
>
> It does not move the cs-gpio property to the top SPI dev node but it replaces
> the cs-gpio from controller-data as was specified in the old binding and use the
> standard cs-gpios property expected by the SPI core as is defined in the new
> binding.
>
> Having a proper commit message is important since out-of-tree DTS can use this
> commit as a reference on how to fix their FDT in case this change broke their
> platforms.
Sure, Will improve the commit message with your other points aswell.
>
>> Respective changes are preposed to spi-s3c64xx.c driver.
>>
>> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>> Cc: Doug Anderson <dianders@chromium.org>
>> Cc: Tomasz Figa <t.figa@samsung.com>
>> ---
>> Changes since v2:
>> None
>>
>>  arch/arm/boot/dts/exynos4210-smdkv310.dts |    2 +-
>>  arch/arm/boot/dts/exynos4412-trats2.dts   |    2 +-
>>  arch/arm/boot/dts/exynos5250-smdk5250.dts |    2 +-
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos4210-smdkv310.dts b/arch/arm/boot/dts/exynos4210-smdkv310.dts
>> index 636d166..9191491 100644
>> --- a/arch/arm/boot/dts/exynos4210-smdkv310.dts
>> +++ b/arch/arm/boot/dts/exynos4210-smdkv310.dts
>> @@ -169,6 +169,7 @@
>>
>>       spi_2: spi@13940000 {
>>               status = "okay";
>> +             cs-gpios = <&gpc1 2 0>;
>>
>>               w25x80@0 {
>>                       #address-cells = <1>;
>> @@ -178,7 +179,6 @@
>>                       spi-max-frequency = <1000000>;
>>
>>                       controller-data {
>> -                             cs-gpio = <&gpc1 2 0>;
>>                               samsung,spi-feedback-delay = <0>;
>>                       };
>>
>> diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
>> index 8a558b7..204b0de 100644
>> --- a/arch/arm/boot/dts/exynos4412-trats2.dts
>> +++ b/arch/arm/boot/dts/exynos4412-trats2.dts
>> @@ -512,6 +512,7 @@
>>       spi_1: spi@13930000 {
>>               pinctrl-names = "default";
>>               pinctrl-0 = <&spi1_bus>;
>> +             cs-gpios = <&gpb 5 0>;
>>               status = "okay";
>>
>>               s5c73m3_spi: s5c73m3 {
>> @@ -519,7 +520,6 @@
>>                       spi-max-frequency = <50000000>;
>>                       reg = <0>;
>>                       controller-data {
>> -                             cs-gpio = <&gpb 5 0>;
>>                               samsung,spi-feedback-delay = <2>;
>>                       };
>>               };
>> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> index a794a70..0c6433a 100644
>> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> @@ -316,6 +316,7 @@
>>       };
>>
>>       spi_1: spi@12d30000 {
>> +             cs-gpios = <&gpa2 5 0>;
>>               status = "okay";
>>
>>               w25q80bw@0 {
>> @@ -326,7 +327,6 @@
>>                       spi-max-frequency = <1000000>;
>>
>>                       controller-data {
>> -                             cs-gpio = <&gpa2 5 0>;
>>                               samsung,spi-feedback-delay = <0>;
>>                       };
>>
>>
>
> Best regards,
> Javier
Thanks for the in depth review.



-- 
Shine bright,
(: Nav :)
