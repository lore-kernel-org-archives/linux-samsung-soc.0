From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 4/4] clk: s2mps11: remove redundant code
Date: Thu, 21 Jan 2016 09:29:14 +0900
Message-ID: <56A0265A.2000307@samsung.com>
References: <1453284864-8082-1-git-send-email-andi.shyti@samsung.com>
 <1453284864-8082-5-git-send-email-andi.shyti@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1453284864-8082-5-git-send-email-andi.shyti@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Sangbeom Kim <sbkim73@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Andi Shyti <andi@etezian.org>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 20.01.2016 19:14, Andi Shyti wrote:
> The definition of s2mps11_name is meant to resolve the name of a
> given clock. Remove it because the clocks have the same name we
> can get it directly from the s2mps11_clks_init structure.
> 
> While in the probe function the s2mps11_clks is used only to
> iterate through the s2mps11_clks. The naming itself brings
> confusion and the readability does not improve much.
> 
> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> ---
>  drivers/clk/clk-s2mps11.c | 36 ++++++++++++++++--------------------
>  1 file changed, 16 insertions(+), 20 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof


