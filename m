From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 1/7] drm/exynos: dp: support hotplug detection via GPIO
Date: Fri, 18 Apr 2014 17:23:51 +0900
Message-ID: <000001cf5adf$87cf7280$976e5780$%han@samsung.com>
References: <1397658786-26138-1-git-send-email-ajaykumar.rs@samsung.com>
 <1397658786-26138-2-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1397658786-26138-2-git-send-email-ajaykumar.rs@samsung.com>
Content-language: ko
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: 'Ajay Kumar' <ajaykumar.rs@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, seanpaul@google.com, abrestic@chromium.org, joshi@samsung.com, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, kyungmin.park@samsung.com, ajaynumb@gmail.com, treding@nvidia.com, prashanth.g@samsung.com, rahul.sharma@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wednesday, April 16, 2014 11:33 PM, Ajay Kumar wrote:
> 
> From: Andrew Bresticker <abrestic@chromium.org>
> 
> Certain bridge chips use a GPIO to indicate the cable status instead
> of the I_DP_HPD pin.  This adds an optional device-tree property,
> "samsung,hpd-gpio", to the exynos-dp controller which indicates that
> the specified GPIO should be used for hotplug detection.
> The GPIO is then set up as an edge-triggered interrupt where the
> rising edge indicates hotplug-in and the falling edge indicates hotplug-out.
> 
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  .../devicetree/bindings/video/exynos_dp.txt        |  4 +++
>  drivers/gpu/drm/exynos/exynos_dp_core.c            | 32 ++++++++++++++++++++--
>  drivers/gpu/drm/exynos/exynos_dp_core.h            |  1 +
>  drivers/gpu/drm/exynos/exynos_dp_reg.c             | 26 ++++++++++++++++--
>  4 files changed, 57 insertions(+), 6 deletions(-)
> 

[.....]

> --- a/drivers/gpu/drm/exynos/exynos_dp_reg.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp_reg.c
> @@ -13,6 +13,7 @@
>  #include <linux/device.h>
>  #include <linux/io.h>
>  #include <linux/delay.h>
> +#include <linux/gpio.h>
> 
>  #include "exynos_dp_core.h"
>  #include "exynos_dp_reg.h"
> @@ -326,6 +327,9 @@ void exynos_dp_clear_hotplug_interrupts(struct exynos_dp_device *dp)
>  {
>  	u32 reg;
> 
> +	if (gpio_is_valid(dp->hpd_gpio))
> +		return;
> +
>  	reg = HOTPLUG_CHG | HPD_LOST | PLUG;
>  	writel(reg, dp->reg_base + EXYNOS_DP_COMMON_INT_STA_4);
> 
> @@ -337,6 +341,9 @@ void exynos_dp_init_hpd(struct exynos_dp_device *dp)
>  {
>  	u32 reg;
> 
> +	if (gpio_is_valid(dp->hpd_gpio))
> +		return;
> +
>  	exynos_dp_clear_hotplug_interrupts(dp);
> 
>  	reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_3);
> @@ -348,6 +355,14 @@ enum dp_irq_type exynos_dp_get_irq_type(struct exynos_dp_device *dp)
>  {
>  	u32 reg;
> 
> +	if (gpio_is_valid(dp->hpd_gpio)) {
> +		reg = gpio_get_value(dp->hpd_gpio);
> +		if (reg)
> +			return DP_IRQ_TYPE_HP_CABLE_IN;
> +		else
> +			return DP_IRQ_TYPE_HP_CABLE_OUT;
> +	}
> +

Please keep the style. It enhances the readability.

if (gpio_is_valid(dp->hpd_gpio)) {
	...
} else {
	...
}

Then, it can be as bellows.

+	if (gpio_is_valid(dp->hpd_gpio)) {
+		reg = gpio_get_value(dp->hpd_gpio);
+		if (reg)
+			return DP_IRQ_TYPE_HP_CABLE_IN;
+		else
+			return DP_IRQ_TYPE_HP_CABLE_OUT;
+	} else {
+		/* Parse hotplug interrupt status register */
+		reg = readl(dp->reg_base + EXYNOS_DP_COMMON_INT_STA_4);
+
+		if (reg & PLUG)
+			return DP_IRQ_TYPE_HP_CABLE_IN;
+
+		if (reg & HPD_LOST)
+			return DP_IRQ_TYPE_HP_CABLE_OUT;
+
+		if (reg & HOTPLUG_CHG)
+			return DP_IRQ_TYPE_HP_CHANGE;
+	}

        return DP_IRQ_TYPE_UNKNOWN;
}

Best regards,
Jingoo Han

>  	/* Parse hotplug interrupt status register */
>  	reg = readl(dp->reg_base + EXYNOS_DP_COMMON_INT_STA_4);
> 
> @@ -402,9 +417,14 @@ int exynos_dp_get_plug_in_status(struct exynos_dp_device *dp)
>  {
>  	u32 reg;
> 
> -	reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_3);
> -	if (reg & HPD_STATUS)
> -		return 0;
> +	if (gpio_is_valid(dp->hpd_gpio)) {
> +		if (gpio_get_value(dp->hpd_gpio))
> +			return 0;
> +	} else {
> +		reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_3);
> +		if (reg & HPD_STATUS)
> +			return 0;
> +	}
> 
>  	return -EINVAL;
>  }
> --
> 1.8.1.2
