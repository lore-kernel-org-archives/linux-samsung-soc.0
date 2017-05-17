From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [GIT PULL] clk/samsung updates
Date: Wed, 17 May 2017 14:19:25 +0200
Message-ID: <485fbe0c-473d-fe6a-6cad-a3d1beadfab8@samsung.com>
References: <d3368372-c7c7-8d34-e8c1-64c94ffd06a9@samsung.com>
        <CGME20170517121929epcas1p18a1b1759cffbaa709b03c9516dced905@epcas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <d3368372-c7c7-8d34-e8c1-64c94ffd06a9@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 04/25/2017 12:48 PM, Sylwester Nawrocki wrote:
> Hi Stephen, Mike,
>
> This pull request contains only patches converting clk/samsung to the clk_hw
> API, if it's too late please just postpone that to 4.13 merge window. Thanks.


Please ignore this pull request, I will rebase and resend with some
patches updated since it turned out there were some issues in this
series.

> The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:
>
>   Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)
>
> are available in the git repository at:
>
>   git://linuxtv.org/snawrocki/samsung.git for-v4.12/clk/next
>
> for you to fetch changes up to 6a907d767e72eaf26c57fc54a372d34ab303bfbb:
>
>   clk: samsung: s5pv210-audss: Convert to the new clk_hw API (2017-04-25 11:32:55 +0200)
>
> ----------------------------------------------------------------
> Marek Szyprowski (6):
>       clk: samsung: Remove dead code
>       clk: samsung: Add local variable to match its purpose
>       clk: samsung: Convert common drivers to the new clk_hw API
>       clk: samsung: exynos-audss: Convert to the new clk_hw API
>       clk: samsung: exynos-clkout: Convert to the new clk_hw API
>       clk: samsung: s5pv210-audss: Convert to the new clk_hw API
>
>  drivers/clk/samsung/clk-cpu.c           | 17 +++--
>  drivers/clk/samsung/clk-exynos-audss.c  | 55 +++++++-------
>  drivers/clk/samsung/clk-exynos-clkout.c | 18 ++---
>  drivers/clk/samsung/clk-pll.c           | 14 ++--
>  drivers/clk/samsung/clk-pll.h           |  4 --
>  drivers/clk/samsung/clk-s3c2410-dclk.c  | 75 ++++++++++---------
>  drivers/clk/samsung/clk-s5pv210-audss.c | 50 ++++++-------
>  drivers/clk/samsung/clk.c               | 91 +++++++++++-------------
>  drivers/clk/samsung/clk.h               |  9 ++-
>  9 files changed, 160 insertions(+), 173 deletions(-)

--
Regards,
Sylwester
