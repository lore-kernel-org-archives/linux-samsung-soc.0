From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] clk: samsung: exynos5433: Correct typos in SoC name
Date: Thu, 26 Jan 2017 21:08:13 +0200
Message-ID: <20170126190813.juim4lwr5oy2e4zt@kozik-lap>
References: <CGME20170126124348eucas1p19cd1a8f28f657f523ac46b48bf699674@eucas1p1.samsung.com>
 <1485434622-6936-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36096 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752814AbdAZTIV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 14:08:21 -0500
Received: by mail-wm0-f68.google.com with SMTP id r126so52466165wmr.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2017 11:08:18 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1485434622-6936-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Thu, Jan 26, 2017 at 01:43:42PM +0100, Marek Szyprowski wrote:
> This patch fixes simple typos in Exynos5433 clocks driver. The SoC name
> was refered a few times as '5443' instead of '5433'.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
