From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/3] ARM: EXYNOS4: Suspend to RAM Support
Date: Thu, 10 Mar 2011 13:37:52 +0900
Message-ID: <006201cbdedc$efd42420$cf7c6c60$%kim@samsung.com>
References: <1299636521-4831-1-git-send-email-jc.lee@samsung.com>
 <1299636521-4831-3-git-send-email-jc.lee@samsung.com>
 <20110309082319.GC605@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59764 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751852Ab1CJEiD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Mar 2011 23:38:03 -0500
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHT00A1SRJDYQ20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Mar 2011 13:38:01 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHT0047ZRJDVP@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Mar 2011 13:38:01 +0900 (KST)
In-reply-to: <20110309082319.GC605@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, 'Jaecheol Lee' <jc.lee@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Russell King - ARM Linux wrote:
> 
> On Wed, Mar 09, 2011 at 11:08:40AM +0900, Jaecheol Lee wrote:
> > This patch adds support suspend to ram for EXYNOS4210.
> > As a note, this includes function of outer cache flush
> > because it is used before entering PM.
> 
> This should be updated to use the generic CPU sleep support, found in my
> tree.

Russell, thanks :)

Yeah it should be based on generic CPU sleep.

As I know, his second patch will be made based on it.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
