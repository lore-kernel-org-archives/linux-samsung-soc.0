From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] clk: samsung: Add git tree entry to MAINTAINERS
Date: Tue, 06 Feb 2018 11:09:19 +0900
Message-ID: <5A790E4F.7060701@samsung.com>
References: <CGME20180205144215epcas1p4f7da6d58948bac6f4f313108596a0fb4@epcas1p4.samsung.com>
        <20180205144158.10500-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <20180205144158.10500-1-s.nawrocki@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-clk@vger.kernel.org
Cc: sboyd@codeaurora.org, mturquette@baylibre.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, krzk@kernel.org, tomasz.figa@gmail.com, b.zolnierkie@samsung.com, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Sylwester,

On 2018년 02월 05일 23:41, Sylwester Nawrocki wrote:
> Add a missing git tree entry for drivers/clk/samsung.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aa71ab52fd76..502442dc08eb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12001,6 +12001,7 @@ M:	Tomasz Figa <tomasz.figa@gmail.com>
>  M:	Chanwoo Choi <cw00.choi@samsung.com>
>  S:	Supported
>  L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git
>  F:	drivers/clk/samsung/
>  F:	include/dt-bindings/clock/exynos*.h
>  F:	Documentation/devicetree/bindings/clock/exynos*.txt
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
