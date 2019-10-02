From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 resend] ARM: dts: exynos: remove obsolete IRQ lines
Date: Wed, 2 Oct 2019 17:48:43 +0200
Message-ID: <20191002154843.GB4072@kozik-lap>
References: <CAJKOXPcs5K46U9mF8evCpbEap_j0Sd5kUk-xiWjwyihAL7te=Q@mail.gmail.com>
 <CGME20190919134622eucas1p1947abc201f86d414bd0b0635f2d91cfe@eucas1p1.samsung.com>
 <20190919134547.11671-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190919134547.11671-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Maciej Falkowski <m.falkowski@samsung.com>, mark.rutland@arm.com, robh@kernel.org, a.hajda@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Sep 19, 2019 at 03:45:47PM +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> In commit 7222e8db2d50 ("iommu/exynos: Fix build errors") Exynos3250
> iommu driver stopped supporting two IRQ lines. The second IRQ line in DTS
> is ignored and is not needed.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250.dtsi | 9 +++------

Thanks, applied.

Best regards,
Krzysztof
