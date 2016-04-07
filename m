From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/2] regulator: s2mps11: Use module_platform_driver()
 instead subsys initcall
Date: Thu, 7 Apr 2016 21:30:24 +0900
Message-ID: <20160407123024.GA6765@kozik-lap>
References: <1459950587-8807-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1459950587-8807-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Apr 06, 2016 at 09:49:46AM -0400, Javier Martinez Canillas wrote:
> The driver's init and exit function don't do anything besides registering
> and unregistering the platform driver, so the module_platform_driver()
> macro could just be used instead of having separate functions.
> 
> Currently the macro is not being used because the driver is initialized at
> subsys init call level but this isn't necessary since consumer devices are
> defined in the DT as dependencies so there's no need for init calls order.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> This patch was tested on an Exynos5422 Odroid XU4 board.

This test might not be sufficient. XU4 is not a mobile device like many
other users of this driver (except Arndale Octa and Artiks all of other
users are mobiles/wearables).

For example XU4 does not have USB OTG (like other devices and like XU3).

Best regards,
Krzysztof

> 
>  drivers/regulator/s2mps11.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
> 
