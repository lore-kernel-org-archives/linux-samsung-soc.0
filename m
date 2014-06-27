From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] ARM: dts: Add mask-tpm-reset to the device tree
Date: Fri, 27 Jun 2014 10:10:53 -0600
Message-ID: <53AD978D.8060703@wwwdotorg.org>
References: <1403774127-21892-1-git-send-email-vikas.sajjan@samsung.com>	<53ABED5B.8010506@samsung.com> <CAD=FV=Vwgdis6FzJ8MHDwfuohB1kN8Mf--2N=rxGNeAfKjJMig@mail.gmail.com> <53AD60D7.4040404@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:45479 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751755AbaF0QK5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jun 2014 12:10:57 -0400
In-Reply-To: <53AD60D7.4040404@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Doug Anderson <dianders@chromium.org>, Tomasz Figa <t.figa@samsung.com>
Cc: Vikas Sajjan <vikas.sajjan@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>, Vikas Sajjan <sajjan.linux@gmail.com>, Linus Walleij <linus.walleij@linaro.org>

On 06/27/2014 06:17 AM, Tomasz Figa wrote:
> Hi Doug,
> 
> On 26.06.2014 17:25, Doug Anderson wrote:
>> Tomasz,
>>
>> On Thu, Jun 26, 2014 at 2:52 AM, Tomasz Figa <t.figa@samsung.com> wrote:
>>> Hi Vikas, Doug,
>>>
>>> On 26.06.2014 11:15, Vikas Sajjan wrote:
>>>> From: Doug Anderson <dianders@chromium.org>
>>>>
>>>> The mask-tpm-reset GPIO is used by the kernel to prevent the TPM from
>>>> being reset across sleep/wake.  If we don't set it to anything then
>>>> the TPM will be reset.  U-Boot will detect this as invalid
>>>> and will reset the system on resume time. This GPIO can always be low
>>>> and not hurt anything.  It will get pulled back high again during a
>>>> normal warm reset when it will default back to an input.
>>>>
>>>> To properly preserve the TPM state across suspend/resume and to make
>>>> the chrome U-Boot happy, properly set the GPIO to mask the
>>>> reset to the TPM.
>>>>
>>>> Signed-off-by: Doug Anderson <dianders@chromium.org>
>>>> Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
>>>> ---
>>>>  arch/arm/boot/dts/exynos5420-peach-pit.dts |   20 ++++++++++++++++++++
>>>>  1 file changed, 20 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
>>>> index 7649982..8fd990a 100644
>>>> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
>>>> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
>>>> @@ -87,6 +87,18 @@
>>>>               pinctrl-0 = <&usb301_vbus_en>;
>>>>               enable-active-high;
>>>>       };
>>>> +
>>>> +     /* We need GPX0_6 to be low at sleep time; just keep it low always */
>>>> +     mask_tpm_reset_regulator: mask-tpm-reset-regulator {
>>>> +     compatible = "regulator-fixed";
>>>> +     regulator-name = "mask-tpm-reset ";
>>>> +             gpio = <&gpx0 6 0>;
>>>> +             enable-active-low;
>>>> +             regulator-boot-on;
>>>> +             regulator-always-on;
>>>> +             pinctrl-names = "default";
>>>> +             pinctrl-0 = <&mask_tpm_reset>;
>>>> +     };
>>>
>>> I don't think this pin is supposed to be a real regulator. If I'm right,
>>> you should just add a hog for it, if you don't have a proper driver to
>>> handle it.
>>
>> Yes, I agree that it shouldn't really be a regulator, but there's not
>> a whole lot of choice.  The pin needs to actually be driven low, not
>> just pulled low.  Without your proposed patch (pinctrl: samsung: Allow
>> pin value to be initialized using pinfunc) I don't think it's possible
>> to actually drive a pin low with a hog.  I could be wrong, though.

Surely there's a driver (or could be a driver) for the TPM chip, and
that driver should have a reset-mask-gpios property, so the driver can
call gpio_get() and gpio_set_output() on the GPIO?

Faking this out via a not-really-a-regulator or pinctrl hogs seems like
an abuse of those features to me.
