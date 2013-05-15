From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Wed, 15 May 2013 17:51:00 -0600
Message-ID: <51941F64.9090104@wwwdotorg.org>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com> <CACRpkdbgjqF3xhxUvfvNJn5Vt-3i0AFBzR_Q8gHdNq919dnNsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:40354 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751414Ab3EOXvG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 May 2013 19:51:06 -0400
In-Reply-To: <CACRpkdbgjqF3xhxUvfvNJn5Vt-3i0AFBzR_Q8gHdNq919dnNsA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Doug Anderson <dianders@google.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Simon Glass <sjg@chromium.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@gmail.com>

On 05/15/2013 12:29 PM, Linus Walleij wrote:
> On Wed, May 15, 2013 at 6:44 PM, Doug Anderson <dianders@google.com> wrote:
...
>> Here's how I need to do things when I'm using "just an interrupt":
>>
>>   pinctrl@11400000 {
>>     cyapa_irq: cyapa-irq {
>>       samsung,pins = "gpx1-2";
>>       samsung,pin-function = <0xf>;
>>       samsung,pin-pud = <0>;
>>       samsung,pin-drv = <0>;
>>     };
>>   };
>>
>>   trackpad {
>>     reg = <0x67>;
>>     compatible = "cypress,cyapa";
>>     interrupts = <2 0>;
>>     interrupt-parent = <&gpx1>;
>>     pinctrl-names = "default";
>>     pinctrl-0 = <&cyapa_irq>;
>>     wakeup-source;
>>   };

I don't really see much disadvantage here; the interrupt bindings
specify things related to interrupts and the pinctrl bindings specify
thing related to pin configuration.

If you want to condense the DT, I'd suggest using a the pinctrl hogging
feature, i.e. don't put pinctrl-* properties in the trackpad node, but
rather define a system-wide "default" pinctrl state in the pin
controller node itself. That configuration will be applied as soon as
the pin controller driver is registered. That'd be the same as the
above, with the following added:

pinctrl@11400000 {
    pinctrl-names = "default";
    pinctrl-0 = <&cyapa_irq>;
};

except that the pinctrl-0 property would probably end up configuring a
whole bunch of basic pinctrl state rather than just that one interrupt pin.

I prefer to put all the static pinctrl configuration in the pinctrl hog,
and only the dynamic stuff in the individual device nodes.

I know LinusW won't like this suggestion much though:-)

>> I really wish I could add a 3rd number to the interrupt specifier for
>> pud and skip the pinctrl bit:
>>
>>   trackpad {
>>     reg = <0x67>;
>>     compatible = "cypress,cyapa";
>>     interrupts = <2 0 0>;
>>     interrupt-parent = <&gpx1>;
>>     wakeup-source;
>>   };

I don't like that myself, since it makes the interrupt binding (and I
assume you'd want to go back to the similar misuse in the GPIO binding)
also configure pinctrl-related stuff.
