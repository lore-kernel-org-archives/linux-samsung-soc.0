From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] regulator: s2mps11: Fix GPIO descriptor initialization
Date: Tue, 20 Nov 2018 13:51:59 +0100
Message-ID: <CAJKOXPc7HA58+zxny3fWJr7mVMqOx9xsKck+-7EHLsfymhfjcQ@mail.gmail.com>
References: <CGME20181120123855eucas1p1a969fba923e9243e576cae0b632504af@eucas1p1.samsung.com>
 <20181120123844.3003-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181120123844.3003-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 20 Nov 2018 at 13:39, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> GPIO descriptor array must be zero initialized to ensure that core will
> properly handle also the case when no external GPIO pin is defined.
>
> Fixes: 1c984942f0a4 ("regulator: s2mps11: Pass descriptor instead of GPIO number")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> This fixes broken eMMC boot on Artik, Rinato and Odroid XU3/XU4/HC1
> boards.

I missed that on my review. Now it looks fine, thanks for fixing it!
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


> ---
>  drivers/regulator/s2mps11.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
> index 6fec45897194..63e66f485cc0 100644
> --- a/drivers/regulator/s2mps11.c
> +++ b/drivers/regulator/s2mps11.c
> @@ -1134,9 +1134,8 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
>                 return -EINVAL;
>         }
>
> -       s2mps11->ext_control_gpiod = devm_kmalloc_array(&pdev->dev,
> -                       rdev_num, sizeof(*s2mps11->ext_control_gpiod),
> -                       GFP_KERNEL);
> +       s2mps11->ext_control_gpiod = devm_kcalloc(&pdev->dev, rdev_num,
> +                              sizeof(*s2mps11->ext_control_gpiod), GFP_KERNEL);
>         if (!s2mps11->ext_control_gpiod)
>                 return -ENOMEM;
>
> --
> 2.17.1
>
