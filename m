From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] clocksource: exynos_mct: fix exynos4_mct_write
Date: Sun, 30 Nov 2014 07:18:56 +0900
Message-ID: <025001d00c22$77a6b5e0$66f421a0$@kernel.org>
References: <1413941828-5547-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:60800 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751304AbaK2WS6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 29 Nov 2014 17:18:58 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NFT009D7NBLVI40@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 30 Nov 2014 07:18:57 +0900 (KST)
In-reply-to: <1413941828-5547-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tobias Jakobi' <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org, 'Daniel Lezcano' <daniel.lezcano@linaro.org>, thomas.ab@samsung.com
Cc: dianders@chromium.org

Tobias Jakobi wrote:
> 
> EXYNOS4_MCT_L_MASK is defined as 0xffffff00, so applying this bitmask
> produces a number outside the range 0x00 to 0xff, which always results
> in execution of the default switch statement.
> 
> Obviously this is wrong and git history shows that the bitmask inversion
> was incorrectly set during a refactoring of the MCT code.
> 
> Fix this by putting the inversion at the correct position again.
> 
> Reported-by: GP Orcullo <kinsamanka@gmail.com>
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

+ Daniel, Thomas,

adding Doug's review tag from previous his reply.

Reviewed-by: Doug Anderson <dianders@chromium.org>

And

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Daniel,

Since this is obvious fix, can you please pick into your tree?
If any problem, please kindly let me know.

Thanks,
Kukjin

> ---
>  drivers/clocksource/exynos_mct.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index 9403061..83564c9 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -97,8 +97,8 @@ static void exynos4_mct_write(unsigned int value, unsigned long offset)
>  	writel_relaxed(value, reg_base + offset);
> 
>  	if (likely(offset >= EXYNOS4_MCT_L_BASE(0))) {
> -		stat_addr = (offset & ~EXYNOS4_MCT_L_MASK) + MCT_L_WSTAT_OFFSET;
> -		switch (offset & EXYNOS4_MCT_L_MASK) {
> +		stat_addr = (offset & EXYNOS4_MCT_L_MASK) + MCT_L_WSTAT_OFFSET;
> +		switch (offset & ~EXYNOS4_MCT_L_MASK) {
>  		case MCT_L_TCON_OFFSET:
>  			mask = 1 << 3;		/* L_TCON write status */
>  			break;
> --
> 2.0.4
