From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] soc: samsung: chipid: Remove the regmap lookup error log
Date: Thu, 22 Aug 2019 20:17:45 +0200
Message-ID: <20190822181745.GB10900@kozik-lap>
References: <CGME20190821150548eucas1p15139f733b00e3a1a107efe39f6712fe9@eucas1p1.samsung.com>
 <20190821150539.31207-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190821150539.31207-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: jonathanh@nvidia.com, kgene@kernel.org, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Aug 21, 2019 at 05:05:39PM +0200, Sylwester Nawrocki wrote:
> In commit 40d8aff614f7 ("soc: samsung: chipid: Convert exynos-chipid
> driver to use the regmap API") of_find_compatible_node() call was
> substituted with syscon_regmap_lookup_by_compatible() but also an error
> log was added for case where lookup fails. On multiplatform the lookup
> will always fail on any non-samsung device so the log is incorrect.
> Remove the error log and just return an error code from
> syscon_regmap_lookup_by_compatible() which internally calls
> of_find_compatible_node().
> 
> Reported-by: Jon Hunter <jonathanh@nvidia.com>

Thanks, applied.

Best regards,
Krzysztof
