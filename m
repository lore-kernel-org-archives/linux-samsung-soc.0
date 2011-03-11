From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/7] ARM: Samsung: update/rewrite Samsung SYSMMU (IOMMU) driver
Date: Fri, 11 Mar 2011 17:00:17 +0100
Message-ID: <201103111700.17373.arnd@arndb.de>
References: <1299229274-9753-4-git-send-email-m.szyprowski@samsung.com> <201103111615.01829.arnd@arndb.de> <000201cbe002$768d9de0$63a8d9a0$%szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="euc-kr"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:58049 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752730Ab1CKQA0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Mar 2011 11:00:26 -0500
In-Reply-To: <000201cbe002$768d9de0$63a8d9a0$%szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org, Tomasz Stanislawski <t.stanislaws@samsung.com>, k.debski@samsung.com, kgene.kim@samsung.com, kyungmin.park@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>,  =?euc-kr?q?=27=B4=EB=C0=CE=B1=E2=27?= <inki.dae@samsung.com>,  =?euc-kr?q?=27=B0=AD=B9=CE=B1=D4=27?= <mk7.kang@samsung.com>, 'KyongHo Cho' <pullip.cho@samsung.com>, linux-kernel@vger.kernel.org

On Friday 11 March 2011, Marek Szyprowski wrote:
> > > > does not support IOMMUs, but that could be changed by wrapping it
> > > > using the include/asm-generic/dma-mapping-common.h infrastructure.
> > >
> > > ARM dma-mapping framework also requires some additional research for better DMA
> > > support (there are still issues with multiple mappings to be resolved).
> > 
> > You mean mapping the same memory into multiple devices, or a different problem?
> 
> Mapping the same memory area multiple times with different cache settings is not
> legal on ARMv7+ systems. Currently the problems might caused by the low-memory
> kernel linear mapping and second mapping created for example by dma_alloc_coherent()
> function.

Yes, I know this problem, but I don't think the case you describe is a serious
limitation (there are more interesting cases, though): dma_map_single() etc
will create additional *bus* addresses for a physical address, not additional
virtual addresses.

dma_alloc_coherent should allocate memory that is not also mapped cached,
which is what I thought we do correctly.

	Arnd
