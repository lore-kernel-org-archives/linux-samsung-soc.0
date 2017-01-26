From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: exynos: Add initial configuration for
 DISP clocks for TM2/TM2e
Date: Thu, 26 Jan 2017 16:20:22 +0100
Message-ID: <081f6c7d-2d48-933f-f13b-cb9a0ae7b4b0@samsung.com>
References: <CGME20170126123806eucas1p2dfbb67c5248e6c3dd979bdd343a3b7cb@eucas1p2.samsung.com>
 <1485434274-6579-1-git-send-email-m.szyprowski@samsung.com>
 <1485434274-6579-4-git-send-email-m.szyprowski@samsung.com>
 <CAGTfZH1A49arLe3nRfeYS02M-8052SU6xqhvPMYg_8hRO3yYBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:44754 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752773AbdAZPU2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 10:20:28 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OKE00MYW7Y0BQ60@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Jan 2017 15:20:24 +0000 (GMT)
In-reply-to: <CAGTfZH1A49arLe3nRfeYS02M-8052SU6xqhvPMYg_8hRO3yYBA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: cwchoi00@gmail.com, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On 26.01.2017 15:49, Chanwoo Choi wrote:
> Hi Marek
>
> 2017-01-26 21:37 GMT+09:00 Marek Szyprowski <m.szyprowski@samsung.com>:
>> Add initial clock configuration for display subsystem for Exynos5433
>> based TM2/TM2e boards in device tree in order to avoid dependency on the
>> configuration left by the bootloader. This initial configuration is also
>> needed to ensure that display subsystem is operational if display power
>> domain gets turned off before clock controller is probed and the inital
>> clock configuration left by the bootloader saved.
>>
>> TM2 and TM2e uses different rate for DISP PLL clock, but for better
>> maintainability all 'assigned-clocks-*' properties for DISP CMU are
>> defines in each board dts instead of redefining the rates property.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>  .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 12 ---------
>>  arch/arm64/boot/dts/exynos/exynos5433-tm2.dts      | 29 ++++++++++++++++++++++
>>  arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts     | 29 ++++++++++++++++++++++
>>  3 files changed, 58 insertions(+), 12 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
>> index 5c207575ed0a..1c1c03142e6d 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
>> @@ -217,18 +217,6 @@
>>         assigned-clock-parents = <&cmu_top CLK_FOUT_AUD_PLL>;
>>  };
>>
>> -&cmu_disp {
>> -       assigned-clocks = <&cmu_mif CLK_MOUT_SCLK_DECON_TV_ECLK_A>,
>> -                         <&cmu_mif CLK_DIV_SCLK_DECON_TV_ECLK>,
>> -                         <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>,
>> -                         <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK>;
>> -       assigned-clock-parents = <&cmu_mif CLK_MOUT_BUS_PLL_DIV2>,
>> -                                <0>,
>> -                                <&cmu_mif CLK_SCLK_DECON_TV_ECLK_DISP>,
>> -                                <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>;
>> -       assigned-clock-rates = <0>, <400000000>;
>> -};
>> -
>>  &cmu_fsys {
>>         assigned-clocks = <&cmu_top CLK_MOUT_SCLK_USBDRD30>,
>>                 <&cmu_top CLK_MOUT_SCLK_USBHOST30>,
>> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
>> index ddba2f889326..b8bb053495af 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
>> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
>> @@ -18,6 +18,35 @@
>>         compatible = "samsung,tm2", "samsung,exynos5433";
>>  };
>>
>> +&cmu_disp {
>> +       assigned-clocks = <&cmu_disp CLK_FOUT_DISP_PLL>,
>> +                         <&cmu_mif CLK_DIV_SCLK_DECON_TV_ECLK>,
>> +                         <&cmu_disp CLK_MOUT_ACLK_DISP_333_USER>,
>> +                         <&cmu_disp CLK_MOUT_SCLK_DSIM0_USER>,
>> +                         <&cmu_disp CLK_MOUT_SCLK_DSIM0>,
>> +                         <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK_USER>,
>> +                         <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK>,
>> +                         <&cmu_disp CLK_MOUT_PHYCLK_MIPIDPHY0_RXCLKESC0_USER>,
>> +                         <&cmu_disp CLK_MOUT_PHYCLK_MIPIDPHY0_BITCLKDIV8_USER>,
>> +                         <&cmu_disp CLK_MOUT_DISP_PLL>,
>> +                         <&cmu_mif CLK_MOUT_SCLK_DECON_TV_ECLK_A>,
>> +                         <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>,
>> +                         <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK>;
>> +       assigned-clock-parents = <0>, <0>,
>> +                                <&cmu_mif CLK_ACLK_DISP_333>,
>> +                                <&cmu_mif CLK_SCLK_DSIM0_DISP>,
>> +                                <&cmu_disp CLK_MOUT_SCLK_DSIM0_USER>,
>> +                                <&cmu_mif CLK_SCLK_DECON_ECLK_DISP>,
>> +                                <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK_USER>,
>> +                                <&cmu_disp CLK_PHYCLK_MIPIDPHY0_RXCLKESC0_PHY>,
>> +                                <&cmu_disp CLK_PHYCLK_MIPIDPHY0_BITCLKDIV8_PHY>,
>> +                                <&cmu_disp CLK_FOUT_DISP_PLL>,
>> +                                <&cmu_mif CLK_MOUT_BUS_PLL_DIV2>,
>> +                                <&cmu_mif CLK_SCLK_DECON_TV_ECLK_DISP>,
>> +                                <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>;
>> +       assigned-clock-rates = <250000000>, <400000000>;
>> +};
>> +
>>  &hsi2c_9 {
>>         status = "okay";
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
>> index d8bca75a1afe..c27500b7d8b5 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
>> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
>> @@ -18,6 +18,35 @@
>>         compatible = "samsung,tm2e", "samsung,exynos5433";
>>  };
>>
>> +&cmu_disp {
>> +       assigned-clocks = <&cmu_disp CLK_FOUT_DISP_PLL>,
>> +                         <&cmu_mif CLK_DIV_SCLK_DECON_TV_ECLK>,
>> +                         <&cmu_disp CLK_MOUT_ACLK_DISP_333_USER>,
>> +                         <&cmu_disp CLK_MOUT_SCLK_DSIM0_USER>,
>> +                         <&cmu_disp CLK_MOUT_SCLK_DSIM0>,
>> +                         <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK_USER>,
>> +                         <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK>,
>> +                         <&cmu_disp CLK_MOUT_PHYCLK_MIPIDPHY0_RXCLKESC0_USER>,
>> +                         <&cmu_disp CLK_MOUT_PHYCLK_MIPIDPHY0_BITCLKDIV8_USER>,
>> +                         <&cmu_disp CLK_MOUT_DISP_PLL>,
>> +                         <&cmu_mif CLK_MOUT_SCLK_DECON_TV_ECLK_A>,
>> +                         <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>,
>> +                         <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK>;
>> +       assigned-clock-parents = <0>, <0>,
>> +                                <&cmu_mif CLK_ACLK_DISP_333>,
>> +                                <&cmu_mif CLK_SCLK_DSIM0_DISP>,
>> +                                <&cmu_disp CLK_MOUT_SCLK_DSIM0_USER>,
>> +                                <&cmu_mif CLK_SCLK_DECON_ECLK_DISP>,
>> +                                <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK_USER>,
>> +                                <&cmu_disp CLK_PHYCLK_MIPIDPHY0_RXCLKESC0_PHY>,
>> +                                <&cmu_disp CLK_PHYCLK_MIPIDPHY0_BITCLKDIV8_PHY>,
>> +                                <&cmu_disp CLK_FOUT_DISP_PLL>,
>> +                                <&cmu_mif CLK_MOUT_BUS_PLL_DIV2>,
>> +                                <&cmu_mif CLK_SCLK_DECON_TV_ECLK_DISP>,
>> +                                <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>;
>> +       assigned-clock-rates = <278000000>, <400000000>;
> Except for setting the assigned-clock-rate for CLK_FOUT_DISP_PLL,
> tm2.dts and tm2e.dts has the same dt node of cmu_disp.
> If there is same value between tm2 and tm2e, you should keep the same value
> in exynos5433-tm2-common.dtsi.
>
> So, I think that exynos5433-tm2-common.dtsi include the relationships
> between clocks and parent clocks as following without assigning the clocks.
>
> And then, each tm2 and tm2e.dts can assign the clock rate for CLK_FOUT_DISP_PLL
> and CLK_DIV_SCLK_DECON_TV_ECLK.
>
> For example,
> In exynos5433-tm2-common.dtsi
>
> &cmu_disp {
>        assigned-clocks = <&cmu_disp CLK_FOUT_DISP_PLL>,
>                          <&cmu_mif CLK_DIV_SCLK_DECON_TV_ECLK>,
>                          <&cmu_disp CLK_MOUT_ACLK_DISP_333_USER>,
>                          <&cmu_disp CLK_MOUT_SCLK_DSIM0_USER>,
>                          <&cmu_disp CLK_MOUT_SCLK_DSIM0>,
>                          <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK_USER>,
>                          <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK>,
>                          <&cmu_disp CLK_MOUT_PHYCLK_MIPIDPHY0_RXCLKESC0_USER>,
>                          <&cmu_disp CLK_MOUT_PHYCLK_MIPIDPHY0_BITCLKDIV8_USER>,
>                          <&cmu_disp CLK_MOUT_DISP_PLL>,
>                          <&cmu_mif CLK_MOUT_SCLK_DECON_TV_ECLK_A>,
>                          <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>,
>                          <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK>;
>        assigned-clock-parents = <0>, <0>,
>                                 <&cmu_mif CLK_ACLK_DISP_333>,
>                                 <&cmu_mif CLK_SCLK_DSIM0_DISP>,
>                                 <&cmu_disp CLK_MOUT_SCLK_DSIM0_USER>,
>                                 <&cmu_mif CLK_SCLK_DECON_ECLK_DISP>,
>                                 <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK_USER>,
>                                 <&cmu_disp CLK_PHYCLK_MIPIDPHY0_RXCLKESC0_PHY>,
>                                 <&cmu_disp CLK_PHYCLK_MIPIDPHY0_BITCLKDIV8_PHY>,
>                                 <&cmu_disp CLK_FOUT_DISP_PLL>,
>                                 <&cmu_mif CLK_MOUT_BUS_PLL_DIV2>,
>                                 <&cmu_mif CLK_SCLK_DECON_TV_ECLK_DISP>,
>                                 <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>;
>     };
>
>
> In exynos5433-tm2.dts
> &cmu_disp {
>      assigned-clocks = <&cmu_disp CLK_FOUT_DISP_PLL>,
>                                    <&cmu_mif CLK_DIV_SCLK_DECON_TV_ECLK>;
>      assigned-clock-rates = <250000000>, <400000000>;
> };
>
>
> In exynos5433-tm2e.dts
> &cmu_disp {
>      assigned-clocks = <&cmu_disp CLK_FOUT_DISP_PLL>,
>                                   <&cmu_mif CLK_DIV_SCLK_DECON_TV_ECLK>;
>      assigned-clock-rates = <278000000>, <400000000>;
> };
>
I guess in such case common properties will be overwritten.

If one really want to put as much as possible into common part it could
be done this way:

exynos5433-tm2.dts before '#include "exynos5433-tm2-common.dtsi"':

#define CLK_FOUT_DISP_PLL_RATE 250000000

exynos5433-tm2e.dts before '#include "exynos5433-tm2-common.dtsi"':

#define CLK_FOUT_DISP_PLL_RATE 278000000

and in exynos5433-tm2-common.dtsi:

+&cmu_disp {
+       assigned-clocks = <&cmu_disp CLK_FOUT_DISP_PLL>,
+                         <&cmu_mif CLK_DIV_SCLK_DECON_TV_ECLK>,
+                         <&cmu_disp CLK_MOUT_ACLK_DISP_333_USER>,
+                         <&cmu_disp CLK_MOUT_SCLK_DSIM0_USER>,
+                         <&cmu_disp CLK_MOUT_SCLK_DSIM0>,
+                         <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK_USER>,
+                         <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK>,
+                         <&cmu_disp CLK_MOUT_PHYCLK_MIPIDPHY0_RXCLKESC0_USER>,
+                         <&cmu_disp CLK_MOUT_PHYCLK_MIPIDPHY0_BITCLKDIV8_USER>,
+                         <&cmu_disp CLK_MOUT_DISP_PLL>,
+                         <&cmu_mif CLK_MOUT_SCLK_DECON_TV_ECLK_A>,
+                         <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>,
+                         <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK>;
+       assigned-clock-parents = <0>, <0>,
+                                <&cmu_mif CLK_ACLK_DISP_333>,
+                                <&cmu_mif CLK_SCLK_DSIM0_DISP>,
+                                <&cmu_disp CLK_MOUT_SCLK_DSIM0_USER>,
+                                <&cmu_mif CLK_SCLK_DECON_ECLK_DISP>,
+                                <&cmu_disp CLK_MOUT_SCLK_DECON_ECLK_USER>,
+                                <&cmu_disp CLK_PHYCLK_MIPIDPHY0_RXCLKESC0_PHY>,
+                                <&cmu_disp CLK_PHYCLK_MIPIDPHY0_BITCLKDIV8_PHY>,
+                                <&cmu_disp CLK_FOUT_DISP_PLL>,
+                                <&cmu_mif CLK_MOUT_BUS_PLL_DIV2>,
+                                <&cmu_mif CLK_SCLK_DECON_TV_ECLK_DISP>,
+                                <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>;
+       assigned-clock-rates = <CLK_FOUT_DISP_PLL_RATE>, <400000000>;
+};
+

The question is if such macro games will be accepted? :)

Regards

Andrzej
