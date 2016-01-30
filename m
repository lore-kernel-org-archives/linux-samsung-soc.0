From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 3/4] clk: s2mps11: remove redundant static variables
 declaration
Date: Fri, 29 Jan 2016 16:34:09 -0800
Message-ID: <20160130003409.GJ12841@codeaurora.org>
References: <1453284864-8082-1-git-send-email-andi.shyti@samsung.com>
 <1453284864-8082-4-git-send-email-andi.shyti@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453284864-8082-4-git-send-email-andi.shyti@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Andi Shyti <andi@etezian.org>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 01/20, Andi Shyti wrote:
> The clk_table and clk_data are declared static. The clk_table
> contains the three clock data stractures belonging to the s2mps11
> driver. In the probe function it gets stored into clk_data.
> 
> Remove clk_table and refer directly to clk_data.
> 
> clk_data, itself, is also declared static. Declare locally it
> and allocate it inside the probe function, as it is not used
> anywhere else.
> 
> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
