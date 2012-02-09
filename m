From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCHv3 1/3] ARM: Exynos: JPEG board definition
Date: Thu, 09 Feb 2012 21:27:48 +0900
Message-ID: <001601cce726$3dee9080$b9cbb180$%kim@samsung.com>
References: <1328095165-31628-1-git-send-email-andrzej.p@samsung.com>
 <1328095165-31628-2-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:48345 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753372Ab2BIM14 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Feb 2012 07:27:56 -0500
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ400HELLADCK20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 21:27:55 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ400DDGLAFOR30@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 21:27:54 +0900 (KST)
In-reply-to: <1328095165-31628-2-git-send-email-andrzej.p@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Andrzej Pietrasiewicz' <andrzej.p@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>

Andrzej Pietrasiewicz wrote:
> 
> ARM: Exynos: JPEG board definition
> 

[...]

> 
> +#define EXYNOS4_PA_JPEG			0x11840000
> +
>  #define EXYNOS4_PA_G2D			0x12800000
> 
>  #define EXYNOS4_PA_I2S0			0x03830000
> @@ -164,6 +166,7 @@
>  #define S5P_PA_FIMC1			EXYNOS4_PA_FIMC1
>  #define S5P_PA_FIMC2			EXYNOS4_PA_FIMC2
>  #define S5P_PA_FIMC3			EXYNOS4_PA_FIMC3
> +#define S5P_PA_JPEG			EXYNOS4_PA_JPEG

I'm not sure we _really_ need to re-define for JPEG.
Why not just use EXYNOS4_PA_JPEG?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
