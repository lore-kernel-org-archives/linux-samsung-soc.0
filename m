From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] pinctrl/samsung: Correct EINTG banks order
Date: Tue, 10 Apr 2018 09:06:26 +0200
Message-ID: <CAJKOXPdckxVfwU60=e7e6trbiB78ETE=G2vuY1kCrcKHaU2CzA@mail.gmail.com>
References: <1523210867-3806-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523210867-3806-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linus.walleij@linaro.org, kgene@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, Apr 8, 2018 at 8:07 PM, Paweł Chmiel
<pawel.mikolaj.chmiel@gmail.com> wrote:
> All banks with GPIO interrupts should be at beginning
> of bank array and without any other types of banks between them.
> This order is expected by exynos_eint_gpio_irq, when doing
> interrupt group to bank translation.
> Otherwise, kernel NULL pointer dereference would happen
> when trying to handle interrupt, due to wrong bank being looked up.
> Observed on s5pv210, when trying to handle gpj0 interrupt,
> where kernel was mapping it to gpi bank.

Thanks for the patch. The issue looks real although one thing was
missed - there is a gap in SVC group between GPK2 and GPL0 (pointed by
Marek Szyprowski):

0x0 - EINT_23 - gpk0
0x1 - EINT_24 - gpk1
0x2 - EINT_25 - gpk2
0x4 - EINT_27 - gpl0
0x7 - EINT_8 - gpm0

Maybe this should be done differently - to remove such hidden
requirement entirely in favor of another parameter of
EXYNOS_PIN_BANK_EINTG argument? Anyway if such hidden requirement
stays, then please document it in the source code (it maybe next to
PIN order... or next macro... or also in exynos_eint_gpio_irq()).

Beside that please add cc-stable and appropriate fixes tag,

Best regards,
Krzysztof
