From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: exynos4: Enable serial controllers on Origen and
 SMDKV310
Date: Tue, 23 Oct 2012 21:03:01 +0900
Message-ID: <01d201cdb116$59de2520$0d9a6f60$%kim@samsung.com>
References: <1349701968-6675-1-git-send-email-t.figa@samsung.com>
 <1587144.mixS1B3zoJ@amdc1227>
 <10e401cdaae0$a17d44b0$e477ce10$%kim@samsung.com> <16890730.oeOgcP5xf2@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:23790 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752688Ab2JWMDE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Oct 2012 08:03:04 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCC00LH9HGWLD70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Oct 2012 21:03:02 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCC00473HH1UJ00@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Oct 2012 21:03:01 +0900 (KST)
In-reply-to: <16890730.oeOgcP5xf2@flatron>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>
Cc: 'Tomasz Figa' <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com

Tomasz Figa wrote:
> 
> However I think this should be considered a fix, because without it serial
> console on Origen and SMDKV310 will be broken.
> 
Well, I couldn't find any broken due to miss this for v3.7. I think, there
is no usage of serial controller in mainline for Origen and SMDKV310 now. So
this should be queued for -next. If not, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
