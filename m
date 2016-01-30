From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 4/4] clk: s2mps11: remove redundant code
Date: Fri, 29 Jan 2016 16:34:12 -0800
Message-ID: <20160130003412.GK12841@codeaurora.org>
References: <1453284864-8082-1-git-send-email-andi.shyti@samsung.com>
 <1453284864-8082-5-git-send-email-andi.shyti@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453284864-8082-5-git-send-email-andi.shyti@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Andi Shyti <andi@etezian.org>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 01/20, Andi Shyti wrote:
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

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
