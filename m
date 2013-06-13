From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: About LPAE supporting on EXYNOS5440
Date: Thu, 13 Jun 2013 21:53:29 +0900
Message-ID: <151501ce6835$0109d4e0$031d7ea0$%kim@samsung.com>
References: <109e01ce667e$5becc880$13c65980$%kim@samsung.com>
 <15605927.1Yi6Xe5hWs@wuerfel> <51B7FD2E.9030306@gmail.com>
 <201306121158.20676.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:62542 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752864Ab3FMMxb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Jun 2013 08:53:31 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOC009I014YXNR0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Jun 2013 21:53:30 +0900 (KST)
In-reply-to: <201306121158.20676.arnd@arndb.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Subash Patel' <subashrp@gmail.com>
Cc: 'Olof Johansson' <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Arnd Bergmann wrote:
> 
> On Wednesday 12 June 2013, Subash Patel wrote:
> > > I would definitely leave on exynos5440 support in defconfig. It's not
> a
> > > lot of extra code, and if you have a system with less than 4GB memory,
> > > you really don't want to enable LPAE because of the overhead.
> >
> > Even if we have <= 4GB memory, and the system designers have placed the
> > memory banks in addresses > 2^32 bytes, then we need LPAE support. I
> > think we may have such systems in future. So memory capacity is not the
> > only parameter to judge if we need to enable LPAE or not.
> 
> Yes, but that wasn't the point. You can always build systems with
> exynos5440 that don't need LPAE, so we should not assume that it is
> not a reasonable configuration.
> 
Agreed.

> I would certainly advise system designers to put all the RAM and I/O
> into normally addressable locations if possible to avoid the need
> for LPAE, but of course that isn't always possible.
> 
Yes, same here. Actually, some IPs sometimes can request to alloc/use
something like dma buffer over 32 bit area after LPAE enabling, but will not
be happened without LPAE.

> We should probably have someone measure the performance impact
> of LPAE as well. If it's less than a few percent, we might not
> care all that much.
> 
Yes, after testing on exynos5440 board, LPAE doesn't cause any performance
degradation with lmbench tool.

- Kukjin
