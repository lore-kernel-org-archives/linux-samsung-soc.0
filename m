From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: Re: [PATCH] ARM: DT: Exynos: fix number of interrupt-cells in mct node
Date: Mon, 12 Aug 2013 11:53:22 +0530
Message-ID: <CANuQgHEq3QA_zE1axnXqCdv8RLXHTfv3wVn59gHSk3jEPtLiXQ@mail.gmail.com>
References: <1371220886-11616-1-git-send-email-chander.kashyap@linaro.org>
	<CANuQgHH+nebJf4HPrsWPLECyvWO8OGJj=YeDG4GQAmLHM8GrPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:44276 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750794Ab3HLGXW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Aug 2013 02:23:22 -0400
Received: by mail-ob0-f176.google.com with SMTP id uz19so8348855obc.35
        for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Aug 2013 23:23:22 -0700 (PDT)
In-Reply-To: <CANuQgHH+nebJf4HPrsWPLECyvWO8OGJj=YeDG4GQAmLHM8GrPw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "t.figa@samsung.com" <t.figa@samsung.com>, "thomas.ab@samsung.com" <thomas.ab@samsung.com>, Chander Kashyap <chander.kashyap@linaro.org>

ping

On 23 July 2013 15:17, Chander Kashyap <chander.kashyap@linaro.org> wrote:
> ping.
>
> On 14 June 2013 20:11, Chander Kashyap <chander.kashyap@linaro.org> wrote:
>> Two cells were used to specify interrupts in mct node, while second cell
>> always remains unused. Hence use only one cell.
>> Suggested by Tomasz Figa.
>>
>> Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
>> ---
>>  arch/arm/boot/dts/exynos4210.dtsi |   19 +++++++++----------
>>  arch/arm/boot/dts/exynos4212.dtsi |   19 +++++++++----------
>>  arch/arm/boot/dts/exynos4412.dtsi |   23 +++++++++++------------
>>  arch/arm/boot/dts/exynos5250.dtsi |   19 +++++++++----------
>>  4 files changed, 38 insertions(+), 42 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
>> index 54710de..ad50010 100644
>> --- a/arch/arm/boot/dts/exynos4210.dtsi
>> +++ b/arch/arm/boot/dts/exynos4210.dtsi
>> @@ -52,23 +52,22 @@
>>                 compatible = "samsung,exynos4210-mct";
>>                 reg = <0x10050000 0x800>;
>>                 interrupt-controller;
>> -               #interrups-cells = <2>;
>> +               #interrups-cells = <1>;
>>                 interrupt-parent = <&mct_map>;
>> -               interrupts = <0 0>, <1 0>, <2 0>, <3 0>,
>> -                            <4 0>, <5 0>;
>> +               interrupts = <0>, <1>, <2>, <3>, <4>, <5>;
>>                 clocks = <&clock 3>, <&clock 344>;
>>                 clock-names = "fin_pll", "mct";
>>
>>                 mct_map: mct-map {
>> -                       #interrupt-cells = <2>;
>> +                       #interrupt-cells = <1>;
>>                         #address-cells = <0>;
>>                         #size-cells = <0>;
>> -                       interrupt-map = <0x0 0 &gic 0 57 0>,
>> -                                       <0x1 0 &gic 0 69 0>,
>> -                                       <0x2 0 &combiner 12 6>,
>> -                                       <0x3 0 &combiner 12 7>,
>> -                                       <0x4 0 &gic 0 42 0>,
>> -                                       <0x5 0 &gic 0 48 0>;
>> +                       interrupt-map = <0 &gic 0 57 0>,
>> +                                       <1 &gic 0 69 0>,
>> +                                       <2 &combiner 12 6>,
>> +                                       <3 &combiner 12 7>,
>> +                                       <4 &gic 0 42 0>,
>> +                                       <5 &gic 0 48 0>;
>>                 };
>>         };
>>
>> diff --git a/arch/arm/boot/dts/exynos4212.dtsi b/arch/arm/boot/dts/exynos4212.dtsi
>> index c0f60f4..ba9ada1 100644
>> --- a/arch/arm/boot/dts/exynos4212.dtsi
>> +++ b/arch/arm/boot/dts/exynos4212.dtsi
>> @@ -39,21 +39,20 @@
>>                 compatible = "samsung,exynos4412-mct";
>>                 reg = <0x10050000 0x800>;
>>                 interrupt-controller;
>> -               #interrups-cells = <2>;
>> +               #interrups-cells = <1>;
>>                 interrupt-parent = <&mct_map>;
>> -               interrupts = <0 0>, <1 0>, <2 0>, <3 0>,
>> -                            <4 0>, <5 0>;
>> +               interrupts = <0>, <1>, <2>, <3>, <4>, <5>;
>>
>>                 mct_map: mct-map {
>> -                       #interrupt-cells = <2>;
>> +                       #interrupt-cells = <>;
>>                         #address-cells = <0>;
>>                         #size-cells = <0>;
>> -                       interrupt-map = <0x0 0 &gic 0 57 0>,
>> -                                       <0x1 0 &combiner 12 5>,
>> -                                       <0x2 0 &combiner 12 6>,
>> -                                       <0x3 0 &combiner 12 7>,
>> -                                       <0x4 0 &gic 1 12 0>,
>> -                                       <0x5 0 &gic 1 12 0>;
>> +                       interrupt-map = <0 &gic 0 57 0>,
>> +                                       <1 &combiner 12 5>,
>> +                                       <2 &combiner 12 6>,
>> +                                       <3 &combiner 12 7>,
>> +                                       <4 &gic 1 12 0>,
>> +                                       <5 &gic 1 12 0>;
>>                 };
>>         };
>>  };
>> diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
>> index 270b389..a680de7 100644
>> --- a/arch/arm/boot/dts/exynos4412.dtsi
>> +++ b/arch/arm/boot/dts/exynos4412.dtsi
>> @@ -39,25 +39,24 @@
>>                 compatible = "samsung,exynos4412-mct";
>>                 reg = <0x10050000 0x800>;
>>                 interrupt-controller;
>> -               #interrups-cells = <2>;
>> +               #interrups-cells = <1>;
>>                 interrupt-parent = <&mct_map>;
>> -               interrupts = <0 0>, <1 0>, <2 0>, <3 0>,
>> -                            <4 0>, <5 0>, <6 0>, <7 0>;
>> +               interrupts = <0>, <1>, <2>, <3>, <4>, <5>, <6>, <7>;
>>                 clocks = <&clock 3>, <&clock 344>;
>>                 clock-names = "fin_pll", "mct";
>>
>>                 mct_map: mct-map {
>> -                       #interrupt-cells = <2>;
>> +                       #interrupt-cells = <1>;
>>                         #address-cells = <0>;
>>                         #size-cells = <0>;
>> -                       interrupt-map = <0x0 0 &gic 0 57 0>,
>> -                                       <0x1 0 &combiner 12 5>,
>> -                                       <0x2 0 &combiner 12 6>,
>> -                                       <0x3 0 &combiner 12 7>,
>> -                                       <0x4 0 &gic 1 12 0>,
>> -                                       <0x5 0 &gic 1 12 0>,
>> -                                       <0x6 0 &gic 1 12 0>,
>> -                                       <0x7 0 &gic 1 12 0>;
>> +                       interrupt-map = <0 &gic 0 57 0>,
>> +                                       <1 &combiner 12 5>,
>> +                                       <2 &combiner 12 6>,
>> +                                       <3 &combiner 12 7>,
>> +                                       <4 &gic 1 12 0>,
>> +                                       <5 &gic 1 12 0>,
>> +                                       <6 &gic 1 12 0>,
>> +                                       <7 &gic 1 12 0>;
>>                 };
>>         };
>>
>> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
>> index a7cf3f5..4e633ef 100644
>> --- a/arch/arm/boot/dts/exynos5250.dtsi
>> +++ b/arch/arm/boot/dts/exynos5250.dtsi
>> @@ -94,23 +94,22 @@
>>                 compatible = "samsung,exynos4210-mct";
>>                 reg = <0x101C0000 0x800>;
>>                 interrupt-controller;
>> -               #interrups-cells = <2>;
>> +               #interrups-cells = <1>;
>>                 interrupt-parent = <&mct_map>;
>> -               interrupts = <0 0>, <1 0>, <2 0>, <3 0>,
>> -                            <4 0>, <5 0>;
>> +               interrupts = <0>, <1>, <2>, <3>, <4>, <5>;
>>                 clocks = <&clock 1>, <&clock 335>;
>>                 clock-names = "fin_pll", "mct";
>>
>>                 mct_map: mct-map {
>> -                       #interrupt-cells = <2>;
>> +                       #interrupt-cells = <1>;
>>                         #address-cells = <0>;
>>                         #size-cells = <0>;
>> -                       interrupt-map = <0x0 0 &combiner 23 3>,
>> -                                       <0x1 0 &combiner 23 4>,
>> -                                       <0x2 0 &combiner 25 2>,
>> -                                       <0x3 0 &combiner 25 3>,
>> -                                       <0x4 0 &gic 0 120 0>,
>> -                                       <0x5 0 &gic 0 121 0>;
>> +                       interrupt-map = <0 &combiner 23 3>,
>> +                                       <1 &combiner 23 4>,
>> +                                       <2 &combiner 25 2>,
>> +                                       <3 &combiner 25 3>,
>> +                                       <4 &gic 0 120 0>,
>> +                                       <5 &gic 0 121 0>;
>>                 };
>>         };
>>
>> --
>> 1.7.9.5
>>
>
>
>
> --
> with warm regards,
> Chander Kashyap



-- 
with warm regards,
Chander Kashyap
