From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 3/7] mmc: sdhci-s3c: Fix driver data for Exynos4 SoCs
Date: Wed, 04 Oct 2017 10:39:28 +0200
Message-ID: <104fe074-3e54-f37c-ac4b-704e5153c154@samsung.com>
References: <20171004063828.22068-1-m.szyprowski@samsung.com>
        <CGME20171004063835eucas1p1082954a0113f374f11ff364cf4b95408@eucas1p1.samsung.com>
        <20171004063828.22068-4-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-reply-to: <20171004063828.22068-4-m.szyprowski@samsung.com>
Content-language: en-GB
Sender: linux-mmc-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-mmc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 10/04/2017 08:38 AM, Marek Szyprowski wrote:
> Support for non-dt based initialization for Exynos SoCs has been removed,
> so there is no need to keep driver IDs for this case. While touching this,
> replace odd conditional code for instantiating driver data for Exynos4
> SoCs with a simple reference and move that driver data under CONFIG_OF.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Sylwester Nawrocki <m.szyprowski@samsung.com>
