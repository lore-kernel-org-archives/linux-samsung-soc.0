From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH RESEND] ARM: dts: exynos: Fix audio (microphone) routing
 on Odroid XU3
Date: Wed, 20 Mar 2019 20:57:53 +0100
Message-ID: <20190320195753.GA9956@kozik-lap>
References: <20190319205522.GD16150@kozik-lap>
 <CGME20190320100002epcas2p2c85f13b20896f837aa5a48643b917680@epcas2p2.samsung.com>
 <20190320095950.23566-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190320095950.23566-1-s.nawrocki@samsung.com>
Sender: stable-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, kgene@kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Mar 20, 2019 at 10:59:50AM +0100, Sylwester Nawrocki wrote:
> The name of CODEC input widget to which microphone is connected through
> the "Headphone" jack is "IN12" not "IN1". This fixes microphone support
> on Odroid XU3.
> 
> Cc: <stable@vger.kernel.org> # v4.14+
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi | 2 +-

Thanks, applied.

Best regards,
Krzysztof
