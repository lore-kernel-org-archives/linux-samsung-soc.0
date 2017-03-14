From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 3/3] arm64: exynos: Enable Exynos PMU and PM domains drivers
Date: Tue, 14 Mar 2017 15:17:09 +0100
Message-ID: <5813978.inLg6sm6zB@amdc3058>
References: <20170311213856.21701-1-krzk@kernel.org>
 <20170311213856.21701-4-krzk@kernel.org>
 <CGME20170314141711epcas1p40ae1d73674e2c0eaa95da6d021456452@epcas1p4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20170311213856.21701-4-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Saturday, March 11, 2017 11:38:56 PM Krzysztof Kozlowski wrote:
> Enable EXYNOS_PM_DOMAINS because recently Exynos5433 got support for
> Power Management domains.  The Exynos5433 pinctrl driver requires
> EXYNOS_PMU to get the syscon-regmap for PMU address space.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
