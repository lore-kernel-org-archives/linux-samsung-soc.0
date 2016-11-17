From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH v2 1/5] arm64: dts: exynos: Fix FSYS CMU parent clocks in
 Exynos 5433 SoC
Date: Thu, 17 Nov 2016 21:56:16 +0900
Message-ID: <CAGTfZH3EATweBuEu2t-Nq6NVme5hYrHa7eC+2TMphSvdz734bA@mail.gmail.com>
References: <CGME20161117085810eucas1p2e6cfa6b12c7505e4d6a39fe7423b796b@eucas1p2.samsung.com>
 <1479373081-11586-1-git-send-email-m.szyprowski@samsung.com> <1479373081-11586-2-git-send-email-m.szyprowski@samsung.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:34496 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935134AbcKQRJR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 12:09:17 -0500
Received: by mail-qk0-f193.google.com with SMTP id 124so27183974qkh.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Nov 2016 09:09:17 -0800 (PST)
In-Reply-To: <1479373081-11586-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Hi Marek,

2016-11-17 17:57 GMT+09:00 Marek Szyprowski <m.szyprowski@samsung.com>:
> This patch corrects FSYS CMU parent clocks specified in clock controller
> node to let improved Exynos 5433 clocks driver to control proper clocks
> on FSYS<->TOP CMU boundary.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

[snip]

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
