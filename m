From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] DMA: PL330: Merge PL330 driver into drivers/dma/
Date: Thu, 8 Dec 2011 23:49:02 +0100
Message-ID: <CACRpkdZZvbJaJ7O7V64msXR5GKHAJ4KCo-cezybVpsaGQa-b6A@mail.gmail.com>
References: <002901ccb582$ba7e0a20$2f7a1e60$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:47152 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752079Ab1LHWtD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Dec 2011 17:49:03 -0500
Received: by iakc1 with SMTP id c1so3207351iak.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Dec 2011 14:49:03 -0800 (PST)
In-Reply-To: <002901ccb582$ba7e0a20$2f7a1e60$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, jassisinghbrar@gmail.com, rmk+kernel@arm.linux.org.uk, Boojin Kim <boojin.kim@samsung.com>

On Thu, Dec 8, 2011 at 9:23 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:

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
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Cc: Vinod Koul <vinod.koul@intel.com>
> Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

Looks good to me,
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thanks,
Linus Walleij
