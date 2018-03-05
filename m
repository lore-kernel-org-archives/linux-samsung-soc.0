From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: Fix IOMMU support for GScaler devices
 on Exynos5250
Date: Mon, 5 Mar 2018 19:14:11 +0100
Message-ID: <20180305181411.vmilqauts5ujgljq@kozik-lap>
References: <CGME20180302160746eucas1p2274e7b1cba7f90acc9beec511c09e279@eucas1p2.samsung.com>
 <20180302160742.16947-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180302160742.16947-1-m.szyprowski@samsung.com>
Sender: stable-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, stable@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Mar 02, 2018 at 05:07:42PM +0100, Marek Szyprowski wrote:
> The proper name for the property, which assign given device to IOMMU is
> 'iommus', not 'iommu'. Fix incorrect name and let all GScaler devices
> to be properly handled when IOMMU support is enabled.
> 
> Reported-by: Andrzej Hajda <a.hajda@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Fixes: 6cbfdd73a94f ("ARM: dts: add sysmmu nodes for exynos5250")
> CC: stable@vger.kernel.org # v4.8+
> ---
> This issue has been introduced in kernel v4.2-rc1, but this patch applies
> cleanly only on v4.8+ kernels.
> ---
>  arch/arm/boot/dts/exynos5250.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof
