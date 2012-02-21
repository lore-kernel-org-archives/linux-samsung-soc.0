From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3] DMA: PL330: Merge PL330 driver into drivers/dma/
Date: Tue, 21 Feb 2012 20:25:05 +0900
Message-ID: <00b401ccf08b$75b35870$611a0950$%kim@samsung.com>
References: <1329341243-14314-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:23632 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753766Ab2BULZH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Feb 2012 06:25:07 -0500
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZQ00GBNQDSHYP0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 21 Feb 2012 20:25:06 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZQ0095DQDTH580@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 21 Feb 2012 20:25:06 +0900 (KST)
In-reply-to: <1329341243-14314-1-git-send-email-kgene.kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Linus Walleij' <linus.walleij@linaro.org>, 'Vinod Koul' <vinod.koul@intel.com>, 'Boojin Kim' <boojin.kim@samsung.com>, 'Jassi Brar' <jassisinghbrar@gmail.com>, 'Russell King' <rmk+kernel@arm.linux.org.uk>

Kukjin Kim wrote:
> 
> From: Boojin Kim <boojin.kim@samsung.com>
> 
> Currently there were two part of DMAC PL330 driver for
> support old styled s3c-pl330 which has been merged into
> drivers/dma/pl330.c driver. Actually, there is no reason
> to separate them now.
> 
> Basically this patch merges arch/arm/common/pl330.c into
> drivers/dma/pl330.c driver and removes useless exported
> symbol, externed function and so on.
> 
> The newer pl330 driver tested on SMDKV310 and SMDK4212 boards
> 
> Cc: Jassi Brar <jassisinghbrar@gmail.com>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>

Hi Russell,

This addressed comments from you about moving 'asm/hardware/pl330.h' into
'drivers/dma/', there is nowhere it is used except drivers/dma/.

If you have any objection on this, please let me know.

As we talked last time, if you're ok on this let me send 'pull request' this
series to you and Vinod. I think this should be sent to rmk tree and dma
tree together.

As a note, this is in 'v3.4-for-vkoul-v2' of linux-samsung.git now.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Vinod Koul <vinod.koul@intel.com>
> Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> Changes since v2:
> - Address comments from Russell King
>   the 'asm/hardware/pl330.h' is moved to 'drivers/dma/pl330.h'
>   which is used only in drivers/dma/
> 
>  arch/arm/common/Kconfig               |    3 -
>  arch/arm/common/Makefile              |    1 -
>  arch/arm/common/pl330.c               | 1959
--------------------------------
> -
>  arch/arm/include/asm/hardware/pl330.h |  217 ----
>  drivers/dma/Kconfig                   |    1 -
>  drivers/dma/pl330.c                   | 1892
+++++++++++++++++++++++++++++++-
>  drivers/dma/pl330.h                   |  251 +++++
>  include/linux/amba/pl330.h            |    1 -
>  8 files changed, 2142 insertions(+), 2183 deletions(-)
>  delete mode 100644 arch/arm/common/pl330.c
>  delete mode 100644 arch/arm/include/asm/hardware/pl330.h
>  create mode 100644 drivers/dma/pl330.h
