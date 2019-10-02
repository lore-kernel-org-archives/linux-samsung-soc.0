From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 2/8] ARM: dts: exynos: Rename Multi Core Timer node to
 "timer"
Date: Wed, 2 Oct 2019 17:49:47 +0200
Message-ID: <20191002154947.GD4072@kozik-lap>
References: <20190923161411.9236-1-krzk@kernel.org>
 <20190923161411.9236-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190923161411.9236-2-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <snawrocki@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Sep 23, 2019 at 06:14:05PM +0200, Krzysztof Kozlowski wrote:
> The device node name should reflect generic class of a device so rename
> the Multi Core Timer node from "mct" to "timer".  This will be also in
> sync with upcoming DT schema.  No functional change.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/exynos3250.dtsi | 2 +-
>  arch/arm/boot/dts/exynos4210.dtsi | 2 +-
>  arch/arm/boot/dts/exynos4412.dtsi | 2 +-
>  arch/arm/boot/dts/exynos5250.dtsi | 2 +-
>  arch/arm/boot/dts/exynos5260.dtsi | 2 +-
>  arch/arm/boot/dts/exynos54xx.dtsi | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

I applied all dts related patches from this set.

Best regards,
Krzysztof
