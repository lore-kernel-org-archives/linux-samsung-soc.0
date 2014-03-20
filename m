From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/4] Consolidate Exynos machine code
Date: Thu, 20 Mar 2014 11:06:48 +0900
Message-ID: <018701cf43e1$0ef65140$2ce2f3c0$@samsung.com>
References: <1395231957-22032-1-git-send-email-sachin.kamat@linaro.org>
 <201403191429.11721.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:53642 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751277AbaCTCGx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Mar 2014 22:06:53 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N2P00DHYPVFF980@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Mar 2014 11:06:52 +0900 (KST)
In-reply-to: <201403191429.11721.arnd@arndb.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, t.figa@samsung.com

Arnd Bergmann wrote:
> 
> On Wednesday 19 March 2014, Sachin Kamat wrote:
> > This patch series consolidates the Exynos machine code and common
> > code into a single file to avoid code duplication and introduces
> > generic compatible strings for Exynos4 and 5 SoC series.
> >
> > Complete discussion and motivation for this series is found here:
> > http://comments.gmane.org/gmane.linux.kernel.samsung-soc/27268
> >
> > This series is based on the latest linux-next and depends on
> > 1. Tomasz Figa's PM consolidation series 1 and 2
> > 2. Patch: ARM: SAMSUNG: Reorganize calls to reserve memory for MFC
> > http://www.spinics.net/lists/linux-samsung-soc/msg25501.html
> > 3. Patch: ARM: EXYNOS: Add support to reserve memory for MFC-v7
> > http://www.spinics.net/lists/arm-kernel/msg315940.html
> > 4. Kconfig and CPU init Consolidation series
> > http://article.gmane.org/gmane.linux.kernel.samsung-soc/28216
> 
Hi Sachin,

Looks good to me.

> Acked-by: Arnd Bergmann <arnd@arndb.de>

Arnd, thanks.

Let me sort this series out for v3.15 then I'll send pull-request to arm-soc with other
dependencies tonight.

Thanks,
Kukjin
