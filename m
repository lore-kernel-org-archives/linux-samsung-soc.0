From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 5/6] ARM: dts: Add "syscon" compatible string to
 chipid node
Date: Wed, 2 Oct 2019 17:44:37 +0200
Message-ID: <20191002154437.GB3469@kozik-lap>
References: <20190910123618.27985-1-s.nawrocki@samsung.com>
 <CGME20190910123644eucas1p234a55b19e68046900539195f55ea60dd@eucas1p2.samsung.com>
 <20190910123618.27985-6-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190910123618.27985-6-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: vireshk@kernel.org, robh+dt@kernel.org, kgene@kernel.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Sep 10, 2019 at 02:36:17PM +0200, Sylwester Nawrocki wrote:
> The CHIP ID block in addition to exact chip revision information
> contains data and control registers for ASV (Adaptive Supply Voltage)
> and ABB (Adaptive Body Bias). Add "syscon" compatible so the CHIPID
> block can be shared by respective drivers.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since v2:
>  - none
> 
> Changes since v1 (RFC):
>  - new patch
> ---
>  arch/arm/boot/dts/exynos5.dtsi | 4 ++--

Please do not forget about exynos prefix in subject.

Thanks, applied.

Best regards,
Krzysztof
