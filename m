From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: Fix audio routing on
 exynos5422-odroidxu3
Date: Tue, 19 Mar 2019 21:53:55 +0100
Message-ID: <20190319205355.GC16150@kozik-lap>
References: <CGME20190306104113epcas1p4a12ebf1aac63883cbd80b2750be76d06@epcas1p4.samsung.com>
 <20190306104056.7603-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190306104056.7603-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: kgene@kernel.org, robh+dt@kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Mar 06, 2019 at 11:40:56AM +0100, Sylwester Nawrocki wrote:
> Add missing audio routing entry for the capture stream, this change
> is required to fix audio recording on Odroid XU3.
> 
> Fixes: 885b005d232c ("ARM: dts: exynos: Add support for secondary DAI to Odroid XU3")

Thanks, applied.

Best regards,
Krzysztof
