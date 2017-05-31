From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH] ARM: s3c64xx: don't select ARM_AMBA from S3C64XX_PL080
Date: Wed, 31 May 2017 20:58:49 +0100
Message-ID: <20170531195849.GD27796@n2100.armlinux.org.uk>
References: <20170524155845.1778223-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:43524 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751009AbdEaT7C (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 31 May 2017 15:59:02 -0400
Content-Disposition: inline
In-Reply-To: <20170524155845.1778223-1-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Eric Anholt <eric@anholt.net>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On Wed, May 24, 2017 at 05:58:34PM +0200, Arnd Bergmann wrote:
> While trying a fix a build warning unrelated to s3c64xx, I ran into
> a circular dependency:
> 
> drivers/i2c/Kconfig:7: symbol I2C is selected by FB_DDC
> drivers/video/fbdev/Kconfig:63: symbol FB_DDC is selected by FB_CYBER2000_DDC
> drivers/video/fbdev/Kconfig:381: symbol FB_CYBER2000_DDC depends on FB_CYBER2000
> drivers/video/fbdev/Kconfig:369: symbol FB_CYBER2000 depends on FB
> drivers/video/fbdev/Kconfig:5: symbol FB is selected by DRM_KMS_FB_HELPER
> drivers/gpu/drm/Kconfig:72: symbol DRM_KMS_FB_HELPER is selected by DRM_KMS_CMA_HELPER
> drivers/gpu/drm/Kconfig:137: symbol DRM_KMS_CMA_HELPER is selected by DRM_PL111
> drivers/gpu/drm/pl111/Kconfig:1: symbol DRM_PL111 depends on ARM_AMBA
> drivers/amba/Kconfig:1: symbol ARM_AMBA is selected by S3C64XX_PL080
> arch/arm/mach-s3c64xx/Kconfig:42: symbol S3C64XX_PL080 default value contains DMADEVICES
> drivers/dma/Kconfig:5: symbol DMADEVICES is selected by SND_SOC_SH4_SIU
> sound/soc/sh/Kconfig:29: symbol SND_SOC_SH4_SIU is selected by SND_SIU_MIGOR
> sound/soc/sh/Kconfig:59: symbol SND_SIU_MIGOR depends on I2C
> 
> The I2C and FB dependencies are hard to untangle, but I notice that
> S3C64XX_PL080 selecting ARM_AMBA is one piece of the puzzle that
> can easily be avoided, as ARCH_S3C64XX already select ARM_AMBA.
> Removing the redundant 'select' now can help us in the future if we
> run into a variation of the same dependency.

Yes, selecting ARM_AMBA from drivers is definitely not right; this
symbol should be selected only by platforms that want AMBA primecell
bus support, not by drivers, precisely because of these dependency
issues.

There's another case where ARM_AMBA is selected that probably needs
fixing - the coresight hwtracing code.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
