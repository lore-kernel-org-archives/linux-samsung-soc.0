From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: mark PM functions as __maybe_unused
Date: Mon, 6 Feb 2017 11:04:52 +0100
Message-ID: <CACRpkdYBL_4caeSkD4aXqGCJ0XF=S_pQ24J8pBPCacDyzdow0g@mail.gmail.com>
References: <20170201161636.2109091-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170201161636.2109091-1-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Feb 1, 2017 at 5:16 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> The rework of the suspend/resume handling uses the wrong #ifdef check, leading
> to a build warning without CONFIG_PM_SLEEP:
>
> drivers/pinctrl/samsung/pinctrl-samsung.c:1142:12: error: 'samsung_pinctrl_resume' defined but not used [-Werror=unused-function]
> drivers/pinctrl/samsung/pinctrl-samsung.c:1092:12: error: 'samsung_pinctrl_suspend' defined but not used [-Werror=unused-function]
>
> Using a __maybe_unused annotation instead of the #ifdef is a simple way to
> avoid this problem class.
>
> Fixes: 2b24efa8e5c5 ("pinctrl: samsung: Replace syscore ops with standard platform device pm_ops")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied with Marek's ACK.

Yours,
Linus Walleij
