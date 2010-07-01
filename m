From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 3/3] arm: s5pv210: GONI: add support for MAX8998 PMIC
Date: Thu, 1 Jul 2010 13:25:45 +0100
Message-ID: <20100701122544.GB17698@sirena.org.uk>
References: <1277964466-23891-1-git-send-email-m.szyprowski@samsung.com> <1277964466-23891-4-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:34776 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753739Ab0GAMZp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Jul 2010 08:25:45 -0400
Content-Disposition: inline
In-Reply-To: <1277964466-23891-4-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

On Thu, Jul 01, 2010 at 08:07:46AM +0200, Marek Szyprowski wrote:

> +static struct regulator_consumer_supply goni_ldo3_consumers[] = {
> +	{	.supply	= "VMIPI_1.1V",	},
> +};

A similar issue to the previous patch applies here - you should be
defining consumers using struct device based lookups only.
