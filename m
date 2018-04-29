From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/5] ARM: dts: exynos: Remove unnecessary address/size
 properties in Midas boards
Date: Sun, 29 Apr 2018 19:28:28 +0200
Message-ID: <20180429172828.2j2qjuwl6z2oipup@kozik-lap>
References: <20180424174602.3915-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180424174602.3915-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Apr 24, 2018 at 07:45:58PM +0200, Krzysztof Kozlowski wrote:
> The children of regulators node do not have reg/ranges properties.  Move the
> children up one level, get rid of regulators node and remove
> address-cells and size-cells properties.  This fixes warnings for
> Exynos4412 Midas family boards:
> 
>     arch/arm/boot/dts/exynos4412-i9300.dtb: Warning (avoid_unnecessary_addr_size):
>         /regulators: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>     arch/arm/boot/dts/exynos4412-i9305.dtb: Warning (avoid_unnecessary_addr_size):
>         /regulators: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>     arch/arm/boot/dts/exynos4412-n710x.dtb: Warning (avoid_unnecessary_addr_size):
>         /regulators: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 32 +++++------
>  arch/arm/boot/dts/exynos4412-midas.dtsi     | 86 ++++++++++++++---------------
>  2 files changed, 55 insertions(+), 63 deletions(-)

Applied entire series.


Best regards,
Krzysztof
