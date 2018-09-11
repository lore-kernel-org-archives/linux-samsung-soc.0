From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2] mfd: max8997: Enale irq-wakeup unconditionally
Date: Tue, 11 Sep 2018 15:44:22 +0100
Message-ID: <20180911144422.GW4185@dell>
References: <CGME20180905115422eucas1p2150fd04724ec667bd8798023a73f1127@eucas1p2.samsung.com>
 <20180905115407.10595-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180905115407.10595-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, MyungJoo Ham <myungjoo.ham@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 05 Sep 2018, Marek Szyprowski wrote:

> IRQ wake up support for MAX8997 driver was initially configured by
> respective property in pdata. However, after the driver conversion to
> device-tree, setting it was left as 'todo'. Nowadays most of other PMIC MFD
> drivers initialized from device-tree assume that they can be an irq wakeup
> source, so enable it also for MAX8997. This fixes support for wakeup from
> MAX8997 RTC alarm.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> changelog:
> v2:
> - removed pdata->wakeup entry as suggested by Krzysztof Kozlowski
> ---
>  drivers/mfd/max8997.c       | 8 +-------
>  include/linux/mfd/max8997.h | 1 -
>  2 files changed, 1 insertion(+), 8 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
