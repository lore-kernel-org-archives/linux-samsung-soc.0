From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] mfd: max8997: Enale irq-wakeup unconditionally
Date: Wed, 5 Sep 2018 12:40:05 +0200
Message-ID: <CAJKOXPe-LDrDK8htEb3FrRn_UPd_6j7ZZ-adj8g8Xoxm--mojA@mail.gmail.com>
References: <CGME20180905093305eucas1p19cbdec510c32cedaf9a9de58fd2de9e1@eucas1p1.samsung.com>
 <20180905093243.3861-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905093243.3861-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, myungjoo.ham@samsung.com, lee.jones@linaro.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 5 Sep 2018 at 11:33, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> IRQ wakeup support for MAX8997 driver was initially configured by
> respective property in pdata. However, after the driver conversion to
> device-tree, setting it was left as 'todo'. Nowadays most of other MAX PMIC
> MFD drivers initialized from device-tree simply assume unconditionally that
> they can be an irq wakeup source, so enable wakeup support also for
> MAX8997. This fixes support for wakeup from MAX8997 RTC alarm.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

If you want to have wakeup always, then just remove pd->wakeup and use
always true in device_init_wakeup(). Otherwise (if it still should be
configurable), use wakeup-source property in DTS:
https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/power/wakeup-source.txt

Best regards,
Krzysztof

> ---
>  drivers/mfd/max8997.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/mfd/max8997.c b/drivers/mfd/max8997.c
> index 3f554c447521..7155e991cb82 100644
> --- a/drivers/mfd/max8997.c
> +++ b/drivers/mfd/max8997.c
> @@ -152,12 +152,7 @@ static struct max8997_platform_data *max8997_i2c_parse_dt_pdata(
>                 return ERR_PTR(-ENOMEM);
>
>         pd->ono = irq_of_parse_and_map(dev->of_node, 1);
> -
> -       /*
> -        * ToDo: the 'wakeup' member in the platform data is more of a linux
> -        * specfic information. Hence, there is no binding for that yet and
> -        * not parsed here.
> -        */
> +       pd->wakeup = true;
>
>         return pd;
>  }
> --
> 2.17.1
>
