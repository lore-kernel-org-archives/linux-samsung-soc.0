From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [patch 1/5] pinctrl: samsung: Remove bogus irq_[un]mask from
 resource management
Date: Fri, 30 Jun 2017 08:02:20 +0200
Message-ID: <CAJKOXPd+ir1+036jmN+Pd6WWvTcTES2xV9LLsh-W=DYvc2LoEQ@mail.gmail.com>
References: <20170629213334.375848050@linutronix.de> <20170629214343.882576048@linutronix.de>
 <CA+Ln22GyEDZidAWkMonjLYF0etxNjZ0btwYkQ5raAPsnk1bJFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CA+Ln22GyEDZidAWkMonjLYF0etxNjZ0btwYkQ5raAPsnk1bJFg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Brian Norris <briannorris@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, Julia Cartwright <julia@ni.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, John Keeping <john@metanate.com>, Doug Anderson <dianders@chromium.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jun 30, 2017 at 4:47 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Thomas,
>
> 2017-06-30 6:33 GMT+09:00 Thomas Gleixner <tglx@linutronix.de>:
>> The irq chip callbacks irq_request/release_resources() have absolutely no
>> business with masking and unmasking the irq.
>>
>> The core code unmasks the interrupt after complete setup and masks it
>> before invoking irq_release_resources().
>>
>> The unmask is actually harmful as it happens before the interrupt is
>> completely initialized in __setup_irq().
>>
>> Remove it.
>
> Good catch, thanks! (Note that the original patch of mine [1] did that
> in .irq_startup()/.irq_shutdown(), which was for some reason changed
> later, but I don't remember the exact story.)
>
> [1] https://patchwork.kernel.org/patch/4466431/
>
> Acked-by: Tomasz Figa <tomasz.figa@gmail.com>
>
> Sylwester, Krzysztof, would you be able to do some basic test?

I suppose this was not tested so yes - I have platforms do this. I
understand that checking any non-shared GPIO interrupt should be
sufficient to test, right?

Best regards,
Krzysztof
