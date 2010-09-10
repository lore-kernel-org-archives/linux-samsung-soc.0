From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 6/6] ARM: S5PC110: add support for MMC regulators on
 Goni board
Date: Fri, 10 Sep 2010 10:41:04 +0100
Message-ID: <20100910094104.GC3068@rakim.wolfsonmicro.main>
References: <1284103403-10696-1-git-send-email-m.szyprowski@samsung.com>
 <1284103403-10696-7-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:34264 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751650Ab0IJJlG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Sep 2010 05:41:06 -0400
Content-Disposition: inline
In-Reply-To: <1284103403-10696-7-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

On Fri, Sep 10, 2010 at 09:23:23AM +0200, Marek Szyprowski wrote:

> +static struct regulator_consumer_supply goni_ldo5_consumers[] = {
> +	{ .supply = "vmmc",	.dev = &s3c_device_hsmmc0.dev },
> +};
> +

This is OK but it is better to use dev_name rather than dev - dev may
be removed at some point since given dev you can always use dev_name but
you don't always have dev.

Acked-by: Mark Brown <broonie@opoensource.wolfsonmicro.com>
