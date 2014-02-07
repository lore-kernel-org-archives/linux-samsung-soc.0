From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 1/9] clk: exynos4: Remove remnants of non-DT support
Date: Fri, 07 Feb 2014 12:32:48 +0100
Message-ID: <52F4C460.1050306@samsung.com>
References: <1391710616-14226-1-git-send-email-t.figa@samsung.com>
 <1391710616-14226-2-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:40384 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752384AbaBGLcx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Feb 2014 06:32:53 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N0M00J8PIQRX690@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Feb 2014 11:32:51 +0000 (GMT)
In-reply-to: <1391710616-14226-2-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Rahul Sharma <r.sh.open@gmail.com>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Thomas Abraham <thomas.abraham@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

On 06/02/14 19:16, Tomasz Figa wrote:
> This patch simplifies a bit clock initialization code by removing
> remnants of non-DT clock initialization, such as reg_base and xom values
> passed in function parameters.
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
