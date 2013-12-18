From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [RESEND] [PATCH] ARM: dts: exynos5: add pwm DT nodes to Exynos5250
 and Exynos5420
Date: Thu, 19 Dec 2013 02:40:11 +0900
Message-ID: <52B1DDFB.4030104@samsung.com>
References: <1381383731-4359-1-git-send-email-l.krishna@samsung.com> <CAK9yfHyB=Uqjg1HhMx6BXSihDmwRpmpkeLrm2YgDj2Yyo4ySuA@mail.gmail.com> <CAL1wa8e0e1NwrntEPTnm8=_bSXj3k=Gk+jenphYPEAh8tXKwiA@mail.gmail.com> <086801cedf9b$cef3c450$6cdb4cf0$@org> <CAL1wa8dsNkDj1pPUgrEB+7T378Gh=-AFXAn8CAe90y8aCZ9vHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:53300 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752104Ab3LRRkR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 12:40:17 -0500
In-Reply-To: <CAL1wa8dsNkDj1pPUgrEB+7T378Gh=-AFXAn8CAe90y8aCZ9vHA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, abrestic@chromium.org, olofj@chromium.org

On 12/12/13 20:35, Leela Krishna Amudala wrote:
> Hi Kukjin,
>
> Even though you said it is applied, I didn't see this patch in any of
> your trees.
> Can you kindly look into this patch and take necessary action..?
>
Applied, thanks.
Kukjin

> Best Wishes,
> Leela Krishna.
>
> On Tue, Nov 12, 2013 at 8:39 PM, Kukjin Kim<kgene@kernel.org>  wrote:
>> Leela Krishna Amudala wrote:
>>>
>>> Hi Sachin,
>>>
>>> On Thu, Oct 10, 2013 at 11:18 AM, Sachin Kamat<sachin.kamat@linaro.org>
>>> wrote:
>>>> Hi Leela,
>>>>
>>>> On 10 October 2013 11:12, Leela Krishna Amudala<l.krishna@samsung.com>
>>> wrote:
>>>>> Add the device-tree binding for the PWM controller to Exynos5250 and
>>> Exynos5420
>>>>>
>>>>> Signed-off-by: Andrew Bresticker<abrestic@chromium.org>
>>>>> Signed-off-by: Olof Johansson<olofj@chromium.org>
>>>>> Signed-off-by: Leela Krishna Amudala<l.krishna@samsung.com>
>>>>> ---
>>>>>   arch/arm/boot/dts/exynos5250.dtsi |    9 +++++++++
>>>>>   arch/arm/boot/dts/exynos5420.dtsi |    9 +++++++++
>>>>>   2 files changed, 18 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
>>> b/arch/arm/boot/dts/exynos5250.dtsi
>>>>> index 864ae90..99abc72 100644
>>>>> --- a/arch/arm/boot/dts/exynos5250.dtsi
>>>>> +++ b/arch/arm/boot/dts/exynos5250.dtsi
>>>>> @@ -521,6 +521,15 @@
>>>>>                  };
>>>>>          };
>>>>>
>>>>> +       pwm: pwm@12dd0000 {
>>>>> +               compatible = "samsung,exynos4210-pwm";
>>>>> +               reg =<0x12dd0000 0x100>;
>>>>> +               samsung,pwm-outputs =<0>,<1>,<2>,<3>;
>>>>> +               #pwm-cells =<3>;
>>>>> +               clocks =<&clock 311>;
>>>>> +               clock-names = "timers";
>>>>> +       };
>>>>> +
>>>>>          amba {
>>>>>                  #address-cells =<1>;
>>>>>                  #size-cells =<1>;
>>>>> diff --git a/arch/arm/boot/dts/exynos5420.dtsi
>>> b/arch/arm/boot/dts/exynos5420.dtsi
>>>>> index d537cd7..80afc8b 100644
>>>>> --- a/arch/arm/boot/dts/exynos5420.dtsi
>>>>> +++ b/arch/arm/boot/dts/exynos5420.dtsi
>>>>> @@ -206,6 +206,15 @@
>>>>>                  clock-names = "uart", "clk_uart_baud0";
>>>>>          };
>>>>>
>>>>> +       pwm: pwm@12dd0000 {
>>>>> +               compatible = "samsung,exynos4210-pwm";
>>>>> +               reg =<0x12dd0000 0x100>;
>>>>> +               samsung,pwm-outputs =<0>,<1>,<2>,<3>;
>>>>> +               #pwm-cells =<3>;
>>>>> +               clocks =<&clock 279>;
>>>>> +               clock-names = "timers";
>>>>> +       };
>>>>> +
