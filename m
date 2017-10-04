From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 5/7] clk: samsung: Remove support for Exynos4212 SoCs in
 Exynos CLKOUT driver
Date: Wed, 4 Oct 2017 10:16:37 +0200
Message-ID: <CAJKOXPeQpwMYwcP8iG1_UrbVeEV1XRBNj8bCYHxLgKtoqoEnpg@mail.gmail.com>
References: <CGME20171004063836eucas1p1ab64c174baf2773eb17d1c94cd05ed8c@eucas1p1.samsung.com>
 <20171004063828.22068-1-m.szyprowski@samsung.com> <20171004063828.22068-6-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20171004063828.22068-6-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Oct 4, 2017 at 8:38 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Support for Exynos4212 SoCs has been removed by commit bca9085e0ae9 ("ARM:
> dts: exynos: remove Exynos4212 support (dead code)"), so there is no need
> to keep remaining dead code related to this SoC version.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos-clkout.c | 2 --
>  1 file changed, 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
