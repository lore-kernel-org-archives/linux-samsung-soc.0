From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: exynos4: Enable serial controllers on Origen and
 SMDKV310
Date: Sat, 08 Sep 2012 11:36:30 +0900
Message-ID: <24d901cd8d6a$c10c9710$4325c530$%kim@samsung.com>
References: <1346675674-16034-1-git-send-email-t.figa@samsung.com>
 <1346675674-16034-4-git-send-email-t.figa@samsung.com>
 <1808225.QZz0WEipT7@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:58207 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751030Ab2IHCgd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Sep 2012 22:36:33 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MA000845F8VZ780@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 08 Sep 2012 11:36:31 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MA0001Y4F8V5K70@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 08 Sep 2012 11:36:31 +0900 (KST)
In-reply-to: <1808225.QZz0WEipT7@amdc1227>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, jy0922.shim@samsung.com, thomas.abraham@linaro.org

Tomasz Figa wrote:
> 
> This patch adds status override of serial nodes to enable used serial
> ports
> on Origen and SMDKV310 board.
> 
Well...I'm not sure about the status of Origen serial, but all of the
serials are enabled on SMDKV310, is it right?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
