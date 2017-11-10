From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung/s3c24xx: add CONFIG_OF dependency
Date: Fri, 10 Nov 2017 11:40:52 +0100
Message-ID: <CACRpkdbSPqATnL_ROFM2VtCYcBPyybxxmnyQbn6bohDeFYa09g@mail.gmail.com>
References: <20171107141244.3377780-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20171107141244.3377780-1-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Nov 7, 2017 at 3:12 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> The driver fails to build without CONFIG_OF:
>
> drivers/pinctrl/samsung/pinctrl-samsung.c: In function 'samsung_gpiolib_register':
> drivers/pinctrl/samsung/pinctrl-samsung.c:936:5: error: 'struct gpio_chip' has no member named 'of_node'
>
> This configuration is now possible since we can now select the
> PINCTRL subsystem on S3C24xx machines other than the device tree
> based ones.
>
> Fixes: d219b924611a ("pinctrl: change Kconfig PINCTRL variable to a menuconfig")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied!

Yours,
Linus Walleij
