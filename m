From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: S3C64XX: Fix interrupt configuration for PCA935x on
 Cragganmore
Date: Thu, 29 Dec 2011 10:32:37 +0000
Message-ID: <20111229103237.GB2909@opensource.wolfsonmicro.com>
References: <1325121979-3609-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <028d01ccc5db$0e453cb0$2acfb610$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:46654 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752930Ab1L2Kcl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Dec 2011 05:32:41 -0500
Content-Disposition: inline
In-Reply-To: <028d01ccc5db$0e453cb0$2acfb610$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

On Thu, Dec 29, 2011 at 12:36:31PM +0900, Kukjin Kim wrote:

> OK, so do you want to apply this before v3.2?

The problem is mostly cosmetic as the chip isn't actually used by
current cosmetics so no need to try to get it into 3.2.
