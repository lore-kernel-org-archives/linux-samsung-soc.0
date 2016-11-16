From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 4/8] ARM: s3c64xx: Drop unused DMA fields from struct
 s3c64xx_spi_csinfo
Date: Wed, 16 Nov 2016 18:58:37 +0200
Message-ID: <20161116165837.GC3727@kozik-lap>
References: <1478791076-19528-1-git-send-email-s.nawrocki@samsung.com>
 <1478791076-19528-5-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35583 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751277AbcKPQ6o (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Nov 2016 11:58:44 -0500
Content-Disposition: inline
In-Reply-To: <1478791076-19528-5-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: krzk@kernel.org, vinod.koul@intel.com, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, broonie@kernel.org, ckeepax@opensource.wolfsonmicro.com, ym0914@gmail.com, arnd@arndb.de, javier@osg.samsung.com, andi.shyti@samsung.com, sbkim73@samsung.com

On Thu, Nov 10, 2016 at 04:17:52PM +0100, Sylwester Nawrocki wrote:
> There is no drivers using those fields so remove them and
> the remaining initializations.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Tested-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  arch/arm/plat-samsung/devs.c              | 24 ------------------------
>  include/linux/platform_data/spi-s3c64xx.h |  3 ---
>  2 files changed, 27 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
