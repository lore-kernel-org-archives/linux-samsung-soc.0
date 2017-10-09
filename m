From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCHv3 1/2] drivers: phy: add calibrate method
Date: Mon, 9 Oct 2017 15:45:45 +0530
Message-ID: <6de8a17a-745b-0fa2-c39d-cdeb28fc9489@ti.com>
References: <6935498c-9788-14e6-844f-f9e8288026dc@samsung.com>
 <1507205511-23048-1-git-send-email-andrzej.p@samsung.com>
 <CGME20171005121201eucas1p269da2155c4257777b0c3a5b210c651f8@eucas1p2.samsung.com>
 <1507205511-23048-2-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507205511-23048-2-git-send-email-andrzej.p-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrzej Pietrasiewicz <andrzej.p-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Thursday 05 October 2017 05:41 PM, Andrzej Pietrasiewicz wrote:
> Some quirky UDCs (like dwc3 on exynos) need to have heir phys calibrated

%s/heir/their
> e.g. for using super speed.

The commit log should also include when phy calibrate should be used and why
existing API's is not sufficient for initializing/calibrating the phy.

Thanks
Kishon
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/phy/phy-core.c  | 15 +++++++++++++++
>  include/linux/phy/phy.h | 10 ++++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index a268f4d..b4964b0 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -372,6 +372,21 @@ int phy_reset(struct phy *phy)
>  }
>  EXPORT_SYMBOL_GPL(phy_reset);
>  
> +int phy_calibrate(struct phy *phy)
> +{
> +	int ret;
> +
> +	if (!phy || !phy->ops->calibrate)
> +		return 0;
> +
> +	mutex_lock(&phy->mutex);
> +	ret = phy->ops->calibrate(phy);
> +	mutex_unlock(&phy->mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(phy_calibrate);
> +
>  /**
>   * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>   * @np: device_node for which to get the phy
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index e694d40..87580c8 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -39,6 +39,7 @@ enum phy_mode {
>   * @power_off: powering off the phy
>   * @set_mode: set the mode of the phy
>   * @reset: resetting the phy
> + * @calibrate: calibrate the phy
>   * @owner: the module owner containing the ops
>   */
>  struct phy_ops {
> @@ -48,6 +49,7 @@ struct phy_ops {
>  	int	(*power_off)(struct phy *phy);
>  	int	(*set_mode)(struct phy *phy, enum phy_mode mode);
>  	int	(*reset)(struct phy *phy);
> +	int	(*calibrate)(struct phy *phy);
>  	struct module *owner;
>  };
>  
> @@ -141,6 +143,7 @@ static inline void *phy_get_drvdata(struct phy *phy)
>  int phy_power_off(struct phy *phy);
>  int phy_set_mode(struct phy *phy, enum phy_mode mode);
>  int phy_reset(struct phy *phy);
> +int phy_calibrate(struct phy *phy);
>  static inline int phy_get_bus_width(struct phy *phy)
>  {
>  	return phy->attrs.bus_width;
> @@ -262,6 +265,13 @@ static inline int phy_reset(struct phy *phy)
>  	return -ENOSYS;
>  }
>  
> +static inline int phy_calibrate(struct phy *phy)
> +{
> +	if (!phy)
> +		return 0;
> +	return -ENOSYS;
> +}
> +
>  static inline int phy_get_bus_width(struct phy *phy)
>  {
>  	return -ENOSYS;
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
