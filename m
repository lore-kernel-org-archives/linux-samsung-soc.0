From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 6/7] phy: samsung: Remove dependency on obsolete SoC support
Date: Wed, 4 Oct 2017 10:16:50 +0200
Message-ID: <CAJKOXPf6a1ZrzcasmbHiYLj+p++i6rnkuDcOzH3EVRSu5Hqkag@mail.gmail.com>
References: <CGME20171004063837eucas1p22344a95b7ad1b36c6a6bc70d5d5c5ada@eucas1p2.samsung.com>
 <20171004063828.22068-1-m.szyprowski@samsung.com> <20171004063828.22068-7-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:51586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751120AbdJDIQw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 04:16:52 -0400
In-Reply-To: <20171004063828.22068-7-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Viresh Kumar <viresh.kumar@linaro.org>

On Wed, Oct 4, 2017 at 8:38 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Support for Exynos4212 SoCs has been removed by commit bca9085e0ae9 ("ARM:
> dts: exynos: remove Exynos4212 support (dead code)"), so there is no need
> to keep remaining dead code related to this SoC version.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/phy/samsung/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
