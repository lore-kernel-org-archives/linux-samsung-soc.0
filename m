From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Remove wrong I2S0 clock from peril clock
Date: Tue, 23 Oct 2012 19:30:33 +0900
Message-ID: <01ab01cdb109$6f00d540$4d027fc0$%kim@samsung.com>
References: <004d01cda2cc$37254570$a56fd050$@samsung.com>
 <016501cda4fa$caa62dc0$5ff28940$@com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:13529 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754050Ab2JWKaf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Oct 2012 06:30:35 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCC00L1ND5SLE40@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Oct 2012 19:30:34 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCC000DDD6XEM10@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Oct 2012 19:30:33 +0900 (KST)
In-reply-to: <016501cda4fa$caa62dc0$5ff28940$@com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sangbeom Kim' <sbkim73@samsung.com>, 'Sangsu Park' <sangsu4u.park@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Sangbeom Kim wrote:
> 
> On Friday, Oct 05, 2012 at 4:37 PM, Sangsu Park wrote:
> > Remove I2S0 clk from peril since peril clock doesn't have I2S0 clk for
> EXYNOS4.
> > Audio Subsystem block has I2S0 clk.
> >
> > Signed-off-by: Sangsu Park <sangsu4u.park@samsung.com>
> 
> Peril control bit 19 is reserved.
> 
> Acked-by: Sangbeom Kim <sbkim73@samsung.com>
> 
Applied.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
