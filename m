From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] Samsung: FIMC machine setup code
Date: Mon, 09 Aug 2010 17:07:48 +0900
Message-ID: <016b01cb3799$f74cf190$e5e6d4b0$%kim@samsung.com>
References: <1281340315-26676-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:37412 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755619Ab0HIIHk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Aug 2010 04:07:40 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L6V00KNUL8QEO20@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Aug 2010 17:07:38 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L6V00H8ML8QPG@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Aug 2010 17:07:38 +0900 (KST)
In-reply-to: <1281340315-26676-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, s.nawrocki@samsung.com, p.osciak@samsung.com

Marek Szyprowski wrote:
> 
> Hello,
> 
Hi :-)

> This is a quick resend of a FIMC patches that enable the driver on
> Aquila, GONI and SMDKC100 machines. The code has been rebased onto
> latest kgene/for-next kernel tree. common-aquila-and-goni code has been
> disabled until a proper and cleaner solution will be provided.
> 
> List of patches:
> 
> [PATCH 1/4] ARM: S5PV210: enable FIMC on Aquila
> [PATCH 2/4] ARM: S5PV210: enable FIMC on Goni
> [PATCH 3/4] ARM: S5PC100: enable FIMC on SMDKC100
> [PATCH 4/4] ARM: S5PV210: Override FIMC driver name on Aquila board
> 
> Best regards
> --
> Marek Szyprowski
> Samsung Poland R&D Center

Looks ok...will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
