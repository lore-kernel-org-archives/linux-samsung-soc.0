From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] pinctrl/samsung: Correct EINTG banks order
Date: Mon, 9 Apr 2018 12:20:49 +0900
Message-ID: <CA+Ln22HAkE55HDEQD2H2ixTzDOhjmZ6=vT0+SKZDyDUq2c35zA@mail.gmail.com>
References: <1523210867-3806-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523210867-3806-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "moderated list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>, linux-gpio@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Pawel,

2018-04-09 3:07 GMT+09:00 Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com=
>:
> All banks with GPIO interrupts should be at beginning
> of bank array and without any other types of banks between them.
> This order is expected by exynos_eint_gpio_irq, when doing
> interrupt group to bank translation.
> Otherwise, kernel NULL pointer dereference would happen
> when trying to handle interrupt, due to wrong bank being looked up.
> Observed on s5pv210, when trying to handle gpj0 interrupt,
> where kernel was mapping it to gpi bank.

Thanks for the patch! Looks like it might be fixing quite an ugly bug indee=
d.

Just one comment for exynos3250 change below.

>
> Signed-off-by: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-exynos-arm.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm.c b/drivers/pinct=
rl/samsung/pinctrl-exynos-arm.c
> index 90c2744..de4ab07 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
> @@ -105,12 +105,12 @@ static const struct samsung_pin_bank_data s5pv210_p=
in_bank[] __initconst =3D {
>         EXYNOS_PIN_BANK_EINTG(7, 0x1c0, "gpg1", 0x38),
>         EXYNOS_PIN_BANK_EINTG(7, 0x1e0, "gpg2", 0x3c),
>         EXYNOS_PIN_BANK_EINTG(7, 0x200, "gpg3", 0x40),
> -       EXYNOS_PIN_BANK_EINTN(7, 0x220, "gpi"),
>         EXYNOS_PIN_BANK_EINTG(8, 0x240, "gpj0", 0x44),
>         EXYNOS_PIN_BANK_EINTG(6, 0x260, "gpj1", 0x48),
>         EXYNOS_PIN_BANK_EINTG(8, 0x280, "gpj2", 0x4c),
>         EXYNOS_PIN_BANK_EINTG(8, 0x2a0, "gpj3", 0x50),
>         EXYNOS_PIN_BANK_EINTG(5, 0x2c0, "gpj4", 0x54),
> +       EXYNOS_PIN_BANK_EINTN(7, 0x220, "gpi"),
>         EXYNOS_PIN_BANK_EINTN(8, 0x2e0, "mp01"),
>         EXYNOS_PIN_BANK_EINTN(4, 0x300, "mp02"),
>         EXYNOS_PIN_BANK_EINTN(8, 0x320, "mp03"),
> @@ -158,9 +158,6 @@ static const struct samsung_pin_bank_data exynos3250_=
pin_banks0[] __initconst =3D
>
>  /* pin banks of exynos3250 pin-controller 1 */
>  static const struct samsung_pin_bank_data exynos3250_pin_banks1[] __init=
const =3D {
> -       EXYNOS_PIN_BANK_EINTN(8, 0x120, "gpe0"),
> -       EXYNOS_PIN_BANK_EINTN(8, 0x140, "gpe1"),
> -       EXYNOS_PIN_BANK_EINTN(3, 0x180, "gpe2"),
>         EXYNOS_PIN_BANK_EINTG(8, 0x040, "gpk0", 0x08),

It looks like gpk0 starts with eint_offset =3D 0x08. Depending on what
the SVC register returns on this SoC, it might be group 0, which would
be fine, but also group 2, which would require this bank to be at
exynos3250_pin_banks1[2]... (or changing the way group is translated
to bank pointer, e.g. by subtracting (eint_offset / 4) from the group
number.

Sylwester, would you be able to check which group number is returned
for GPK0 bank in SVC register on Exynos 3250?

Best regards,
Tomasz
