From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/4] pinctrl: samsung: Register pinctrl before GPIO
Date: Tue, 14 Mar 2017 15:58:04 +0200
Message-ID: <CAJKOXPf09Y7ojLP4reZpCy9D509fRSs08otnN4mHmZJjYO6EDw@mail.gmail.com>
References: <1487251636-2480-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1487251636-2480-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <CACRpkdbq4RMH_2rfaxDbEZaqrQWO9bq8BS8AqnaV6SH=0s6jRQ@mail.gmail.com>
 <20170223172313.GF2742@localhost.localdomain> <CACRpkdZ+EQ=p_vGrBFYu6p-MnC0OvcY7P1-OWzebKgQRhGWQJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZ+EQ=p_vGrBFYu6p-MnC0OvcY7P1-OWzebKgQRhGWQJQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Mar 14, 2017 at 3:44 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Feb 23, 2017 at 6:23 PM, Charles Keepax
> <ckeepax@opensource.wolfsonmicro.com> wrote:
>> On Wed, Feb 22, 2017 at 03:37:37PM +0100, Linus Walleij wrote:
>>> On Thu, Feb 16, 2017 at 2:27 PM, Charles Keepax
>>> <ckeepax@opensource.wolfsonmicro.com> wrote:
>>>
>>> > If we request a GPIO hog, then gpiochip_add_data will attempt to request
>>> > some of its own GPIOs. The driver also uses gpiochip_generic_request
>>> > which means that for any GPIO request to succeed the pinctrl needs to be
>>> > registered. Currently however the driver registers the GPIO and then the
>>> > pinctrl meaning all GPIO hog requests will fail, which then in turn causes
>>> > the whole driver to fail probe. Fix this up by ensuring we register the
>>> > pinctrl first. Although currently there are no users of GPIO hogs in
>>> > mainline there are plenty of Samsung based boards that are widely used
>>> > for development purposes of other hardware. Indeed we hit this issue
>>> > whilst attaching some additional hardware to an Arndale system.
>>> >
>>> > Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
>>> > Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
>>> > ---
>>> >
>>> > Changes since v1:
>>> >  - Updated commit message
>>>
>>> Patch applied. Will not be visible in -next until after the merge window
>>> though.
>>>
>>
>> Apologies but I think you might be best to drop this patch for
>> now, it seems this causes the ranges passed to
>> pinctrl_add_gpio_range to have the wrong .base, whilst I can
>> actually see no ill effects from this on Arndale. I suspect this
>> patch may be only part of the solution and may potentially cause
>> issues for others even though it seems fine for me.
>
> OK I dropped it.
>
> Resend it if you figure it out.
>
> The Samsung driver traffic is increasing, and there are now
> a bunch of developers starting to step on each others' toes.
>
> Would you Samsung developers start considering someone who
> can collect Samsung pin control patches and send them as
> pull requests to me?

For some reason, some days ago I had impression that Sylwester is
doing this already... but I was corrected that you are taking them
directly. If Tomasz and Sylwester are willing to do this, they got my
Ack.

If not, I can take it and set a separate repo on my kernel.org account.

Best regards,
Krzysztof
