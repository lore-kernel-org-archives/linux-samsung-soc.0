From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] gpio: exynos4: Add device tree support
Date: Thu, 13 Oct 2011 08:59:15 +0530
Message-ID: <CAJuYYwRKa+=AJrtgWEf8ow4cHKZruogtAsFQ8XR4B6fTS69QfQ@mail.gmail.com>
References: <1318320974-9879-1-git-send-email-thomas.abraham@linaro.org>
	<4E945C90.1050601@gmail.com>
	<CAJuYYwRwBxkAo2fMfVV9wtQ40XeROAnc-cGJK+cssjuh9px=qQ@mail.gmail.com>
	<4E946109.2000305@gmail.com>
	<CAJuYYwQWUjVf9Z5Rdw4fTK70=B1aw-5x_wjYm_fq+zHyQAWJvg@mail.gmail.com>
	<4E95AE26.8080702@gmail.com>
	<CAJuYYwRsM_aGkeG9v97jdsJgSQeokViuLGdF5TvqEkNZCAgFVA@mail.gmail.com>
	<20111013010101.GK14042@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:38314 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751560Ab1JMD3Q convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Oct 2011 23:29:16 -0400
Received: by gyb13 with SMTP id 13so1363857gyb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Oct 2011 20:29:16 -0700 (PDT)
In-Reply-To: <20111013010101.GK14042@ponder.secretlab.ca>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On 13 October 2011 06:31, Grant Likely <grant.likely@secretlab.ca> wrot=
e:
> On Wed, Oct 12, 2011 at 09:45:25PM +0530, Thomas Abraham wrote:
>> On 12 October 2011 20:41, Rob Herring <robherring2@gmail.com> wrote:
>> > On 10/11/2011 11:06 AM, Thomas Abraham wrote:
>> >> On 11 October 2011 21:00, Rob Herring <robherring2@gmail.com> wro=
te:
>> >>> On 10/11/2011 10:19 AM, Thomas Abraham wrote:
>> >>>> Hi Rob,
>> >>>>
>> >>>> On 11 October 2011 20:41, Rob Herring <robherring2@gmail.com> w=
rote:
>> >>>>> Thomas,
>> >>>>>
>> >>>>> On 10/11/2011 03:16 AM, Thomas Abraham wrote:
>> >>>>>> As gpio chips get registered, a device tree node which repres=
ents the
>> >>>>>> gpio chip is searched and attached to it. A translate functio=
n is also
>> >>>>>> provided to convert the gpio specifier into actual platform s=
ettings
>> >>>>>> for pin function selection, pull up/down and driver strength =
settings.
>> >>>>>>
>> >>>>>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> >>>>>> ---
>> >>>>>> This patch is based on the latest consolidated Samsung GPIO d=
river available
>> >>>>>> in the following tree:
>> >>>>>> =A0 https://github.com/kgene/linux-samsung.git =A0branch: for=
-next
>> >>>>>>
>> >>>>>> =A0.../devicetree/bindings/gpio/gpio-samsung.txt =A0 =A0 =A0|=
 =A0 30 +++++++++++
>> >>>>>> =A0drivers/gpio/gpio-samsung.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0| =A0 53 ++++++++++++++++++++
>> >>>>>> =A02 files changed, 83 insertions(+), 0 deletions(-)
>> >>>>>> =A0create mode 100644 Documentation/devicetree/bindings/gpio/=
gpio-samsung.txt
>> >>>>>>
>> >>>>>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-sams=
ung.txt b/Documentation/devicetree/bindings/gpio/gpio-samsung.txt
>> >>>>>> new file mode 100644
>> >>>>>> index 0000000..883faeb
>> >>>>>> --- /dev/null
>> >>>>>> +++ b/Documentation/devicetree/bindings/gpio/gpio-samsung.txt
>> >>>>>> @@ -0,0 +1,30 @@
>> >>>>>> +Samsung Exynos4 GPIO Controller
>> >>>>>> +
>> >>>>>> +Required properties:
>> >>>>>> +- compatible: Format of compatible property value should be
>> >>>>>> + =A0"samsung,exynos4-gpio-<controller_name>". Example: For G=
PA0 controller, the
>> >>>>>> + =A0compatible property value should be "samsung,exynos4-gpi=
o-gpa0".
>> >>>>>
>> >>>>> Isn't gpa0 an instance of the h/w, not a version?
>> >>>>
>> >>>> GPA0 is a instance of the gpio controller. There are several su=
ch
>> >>>> instances and there could be differences in those instances suc=
h as
>> >>>> the number of GPIO lines managed by that gpio controller instan=
ce.
>> >>>>
>> >>>
>> >>> That doesn't seem like a reason to have different compatible str=
ings.
>> >>> Does that affect the programming model of the controller? Unused=
 lines
>> >>> whether at the board level or SOC level shouldn't really matter.
>> >>
>> >>
>> >> No, that does not affect the programming of the controller. The r=
eason
>> >> for the instance name extension in compatible string is to match =
the
>> >> gpio_chip with a gpio controller node. When matched, the of_node
>> >> pointer of the gpio_chip is set to point to that controller node.
>> >>
>> >> This might not be the best possible implementation but the device=
 tree
>> >> support code in this patch is dictated by the structure of the
>> >> existing gpio driver code. As you suggested previously, I will lo=
ok at
>> >> reworking the gpio driver a little later but for now, there was a=
 need
>> >> for working gpio dt solution to make progress on dt support for o=
ther
>> >> controllers.
>> >
>> > Linux should provide clues about what's needed in a binding, but t=
he
>> > binding should not be defined based on current Linux code. Doing t=
he
>> > binding one way and changing it later is not a good plan.
>>
>> Ok. When starting on this, two compatible values where used for the
>> gpio controllers, one was "samsung,exynos4-gpio" and another was
>> "samsung,exynos4-gpio-<ctrl_name>". And when the gpio dt support wou=
ld
>> mature, the second compatible value could be dropped. Non-linux
>> platforms could always use the generic "samsung,exynos4-gpio"
>> compatible value to match. I moved to using only
>> "samsung,exynos4-gpio-<ctrl_name>" just before sending this patch
>> because I was not sure of the right approach.
>>
>> >
>> > I think you need to convert all users of gpio over as well so you =
can
>> > move to dynamic gpio_chip creation and gpio numbering. Or maybe yo=
u can
>> > match based on base address? This is going to be a common problem =
as
>> > gpio is converted over to DT. Perhaps Grant or others have suggest=
ions
>> > on the approach to use.
>>
>> Yes, I agree with you about the dynamic gpio_chip creation and gpio
>> numbering. Probably, I should have focussed more on this before movi=
ng
>> to dt support for other controllers.
>>
>> But matching based on base address is still an option if that is
>> better than matching with compatible values as defined currently. Th=
e
>> 'struct samsung_gpio_chip' which encapsulates 'struct gpio_chip' has
>> information about the base address of the gpio controller. The match
>> of gpio device node with 'struct gpio_chip' can be quickly moved ove=
r
>> to base address matching. Would this be better than the current
>> approach?
>
> That's what I would do.

Thanks Grant. I will modify the patch to match against the base
address of the controller.

Regards,
Thomas.

>
> g.
>
>
