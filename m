From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2.1 2/6] clk: samsung: Add local variable to match it purpose
Date: Mon, 24 Apr 2017 09:56:05 +0200
Message-ID: <CAJKOXPdqopTqxJ4VCpVw39YGC0Gp6wzRwiBWPbFfpQXP_SAu+Q@mail.gmail.com>
References: <CGME20170424075423eucas1p239eaef08b93dade23292c175b838d9a5@eucas1p2.samsung.com>
 <CAJKOXPdDBsqHp-qXFFjcK10PUb_Vo1q6DsdgerYW4j+9ESpxfw@mail.gmail.com> <1493020452-23085-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1493020452-23085-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Apr 24, 2017 at 9:54 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Add new variable to avoid using clk pointer for different purposes across
> the exynos_register_cpu_clock() function. This will help in future rewrite
> for the new clk_hw API.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-cpu.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
