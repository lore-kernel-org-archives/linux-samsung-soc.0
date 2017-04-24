From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 6/6] clk: samsung: s5pv210-audss: Convert to the new
 clk_hw API
Date: Mon, 24 Apr 2017 08:56:50 +0200
Message-ID: <CAJKOXPf_0DMHPVXs15e6X_JuajENQTKOZ5ekNejVaez1KOPVGw@mail.gmail.com>
References: <CGME20170424064231eucas1p2dc993650881054dfea9aadb6abb0eb38@eucas1p2.samsung.com>
 <1493016143-21569-1-git-send-email-m.szyprowski@samsung.com> <1493016143-21569-7-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1493016143-21569-7-git-send-email-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Apr 24, 2017 at 8:42 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Clock providers should use the new struct clk_hw based API, so convert
> Samsung S5PV210 Audio Subsystem clock provider to the new approach.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-s5pv210-audss.c | 50 +++++++++++++++++----------------
>  1 file changed, 26 insertions(+), 24 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
