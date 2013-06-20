From: Arun Kumar K <arunkk.samsung@gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: Add MFC node for exynos 5420
Date: Thu, 20 Jun 2013 10:00:56 +0530
Message-ID: <CALt3h7-xxSUtwqeVRNHKmqd1xk3eNnOe7upmUN2E8CN0xzv8hQ@mail.gmail.com>
References: <1371631969-10076-1-git-send-email-arun.kk@samsung.com>
	<1371631969-10076-2-git-send-email-arun.kk@samsung.com>
	<CANuQgHGR1vDgz6TkCYKr5XtBLVdXng+tF90NShae_4Cqse3G+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f174.google.com ([209.85.128.174]:44823 "EHLO
	mail-ve0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751556Ab3FTEa6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 00:30:58 -0400
Received: by mail-ve0-f174.google.com with SMTP id oz10so4748531veb.33
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jun 2013 21:30:57 -0700 (PDT)
In-Reply-To: <CANuQgHGR1vDgz6TkCYKr5XtBLVdXng+tF90NShae_4Cqse3G+g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chander Kashyap <chander.kashyap@linaro.org>
Cc: Arun Kumar K <arun.kk@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>

Hi Chander,

On Wed, Jun 19, 2013 at 5:34 PM, Chander Kashyap
<chander.kashyap@linaro.org> wrote:
> On 19 June 2013 14:22, Arun Kumar K <arun.kk@samsung.com> wrote:
>> The patch adds MFC nodes for exynos 5420 and for
>> smdk 5420 board.
>>
>> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos5420-smdk5420.dts |    5 +++++
>>  arch/arm/boot/dts/exynos5420.dtsi         |    8 ++++++++
>>  2 files changed, 13 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
>> index 08607df..682532c 100644
>> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
>> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
>> @@ -30,4 +30,9 @@
>>                         clock-frequency = <24000000>;
>>                 };
>>         };
>> +
>> +       codec@11000000 {
>> +               samsung,mfc-r = <0x43000000 0x800000>;
>> +               samsung,mfc-l = <0x51000000 0x800000>;
>> +       };
>>  };
>> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
>> index 8474d63..cb74356 100644
>> --- a/arch/arm/boot/dts/exynos5420.dtsi
>> +++ b/arch/arm/boot/dts/exynos5420.dtsi
>> @@ -100,4 +100,12 @@
>>                 clocks = <&clock 260>, <&clock 131>;
>>                 clock-names = "uart", "clk_uart_baud0";
>>         };
>> +
>> +       codec@11000000 {
>> +               compatible = "samsung,mfc-v7";
>> +               reg = <0x11000000 0x10000>;
>> +               interrupts = <0 96 0>;
>> +               clocks = <&clock 401>;
>> +               clock-names = "mfc";
>> +       };
> Is it not possible to move the common part of this node to common
> exynos5.dtsi? As exynos5250 is using same property values.

Yes that can be done. I have kept it separate as the IP is different
and compatible is also changing. But the reg and interrupt remains same
and hopefully that can be moved to common exynos5.dtsi.

Regards
Arun
