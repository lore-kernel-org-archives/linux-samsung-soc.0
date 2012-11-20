From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: EXYNOS: Add support for ORIGEN4QUAD board
Date: Tue, 20 Nov 2012 13:38:39 +0900
Message-ID: <0b6801cdc6d8$e98c1600$bca44200$@org>
References: <1353345846-31355-1-git-send-email-kh.choi@insignal.co.kr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:11328 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751428Ab2KTEil (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Nov 2012 23:38:41 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDR004LSRIY84F0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Nov 2012 13:38:39 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDR003WHRKFK830@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Nov 2012 13:38:39 +0900 (KST)
In-reply-to: <1353345846-31355-1-git-send-email-kh.choi@insignal.co.kr>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: chlrbgh0@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: jhkim@insignal.co.kr, 'Kyuho Choi' <kh.choi@insignal.co.kr>

chlrbgh0@gmail.com wrote:
> 
> From: Kyuho Choi <kh.choi@insignal.co.kr>
> 
> This patch add support for Insignal ORIGEN4QUAD board.
> ORIGEN4QUAD board based on Samsung Exynos4412 SoC.
> 
> Signed-off-by: Kyuho Choi <kh.choi@insignal.co.kr>
> ---
>  arch/arm/mach-exynos/Kconfig       |    1 +
>  arch/arm/mach-exynos/mach-origen.c |   74
+++++++++++++++++++++++++++-----
> ---
>  2 files changed, 58 insertions(+), 17 deletions(-)
> 
Hmm...at this moment, I don't want to update non-DT stuff for exynos,
because I have a plan to move on supporting only DT for all of exynos next
time.

Please submit DT patches for the ORIGEN4QUAD board.

Thanks.

K-Gene <kgene@kernel.org>
