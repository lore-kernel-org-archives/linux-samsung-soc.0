From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2] mfd: max8997: Disable interrupt handling for
 suspend/resume cycle
Date: Tue, 11 Sep 2018 15:53:30 +0100
Message-ID: <20180911145330.GX4185@dell>
References: <CGME20180905143815eucas1p29cb4247cfef8180433d9b4627f5ff883@eucas1p2.samsung.com>
 <20180905143606.5916-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180905143606.5916-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, MyungJoo Ham <myungjoo.ham@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 05 Sep 2018, Marek Szyprowski wrote:

> Disable IRQs during suspend/resume cycle to ensure handling of wakeup
> interrupts (i.e. RTC wake alarm) after max8997_resume(). This way it can
> be properly handled when I2C bus is finally available. This pattern is
> also used in other MAX PMIC MFD drivers.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> changelog:
> v2:
> - reordered the sequence of operation as suggested by Krzysztof Kozlowski
> ---
>  drivers/mfd/max8997.c | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
