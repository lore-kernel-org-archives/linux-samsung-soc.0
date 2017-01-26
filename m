From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] clk: samsung: mark s3c...._clk_sleep_init() as __init
Date: Thu, 26 Jan 2017 07:58:09 +0200
Message-ID: <20170126055809.fa2vgn54b7uk7wy5@kozik-lap>
References: <1485293599-23581-1-git-send-email-martin@kaiser.cx>
 <1485380545-24815-1-git-send-email-martin@kaiser.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1485380545-24815-1-git-send-email-martin@kaiser.cx>
Sender: linux-clk-owner@vger.kernel.org
To: martin@kaiser.cx
Cc: Stephen Boyd <sboyd@codeaurora.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jan 25, 2017 at 10:42:25PM +0100, martin@kaiser.cx wrote:
> From: Martin Kaiser <martin@kaiser.cx>
> 
> These functions are referencing s3c...._clk_regs[], which are marked as
> __initdata. When compiling with CONFIG_DEBUG_SECTION_MISMATCH=y, this
> produces warnings like
> 
> WARNING: vmlinux.o(.text+0x198350):
> Section mismatch in reference from the function s3c2410_clk_sleep_init()
> to the (unknown reference) .init.data:(unknown)
> 
> Mark the s3c...._clk_sleep_init() functions as __init in
> order to fix this.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
> v2:
> Fix the commit message, describe what the problem really is.
> (Thanks, Krzysztof)
> 
>  drivers/clk/samsung/clk-s3c2410.c |    4 ++--
>  drivers/clk/samsung/clk-s3c2412.c |    4 ++--
>  drivers/clk/samsung/clk-s3c2443.c |    4 ++--
>  drivers/clk/samsung/clk-s3c64xx.c |    4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

