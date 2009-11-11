From: Jinsung Yang <jsgood.yang@samsung.com>
Subject: RE: Samsung SoC / multimedia / allocating contiguous buffers
Date: Wed, 11 Nov 2009 16:46:07 +0900
Message-ID: <008001ca62a3$0783cd30$168b6790$%yang@samsung.com>
References: <20091111072807.GZ4047@prithivi.gnumonks.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:19068 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756761AbZKKHv1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Nov 2009 02:51:27 -0500
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KSX00K13PC031@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Nov 2009 16:40:48 +0900 (KST)
Received: from JSGOODMAIN ([12.23.109.106])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KSX0008OPC0QY@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Nov 2009 16:40:49 +0900 (KST)
In-reply-to: <20091111072807.GZ4047@prithivi.gnumonks.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Harald Welte' <laforge@gnumonks.org>, linux-samsung-soc@vger.kernel.org

> I have sent a mail to the linux-media@vger.kernel.org mailing list,
> outlining the need for an allocator for physically contiguous memory in
> order to properly support the various multimedia IP cores inside the
> samsung SoCs.
> 

Yeah, good.
When I was in LPC2009 on Sep, there was 3 full days mini-summit of V4L2, and
there were many discussions about physically contiguous memory allocating
including PMM suggested by Samsung.
As a result of that discussion, linux-media will implement new buffer
architecture which named to 'Memory Pool' by Laurent Pinchart.
Also, in the linux-media list, the RFC of Memory Pool is available. We may
be interesting in there continuously.

Best Regards
--
Jinsung, Yang <jsgood.yang@samsung.com>
AP Development Team
System LSI, Semiconductor Business
SAMSUNG Electronics Co., LTD
