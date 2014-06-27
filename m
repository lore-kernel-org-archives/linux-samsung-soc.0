From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: Re: [PATCH] ARM: dts: Add mask-tpm-reset to the device tree
Date: Fri, 27 Jun 2014 21:19:29 +0530
Message-ID: <CAGm_ybi6y1AyXP80S_jQv0DDM4YGZSbqhAhtHr3ZXhs27-Z2Ww@mail.gmail.com>
References: <1403774127-21892-1-git-send-email-vikas.sajjan@samsung.com>
	<53ABED5B.8010506@samsung.com>
	<CAD=FV=Vwgdis6FzJ8MHDwfuohB1kN8Mf--2N=rxGNeAfKjJMig@mail.gmail.com>
	<53AD60D7.4040404@gmail.com>
	<CAD=FV=Wz5nB=fe-snzdNC-Tb50wXz9h3S5z4jAHzKxH3N66UVw@mail.gmail.com>
	<53AD8A5E.9090904@gmail.com>
	<CAD=FV=U3XPca_tQn4VO-b6FS4t+jUeMs9dSfsBoLYqjNb3V11w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:61223 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753446AbaF0Ptb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jun 2014 11:49:31 -0400
Received: by mail-wg0-f47.google.com with SMTP id k14so5317157wgh.6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2014 08:49:29 -0700 (PDT)
In-Reply-To: <CAD=FV=U3XPca_tQn4VO-b6FS4t+jUeMs9dSfsBoLYqjNb3V11w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Tomasz Figa <t.figa@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>

Doug,

On Fri, Jun 27, 2014 at 8:52 PM, Doug Anderson <dianders@chromium.org> wrote:
> Tomasz,
>
> On Fri, Jun 27, 2014 at 8:14 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>> On 27.06.2014 17:10, Doug Anderson wrote:
>>> Tomasz and Vikas,
>>>
>>> On Fri, Jun 27, 2014 at 5:17 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>>>> Hi Doug,
>>>>
>>>> On 26.06.2014 17:25, Doug Anderson wrote:
>>>>> Tomasz,
>>>>>
>>>>> On Thu, Jun 26, 2014 at 2:52 AM, Tomasz Figa <t.figa@samsung.com> wrote:
>>>>>> Hi Vikas, Doug,
>>>>>>
>>>>>> On 26.06.2014 11:15, Vikas Sajjan wrote:
>>>>>>> From: Doug Anderson <dianders@chromium.org>
>>>>>>>
>>>>>>> The mask-tpm-reset GPIO is used by the kernel to prevent the TPM from
>>>>>>> being reset across sleep/wake.  If we don't set it to anything then
>>>>>>> the TPM will be reset.  U-Boot will detect this as invalid
>>>>>>> and will reset the system on resume time. This GPIO can always be low
>>>>>>> and not hurt anything.  It will get pulled back high again during a
>>>>>>> normal warm reset when it will default back to an input.
>>>>>>>
>>>>>>> To properly preserve the TPM state across suspend/resume and to make
>>>>>>> the chrome U-Boot happy, properly set the GPIO to mask the
>>>>>>> reset to the TPM.
>>>>>>>
>>>>>>> Signed-off-by: Doug Anderson <dianders@chromium.org>
>>>>>>> Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
>>>>>>> ---
>>>>>>>  arch/arm/boot/dts/exynos5420-peach-pit.dts |   20 ++++++++++++++++++++
>>>>>>>  1 file changed, 20 insertions(+)
>>>>>>>
>>>>>>> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
>>>>>>> index 7649982..8fd990a 100644
>>>>>>> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
>>>>>>> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
>>>>>>> @@ -87,6 +87,18 @@
>>>>>>>               pinctrl-0 = <&usb301_vbus_en>;
>>>>>>>               enable-active-high;
>>>>>>>       };
>>>>>>> +
>>>>>>> +     /* We need GPX0_6 to be low at sleep time; just keep it low always */
>>>>>>> +     mask_tpm_reset_regulator: mask-tpm-reset-regulator {
>>>>>>> +     compatible = "regulator-fixed";
>>>>>>> +     regulator-name = "mask-tpm-reset ";
>>>>>>> +             gpio = <&gpx0 6 0>;
>>>>>>> +             enable-active-low;
>>>>>>> +             regulator-boot-on;
>>>>>>> +             regulator-always-on;
>>>>>>> +             pinctrl-names = "default";
>>>>>>> +             pinctrl-0 = <&mask_tpm_reset>;
>>>>>>> +     };
>>>>>>
>>>>>> I don't think this pin is supposed to be a real regulator. If I'm right,
>>>>>> you should just add a hog for it, if you don't have a proper driver to
>>>>>> handle it.
>>>>>
>>>>> Yes, I agree that it shouldn't really be a regulator, but there's not
>>>>> a whole lot of choice.  The pin needs to actually be driven low, not
>>>>> just pulled low.  Without your proposed patch (pinctrl: samsung: Allow
>>>>> pin value to be initialized using pinfunc) I don't think it's possible
>>>>> to actually drive a pin low with a hog.  I could be wrong, though.
>>>>>
>>>>
>>>> Uhm, I was convinced that this patch was already in. So I think your use
>>>> case is definitely a good reason to get back to this patch and use the
>>>> facility it provides to solve your problem.
>>>
>>> Thanks, that seems very reasonable to me, too.
>>>
>>> Are you going to pick up revitalizing this patch series or are you
>>> hoping Vikas will?  IIRC I was in favor of your patch but it generated
>>> a whole bunch of discussion and never actually landed.
>>
>> I will respin it along with few other patches for pinctrl-samsung, but
>> obviously not before Monday.
>
> Sounds like a plan.  Vikas: I'll assume you're going to redo this
> patch atop Tomasz's once he posts up his.

Sure, will respin atop Tomasz's patch series.


>
> -Doug
