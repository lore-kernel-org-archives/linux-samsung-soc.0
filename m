From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: About LPAE supporting on EXYNOS5440
Date: Tue, 11 Jun 2013 11:53:36 +0200
Message-ID: <6690814.Wx0lSuVAQ5@wuerfel>
References: <109e01ce667e$5becc880$13c65980$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:56831 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752581Ab3FKJx2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Jun 2013 05:53:28 -0400
In-Reply-To: <109e01ce667e$5becc880$13c65980$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Olof Johansson' <olof@lixom.net>

On Tuesday 11 June 2013 17:33:33 Kukjin Kim wrote:
> Hi all,
> 
> The exynos5440 can support LPAE and referece boards, SSDK5440 and SD5v1 have
> over 8GiB memory.
> 
> Current exynos_defconfig selects every EXYNOS SoCs including exynos5440 it
> means supporting LPAE will be selected for other EXYNOS SoCs.
> 
> I'm wondering if seleting LPAE causes some problem for multiplatform. Can we
> support LPAE enabled and disabled platform together with single zImage?

No, that isn't possible. I think we should enable all exynos support in the
regular multi_v7_defconfig and leave LPAE turned off for that, but create
another multi_lpae_defconfig that has all LPAE capable machines turned on.
This is also what I expect the distros to do.

	Arnd
