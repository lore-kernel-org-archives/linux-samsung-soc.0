From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: DT on s3c24xx
Date: Thu, 18 Dec 2014 15:53:14 +0100
Message-ID: <CACRpkdZumW0bZhc7xK_bes1A7Vuw5QYF2wgG86g0f4-5fJ97Lg@mail.gmail.com>
References: <CA+E=qVf4nT5x-fRFBu=Wv_VKUnEMAEP4GgJG8em8NyUFkwtbPg@mail.gmail.com>
	<20141218075205.GB10857@pengutronix.de>
	<CA+E=qVeU4hEX2x9uAPfgqEgpxvA7bUBWqWJtBJdbP=RK6ghfEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CA+E=qVeU4hEX2x9uAPfgqEgpxvA7bUBWqWJtBJdbP=RK6ghfEQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, arm-linux <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Ben Dooks <ben-linux@fluff.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Dec 18, 2014 at 9:34 AM, Vasily Khoruzhick <anarsoul@gmail.com> wrote:

> Can I change pin function after gpio was requested? In low-power state
> (i.e. when display is disabled) it's gpio driving some level,
> and in active state it's some LCD controller pin (don't remember which
> one exactly)

Please read the section named "GPIO mode pitfalls" in
Documentation/pinctrl.txt very closely.

Two ways:

- You can use the GPIO and pin control interface to the same
  hardware in parallel. There is no blocking this since there
  is hardware out that that actually allow this. NOT
  RECOMMENDED.

- If the "GPIO mode" mentioned is only about e.g. grounding
  the pins in a low power state and then not really about using
  them as GPIO, extend the pin controller to be able to e.g.
  ground the pins with PIN_CONFIG_OUTPUT or
  PIN_CONFIG_LOW_POWER_MODE if you use
  generic bindings.

If the usecase is low power, the latter approach is recommended.

Yours,
Linus Walleij
