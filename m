From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: S5PC1XX clocki fixes
Date: Tue, 12 Jan 2010 09:04:02 +0100
Message-ID: <000001ca935d$d04e3b70$70eab250$%szyprowski@samsung.com>
References: <1263270017-25155-1-git-send-email-ben@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:56031 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752589Ab0ALIFE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Jan 2010 03:05:04 -0500
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KW400A3MJSDQ6@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Jan 2010 17:05:02 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KW400HMFJSAJQ@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Jan 2010 17:05:01 +0900 (KST)
In-reply-to: <1263270017-25155-1-git-send-email-ben@trinity.fluff.org>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ben Dooks' <ben@trinity.fluff.org>, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>

Hello,

On Tuesday, January 12, 2010 5:20 AM Ben Dooks wrote:

> Initial set of S5PC1XX clock fixes, two temporary patches in this series
> to allow it to build which will go away once the parent patches are fixed.
> 
> Currently only build tested.
 
Thanks for your patches! I was about to send similar patches for S5PC100 today,
but had some issues left to resolve. I've tested your patches and there is some
regression. Kernel fails to boot trying to dereference NULL pointer. I will
sort this out asap.

I will also update S5PC110 patches to use as much as possible from new common
plat-samsung framework.

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
