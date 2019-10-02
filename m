From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 6/6] ARM: dts: Add samsung,asv-bin property for
 odroidxu3-lite
Date: Wed, 2 Oct 2019 17:44:48 +0200
Message-ID: <20191002154448.GC3469@kozik-lap>
References: <20190910123618.27985-1-s.nawrocki@samsung.com>
 <CGME20190910123647eucas1p176bc817bbdae813e5aa9ab4745f9c285@eucas1p1.samsung.com>
 <20190910123618.27985-7-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190910123618.27985-7-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: vireshk@kernel.org, robh+dt@kernel.org, kgene@kernel.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Sep 10, 2019 at 02:36:18PM +0200, Sylwester Nawrocki wrote:
> The Exynos5422 SoC used on Odroid XU3 Lite boards belongs to
> a special ASV bin but this information cannot be read from the
> CHIPID block registers. Add samsung,asv-bin property for XU3
> Lite to ensure the ASV bin is properly determined.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since v2:
>  - none
> 
> Changes since v1 (RFC):
>  - new patch
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts | 4 ++++

Thanks, applied.

Best regards,
Krzysztof
