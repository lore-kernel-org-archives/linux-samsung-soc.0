From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v2] regulators: add support max8952 regulator
Date: Tue, 7 Sep 2010 11:04:43 +0100
Message-ID: <20100907100442.GD7886@rakim.wolfsonmicro.main>
References: <1283844202-4158-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:36039 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1756221Ab0IGKEo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Sep 2010 06:04:44 -0400
Content-Disposition: inline
In-Reply-To: <1283844202-4158-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, lrg@slimlogic.co.uk, Changhwan Youn <chaos.youn@samsung.com>

On Tue, Sep 07, 2010 at 04:23:22PM +0900, Kukjin Kim wrote:
> From: Changhwan Youn <chaos.youn@samsung.com>
> 
> The operation of max8952 is almost similar to max8649 except
> the output voltage range. This patch adds support the max8952
> regulator using current max8649 implementation.
> 
> Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>

This is OK but it should also include removal of the separate max8952
driver since the functionality is now merged into this driver.  With
that

Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
