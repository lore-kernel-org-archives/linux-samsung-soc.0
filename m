From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [RFC] Sort out S5P SoCs support in mainline
Date: Wed, 28 May 2014 19:41:41 +0900
Message-ID: <021f01cf7a61$69853e30$3c8fba90$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:61270 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751977AbaE1Klo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 May 2014 06:41:44 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N6A00I4R5PI1760@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 May 2014 19:41:42 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>

Hi all,

I'm wondering who need to support following SoCs/boards in mainline.

* S5P64X0/SMDK6440 and SMDK6450
* S5PC100/SMDKC100

If nobody is using them, how about to remove them from mainline?

Thanks,
Kukjin
