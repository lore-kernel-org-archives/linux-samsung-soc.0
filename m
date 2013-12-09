From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos4: Correct SRC_MFC register
Date: Mon, 09 Dec 2013 14:35:28 +0100
Message-ID: <4009792.HvWcr5GnEc@amdc1227>
References: <1385097668-24620-1-git-send-email-sw0312.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:20142 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933431Ab3LINfk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 08:35:40 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MXJ0053PKFFD210@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Dec 2013 13:35:39 +0000 (GMT)
In-reply-to: <1385097668-24620-1-git-send-email-sw0312.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mturquette@linaro.org, kgene.kim@samsung.com, kyungmin.park@samsung.com

Hi Seung-Woo,

On Friday 22 of November 2013 14:21:08 Seung-Woo Kim wrote:
> The SRC_MFC register was incorrect. This patch corrects it.
> 
> Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos4.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Good catch.

Acked-by: Tomasz Figa <t.figa@samsung.com>

I guess this could go as a fix for current rc, through clk-fixes.
Mike, what do you think?

Best regards,
Tomasz
