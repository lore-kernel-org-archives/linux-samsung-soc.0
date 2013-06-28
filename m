From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: remove obsolete exynos4_defconfig
Date: Fri, 28 Jun 2013 15:17:27 +0200
Message-ID: <51CD8CE7.4080209@samsung.com>
References: <2326060.vKzrGtO1Cq@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:19850 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753915Ab3F1NRa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Jun 2013 09:17:30 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MP3008AFU7NNS30@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Jun 2013 14:17:28 +0100 (BST)
In-reply-to: <2326060.vKzrGtO1Cq@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org

On 06/28/2013 11:48 AM, Bartlomiej Zolnierkiewicz wrote:
> It hasn't been updated since Novemeber 2011 and exynos_defconfig
> should be used instead.
> 
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Since it has been already discussed and agreed to remove
exynos4_defconfig [1],

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

[1] http://www.spinics.net/lists/arm-kernel/msg251062.html

Thanks,
Sylwester
