From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH v3 3/3] ARM: dts: add dts files for xyref5260 board
Date: Sat, 15 Feb 2014 14:54:45 +0530
Message-ID: <CAPdUM4ONDr6x+CTXGXR_MzYAdktjp+4TO7FL+mJd3UdqFNkTEw@mail.gmail.com>
References: <1392385032-22015-1-git-send-email-rahul.sharma@samsung.com>
	<1392385032-22015-4-git-send-email-rahul.sharma@samsung.com>
	<52FE672A.6070803@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:38015 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751585AbaBOJYr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 15 Feb 2014 04:24:47 -0500
In-Reply-To: <52FE672A.6070803@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>

Thanks Tomasz,

On 15 February 2014 00:27, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Rahul,
>
> The patch looks good, except one issue pointed inline.
>
>
> On 14.02.2014 14:37, Rahul Sharma wrote:
>>
>> diff --git a/arch/arm/boot/dts/exynos5260-xyref5260-evt0.dts
>> b/arch/arm/boot/dts/exynos5260-xyref5260-evt0.dts
>> new file mode 100644
>> index 0000000..c4efc1e
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/exynos5260-xyref5260-evt0.dts
>
>
> [snip]
>
>
>> +&mmc_0 {
>> +       status = "okay";
>> +       num-slots = <1>;
>> +       broken-cd;
>> +       bypass-smu;
>> +       supports-highspeed;
>> +       supports-hs200-mode; /* 200 Mhz */
>> +       fifo-depth = <0x40>;
>
>
> This is a SoC-level property and it is already specified in your
> exynos5260.dtsi.
>

Tomasz,

yea correct. I will put these inside SoC node.

Regards,
Rahul Sharma.

>
>> +       card-detect-delay = <200>;
>> +       samsung,dw-mshc-ciu-div = <3>;
>> +       samsung,dw-mshc-sdr-timing = <0 4>;
>> +       samsung,dw-mshc-ddr-timing = <0 2>;
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&sd0_rdqs &sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4
>> &sd0_bus8>;
>> +
>> +       slot@0 {
>> +               reg = <0>;
>> +               bus-width = <8>;
>> +       };
>> +};
>> +
>> +&mmc_2 {
>> +       status = "okay";
>> +       num-slots = <1>;
>> +       supports-highspeed;
>> +       fifo-depth = <0x40>;
>
>
> Ditto.
>
> Best regards,
> Tomasz
