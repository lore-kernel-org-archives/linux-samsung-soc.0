From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/4] ARM: Kconfig: Add audio support dependency
Date: Sun, 2 Jan 2011 14:05:18 +0000
Message-ID: <20110102140517.GJ4935@opensource.wolfsonmicro.com>
References: <1293171965-24416-1-git-send-email-sw.youn@samsung.com>
 <1293172569-21465-1-git-send-email-sw.youn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:46513 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751828Ab1ABOFC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 2 Jan 2011 09:05:02 -0500
Content-Disposition: inline
In-Reply-To: <1293172569-21465-1-git-send-email-sw.youn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Seungwhan Youn <sw.youn@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, linux@arm.linux.org.uk, ben-linux@fluff.org, kgene.kim@samsung.com, lrg@slimlogic.co.uk, jassi.brar@samsung.com

On Fri, Dec 24, 2010 at 03:36:09PM +0900, Seungwhan Youn wrote:

> This patch adds Samsung ASoC audio support dependency for Samsung SoCs.

> Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>

> +	select ASOC_SAMSUNG if SND_SOC

Hrm, if we're going to do this we probably ought to be doing it for all
architectures.  It's a good idea, we don't tend to have multiple
possible architectures supported for a given architecture.  Since the
second patch didn't apply I'll leave this one too, and patches 3 and 4,
though they all look good.
