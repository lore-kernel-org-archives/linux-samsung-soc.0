From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2] pinctrl: samsung: Calculate GPIO base for pinctrl_add_gpio_range
Date: Sat, 4 Mar 2017 20:20:11 +0900
Message-ID: <CA+Ln22HUK2NBV7=NCeJ3r1J2E5-C_5qc+i9Co5js9VamAXF04g@mail.gmail.com>
References: <20170228090143.GG2742@localhost.localdomain> <1488301475-10804-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1488301475-10804-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, patches@opensource.wolfsonmicro.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Charles,

2017-03-01 2:04 GMT+09:00 Charles Keepax <ckeepax@opensource.wolfsonmicro.com>:
> As the pinctrl is now added before the GPIOs are registered we need to
> manually calculate what the GPIO base will be, otherwise the base for
> each gpio_range will be set to zero. Fortunately the driver
> already assigns a GPIO base, in samsung_gpiolib_register, and uses the
> same calculation it does for the pin_base. Meaning the two will always
> be the same and allowing us to reuse the pinbase and avoid the issue.

Sorry, I didn't notice before and I don't see the offending patch in ,
but you should add

Fixes: XXXXXXXXXXXX ("pinctrl: Patch subject")

if you intend to submit this patch separately. Otherwise, maybe this
can be just squashed?

>
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>
> Changes since v1:
>  - Use grange.base in samsung_gpiolib_register to make it more
>    clear the two are related in the driver.

Other than the above:

Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

Best regards,
Tomasz
