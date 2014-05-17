From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: Add pwmX_out pinctrl nodes to Exynos5250
Date: Sun, 18 May 2014 02:13:22 +0530
Message-ID: <CAEC9eQMUEAc45+5t_e-3DfFBxuainG8iFOz9qq=OAN2nigVDrg@mail.gmail.com>
References: <1399542642-10001-1-git-send-email-ajaykumar.rs@samsung.com>
	<048c01cf7102$4c2266f0$e46734d0$@samsung.com>
	<5376A7BF.9010702@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f172.google.com ([209.85.220.172]:37400 "EHLO
	mail-vc0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751101AbaEQUnX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 17 May 2014 16:43:23 -0400
Received: by mail-vc0-f172.google.com with SMTP id hr9so7957662vcb.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 17 May 2014 13:43:22 -0700 (PDT)
In-Reply-To: <5376A7BF.9010702@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

Hi Kukjin,

On Sat, May 17, 2014 at 5:35 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> On 05/16/14 21:28, Kukjin Kim wrote:
>>
>> Ajay Kumar wrote:
>>>
>>>
>>> Adds the PWM nodes to 5250 pinctrl dtsi file.
>>>
>>> Signed-off-by: Ajay Kumar<ajaykumar.rs@samsung.com>
>>> ---
>>>   arch/arm/boot/dts/exynos5250-pinctrl.dtsi |   28
>>> ++++++++++++++++++++++++++++
>>>   1 file changed, 28 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
>>> b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
>>> index 9a49e68..886cfca 100644
>>> --- a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
>>> +++ b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
>>> @@ -351,6 +351,34 @@
>>>                         samsung,pin-drv =<0>;
>>>                 };
>>>
>>> +               pwm0_out: pwm0-out {
>>> +                       samsung,pins = "gpb2-0";
>>> +                       samsung,pin-function =<2>;
>>> +                       samsung,pin-pud =<0>;
>>> +                       samsung,pin-drv =<0>;
>>> +               };
>>> +
>>> +               pwm1_out: pwm1-out {
>>> +                       samsung,pins = "gpb2-1";
>>> +                       samsung,pin-function =<2>;
>>> +                       samsung,pin-pud =<0>;
>>> +                       samsung,pin-drv =<0>;
>>> +               };
>>> +
>>> +               pwm2_out: pwm2-out {
>>> +                       samsung,pins = "gpb2-2";
>>> +                       samsung,pin-function =<2>;
>>> +                       samsung,pin-pud =<0>;
>>> +                       samsung,pin-drv =<0>;
>>> +               };
>>> +
>>> +               pwm3_out: pwm3-out {
>>> +                       samsung,pins = "gpb2-3";
>>> +                       samsung,pin-function =<2>;
>>> +                       samsung,pin-pud =<0>;
>>> +                       samsung,pin-drv =<0>;
>>> +               };
>>> +
>>>                 i2c7_bus: i2c7-bus {
>>>                         samsung,pins = "gpb2-2", "gpb2-3";
>>>                         samsung,pin-function =<3>;
>>> --
>>> 1.7.9.5
>>
>>
>> Looks good to me, applied this and 2nd one.
>>
> Oops, I can't find the branch including this patches and your patches in my
> mailbox...can you please send this patches again including linux-arm-kernel
> ml?

These patches were created against the "for-next" branch.
Anyways, I will add the branch name and resend after including
linux-arm-kernel ml.

Regards,
Ajay
