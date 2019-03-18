From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/2] ARM: dts: exynos: Use ADC for Exynos4x12 on Exyno4412
Date: Mon, 18 Mar 2019 19:38:19 +0100
Message-ID: <20190318183819.GA4730@kozik-lap>
References: <20190212174550.4383-1-krzk@kernel.org>
 <20190212174550.4383-3-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190212174550.4383-3-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Feb 12, 2019 at 06:45:50PM +0100, Krzysztof Kozlowski wrote:
> Exynos4412 should use "samsung,exynos4212-adc" compatible to report
> proper number of (four) channels.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/exynos4412.dtsi | 2 +-

Applied.

Best regards,
Krzysztof
