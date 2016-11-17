From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/2] clk/samsung: exynos5433: Fix parent clocks for FSYS
 block
Date: Thu, 17 Nov 2016 13:05:21 +0100
Message-ID: <af6c8094-14b1-c7b5-4549-3db6b9950703@samsung.com>
References: <CGME20161117085106eucas1p1db7f6fb1e955257c607785ee76536b18@eucas1p1.samsung.com>
 <1479372648-11242-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:63974 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964842AbcKQMFd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 07:05:33 -0500
In-reply-to: <1479372648-11242-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org

(Adding linux-clk@vger.kernel.org at Cc)

On 11/17/2016 09:50 AM, Marek Szyprowski wrote:
> The proper parent clock for FSYS block is "aclk_fsys_200" according to
> the Exynos5433 reference manual.

Applied both patches to my tree, thanks.
