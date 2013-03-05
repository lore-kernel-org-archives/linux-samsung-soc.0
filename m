From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 00/23] RFC: exynos multiplatform support
Date: Tue, 5 Mar 2013 21:54:22 +0000
Message-ID: <201303052154.22857.arnd@arndb.de>
References: <1362505353-8873-1-git-send-email-arnd@arndb.de> <201303052150.24947.heiko@sntech.de> <201303052124.04101.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:64398 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752838Ab3CEVyk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Mar 2013 16:54:40 -0500
In-Reply-To: <201303052124.04101.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Deepak Saxena <dsaxena@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>

On Tuesday 05 March 2013, Arnd Bergmann wrote:
> The s3c64xx_dma code is also interesting because
> it has both an implementation of the s3c_dma interface in
> arch/arm/mach-s3c64xx/dma.c and one using the generic interface in
> drivers/dma/amba-pl08x.c. 

This actually brings me to an interesting idea: the s3c64xx SPI driver
is used with the regular dmaengine API and pl330 on S5P and Exynos,
but with the s3c-dma interface and pl080 on S3C64xx.

If we just convert S3C64xx to use the pl080 dmaengine driver
instead, we can apply my SPI patch without breaking anything.

We still need a solution for the ASoC drivers, but they are
not as essential. We could probably move the wrapper files
from plat-samsung/*dma*.c to sounds/soc/samsung when that becomes
the only remaining user.

There is also drivers/mmc/host/s3cmci.c, which uses the s3c-dma
interface, but it is only used on s3c24xx, not s3c64xx or later.

	Arnd
