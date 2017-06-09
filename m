From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v3 4/6] clk: samsung: exynos-audss: Convert to the new
 clk_hw API
Date: Fri, 09 Jun 2017 12:25:09 +0200
Message-ID: <84dfafa1-086b-e6b5-e85d-135626f4e531@samsung.com>
References: <1493016143-21569-5-git-send-email-m.szyprowski@samsung.com>
        <CGME20170515065111eucas1p2127c41dc0fa0d069d5f09bc222f5bd55@eucas1p2.samsung.com>
        <1494831047-10235-1-git-send-email-m.szyprowski@samsung.com>
        <5939FB00.3070709@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:31601 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751527AbdFIKZW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Jun 2017 06:25:22 -0400
In-reply-to: <5939FB00.3070709@samsung.com>
Content-language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi Chanwoo,

On 06/09/2017 03:33 AM, Chanwoo Choi wrote:
> I tested this patch[1] which was applied on Sylwester's git repo.
> [1]https://git.linuxtv.org/snawrocki/samsung.git/commit/?h=for-v4.13/clk/next&id=6622c52f47372186c17548ca7398c229c45e6215
> 
> When I tested it on XU3, I can't get the kernel booting.

Thanks for checking this, it seems I didn't appply v3 patches from Marek.
I corrected this now and tested on Odroid-XU3. The right patches should
be now in the for-v4.13/clk/next branch.

-- 
Regards,
Sylwester
