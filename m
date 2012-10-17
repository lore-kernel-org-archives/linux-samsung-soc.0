From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] spi: s3c64xx: use clk_prepare_enable and
 clk_disable_unprepare
Date: Wed, 17 Oct 2012 16:12:26 +0900
Message-ID: <20121017071224.GC14199@opensource.wolfsonmicro.com>
References: <1349220612-2464-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:58554 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751382Ab2JQHMb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Oct 2012 03:12:31 -0400
Content-Disposition: inline
In-Reply-To: <1349220612-2464-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: spi-devel-general@lists.sourceforge.net, grant.likely@secretlab.ca, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org

On Wed, Oct 03, 2012 at 08:30:12AM +0900, Thomas Abraham wrote:
> Convert clk_enable/clk_disable to clk_prepare_enable/clk_disable_unprepare
> calls as required by common clock framework.

Applied, thanks.
