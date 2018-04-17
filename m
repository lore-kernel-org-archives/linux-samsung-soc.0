From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl/samsung: Document required order of banks
Date: Tue, 17 Apr 2018 11:14:22 +0900
Message-ID: <CA+Ln22Hgn5VmeUAdcmHi64-HdRqpuGBBN9uUzmFTOBatagzXeg@mail.gmail.com>
References: <1523893966-8884-1-git-send-email-pawel.mikolaj.chmiel@gmail.com> <1523893966-8884-3-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523893966-8884-3-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "moderated list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>, linux-gpio@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

2018-04-17 0:52 GMT+09:00 Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com=
>:
> This patch documents requirement coming from the way
> exynos_eint_gpio_irq() is working now, which expects
> EINTG banks to be at the beginning of the bank arrays.
>
> Cc: stable@vger.kernel.org

Probably no need for this one to go to stable, but either is fine for me.

> Signed-off-by: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-exynos-arm.c   | 26 ++++++++++++++++++++=
++++++
>  drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 20 ++++++++++++++++++++
>  2 files changed, 46 insertions(+)

Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>

Thanks for the patch!

Best regards,
Tomasz
