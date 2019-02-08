From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] pinctrl: samsung: Remove legacy API for handling
 external wakeup interrupts mask
Date: Fri, 8 Feb 2019 14:53:06 +0100
Message-ID: <CACRpkdbXZnYP0=BXqoSyr9=y4+WWWax+KYQ8MvcAUVyMVL652w@mail.gmail.com>
References: <20190205195909.3565-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190205195909.3565-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sylwester Nawrocki <snawrocki@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Feb 5, 2019 at 8:59 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Remove the legacy, ugly API of exposing the static value of external
> wakeup interrupts mask, because all arch-machine users where converted
> to use generic implementation from pinctrl driver.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Sylwester Nawrocki <snawrocki@kernel.org>
> Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

Patch applied for v5.1.

Yours,
Linus Walleij
