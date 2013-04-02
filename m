From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 0/6] pinctrl: Add support for pin control on S3C64xx
Date: Tue, 02 Apr 2013 10:00:03 +0200
Message-ID: <1441305.zvZX7Ed4lY@flatron>
References: <1363642315-10331-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f171.google.com ([209.85.215.171]:65082 "EHLO
	mail-ea0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757101Ab3DBIAH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Apr 2013 04:00:07 -0400
Received: by mail-ea0-f171.google.com with SMTP id b15so67600eae.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Apr 2013 01:00:06 -0700 (PDT)
In-Reply-To: <1363642315-10331-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, linus.walleij@linaro.org

Hi,

On Monday 18 of March 2013 22:31:49 Tomasz Figa wrote:
> This series makes necessary preparations to add support for pin
> controller available on Samsung S3C64xx using pinctrl-samsung driver
> and then adds pinctrl-s3c64xx driver which implements SoC-specific part
> of the code.
> 
> It has been tested on a tiny6410 (mini6410-compatible) board with my
> patches for samsung-time cleanup and S3C64xx Device Tree support:
>  - http://thread.gmane.org/gmane.linux.kernel.samsung-soc/16664
>  -
> http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg16325.
> html
> 
> Just the driver is added for now, as this is the part that can safely go
> through Linus' pinctrl tree. I will post appropriate enablement patches
> after all the dependencies get merged to Kgene's tree.
> 
> See particular patches for more detailed description of all changes.
> 
> Tomasz Figa (6):
>   pinctrl: samsung: Protect bank registers with a spinlock
>   pinctrl: samsung: Include pinctrl-exynos driver data conditionally
>   pinctrl: samsung: Split pin bank description into two structures
>   pinctrl: samsung: Remove hardcoded register offsets
>   pinctrl: samsung: Handle banks with two configuration registers
>   pinctrl: Add pinctrl-s3c64xx driver
> 
>  .../bindings/pinctrl/samsung-pinctrl.txt           |   3 +
>  drivers/pinctrl/Kconfig                            |   5 +
>  drivers/pinctrl/Makefile                           |   1 +
>  drivers/pinctrl/pinctrl-exynos.c                   |  36 +-
>  drivers/pinctrl/pinctrl-exynos.h                   |  16 +-
>  drivers/pinctrl/pinctrl-s3c64xx.c                  | 817
> +++++++++++++++++++++ drivers/pinctrl/pinctrl-samsung.c                
>  |  99 ++-
>  drivers/pinctrl/pinctrl-samsung.h                  |  42 +-
>  8 files changed, 947 insertions(+), 72 deletions(-)
>  create mode 100644 drivers/pinctrl/pinctrl-s3c64xx.c

Any comments about this series?

Best regards,
Tomasz
