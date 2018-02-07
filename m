From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/3] clk: exynos5433: Extend list of available AUD_PLL
 output frequencies
Date: Wed, 07 Feb 2018 14:04:18 +0100
Message-ID: <086b44d2-6556-fa7c-1a5b-01c243bf0682@samsung.com>
References: <CGME20180205142252epcas1p4471e32e2b513806420c64b323af2ffa6@epcas1p4.samsung.com>
        <20180205142230.9755-1-s.nawrocki@samsung.com>
        <5A7916A2.7010307@samsung.com>
        <75cac4e7-9bbb-e591-36a1-dcacc3f94ace@samsung.com>
        <5A7AE1E0.8000509@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:27051 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753695AbeBGNE0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Feb 2018 08:04:26 -0500
In-reply-to: <5A7AE1E0.8000509@samsung.com>
Content-language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-clk@vger.kernel.org, sboyd@codeaurora.org, mturquette@baylibre.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com

On 02/07/2018 12:24 PM, Chanwoo Choi wrote:
> Could you share your equation?
> because your result is a little bit different of my result.
> - my equation : ((mdiv + kdiv/65535) x 24MHz) / (pdiv x POWER(2,sdiv))

It resembles the code from samsung_pll36xx_recalc_rate():

(24 * 10^6 * (M * 2^16 + K)) / (P * 2^S) / 2^16

and a more accurate one

ROUNDDOWN(ROUNDDOWN(24 * 10^6 * (M * 2^16 + K), 0) / ROUNDDOWN(P * 2^S, 0) / 2^16, 0)

Shouldn't you substitute 65535 with 65536?

-- 
Regards,
Sylwester
