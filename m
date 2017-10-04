From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/9] clk: samsung: Remove support for obsolete Exynos4212
 CPU clock
Date: Wed, 4 Oct 2017 14:54:16 +0200
Message-ID: <CAJKOXPejmE6xZGL19ms_xZH61Ey7pg8+n7x=V9rtx6-8o+PLYA@mail.gmail.com>
References: <CGME20171003100029eucas1p2c706e911f316a58f35be7c443824f07c@eucas1p2.samsung.com>
 <20171003100016.32029-1-m.szyprowski@samsung.com> <20171003100016.32029-2-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20171003100016.32029-2-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Oct 3, 2017 at 12:00 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Support for Exynos 4212 SoC has been removed by commit bca9085e0ae9 ("ARM:
> dts: exynos: remove Exynos4212 support (dead code)"), so there is no need
> to keep dead code.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos4.c | 33 ++++-----------------------------
>  1 file changed, 4 insertions(+), 29 deletions(-)
>

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
