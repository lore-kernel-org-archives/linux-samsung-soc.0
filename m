From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 0/3] regulator: max8998: Add support for Device Tree
Date: Mon, 15 Apr 2013 14:42:08 +0200
Message-ID: <1884769.9OL2jLgc2r@amdc1227>
References: <1365092363-12763-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:63648 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753638Ab3DOMmd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Apr 2013 08:42:33 -0400
In-reply-to: <1365092363-12763-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@opensource.wolfsonmicro.com
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, lrg@ti.com, m.szyprowski@samsung.com, kgene.kim@samsung.com

Hi Mark,

On Thursday 04 of April 2013 18:19:20 Tomasz Figa wrote:
> This series adds Device Tree support to max8998 MFD driver.
> 
> First patch reworks max8998-irq driver to use IRQ domains. Second patch
> prepares platform data structure to ease generating it at runtime from
> data parsed from device tree. Third patch implements Device Tree
> binding and adds necessary documentation.
> 
> Tested on Universal C210 board.
> 
> Tomasz Figa (3):
>   mfd: Add irq domain support for max8998 interrupts
>   regulator: max8998: Use arrays for specifying voltages in platform
>     data
>   mfd: max8998: Add support for Device Tree
> 
>  Documentation/devicetree/bindings/mfd/max8998.txt | 111 ++++++++++
>  arch/arm/mach-exynos/mach-universal_c210.c        |   8 +-
>  arch/arm/mach-s5pv210/mach-aquila.c               |   8 +-
>  arch/arm/mach-s5pv210/mach-goni.c                 |   8 +-
>  drivers/mfd/Kconfig                               |   1 +
>  drivers/mfd/max8998-irq.c                         |  61 +++---
>  drivers/mfd/max8998.c                             |  76 ++++++-
>  drivers/regulator/max8998.c                       | 254
> ++++++++++++++++------ drivers/rtc/rtc-max8998.c                         | 
> 17 +-
>  include/linux/mfd/max8998-private.h               |   6 +-
>  include/linux/mfd/max8998.h                       |  20 +-
>  11 files changed, 435 insertions(+), 135 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/max8998.txt

Any chance to still have this series merged for 3.10?

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Kernel and System Framework
