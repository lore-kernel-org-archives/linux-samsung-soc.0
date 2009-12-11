From: Jinsung Yang <jsgood.yang@samsung.com>
Subject: RE: 2.6.28 and newest linux kernel for samsung
Date: Fri, 11 Dec 2009 16:16:53 +0900
Message-ID: <005201ca7a31$ea3ef0a0$bebcd1e0$%yang@samsung.com>
References: <3c17e3570912102244w21418964y8fb3f0e01ef0e39a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout5.samsung.com ([203.254.224.35]:60642 "EHLO
	mailout5.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934820AbZLKHKM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Dec 2009 02:10:12 -0500
Received: from epmmp1 (mailout5.samsung.com [203.254.224.35])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KUH003AM7X5D7@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Dec 2009 16:10:18 +0900 (KST)
Received: from JSGOODMAIN ([12.23.109.106])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KUH000IO7X5CD@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Dec 2009 16:10:17 +0900 (KST)
In-reply-to: <3c17e3570912102244w21418964y8fb3f0e01ef0e39a@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Barry Song' <21cnbao@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org

> From: linux-samsung-soc-owner@vger.kernel.org [mailto:linux-samsung-soc-
> owner@vger.kernel.org] On Behalf Of Barry Song
> Sent: Friday, December 11, 2009 3:45 PM
> To: linux-samsung-soc@vger.kernel.org
> Subject: 2.6.28 and newest linux kernel for samsung
> 
> Hi,
> I found there are many drivers which have existed in samsung 2.6.28
> tree. For example, s3c6410 jpeg/multi functions codecs/2D/3D, audio
> board drivers, framebuffer and so on. But they are not in 2.6.31 or
> newest tree.
> Is there any plan about that? And is there any way to use those
> drivers in new kernel since some are using old kernel or subsystem
> API?

We have plan to submit some drivers of s3c6410 to 2.6.33 stable target.
Regarding this, we are picking the devices which are possible to be submitted or not.
We hope that this work is getting started from next week, but it depends on the release of 2.6.33-rc1.

Best Regards
--
Jinsung, Yang <jsgood.yang@samsung.com>
AP Development Team
System LSI, Semiconductor Business
SAMSUNG Electronics Co., LTD
