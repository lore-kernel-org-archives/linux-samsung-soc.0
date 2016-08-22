From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND][PATCH v2] pinctrl: exynos: remove duplicate calls in irq handler
Date: Mon, 22 Aug 2016 14:08:14 +0200
Message-ID: <CACRpkdbiBgzM2Z8tJRx7RxeZrjKWRSUFOKfQgEkgpWYKbCUf5w@mail.gmail.com>
References: <15692f4c2b0.efa5c46c29252.3567074676558581477@zoho.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <15692f4c2b0.efa5c46c29252.3567074676558581477@zoho.com>
Sender: linux-gpio-owner@vger.kernel.org
To: perr perr <strongbox8@zoho.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Aug 16, 2016 at 12:45 PM, perr perr <strongbox8@zoho.com> wrote:

> Because chained_irq_enter() has already called chip->irq_mask() and
> chip->irq_ack(), also chained_irq_exit() will call chip->irq_unmask(),
> so it's not necessary to call chip->irq_*() here.
>
> Signed-off-by: Perr Zhang <strongbox8@zoho.com>
> Acked-by: Tomasz Figa <tomasz.figa@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Patch did not apply because of whitespace-damage, I guess due
to this:

User-Agent: Zoho Mail
X-Mailer: Zoho Mail

No idea what that is :D

But don't worry! I edited the patch by hand and now it is applied,
check the result in linux-next.

Yours,
Linus Walleij
