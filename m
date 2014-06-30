From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 3/6] clk: samsung: exynos4: Remove SRC_MASK_ISP gates
Date: Mon, 30 Jun 2014 15:50:22 +0200
Message-ID: <53B16B1E.8090206@samsung.com>
References: <1403618235-19353-1-git-send-email-t.figa@samsung.com>
 <1403618235-19353-4-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1403618235-19353-4-git-send-email-t.figa@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 24.06.2014 15:57, Tomasz Figa wrote:
> ISP special clocks have dedicated gating registers and so MUX SRC_MASK
> register should not be used. This patch fixes the problem of
> Exynos4x12-based boards freezing on system suspend, because those
> mux outputs need not to be masked while suspending.
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Cc: Mike Turquette <mturquette@linaro.org>
> ---
>  drivers/clk/samsung/clk-exynos4.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)

Applied as a fix for 3.16.

Best regards,
Tomasz
