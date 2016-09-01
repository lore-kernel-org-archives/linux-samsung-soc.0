From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/3] media: exynos4-is: Improve clock management
Date: Thu, 01 Sep 2016 12:57:40 +0200
Message-ID: <3b2462c9-a454-6902-6f57-c4999a17a7e1@samsung.com>
References: <1472649918-10371-1-git-send-email-m.szyprowski@samsung.com>
 <1472649918-10371-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:24216 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751606AbcIALIr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 07:08:47 -0400
In-reply-to: <1472649918-10371-3-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>

On 08/31/2016 03:25 PM, Marek Szyprowski wrote:
> There is no need to keep all clocks prepared all the time. Call to
> clk_prepare/unprepare can be done on demand from runtime pm callbacks
> (it is allowed to call sleeping functions from that context).
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/media/platform/exynos4-is/fimc-lite.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)


Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
