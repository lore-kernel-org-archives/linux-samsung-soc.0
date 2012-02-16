From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Correct MIPI-CSIS io memory resource
 definition
Date: Thu, 16 Feb 2012 15:00:05 +0900
Message-ID: <056301ccec70$3d24b590$b76e20b0$%kim@samsung.com>
References: <1329241007-28811-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:20985 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753121Ab2BPGAN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Feb 2012 01:00:13 -0500
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZH00LSI1Z3G470@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 16 Feb 2012 15:00:11 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZH009HI209RRC0@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 16 Feb 2012 15:00:11 +0900 (KST)
In-reply-to: <1329241007-28811-1-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, riverful.kim@samsung.com, sw0312.kim@samsung.com, 'Kyungmin Park' <kyungmin.park@samsung.com>

Sylwester Nawrocki wrote:
> 
> The resources size is increased to 16KB to also include the non-image
> packet
> data buffers (CSIS_PKTDATAn). The 4KiB region is only sufficient when the
> driver is not using the packet data buffers.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> 
> ---
> Hi Kgene,
> 
Hi
 
> This patch is a fix, but it should be needed starting from v3.4,
> when the MIPI-CSIS driver is updated.
> 
OK, will apply.

But it's time to replace static definition for resource and as a note, I'm
going to prepare it :)

If any updates, let you know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
