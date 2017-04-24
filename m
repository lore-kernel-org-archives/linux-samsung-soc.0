From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/6] clk: samsung: Remove dead code
Date: Mon, 24 Apr 2017 08:49:33 +0200
Message-ID: <CAJKOXPf-zuc_MriaeovcOCNpwWrgMPdXEj3ksAChRTUpNowb2A@mail.gmail.com>
References: <CGME20170424064228eucas1p2543d7f206ac18476891e500991611733@eucas1p2.samsung.com>
 <1493016143-21569-1-git-send-email-m.szyprowski@samsung.com> <1493016143-21569-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1493016143-21569-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Apr 24, 2017 at 8:42 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> samsung_clk_register_pll2550x() function is not used anymore, so remove its
> declaration.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-pll.h | 4 ----
>  1 file changed, 4 deletions(-)
>

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
