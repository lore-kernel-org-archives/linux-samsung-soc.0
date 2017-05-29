From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: samsung: Constify wakeup driver specific data
Date: Mon, 29 May 2017 11:34:49 +0200
Message-ID: <CACRpkdYN20Q3qcBtORPArCMfdTCGWNoHsyRyB9EYOXiwqN0Miw@mail.gmail.com>
References: <20170523184141.24284-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170523184141.24284-1-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, May 23, 2017 at 8:41 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Static exynos_irq_chip structures, containing driver specific data, are
> referenced only through opaque data pointer in const of_device_id table.
> The contents of pointed memory (exynos_irq_chip structure itself) is
> then copied with kmemdup() during wakeup initialization so
> exynos_irq_chip can be made const for code safenes.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

All looks good to me, Acked-by.

Expecting to get this in a pull request.

Yours,
Linus Walleij
