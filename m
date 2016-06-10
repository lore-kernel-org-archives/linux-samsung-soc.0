From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [RFC PATCH 01/15] clock: exynos: fixup endian in pll clk
Date: Fri, 10 Jun 2016 11:51:16 +0200
Message-ID: <575A8D94.80709@samsung.com>
References: <20160608183110.13851-1-matthew@mattleach.net>
 <20160608183110.13851-2-matthew@mattleach.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:11501 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752078AbcFJJvk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jun 2016 05:51:40 -0400
In-reply-to: <20160608183110.13851-2-matthew@mattleach.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Matthew Leach <matthew@mattleach.net>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Ben Dooks <ben.dooks@codethink.co.uk>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org

On 06/08/2016 08:30 PM, Matthew Leach wrote:
> Fix the clk endian access code to deal with kernels built for big endian
> operation.
> 
> Signed-off-by: Matthew Leach <matthew@mattleach.net>

We should have gotten rid of those __raw_{readl, writel} calls earlier
for other reasons too. Thanks for the fix, patch applied!

-- 
Regards,
Sylwester
