From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2 4/4] phy: exynos: Use one define for enable bit
Date: Tue, 14 Mar 2017 15:46:10 +0100
Message-ID: <2746282.jBJ7tRjldv@amdc3058>
References: <20170311182534.13345-1-krzk@kernel.org>
 <20170311182534.13345-5-krzk@kernel.org>
 <CGME20170314144612epcas5p43922a86ea62ef32bc8e32dc27f5164ab@epcas5p4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20170311182534.13345-5-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Lee Jones <lee.jones@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


Hi,

On Saturday, March 11, 2017 08:25:34 PM Krzysztof Kozlowski wrote:
> There is no need for separate defines for Exynos4 and Exynos5 phy enable
> bit and MIPI phy reset bits.  In both cases there are the same so
> simplify it.
> 
> This reduces number of defines and allows removal of one header file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/phy/phy-exynos-dp-video.c           |  5 ++--
>  drivers/phy/phy-exynos-mipi-video.c         | 39 ++++++++++++++---------------
>  drivers/phy/phy-exynos5-usbdrd.c            |  5 ++--
>  include/linux/mfd/syscon/exynos5-pmu.h      | 22 ----------------
>  include/linux/soc/samsung/exynos-regs-pmu.h |  3 ++-
>  5 files changed, 25 insertions(+), 49 deletions(-)
>  delete mode 100644 include/linux/mfd/syscon/exynos5-pmu.h

[...]

> --- a/include/linux/mfd/syscon/exynos5-pmu.h
> +++ /dev/null

> -#define EXYNOS5433_PAD_RETENTION_AUD_OPTION		(0x3028)
> -#define EXYNOS5433_PAD_INITIATE_WAKEUP_FROM_LOWPWR	BIT(28)

EXYNOS5433_PAD_INITIATE_WAKEUP_FROM_LOWPWR is not defined in
<soc/samsung/exynos-regs-pmu.h> and is still used by
drivers/mfd/exynos-lpass.c (at least in next-20170310)

Do I miss something or it needs to be fixed?

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
