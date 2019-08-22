From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] soc: samsung: Select missing dependency for
 EXYNOS_CHIPID
Date: Thu, 22 Aug 2019 20:17:33 +0200
Message-ID: <20190822181733.GA10900@kozik-lap>
References: <20190821150711.31398-1-s.nawrocki@samsung.com>
 <CGME20190821153936eucas1p22cd1a6105806cb5ad7b43252852fec05@eucas1p2.samsung.com>
 <20190821153926.12297-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190821153926.12297-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: kgene@kernel.org, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Aug 21, 2019 at 05:39:26PM +0200, Sylwester Nawrocki wrote:
> The chipid driver uses the MFD syscon API but it was not covered
> properly in Kconfig.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  drivers/soc/samsung/Kconfig | 1 +

Thanks, applied.

Best regards,
Krzysztof
