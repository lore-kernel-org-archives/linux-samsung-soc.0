From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] clk/samsung: exynos-audss: Replace syscore PM with
 platform device PM
Date: Thu, 29 Dec 2016 16:18:02 +0100
Message-ID: <9b4c95cf-4f8b-8b70-a609-4c487fe36bb8@samsung.com>
References: <CGME20161125095119epcas2p1d9f9ba31fbb556ff714f4330ad746ed5@epcas2p1.samsung.com>
 <1480066794-18713-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:36500 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752311AbcL2PSP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Dec 2016 10:18:15 -0500
In-reply-to: <1480066794-18713-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On 11/25/2016 10:39 AM, Marek Szyprowski wrote:
> Exynos AUDSS clock driver has beem already converted to platform driver, so
> remove the dependency on the syscore ops - the last remaining non-platform
> driver feature. Platform device's system sleep PM provides all needed
> infrastructure for replacing syscore-based PM, so do it now.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Applied, thanks.
