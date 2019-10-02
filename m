From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 3/4] ARM: dts: exynos: map 0x10000 SFR instead of
 0x100 in DMC Exynos5422
Date: Wed, 2 Oct 2019 19:29:31 +0200
Message-ID: <20191002172931.GE21463@kozik-lap>
References: <20191002060455.3834-1-l.luba@partner.samsung.com>
 <CGME20191002060506eucas1p28c9670128f5adfb628d7e84ce55c6e60@eucas1p2.samsung.com>
 <20191002060455.3834-4-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191002060455.3834-4-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, b.zolnierkie@samsung.com, kgene@kernel.org, mark.rutland@arm.com, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, robh+dt@kernel.org, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Oct 02, 2019 at 08:04:54AM +0200, Lukasz Luba wrote:
> There is a need to access registers at address offset near 0x10000.
> These registers are private DMC performance counters, which might be used
> as interrupt trigger when overflow. Potential usage is to skip polling
> in devfreq framework and switch to interrupt managed bandwidth control.
> 
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi | 2 +-

Thanks, applied but re-ordered with previous one. Applying first
interrupts enables the interrupt mode which does not make sense without
extended mapping

Best regards,
Krzysztof
