From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/2] ARM: multi_v7_defconfig: Enable options for
 boards with Exynos SoC
Date: Wed, 9 Oct 2019 19:01:52 +0200
Message-ID: <20191009170152.GA28821@kozik-lap>
References: <20191008160234.3106-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191008160234.3106-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Simon Horman <horms+renesas@verge.net.au>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Oct 08, 2019 at 06:02:33PM +0200, Krzysztof Kozlowski wrote:
> Sync with exynos_defconfig and enable following options for Samsung
> Exynos SoC based boards:
> 1. NFC_S3FWRN5_I2C (with NFC stack): Samsung S3FWRN5 NCI NFC Controller,
>    used for example on Exynos5433 (if booted in 32-bit mode),
> 2. S3C2410_WATCHDOG: watchdog driver used on S3C, S5P and Exynos SoCs,
> 3. REGULATOR_S2MPA01: Samsung S2MPA01 regulators driver present on
>    Exynos5260 RexNos REX-RED board,
> 4. SND_SOC_ARNDALE: sound support on Arndale boards,
> 5. EXYNOS_IOMMU: IOMMU driver used on all Exynos SocS,,
> 6. EXTCON_MAX14577, EXTCON_MAX77693 and EXTCON_MAX8997: extcon drivers
>    for handling micro USB on mobile Samsung boards (Trats, Trats2,
>    Rinato),
> 7. PHY_EXYNOS5250_SATA: SATA phy for Exynos5250 present on Arndale and
>    SMDK5250 boards.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> SND_SOC_ARNDALE is in progress (patch introducing it was not yet applied)
> 
> Changes since v1:
> 1. Bring back REMOTEPROC.
> ---
>  arch/arm/configs/multi_v7_defconfig | 17 ++++++++++++++++-

Applied both.

Best regards,
Krzysztof
