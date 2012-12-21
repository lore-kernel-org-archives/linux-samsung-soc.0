From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: fix split memory bank for SSDK5440
Date: Thu, 20 Dec 2012 16:43:39 -0800
Message-ID: <01f901cddf14$39f04500$add0cf00$@samsung.com>
References: <1356030217-5472-1-git-send-email-kgene.kim@samsung.com>
 <1464138.NEt7mMkYJc@flatron> <50D38F04.8020307@gmail.com>
 <3158118.uctD3XVWRG@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:62261 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751344Ab2LUAns (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Dec 2012 19:43:48 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MFC00644VCLVM90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Dec 2012 09:43:45 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MFC0013WVCV3O70@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Dec 2012 09:43:45 +0900 (KST)
In-reply-to: <3158118.uctD3XVWRG@flatron>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Subash Patel' <subashrp@gmail.com>
Cc: 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Cho KyongHo <pullip.cho@samsung.com>

Tomasz Figa wrote:
> 
> On Thursday 20 of December 2012 14:19:48 Subash Patel wrote:
> > I would like to ask a question here. Do we need to have sparse even if
> > the physical memory is contiguous? All the recent exynos machines come
> > with physical banks without any holes, and I am thinking why not drop it
> > and use flat mem instead. With LPAE these sections sizes wont be useful,
> > and I dont like to keep different section sizes for different
> > configurations. Any suggestions/opinions are very much helpful to me.
> 
> Since sparse memory is the only option available on Exynos currently in
> kernel configuration, I assume there was a reason for it. However I am not
> an expert in memory management, so please correct me if I am wrong.
> 
Hmm...yeah, as Subash said, it's no problem to disable sparsemem on EXYNOS
for now but memory hole can be existing on upcoming EXYNOS such as S5PV210
so keeping sparsemem would be better I think.

- Kukjin
