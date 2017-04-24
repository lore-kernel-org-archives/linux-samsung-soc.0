From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 3/6] clk: samsung: Convert common drivers to the new
 clk_hw API
Date: Mon, 24 Apr 2017 08:55:20 +0200
Message-ID: <CAJKOXPc0gqW5qR6BCj7rS_4KDLoDFQFT634Sum1AoNPpddxEig@mail.gmail.com>
References: <CGME20170424064229eucas1p2f2feb95623d6c4ac8db01ff519a53fa9@eucas1p2.samsung.com>
 <1493016143-21569-1-git-send-email-m.szyprowski@samsung.com> <1493016143-21569-4-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1493016143-21569-4-git-send-email-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Apr 24, 2017 at 8:42 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Clock providers should use the new struct clk_hw based API, so convert
> Samsung clock providers and their helper functions to the new approach.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-cpu.c          |  8 ++-
>  drivers/clk/samsung/clk-pll.c          | 14 +++---
>  drivers/clk/samsung/clk-s3c2410-dclk.c | 75 ++++++++++++++--------------
>  drivers/clk/samsung/clk.c              | 91 +++++++++++++++-------------------
>  drivers/clk/samsung/clk.h              |  9 ++--
>  5 files changed, 92 insertions(+), 105 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
