From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS5: Remove wrongly placed usb2.0 PHY_CFG
 definition from PMU_REG
Date: Thu, 08 Nov 2012 13:52:05 +0900
Message-ID: <0cec01cdbd6c$cd290e70$677b2b50$%kim@samsung.com>
References: <1349443590-29901-1-git-send-email-gautam.vivek@samsung.com>
 <003b01cda5f8$f84e35c0$e8eaa140$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:19272 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753467Ab2KHEwP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Nov 2012 23:52:15 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD5007CQK6EEYH0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 Nov 2012 13:52:06 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MD500BICK6TCG30@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 Nov 2012 13:52:05 +0900 (KST)
In-reply-to: <003b01cda5f8$f84e35c0$e8eaa140$%han@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jingoo Han' <jg1.han@samsung.com>, 'Vivek Gautam' <gautam.vivek@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, thomas.abraham@linaro.org

Jingoo Han wrote:
> 
> On Friday, October 05, 2012 10:27 PM Vivek Gautam wrote
> >
> > EXYNOS5_USB_CFG macro should actually point to USB20PHY_CFG
> > system register (base addr + 0x230). It's wrongly placed in regs-pmu.
> > Actual register at offset 0x230 in PMU is SEQ_TRANSITION4.
> >
> > Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> 
> As you mentioned, this definition is wrong.
> So, it should be removed.
> 
> Reviewed-by: Jingoo Han <jg1.han@samsung.com>
> 
Applied, thanks.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
