From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 1/3] mtd: s3c2410: make ecc mode configurable via
 platform data
Date: Fri, 21 Oct 2016 21:27:10 +0300
Message-ID: <20161021182710.GA17279@kozik-lap>
References: <1476999766-32526-1-git-send-email-sergio.prado@e-labworks.com>
 <1476999766-32526-2-git-send-email-sergio.prado@e-labworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36185 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934190AbcJUS1U (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Oct 2016 14:27:20 -0400
Content-Disposition: inline
In-Reply-To: <1476999766-32526-2-git-send-email-sergio.prado@e-labworks.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sergio Prado <sergio.prado@e-labworks.com>
Cc: kgene@kernel.org, krzk@kernel.org, javier@osg.samsung.com, linux@armlinux.org.uk, linux@simtec.co.uk, boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org

On Thu, Oct 20, 2016 at 07:42:44PM -0200, Sergio Prado wrote:
> Removing CONFIG_MTD_NAND_S3C2410_HWECC option and adding a ecc_mode
> field in the drivers's platform data structure so it can be selectable
> via platform data.
> 
> Also setting this field to NAND_ECC_SOFT in all boards using this
> driver since none of them had CONFIG_MTD_NAND_S3C2410_HWECC enabled.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  arch/arm/mach-s3c24xx/common-smdk.c            |   1 +
>  arch/arm/mach-s3c24xx/mach-anubis.c            |   1 +
>  arch/arm/mach-s3c24xx/mach-at2440evb.c         |   1 +
>  arch/arm/mach-s3c24xx/mach-bast.c              |   1 +
>  arch/arm/mach-s3c24xx/mach-gta02.c             |   1 +
>  arch/arm/mach-s3c24xx/mach-jive.c              |   1 +
>  arch/arm/mach-s3c24xx/mach-mini2440.c          |   1 +
>  arch/arm/mach-s3c24xx/mach-osiris.c            |   1 +
>  arch/arm/mach-s3c24xx/mach-qt2410.c            |   1 +
>  arch/arm/mach-s3c24xx/mach-rx1950.c            |   1 +
>  arch/arm/mach-s3c24xx/mach-rx3715.c            |   1 +
>  arch/arm/mach-s3c24xx/mach-vstms.c             |   1 +
>  arch/arm/mach-s3c64xx/mach-hmt.c               |   1 +
>  arch/arm/mach-s3c64xx/mach-mini6410.c          |   1 +
>  arch/arm/mach-s3c64xx/mach-real6410.c          |   1 +
>  drivers/mtd/nand/Kconfig                       |   9 --
>  drivers/mtd/nand/s3c2410.c                     | 119 +++++++++++++------------
>  include/linux/platform_data/mtd-nand-s3c2410.h |   6 +-
>  18 files changed, 79 insertions(+), 70 deletions(-)
>

I acked this twice (v1 and v2)... and still you are ignoring them. I am
sorry, I am not gonna to ack this third time!

For v2 I acked also other patches but it it is not there as well...

BR,
Krzysztof
