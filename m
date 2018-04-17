From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl/samsung: Correct EINTG banks order
Date: Tue, 17 Apr 2018 11:12:38 +0900
Message-ID: <CA+Ln22E17WK2GA_6-AXZu9Z+Q_Nb86xO6npZvrCc21ciYwHt8w@mail.gmail.com>
References: <1523893966-8884-1-git-send-email-pawel.mikolaj.chmiel@gmail.com> <1523893966-8884-2-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523893966-8884-2-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "moderated list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>, linux-gpio@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

2018-04-17 0:52 GMT+09:00 Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com=
>:
> All banks with GPIO interrupts should be at beginning
> of bank array and without any other types of banks between them.
> This order is expected by exynos_eint_gpio_irq, when doing
> interrupt group to bank translation.
> Otherwise, kernel NULL pointer dereference would happen
> when trying to handle interrupt, due to wrong bank being looked up.
> Observed on s5pv210, when trying to handle gpj0 interrupt,
> where kernel was mapping it to gpi bank.
>
> Cc: stable@vger.kernel.org
> Fixes: 023e06dfa6882f500b9c86fd61f0b1913aa07f36 ("pinctrl: exynos: add ex=
ynos5410 SoC specific data")
> Fixes: 608a26a7bc04a39cfd7041f31ca2b2100113d14e ("pinctrl: Add s5pv210 su=
pport to pinctrl-exynos)
> Signed-off-by: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
>
> Changes from v1:
>   - Limit changes to s5pv210 and Exynos5410. Exynos3250 will be handled l=
ater.
>   - Added cc stable
>   - Added fixes tag
> ---
>  drivers/pinctrl/samsung/pinctrl-exynos-arm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>

Thanks for the patch!

Best regards,
Tomasz
