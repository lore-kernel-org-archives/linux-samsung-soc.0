From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFT][PATCH] arm64: dts: exynos: Remove unneeded address space
 mapping for soc node
Date: Sun, 29 Apr 2018 19:26:41 +0200
Message-ID: <20180429172641.d3hiwr5omrmmo5eh@kozik-lap>
References: <CGME20180424173731epcas2p15cddb6a4ea379f6d1736a93961a9c913@epcas2p1.samsung.com>
 <20180424173652.14735-1-krzk@kernel.org>
 <4ebc237b-b29a-0169-8d1b-8726b33bbf9c@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4ebc237b-b29a-0169-8d1b-8726b33bbf9c@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Apr 25, 2018 at 07:52:45AM +0200, Marek Szyprowski wrote:
> Hi Krzysztof,
> 
> On 2018-04-24 19:36, Krzysztof Kozlowski wrote:
> > Remove the address space mapping between root and soc nodes to fix
> > DTC warnings in Exynos5433 and Exynos7 like:
> >
> >      arch/arm64/boot/dts/exynos/exynos5433-tm2.dtb:
> >          Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Works fine on Samsung Exynos5433-based TM2e board.
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks for testing! Applied.


Best regards,
Krzysztof
