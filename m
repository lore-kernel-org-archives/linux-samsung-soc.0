From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH 5/7] ARM: dts: enable hdmi for exynos5250 based snow board
Date: Thu, 8 May 2014 08:54:45 +0530
Message-ID: <CAPdUM4MX-ZmqQaEhEJYJG7tjw7uMqaBWWuFQFa0sJoHYR8pQRQ@mail.gmail.com>
References: <1397993044-14564-1-git-send-email-rahul.sharma@samsung.com>
	<1397993044-14564-6-git-send-email-rahul.sharma@samsung.com>
	<535DF57B.5030301@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46]:55221 "EHLO
	mail-wg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751766AbaEHDYq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 May 2014 23:24:46 -0400
In-Reply-To: <535DF57B.5030301@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>

Thanks Tushar,

On 28 April 2014 12:00, Tushar Behera <tushar.behera@linaro.org> wrote:
> On 04/20/2014 04:54 PM, Rahul Sharma wrote:
>> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>>
>> Enable support for HDMI for exynos5250 based Snow board.
>>
>> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos5250-cros-common.dtsi |   13 ++++++++++++-
>>  arch/arm/boot/dts/exynos5250-snow.dts         |    7 +++++++
>>  2 files changed, 19 insertions(+), 1 deletion(-)
>
> [ ... ]
>
>> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
>> index 52ae335..586cd38 100644
>> --- a/arch/arm/boot/dts/exynos5250-snow.dts
>> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
>> @@ -343,4 +343,11 @@
>>                       pinctrl-0 = <&ptn3460_gpios>;
>>               };
>>       };
>> +
>> +     hdmi {
>> +             hdmi-en-supply = <&tps65090_fet7>;
>
> Looks like tps65090_fet7 is not defined yet or might be not mentioned as
> dependency.
>

I should have mentioned one more dependency on Sachin's patches for
snow DTS.( https://patches.linaro.org/28325/ ). Sorry for confusion.

Regards,
Rahul Sharma.

>> +             vdd-supply = <&ldo8_reg>;
>> +             vdd_osc-supply = <&ldo10_reg>;
>> +             vdd_pll-supply = <&ldo8_reg>;
>> +     };
>>  };
>>
>
> --
> Tushar Behera
