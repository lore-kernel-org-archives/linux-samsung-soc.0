From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/2] ARM: S3C64XX: Fix the memory mapped GPIOs on
 Cragganmore
Date: Thu, 29 Dec 2011 10:34:12 +0000
Message-ID: <20111229103412.GC2909@opensource.wolfsonmicro.com>
References: <1325121813-2066-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <029301ccc5de$58557970$09006c50$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:46669 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752103Ab1L2KeP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Dec 2011 05:34:15 -0500
Content-Disposition: inline
In-Reply-To: <029301ccc5de$58557970$09006c50$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Thu, Dec 29, 2011 at 01:00:04PM +0900, Kukjin Kim wrote:

> And Mark, how about using DEFINE_RES_XXX() like following?

That's fine, though the mmgpio one does need to have the name added.
