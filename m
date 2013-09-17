From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] MAINTAINERS: Add DTS files to patterns for Samsung platform
Date: Tue, 17 Sep 2013 12:31:20 +0200
Message-ID: <1466354.6bhNY3vCLP@amdc1227>
References: <1378983449-6205-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:57488 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751970Ab3IQKba (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Sep 2013 06:31:30 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MT9005DLMJQWY70@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Sep 2013 11:31:28 +0100 (BST)
In-reply-to: <1378983449-6205-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

Hi Mark,

On Thursday 12 of September 2013 11:57:29 Mark Brown wrote:
> From: Mark Brown <broonie@linaro.org>
> 
> Help ensure that updates to the Samsung device trees get sent to the
> Samsung maintainers for review by adding file patterns to MAINTAINERS.
> 
> Signed-off-by: Mark Brown <broonie@linaro.org>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6d0dabe..8a0c044 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1154,6 +1154,8 @@ L:	linux-arm-kernel@lists.infradead.org (moderated
> for non-subscribers) L:	linux-samsung-soc@vger.kernel.org (moderated for
> non-subscribers) W:	http://www.fluff.org/ben/linux/
>  S:	Maintained
> +F:	arch/arm/boot/s3c*
> +F:	arch/arm/boot/exynos*

I believe it should be arch/arm/boot/dts/.

Best regards,
Tomasz
