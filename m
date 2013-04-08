From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] clk: exynos4: export clocks required for fimc-is
Date: Mon, 08 Apr 2013 16:22:51 +0900
Message-ID: <2c8f01ce3429$e110ef50$a332cdf0$%kim@samsung.com>
References: <1365184185-23794-1-git-send-email-s.nawrocki@samsung.com>
 <20130405183221.7302.97946@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:34143 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934379Ab3DHHWx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Apr 2013 03:22:53 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MKX00GWTDTR2WS0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Apr 2013 16:22:52 +0900 (KST)
In-reply-to: <20130405183221.7302.97946@quantum>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mike Turquette' <mturquette@linaro.org>
Cc: kyungmin.park@samsung.com, thomas.abraham@linaro.org, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>

Mike Turquette wrote:
> 
> Quoting Sylwester Nawrocki (2013-04-05 10:49:45)
> > This patch adds clock indexes for ACLK_DIV0, ACLK_DIV1,
> > ACLK_400_MCUISP, ACLK_MCUISP_DIV0, ACLK_MCUISP_DIV1,
> > DIVACLK_400_MCUISP and DIVACLK_200 so these clocks are
> > available to the consumers (Exynos4x12 FIMC-IS subsystem).
> > While at it, indentation of the mux clocks table is
> > corrected.
> >
> > Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> 
> Acked-by: Mike Turquette <mturquette@linaro.org>
> 
Thanks, applied into next/clk-exynos.

- Kukjin
