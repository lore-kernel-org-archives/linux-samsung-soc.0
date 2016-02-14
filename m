From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] regulator: Rename files for max77686 and max77802 drivers
Date: Sun, 14 Feb 2016 15:53:19 +0900
Message-ID: <56C0245F.1080209@samsung.com>
References: <1455250463-5955-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455250463-5955-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: k.kozlowski.k@gmail.com, Andi Shyti <andi.shyti@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

W dniu 12.02.2016 o 13:14, Javier Martinez Canillas pisze:
> The max77686 and max77802 regulator drivers are for sub-devices of a MFD
> driver for some PMIC blocks. But the same object file name (max77686.o)
> was used for both the common MFD driver and the max77686 regulator one.
> 
> This confuses kbuild if both drivers are built as module causing the MFD
> driver to not be copied when installing the modules.
> 
> Also, max77{686,802} are a quite generic name for MFD subdevices drivers
> so it is better to rename them to max77{686,802}-regulator like it's the
> case for most regulator drivers.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> 
>  MAINTAINERS                                            | 2 +-
>  drivers/regulator/Makefile                             | 4 ++--
>  drivers/regulator/{max77686.c => max77686-regulator.c} | 0
>  drivers/regulator/{max77802.c => max77802-regulator.c} | 0
>  4 files changed, 3 insertions(+), 3 deletions(-)
>  rename drivers/regulator/{max77686.c => max77686-regulator.c} (100%)
>  rename drivers/regulator/{max77802.c => max77802-regulator.c} (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 97b99f24ea53..863eb59e101b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6904,7 +6904,7 @@ MAXIM MAX77802 MULTIFUNCTION PMIC DEVICE DRIVERS
>  M:	Javier Martinez Canillas <javier@osg.samsung.com>
>  L:	linux-kernel@vger.kernel.org
>  S:	Supported
> -F:	drivers/*/*max77802.c
> +F:	drivers/*/*max77802*.c
>  F:	Documentation/devicetree/bindings/*/*max77802.txt
>  F:	include/dt-bindings/*/*max77802.h

Looks fine, but can you also update the max77686 entry with extended
wildcard?

Best regards,
Krzysztof
