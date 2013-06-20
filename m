From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 2/5] ARM: dts: exynos5420: add dt nodes for hdmi subsystem
Date: Thu, 20 Jun 2013 12:13:23 +0530
Message-ID: <CAPdUM4PyJ0FN9N+LnbJRxxGsQuVD8HuW=eyV0q_sRGdrow6aTw@mail.gmail.com>
References: <1371706911-27016-1-git-send-email-rahul.sharma@samsung.com>
	<1371706911-27016-3-git-send-email-rahul.sharma@samsung.com>
	<CAK9yfHx+Ekrs1f=zquoSyjozsVwkWd18NLp+yadoSAbn_1008Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qe0-f50.google.com ([209.85.128.50]:47435 "EHLO
	mail-qe0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753498Ab3FTGnY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 02:43:24 -0400
Received: by mail-qe0-f50.google.com with SMTP id f6so3699754qej.23
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jun 2013 23:43:23 -0700 (PDT)
In-Reply-To: <CAK9yfHx+Ekrs1f=zquoSyjozsVwkWd18NLp+yadoSAbn_1008Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, tomasz.figa@gmail.com, rob.herring@calxeda.com, s.nawrocki@samsung.com, grant.likely@linaro.org, joshi@samsung.com

ok Sachin. Thanks.

On Thu, Jun 20, 2013 at 12:08 PM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> On 20 June 2013 11:11, Rahul Sharma <rahul.sharma@samsung.com> wrote:
>> Add hdmi, mixer, ddc device tree nodes for Exynos 5420 SoC.
>>
>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos5420-smdk5420.dts |   15 +++++++++++++++
>>  arch/arm/boot/dts/exynos5420.dtsi         |   12 ++++++++++++
>>  2 files changed, 27 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
>> index 08607df..b3721bd 100644
>> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
>> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
>> @@ -30,4 +30,19 @@
>>                         clock-frequency = <24000000>;
>>                 };
>>         };
>> +
>> +       hdmi {
>> +               hpd-gpio = <&gpx3 7 0>;
>> +       };
>> +
>> +       i2c_2: i2c@12C80000 {
>> +               samsung,i2c-sda-delay = <100>;
>> +               samsung,i2c-max-bus-freq = <66000>;
>> +               status = "okay";
>> +
>> +               hdmiddc@50 {
>> +                       compatible = "samsung,exynos4210-hdmiddc";
>> +                       reg = <0x50>;
>> +               };
>> +       };
>>  };
>> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
>> index b0ec047..45aadf9 100644
>> --- a/arch/arm/boot/dts/exynos5420.dtsi
>> +++ b/arch/arm/boot/dts/exynos5420.dtsi
>> @@ -201,4 +201,16 @@
>>                 clock-names = "i2c";
>>                 status = "disabled";
>>         };
>> +
>> +       hdmi {
>> +               compatible = "samsung,exynos4212-hdmi";
>> +               reg = <0x14530000 0x70000>;
>> +               interrupts = <0 95 0>;
>> +       };
>> +
>> +       mixer: mixer@14450000 {
>> +               compatible = "samsung,exynos5420-mixer";
>> +               reg = <0x14450000 0x10000>;
>> +               interrupts = <0 94 0>;
>> +       };
>
> If these are the parent nodes, disable them here and enable in the board files.
>
>
> --
> With warm regards,
> Sachin
