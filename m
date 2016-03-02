From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/3] Device tree binding documentation for gpio-switch
Date: Wed, 2 Mar 2016 10:03:27 -0600
Message-ID: <CAL_JsqLX-F=-k83_-5-QL2QZpAArQqOHjE+19c1wvNKWayYfMw@mail.gmail.com>
References: <1449250275-23435-1-git-send-email-martyn.welch@collabora.co.uk>
 <CACRpkdYvU6YG5yRCLsyS7sq816t3shWw51OTR2-fkp-FqSeESg@mail.gmail.com>
 <CAL_JsqJXX71Bwbm21H3QAJxYDO60kyHgKVzXxxrH9ze6ZWYtXw@mail.gmail.com> <1488914.9p6SgUg6XA@adelgunde>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1488914.9p6SgUg6XA@adelgunde>
Sender: linux-kernel-owner@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Martyn Welch <martyn.welch@collabora.co.uk>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Olof Johansson <olof@lixom.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Kukjin Kim <kgene@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Kumar Gala <galak@codeaurora.org>, Michael Welling <mwelling@ieee.org>, Russell King <linux@arm.linux.org.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Reviving this thread...

On Tue, Dec 15, 2015 at 3:09 AM, Markus Pargmann <mpa@pengutronix.de> wrote:
> Hi,
>
> On Monday 14 December 2015 09:45:48 Rob Herring wrote:
>> On Mon, Dec 14, 2015 at 8:28 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> > On Fri, Dec 11, 2015 at 3:06 PM, Rob Herring <robh+dt@kernel.org> wrote:
>> >> On Fri, Dec 11, 2015 at 6:39 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> >>> On Fri, Dec 4, 2015 at 6:31 PM, Martyn Welch
>> >>> <martyn.welch@collabora.co.uk> wrote:
>>
>> [...]
>>
>> >>> Markus Pargmann also did a series that add initial values to
>> >>> hogs, which is the inverse usecase of this, where you want to
>> >>> *output* something by default, then maybe also make it available
>> >>> to userspace.
>> >>>
>> >>> So what we need to see here is a patch series that does all of these
>> >>> things:
>> >>>
>> >>> - Name lines
>> >>>
>> >>> - Sets them to initial values
>> >>>
>> >>> - Mark them as read-only
>> >>>
>> >>> - Mark them as "not used by the operating system" so that they
>> >>>   can be default-exported to userspace.
>> >>
>> >> No! This should not be a DT property.
>> >>
>> >> Whether I want to control a GPIO in the kernel or userspace is not
>> >> known and can change over time. It could simply depend on kernel
>> >> config. There is also the case that a GPIO has no connection or kernel
>> >> driver until some time later when a DT overlay for an expansion board
>> >> is applied.
>> >
>> > That's correct. So from a DT point of view, what really matters is
>> > to give things a name, and the hogs and initvals syntax already
>> > has a structure for this that is in use
>> > (from Documentation/devicetree/bindings/gpio/gpio.txt):
>> >
>> >         qe_pio_a: gpio-controller@1400 {
>> >                 compatible = "fsl,qe-pario-bank-a", "fsl,qe-pario-bank";
>> >                 reg = <0x1400 0x18>;
>> >                 gpio-controller;
>> >                 #gpio-cells = <2>;
>> >
>> >                 line_b {
>> >                         gpio-hog;
>> >                         gpios = <6 0>;
>> >                         output-low;
>> >                         line-name = "foo-bar-gpio";
>> >                 };
>> >         };
>> >
>> > Markus use this also for initial values. That could easily be used in
>> > a budget version like this:
>> >
>> >                 line_b {
>> >                         /* Just naming */
>> >                         gpios = <6 0>;
>> >                         line-name = "foo-bar-gpio";
>> >                 };
>> >
>> > That could grow kind of big though. Or maybe not? How many
>> > GPIO lines are actually properly named in a typical system?
>>
>> We should limit it to GPIOs with no connection to another node. For
>> example, I don't want to see a SD card detect in the list as that
>> should be in the SD host node. However, that is hard to enforce and
>> can change over time. Removing it would break userspace potentially.
>> Of course if the kernel starts own a signal that userspace used, then
>> that potentially breaks userspace regardless of the DT changing. OTOH,
>> using GPIOs in userspace is kind of use at your own risk.
>
> I see this a bit differently. I would really like to see the each GPIO having
> two different names:

I think we are saying the same thing...

> - GPIO label: This is the name of the GPIO line in the schematic for example

Yes.

> - GPIO use (this is the current semantic of the GPIO name): The use of a GPIO,
>   e.g. 'sd-card-detect', 'LED', ...

This should be determined from the compatible string and/or -gpios
prefix. This is the what the function is and "label" is which one.

> I think it would be good to describe all GPIO labels in gpiochip subnodes as
> gpio-hogging introduced it. This would offer a use-independent naming. The use
> of the function could be defined in the device node that is using this gpio.

I think I agree here. You may have a defined function without any
connection to another node. I also think we should encourage simple
GPIO bindings like gpio-leds to be child nodes. Having them at the
top-level is kind of arbitrary. Of course, allowing for both is
required.

> As an example perhaps something like this:
>
>         &gpiochip {
>                 some_interrupt {
>                         gpios = <4 0>;
>                         line-name = "some_interrupt_line";
>                 };
>
>                 line_b {
>                         gpios = <6 0>;
>                         line-name = "line-b";
>                 };
>         };
>
>         randomswitch {
>                 compatible = "gpio-switch";
>                 gpios = <&gpiochip 4 0>;
>                 use = "action-trigger";
>                 read-only;
>         };
>
> Also this does seem kind of inconsistent with gpio-hogging and the proposed
> gpio-initval. gpio-hogging is defined in subnodes of the gpio chip while
> gpio-switches are not. As "gpio-switch" is not really any kind of device it
> would perhaps make sense to keep this consistent with gpio-hogging as well and
> define it in the same subnodes?
> I would be happy about any consistent way.

Yes, as well as gpio leds, keys, etc. bindings. The key is you would
need to be able to start with something minimal and extend it with
specific compatibles.

[...]

>> We also have to consider how to handle add-on boards. We probably need
>> a connector node which can remap connector signals to host signals in
>> order to have overlays independent of the host board DT. For GPIOs
>> this is probably a gpio-map property similar to interrupt-map. The
>> complicated part will be connectors that require pinmux setup of the
>> host.
>
> Also what about hotplugging gpio-chips? Is there any mechanism to let the
> 'gpio-switch' know that the GPIO is not there anymore?

There are certainly issues around hotplug and GPIOs. If the
gpio-switch device is a child of the gpio controller, then it should
be possible.

Rob
