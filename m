From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/4] ARM: SAMSUNG: Add SMDK audio configuration
Date: Fri, 24 Dec 2010 11:49:04 +0000
Message-ID: <20101224114904.GA15926@opensource.wolfsonmicro.com>
References: <1293171965-24416-1-git-send-email-sw.youn@samsung.com>
 <1293172938-23615-1-git-send-email-sw.youn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:57777 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752171Ab0LXLsx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Dec 2010 06:48:53 -0500
Content-Disposition: inline
In-Reply-To: <1293172938-23615-1-git-send-email-sw.youn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Seungwhan Youn <sw.youn@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, linux@arm.linux.org.uk, ben-linux@fluff.org, kgene.kim@samsung.com, lrg@slimlogic.co.uk, jassi.brar@samsung.com

On Fri, Dec 24, 2010 at 03:42:18PM +0900, Seungwhan Youn wrote:

>  	select S3C_DEV_HSMMC
> +	select SMDK_HAS_WM9710_AC97 if ASOC_SAMSUNG
>  	help

There's no need for the ifs here - since the actual machine driver is a
user visible control and the SMDK_HAS_ are just dependencies for that
it's more normal to just select the symbol.
