From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] clk: samsung: mark s3c...._clk_sleep_init() as __init
Date: Wed, 25 Jan 2017 09:35:50 +0900
Message-ID: <5887F2E6.7060205@samsung.com>
References: <CGME20170124213354epcas2p48cd7596378462562c66017fe39774bb0@epcas2p4.samsung.com>
 <1485293599-23581-1-git-send-email-martin@kaiser.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1485293599-23581-1-git-send-email-martin@kaiser.cx>
Sender: linux-clk-owner@vger.kernel.org
To: Martin Kaiser <martin@kaiser.cx>, Stephen Boyd <sboyd@codeaurora.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Martin,

On 2017년 01월 25일 06:33, Martin Kaiser wrote:
> These functions are called only by other __init functions.
> Compiling for s3c2410 with CONFIG_DEBUG_SECTION_MISMATCH=y,
> I get warnings like
> 
> WARNING: vmlinux.o(.text+0x198350):
> Section mismatch in reference from the function s3c2410_clk_sleep_init()
> to the (unknown reference) .init.data:(unknown)
> 
> Marking the s3c...._clk_sleep() functions as __init fixes this.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/clk/samsung/clk-s3c2410.c | 4 ++--
>  drivers/clk/samsung/clk-s3c2412.c | 4 ++--
>  drivers/clk/samsung/clk-s3c2443.c | 4 ++--
>  drivers/clk/samsung/clk-s3c64xx.c | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)


Looks good to me.
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

[snip]

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
