From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] pinctrl: samsung: Suppress unbinding to prevent
 theoretical attacks
Date: Fri, 20 May 2016 22:29:50 -0400
Message-ID: <7d725a0a-216e-40d9-8a65-62eeb2faaf34@osg.samsung.com>
References: <1463464926-17482-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463464926-17482-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 05/17/2016 02:02 AM, Krzysztof Kozlowski wrote:
> Although unbinding a pinctrl driver requires root privileges but it
> still might be used theoretically in certain attacks (by triggering NULL
> pointer exception or memory corruption).
> 
> Samsung pincontrol drivers are essential for system operation so their
> removal is not expected. They do not implement remove() driver callback
> and they are not buildable as modules.
> 
> Suppression of the unbinding will prevent triggering NULL pointer
> exception like this (Odroid XU3):
> 
>   $ echo 13400000.pinctrl > /sys/bus/platform/drivers/samsung-pinctrl/unbind
>   $ cat /sys/kernel/debug/gpio
> 
>   Unable to handle kernel NULL pointer dereference at virtual address 00000c44
>   pgd = ec41c000
>   [00000c44] *pgd=6d448835, *pte=00000000, *ppte=00000000
>   Internal error: Oops: 17 [#1] PREEMPT SMP ARM
>     (samsung_gpio_get) from [<c034f9a0>] (gpiolib_seq_show+0x1b0/0x26c)
>     (gpiolib_seq_show) from [<c01fb8c0>] (seq_read+0x304/0x4b8)
>     (seq_read) from [<c02dbc78>] (full_proxy_read+0x4c/0x64)
>     (full_proxy_read) from [<c01d9fb0>] (__vfs_read+0x2c/0x110)
>     (__vfs_read) from [<c01db400>] (vfs_read+0x8c/0x110)
>     (vfs_read) from [<c01db4c4>] (SyS_read+0x40/0x8c)
>     (SyS_read) from [<c01078c0>] (ret_fast_syscall+0x0/0x3c)
> 
> Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
