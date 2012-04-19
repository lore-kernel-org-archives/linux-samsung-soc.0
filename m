From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/7] ARM: S5P: moving plat-s5p stuff into plat-samsung
Date: Thu, 19 Apr 2012 13:23:32 +0000
Message-ID: <201204191323.32301.arnd@arndb.de>
References: <1334802036-16768-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:62577 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751639Ab2DSNXm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Apr 2012 09:23:42 -0400
In-Reply-To: <1334802036-16768-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

On Thursday 19 April 2012, Kukjin Kim wrote:
> This patches move plat-s5p stuff into plat-samsung for keep just one
> plat directory, plat-samsung for Samsung stuff. Actually, it includes
> small things for common s5p and there is no problem this moving.
> Of course, I'm working on removing plat-s3c24xx and will be submitted
> before v3.4 release.
> 
> NOTE, now the plat-s5p directory which is including Kconfig and dummy
> Makefile is not removed yet because need to cleanup CONFIG_PLAT_S5P
> and will be removed soon.
> 

Very nice!

Out of curiosity, how far are you planning to take the consolidation
of the various directories in the end?
I assume all the s3c24* directories end up getting merged into
s3c24xx, but what about s3c64xx, s5p64x0, s5pc100 and s5pcv210?
Are they going to stay separate or do they get merged together
or with exynos?

	Arnd
