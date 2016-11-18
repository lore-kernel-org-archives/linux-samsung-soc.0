From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH RESEND] clk/samsung: exynos5433: mark some clocks as
 critical
Date: Fri, 18 Nov 2016 13:18:19 +0200
Message-ID: <20161118111819.GB2392@kozik-lap>
References: <1479463458-24187-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34889 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752345AbcKRLSZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 06:18:25 -0500
Content-Disposition: inline
In-Reply-To: <1479463458-24187-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Fri, Nov 18, 2016 at 11:04:18AM +0100, Marek Szyprowski wrote:
> Some parent clocks of the Exynos5433 CMUs must be always enabled to access
> any register in the given CMU or devices connected to it. For the time
> being, until a proper solution based on runtime PM is applied, mark those
> clocks as critical (instead of ignore unused) to prevent disabling them.
> 
> Reported-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
> Resend reason: corrected reported by tag.
> ---
>  drivers/clk/samsung/clk-exynos5433.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
