From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: dts: Add pwmX_out pinctrl nodes to Exynos5420
Date: Fri, 02 May 2014 19:32:45 +0200
Message-ID: <5363D6BD.6070001@gmail.com>
References: <1399034937-24683-1-git-send-email-arun.kk@samsung.com> <CAD=FV=V30qfsRfFZ7LXnF9VmMo5dGJx6FfOaKwGrLtS5_r7PGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f41.google.com ([209.85.216.41]:55959 "EHLO
	mail-qa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752933AbaEBRcq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 May 2014 13:32:46 -0400
In-Reply-To: <CAD=FV=V30qfsRfFZ7LXnF9VmMo5dGJx6FfOaKwGrLtS5_r7PGQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>, Arun Kumar K <arun.kk@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Arun Kumar <arunkk.samsung@gmail.com>

Hi,

On 02.05.2014 17:44, Doug Anderson wrote:
> Arun,
>
> On Fri, May 2, 2014 at 5:48 AM, Arun Kumar K <arun.kk@samsung.com> wrote:
>> Adds the PWM nodes to 5420 pinctrl dtsi file.
>>
>> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos5420-pinctrl.dtsi |   28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
>> index e62c8eb..ba686e4 100644
>> --- a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
>> +++ b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
>> @@ -624,6 +624,34 @@
>>                          samsung,pin-drv = <0>;
>>                  };
>>
>> +               pwm0_out: pwm0-out {
>> +                       samsung,pins = "gpb2-0";
>> +                       samsung,pin-function = <2>;
>> +                       samsung,pin-pud = <0>;
>> +                       samsung,pin-drv = <0>;
>> +               };
>> +
>> +               pwm1_out: pwm1-out {
>> +                       samsung,pins = "gpb2-1";
>> +                       samsung,pin-function = <2>;
>> +                       samsung,pin-pud = <0>;
>> +                       samsung,pin-drv = <0>;
>> +               };
>> +
>> +               pwm2_out: pwm2-out {
>> +                       samsung,pins = "gpb2-2";
>> +                       samsung,pin-function = <2>;
>> +                       samsung,pin-pud = <0>;
>> +                       samsung,pin-drv = <0>;
>> +               };
>> +
>> +               pwm3_out: pwm3-out {
>> +                       samsung,pins = "gpb2-3";
>> +                       samsung,pin-function = <2>;
>> +                       samsung,pin-pud = <0>;
>> +                       samsung,pin-drv = <0>;
>> +               };
>> +
>>                  i2c7_hs_bus: i2c7-hs-bus {
>>                          samsung,pins = "gpb2-2", "gpb2-3";
>>                          samsung,pin-function = <3>;
>
> Possibly pwm3-out belongs below this one (since the start pin is
> "larger" than the start pin of i2c7-hs-bus).  Tomasz probably has a
> definite opinion on this.

Well, I'm not opposed to keeping it as is. Having all the pwm nodes 
together might be even more readable.

So feel free to add my Reviewed-by tag.

Best regards,
Tomasz
