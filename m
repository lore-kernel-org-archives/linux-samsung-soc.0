From: Martyn Welch <martyn.welch@collabora.co.uk>
Subject: Re: [PATCH 2/3] Add support for monitoring gpio switches
Date: Wed, 16 Dec 2015 10:11:46 +0000
Message-ID: <567138E2.80505@collabora.co.uk>
References: <1449250275-23435-1-git-send-email-martyn.welch@collabora.co.uk>	<1449250275-23435-3-git-send-email-martyn.welch@collabora.co.uk> <CACRpkdb=it+U+3-0mvZ9Pf1cnYT_r1KkFiS=C4YDkqrjoRm+kQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb=it+U+3-0mvZ9Pf1cnYT_r1KkFiS=C4YDkqrjoRm+kQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org



On 11/12/15 09:08, Linus Walleij wrote:
> On Fri, Dec 4, 2015 at 6:31 PM, Martyn Welch
> <martyn.welch@collabora.co.uk> wrote:
>
>> Select Chromebooks have gpio attached to switches used to cause the
>> firmware to enter alternative modes of operation and/or control other
>> device characteristics (such as write protection on flash devices). This
>> patch adds a driver that exposes a read-only interface to allow these
>> signals to be read from user space.
>>
>> This functionality has been generalised to provide support for any device
>> with device tree support which needs to identify a gpio as being used for a
>> specific task.
>>
>> Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
>
> If you want to do this thing, also propose a device tree binding document
> for "gpio-switch".
>
> But first (from Documentation/gpio/drivers-on-gpio.txt):
>
> - gpio-keys: drivers/input/keyboard/gpio_keys.c is used when your GPIO line
>    can generate interrupts in response to a key press. Also supports debounce.
>

This one generates input events from gpio. I'm not looking to generate 
events.

> - gpio-keys-polled: drivers/input/keyboard/gpio_keys_polled.c is used when your
>    GPIO line cannot generate interrupts, so it needs to be periodically polled
>    by a timer.
>

Ditto (but using a polled mechanism rather than interrupts)

> - extcon-gpio: drivers/extcon/extcon-gpio.c is used when you need to read an
>    external connector status, such as a headset line for an audio driver or an
>    HDMI connector. It will provide a better userspace sysfs interface than GPIO.
>

This appears to be exclusively for monitoring insertion events, or am I 
missing something?

> So you mean none of these apply for this case?
>

No, I'm looking for a mechanism to identify GPIO as connected to a 
specific signal, which is provided across multiple devices, but which 
might be implemented subtly differently on different platforms (i.e. 
active high/low) and on different GPIO lines.

> Second: what you want to do is export a number of GPIOs with certain names
> to userspace. This is something very generic and should be implemented
> as such, not as something Chromebook-specific.
>

I'd agree that my first implementation was ChromeBook specific, but I'm 
fairly sure that my last attempt wasn't. I've mentioned ChromeBooks as 
an example of an existing use case.

> Patches like that has however already been suggested, and I have NACKed
> them because the GPIO sysfs ABI is insane, and that is why I am refactoring
> the world to create a proper chardev ABI for GPIO instead. See:
> http://marc.info/?l=linux-gpio&m=144550276512673&w=2
>

I can certainly understand the rationale for the changes that you are 
proposing, though do worry that it does make it a bit tougher to use 
from scripting languages. I see that the question of how to provide 
functionality equivalent to the above was raised and no answer was 
forthcoming. Is there a plan for supporting the identification of a GPIO 
line serving a specific purpose?

What is the status of the mentioned patch series?

Martyn

> So for the moment, NACK on this, please participate in creating the
> *right* ABI for GPIO instead of trying to shoehorn stuff into the dying
> sysfs ABI.
>
> Yours,
> Linus Walleij
>
