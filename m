From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v6 1/2] soc: samsung: add exynos chipid driver support
Date: Wed, 25 May 2016 10:49:53 +0200
Message-ID: <15114439.HIyt1ChUT2@wuerfel>
References: <1464163104-8163-1-git-send-email-pankaj.dubey@samsung.com> <1464163104-8163-2-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464163104-8163-2-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, k.kozlowski@samsung.com, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, thomas.ab@samsung.com, kgene@kernel.org, Grant Likely <grant.likely@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wednesday, May 25, 2016 1:28:23 PM CEST Pankaj Dubey wrote:
> Exynos SoCs have Chipid, for identification of product IDs
> and SoC revisions. This patch intends to provide initialization
> code for all these functionalities, at the same time it provides some
> sysfs entries for accessing these information to user-space.
> 
> This driver uses existing binding for exynos-chipid.
> 
> CC: Grant Likely <grant.likely@linaro.org>
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  drivers/soc/samsung/Kconfig            |   5 +
>  drivers/soc/samsung/Makefile           |   1 +
>  drivers/soc/samsung/exynos-chipid.c    | 172 +++++++++++++++++++++++++++++++++
>  include/linux/soc/samsung/exynos-soc.h |  51 ++++++++++
> 


I don't like how this exposes the internals of the samsung SoC in a global header
file, after we spent a considerable amount of work on keeping it confined
to arch/arm/{mach-exynos,mach-s3c64xx,plat-samsung}.

Please remove the external interface of the driver, in particular the global
data structure. We keep coming back to this for a lot of platforms, and
I still think we should have an architecture-independent way of matching
platforms to struct soc_device, using an exported function from drivers/base/soc.c
that uses glob_match() to compare a platform string against the running system.

	Arnd
