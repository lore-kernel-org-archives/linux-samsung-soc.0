From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C24XX: Remove unused GPIO drive strength register
 definitions
Date: Mon, 08 Apr 2013 19:01:02 +0900
Message-ID: <2cd801ce343f$fa20a330$ee61e990$%kim@samsung.com>
References: <1365366588-19517-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:31080 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934889Ab3DHKBD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Apr 2013 06:01:03 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MKX005QYL5HMWS0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Apr 2013 19:01:02 +0900 (KST)
In-reply-to: <1365366588-19517-1-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>

Sylwester Nawrocki wrote:
> 
> There is currently no users of these definitions so remove them.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm/mach-s3c24xx/regs-dsc.h |  203 +--------------------------------
> -----
>  1 files changed, 4 insertions(+), 199 deletions(-)
> 
Thanks for your cleanup ;-)

Applied.

- Kukjin
