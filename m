From: Sangbeom Kim <sbkim73@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Remove wrong I2S0 clock from peril clock
Date: Mon, 08 Oct 2012 11:15:31 +0900
Message-ID: <016501cda4fa$caa62dc0$5ff28940$@com>
References: <004d01cda2cc$37254570$a56fd050$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56371 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751039Ab2JHCPN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 7 Oct 2012 22:15:13 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBJ00D73Y7NCQC0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Oct 2012 11:15:11 +0900 (KST)
Received: from DOSBKIM7302 ([10.90.35.108])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBJ00EZ6Y9B5TB0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Oct 2012 11:15:11 +0900 (KST)
In-reply-to: <004d01cda2cc$37254570$a56fd050$@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sangsu Park' <sangsu4u.park@samsung.com>, 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Friday, Oct 05, 2012 at 4:37 PM, Sangsu Park wrote:
> Remove I2S0 clk from peril since peril clock doesn't have I2S0 clk for EXYNOS4.
> Audio Subsystem block has I2S0 clk.
> 
> Signed-off-by: Sangsu Park <sangsu4u.park@samsung.com>

Peril control bit 19 is reserved.

Acked-by: Sangbeom Kim <sbkim73@samsung.com>

Thanks,
Sangbeom.
