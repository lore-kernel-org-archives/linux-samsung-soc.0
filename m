From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCHv3 2/3] ARM: Exynos: Register JPEG on universal_c210
Date: Thu, 09 Feb 2012 21:30:25 +0900
Message-ID: <001701cce726$99be97c0$cd3bc740$%kim@samsung.com>
References: <1328095165-31628-1-git-send-email-andrzej.p@samsung.com>
 <1328095165-31628-3-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:48968 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753903Ab2BIMa3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Feb 2012 07:30:29 -0500
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ400HGALDYCK20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 21:30:28 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ400DQKLEQOR30@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 21:30:28 +0900 (KST)
In-reply-to: <1328095165-31628-3-git-send-email-andrzej.p@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Andrzej Pietrasiewicz' <andrzej.p@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>

Andrzej Pietrasiewicz wrote:
> 
> ARM: Exynos: Register JPEG on universal_c210
> 

[...]

> 
> +	s5p_device_jpeg.dev.parent =  &exynos4_device_pd[PD_CAM].dev;
>  	s5p_device_fimc0.dev.parent = &exynos4_device_pd[PD_CAM].dev;
>  	s5p_device_fimc1.dev.parent = &exynos4_device_pd[PD_CAM].dev;
>  	s5p_device_fimc2.dev.parent = &exynos4_device_pd[PD_CAM].dev;

No, we moved to use generic power domain.

See v3.4-for-rafael branch in my tree and it has been merged into linux-next
via pm tree.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
