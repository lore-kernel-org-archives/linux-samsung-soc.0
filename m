From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Build ChromeOS EC drivers as
 modules
Date: Wed, 18 Nov 2015 21:47:59 +0900
Message-ID: <564C737F.9060405@samsung.com>
References: <1447775924-2189-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447775924-2189-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: k.kozlowski.k@gmail.com, linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Kukjin Kim <kgene@kernel.org>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

W dniu 18.11.2015 o 00:58, Javier Martinez Canillas pisze:
> Since the multi_v7_defconfig is used to build an image for different
> platforms, the options should be enabled as module whenever possible.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> The patch was tested on an Exynos5800 Peach Pi Chromebook
> and the drivers' modules were correctly autoloaded.
> 
>  arch/arm/configs/multi_v7_defconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

I suppose this could go through Samsung-soc. I got few other patches for
multi_v7.

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
