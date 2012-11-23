From: Sangbeom Kim <sbkim73@samsung.com>
Subject: RE: [PATCH V3] ARM: EXYNOS5: Add clocks for EXYNOS5 Audio Subsystem.
Date: Fri, 23 Nov 2012 18:27:19 +0900
Message-ID: <000401cdc95c$c2aec420$480c4c60$@com>
References: <1352176731-16199-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:31077 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758679Ab2KWJ1r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Nov 2012 04:27:47 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDX00EYDOXG83K0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Nov 2012 18:27:27 +0900 (KST)
Received: from DOSBKIM7302 ([12.23.120.118])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDX00BMYOXH0C00@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Nov 2012 18:27:27 +0900 (KST)
In-reply-to: <1352176731-16199-1-git-send-email-padma.v@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Padmavathi Venna' <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, olofj@google.com

On Tue, Nov 6, 2012 at 1:39 PM, Padmavathi Venna wrote:

> -----Original Message-----
> From: Padmavathi Venna [mailto:padma.v@samsung.com]
> Sent: Tuesday, November 06, 2012 1:39 PM
> To: linux-arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org
> Cc: padma.v@samsung.com; sbkim73@samsung.com; ben-linux@fluff.org; kgene.kim@samsung.com;
> olofj@google.com
> Subject: [PATCH V3] ARM: EXYNOS5: Add clocks for EXYNOS5 Audio Subsystem.
> 
> This patch adds all the required clock instances for audio
> subsystem and adds the clock alias names for sclk-i2s and
> i2s-bus clks. This patch also do the static mapping
> of audss clock base address to control audss clocks in CMU
> clock framework.
> 
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>

Acked-by: Sangbeom Kim <sbkim73@samsung.com>

Thanks,
Sangbeom
