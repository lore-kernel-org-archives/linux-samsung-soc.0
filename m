From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] soc: samsung: chipid: Make exynos_chipid_early_init()
 static
Date: Sun, 6 Oct 2019 17:51:34 +0200
Message-ID: <20191006155134.GD29365@kozik-lap>
References: <CGME20190904085001eucas1p2b3a120d6206983d47f0084b872042342@eucas1p2.samsung.com>
 <20190904084951.28971-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190904084951.28971-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: kgene@kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Sep 04, 2019 at 10:49:51AM +0200, Sylwester Nawrocki wrote:
> Add missing static qualifier to the chipid initcall function.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  drivers/soc/samsung/exynos-chipid.c | 2 +-

Thanks, applied.

Best regards,
Krzysztof
