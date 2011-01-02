From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/4] ARM: SAMSUNG: Add SMDK audio configuration
Date: Sun, 2 Jan 2011 14:01:30 +0000
Message-ID: <20110102140129.GI4935@opensource.wolfsonmicro.com>
References: <1293171965-24416-1-git-send-email-sw.youn@samsung.com>
 <1293172938-23615-1-git-send-email-sw.youn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:49776 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751283Ab1ABOBM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 2 Jan 2011 09:01:12 -0500
Content-Disposition: inline
In-Reply-To: <1293172938-23615-1-git-send-email-sw.youn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Seungwhan Youn <sw.youn@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, linux@arm.linux.org.uk, ben-linux@fluff.org, kgene.kim@samsung.com, lrg@slimlogic.co.uk, jassi.brar@samsung.com

On Fri, Dec 24, 2010 at 03:42:18PM +0900, Seungwhan Youn wrote:
> This patch adds SMDK audio select configurations based on platform dependacny.
> This helps more easyly and clearly to make sure about configuration on audio
> drivers support on platform side.
> 
> Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>

This doesn't apply against current ASoC; I suspect it needs to be merged
via the ARM tree.
