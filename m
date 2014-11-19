From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: RE: [PATCH v4] ARM: EXYNOS: add Exynos3250 PMU support
Date: Wed, 19 Nov 2014 16:54:10 +0530
Message-ID: <000a01d003eb$79fe9630$6dfbc290$@samsung.com>
References: <1908469.QaqIJlesoD@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:58544 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751204AbaKSLYe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Nov 2014 06:24:34 -0500
In-reply-to: <1908469.QaqIJlesoD@amdc1032>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>, 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: 'Chanwoo Choi' <cw00.choi@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Vikas Sajjan' <vikas.sajjan@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On Tuesday, November 18, 2014 11:05 PM, Bartlomiej Zolnierkiewicz Wrote:
> This patch prepares the PMU code for the future:
> - suspend/resume (S2R) support
> - cpuidle AFTR/W-AFTR modes support
> on Exynos3250.
> 
> Cc: Pankaj Dubey <pankaj.dubey@samsung.com>
> Cc: Vikas Sajjan <vikas.sajjan@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Other than one small nitpick patch looks fine to me. Tested on Exynos3250
based
Espresso board and kernel booted fine.

Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>

> 
> +static void exynos3250_pmu_init(void)
> +{
> +	unsigned int value;
> +
> +	/*
> +	 * To prevent form issuing new bus request form L2 memory system

typo: %s/form/from

> +	 * If core status is power down, should be set '1' to L2 power down
> +	 */

Thanks,
Pankaj Dubey

> --
> 1.8.2.3
