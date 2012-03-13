From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 05/12] ARM: EXYNOS: add support uart for EXYNOS4 and EXYNOS5
Date: Tue, 13 Mar 2012 16:13:10 +0000
Message-ID: <201203131613.10620.arnd@arndb.de>
References: <1331652643-12626-1-git-send-email-kgene.kim@samsung.com> <1331652643-12626-6-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:54202 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754756Ab2CMQNQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Mar 2012 12:13:16 -0400
In-Reply-To: <1331652643-12626-6-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, olof@lixom.net

On Tuesday 13 March 2012, Kukjin Kim wrote:
> Actually, the base address of uart is different between EXYNOS4
> and EXYNOS5 and this patch enables to support uart for EXYNOS4
> and EXYNOS5 SoCs at runtime.

Can you explain why this patch is still needed? The exynos5250_dt_map_io
function does not call s3c24xx_init_uarts() at all, so it seems that most
of this patch just adds dead code that would only be needed for the non-dt
case.

	Arnd
