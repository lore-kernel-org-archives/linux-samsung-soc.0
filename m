From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 4/9] ARM: EXYNOS: enable exynos_chipid for ARCH_EXYNOS
Date: Thu, 15 Aug 2019 20:29:29 +0200
Message-ID: <20190815182929.GE14360@kozik-lap>
References: <20190813150827.31972-1-s.nawrocki@samsung.com>
 <CGME20190813150854eucas1p14716609be6697222ae5795328cb2ed04@eucas1p1.samsung.com>
 <20190813150827.31972-5-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190813150827.31972-5-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: robh+dt@kernel.org, vireshk@kernel.org, devicetree@vger.kernel.org, kgene@kernel.org, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Aug 13, 2019 at 05:08:22PM +0200, Sylwester Nawrocki wrote:
> From: Pankaj Dubey <pankaj.dubey@samsung.com>
> 
> As now we have chipid driver to initialize SoC related information
> let's include it in build by default.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since v1 (RFC):

Thanks, applied.

Best regards,
Krzysztof
