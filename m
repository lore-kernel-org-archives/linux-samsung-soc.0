From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: Exynos: Enable DT support by default for Exynos5 SoC
Date: Fri, 10 Aug 2012 15:14:35 +0900
Message-ID: <0dd501cd76bf$69f271a0$3dd754e0$%kim@samsung.com>
References: <1344485719-26111-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18919 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754452Ab2HJGOh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Aug 2012 02:14:37 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M8I00D5VZZT5WB0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Aug 2012 15:14:35 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M8J0077R00BGTD0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Aug 2012 15:14:35 +0900 (KST)
In-reply-to: <1344485719-26111-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> Since support for Exynos5 SoC based boards is going to be only
> device tree (DT) based, it makes no sense to provide DT as a user
> selectable feature in menuconfig (De-selecting it gives
> "no machine record defined" linker error). Hence enabling it along with
> ARCH_EXYNOS5 option.
> 
Yeah, it's true supporting EXYNOS5 SoCs is available only on DT. But I think
this is not needed and current method is more clear with EXYNOS4.

Note, 'exynos_defconfig' in mainline is supporting EXYNOS4 and EXYNOS5 DT
together.


> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>

BTW, I commented on other patch, I don't see why you need to keep the
duplicated signoff?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
