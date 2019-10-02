From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 4/4] memory: samsung: exynos5422-dmc: Add support for
 interrupt from performance counters
Date: Wed, 2 Oct 2019 19:38:14 +0200
Message-ID: <20191002173814.GF21463@kozik-lap>
References: <20191002060455.3834-1-l.luba@partner.samsung.com>
 <CGME20191002060507eucas1p169394dec59f010e112eb38d83e3fb8ba@eucas1p1.samsung.com>
 <20191002060455.3834-5-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191002060455.3834-5-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, b.zolnierkie@samsung.com, kgene@kernel.org, mark.rutland@arm.com, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, robh+dt@kernel.org, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Oct 02, 2019 at 08:04:55AM +0200, Lukasz Luba wrote:
> Introduce a new interrupt driven mechanism for managing speed of the
> memory controller. The interrupts are generated due to performance
> counters overflow. The performance counters might track memory reads,
> writes, transfers, page misses, etc. In the basic algorithm tracking
> read transfers and calculating memory pressure should be enough to
> skip polling mode in devfreq.
> 
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>  drivers/memory/samsung/exynos5422-dmc.c | 345 ++++++++++++++++++++++--

Thanks, applied.

Best regards,
Krzysztof
