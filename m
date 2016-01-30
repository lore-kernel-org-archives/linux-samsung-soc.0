From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 2/4] clk: s2mps11: allocate only one structure for
 clock init
Date: Fri, 29 Jan 2016 16:34:04 -0800
Message-ID: <20160130003404.GI12841@codeaurora.org>
References: <1453284864-8082-1-git-send-email-andi.shyti@samsung.com>
 <1453284864-8082-3-git-send-email-andi.shyti@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453284864-8082-3-git-send-email-andi.shyti@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Andi Shyti <andi@etezian.org>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 01/20, Andi Shyti wrote:
> The driver allocates three structures, s2mpsxx_clk_init, for
> three different clock types (s2mps11, s2mps13 and s2mps14). They
> are quite similar but they differ only by the name. Only one of
> these structures is used, while the others lie unused in the
> memory.
> 
> The clock's name, though, is not such a meaningful information
> and by assigning the same name to the initial data we can avoid
> over allocation. The common name chosen will be s2mps11,
> coherently with the device driver name, instead of the clock
> device.
> 
> Therefore, remove the structures associated to s2mps13 and
> s2mps14 and use only the one referred to s2mps11 for all kind of
> clocks.
> 
> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> Suggested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
