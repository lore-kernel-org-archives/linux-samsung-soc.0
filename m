From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: S3C64XX: Fix build of Cragganmore after SPI changes
Date: Fri, 30 Dec 2011 02:02:56 +0000
Message-ID: <20111230020256.GD9737@opensource.wolfsonmicro.com>
References: <1325073936-10936-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <02cb01ccc696$c0088680$40199380$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:38397 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754713Ab1L3CC7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Dec 2011 21:02:59 -0500
Content-Disposition: inline
In-Reply-To: <02cb01ccc696$c0088680$40199380$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Padmavathi Venna' <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

On Fri, Dec 30, 2011 at 11:00:05AM +0900, Kukjin Kim wrote:

> I couldn't look at the line of 's3c64xx_spi_set_info(...);' which is deleted
> in this patch in my tree. So I couldn't apply this.

> Do you want to apply this just to add 's3c64xx_spi0_set_platdata()'?

No, I think this is a case of me noticing a problem in a patch I thought
was already upstream (and pushed later in the day).  Sorry for the
noise.
