From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFT v3 4/8] ARM: dts: exynos: Remove MCT subnode for interrupt
 map on Exynos4210
Date: Mon, 23 Sep 2019 09:13:17 +0200
Message-ID: <20190923071317.GA4246@pi3>
References: <20190921170152.5033-1-krzk@kernel.org>
 <CGME20190921203810epcas3p39f3d9e3224d2c5ef61c1e18df2ab403d@epcas3p3.samsung.com>
 <20190921170152.5033-4-krzk@kernel.org>
 <c1d02aa3-b5f2-1c5b-0b7b-8749e7c0ce9a@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c1d02aa3-b5f2-1c5b-0b7b-8749e7c0ce9a@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <snawrocki@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Sep 23, 2019 at 08:56:46AM +0200, Marek Szyprowski wrote:
> Hi Krzysztof,
> 
> On 21.09.2019 19:01, Krzysztof Kozlowski wrote:
> > Multi Core Timer node has interrupts routed to two different parents -
> > GIC and combiner.  This was modeled with a interrupt-map within a
> > subnode but can be expressed in an easier and more common way, directly
> > in the node itself.
> 
> Maybe we should simply use 'interrupts-extended' based approach and 
> simplify mct node even more (get rid of interrupt-parent, interrupts, 
> size/address cells)?

Indeed, that looks like the tool for this job. Thanks for hint, I'll try
it.

Best regards,
Krzysztof
