From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 0/2] Add GPLL, APLL, KPLL,
 EPLL and VPLL freq table for exynos5420 and exynos5250
Date: Wed, 28 Aug 2013 16:26:40 +0200
Message-ID: <1478632.tycRNPVyxz@amdc1227>
References: <1377697198-19097-1-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:15301 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753585Ab3H1O0q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Aug 2013 10:26:46 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MS800I7ZW41H400@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Aug 2013 15:26:43 +0100 (BST)
In-reply-to: <1377697198-19097-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, mturquette@linaro.org, patches@linaro.org, linaro-kernel@lists.linaro.org, joshi@samsung.com

On Wednesday 28 of August 2013 19:09:56 Vikas Sajjan wrote:
> Adds GPLL, APLL, KPLL, EPLL and VPLL freq table for exynos5420 and
> exynos5250.
> 
> changes since v1:
> 	- addressed comments from Tomasz Figa <tomasz.figa@gmail.com>
> 
> is rebased on Mike's
> https://git.linaro.org/gitweb?p=people/mturquette/linux.git;a=shortlog;h=
> refs/heads/clk-next and on top of Tomasz Figa's clk clean-up patch series
> http://www.spinics.net/lists/arm-kernel/msg269848.html
> 
> 
> Vikas Sajjan (2):
>   clk: samsung: Add GPLL freq table for exynos5250 SoC
>   clk: samsung: Add APLL, KPLL, EPLL and VPLL freq table for exynos5420
>     SoC
> 
>  drivers/clk/samsung/clk-exynos5250.c |   19 ++++++++-
>  drivers/clk/samsung/clk-exynos5420.c |   78
> ++++++++++++++++++++++++++++++++++ 2 files changed, 96 insertions(+), 1
> deletion(-)

For the whole series:

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
