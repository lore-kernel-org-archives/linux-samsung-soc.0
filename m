From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 4/5] drm/exynos: add support for apb mapped phys in hdmi
 driver
Date: Thu, 10 Apr 2014 19:17:54 +0200
Message-ID: <5346D242.4090009@samsung.com>
References: <1396458826-3051-1-git-send-email-rahul.sharma@samsung.com>
 <1396458826-3051-5-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1396458826-3051-5-git-send-email-rahul.sharma@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rahul Sharma <rahul.sharma@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: joshi@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Rahul,

On 02.04.2014 19:13, Rahul Sharma wrote:
> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>
> Previous SoCs have hdmi phys which are accessible through
> dedicated i2c lines. Newer SoCs have Apb mapped hdmi phys.
> Hdmi driver is modified to support apb mapped phys.
>
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> ---
>   drivers/gpu/drm/exynos/exynos_hdmi.c |  142 +++++++++++++++++++++-------------
>   drivers/gpu/drm/exynos/regs-hdmi.h   |    7 ++
>   2 files changed, 96 insertions(+), 53 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 5b2cfe7..5989770 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -33,6 +33,7 @@
>   #include <linux/regulator/consumer.h>
>   #include <linux/io.h>
>   #include <linux/of.h>
> +#include <linux/of_address.h>
>   #include <linux/i2c.h>
>   #include <linux/of_gpio.h>
>   #include <linux/hdmi.h>
> @@ -68,6 +69,8 @@ enum hdmi_type {
>
>   struct hdmi_driver_data {
>   	unsigned int type;
> +	const struct hdmiphy_config *phy_confs;
> +	unsigned int phy_conf_count;
>   	unsigned int is_apb_phy:1;
>   };
>
> @@ -196,9 +199,12 @@ struct hdmi_context {
>   	struct hdmi_resources		res;
>
>   	int				hpd_gpio;
> +	void __iomem			*regs_hdmiphy;
>   	struct regmap			*pmureg;
>
>   	enum hdmi_type			type;
> +	const struct hdmiphy_config	*phy_confs;
> +	unsigned int			phy_conf_count;
>   };
>
>   struct hdmiphy_config {
> @@ -206,14 +212,6 @@ struct hdmiphy_config {
>   	u8 conf[32];
>   };
>
> -struct hdmi_driver_data exynos4212_hdmi_driver_data = {
> -	.type	= HDMI_TYPE14,
> -};
> -
> -struct hdmi_driver_data exynos5_hdmi_driver_data = {
> -	.type	= HDMI_TYPE14,
> -};
> -
>   /* list of phy config settings */
>   static const struct hdmiphy_config hdmiphy_v13_configs[] = {
>   	{
> @@ -428,6 +426,21 @@ static const struct hdmiphy_config hdmiphy_v14_configs[] = {
>   	},
>   };
>
> +
> +struct hdmi_driver_data exynos4212_hdmi_driver_data = {
> +	.type		= HDMI_TYPE14,
> +	.phy_confs	= hdmiphy_v14_configs,
> +	.phy_conf_count	= ARRAY_SIZE(hdmiphy_v14_configs),
> +	.is_apb_phy	= 0,
> +};
> +
> +struct hdmi_driver_data exynos5_hdmi_driver_data = {
> +	.type		= HDMI_TYPE14,
> +	.phy_confs	= hdmiphy_v13_configs,
> +	.phy_conf_count	= ARRAY_SIZE(hdmiphy_v13_configs),
> +	.is_apb_phy	= 0,
> +};
> +
>   static inline u32 hdmi_reg_read(struct hdmi_context *hdata, u32 reg_id)
>   {
>   	return readl(hdata->regs + reg_id);
> @@ -447,6 +460,48 @@ static inline void hdmi_reg_writemask(struct hdmi_context *hdata,
>   	writel(value, hdata->regs + reg_id);
>   }
>
> +static int hdmiphy_reg_writeb(struct hdmi_context *hdata,
> +			u32 reg_offset, u8 value)
> +{
> +	if (hdata->hdmiphy_port) {
> +		u8 buffer[2];
> +		int ret;
> +
> +		buffer[0] = reg_offset;
> +		buffer[1] = value;
> +
> +		ret = i2c_master_send(hdata->hdmiphy_port, buffer, 2);
> +		if (ret == 2)
> +			return 0;
> +		return ret;
> +	} else {
> +		writeb(value, hdata->regs_hdmiphy + (reg_offset<<2));
> +		return 0;
> +	}
> +}
> +
> +static int hdmiphy_reg_write_buf(struct hdmi_context *hdata,
> +			u32 reg_offset, const u8 *buf, u32 len)
> +{
> +	if ((reg_offset + len) > 32)
> +		return -EINVAL;
> +
> +	if (hdata->hdmiphy_port) {
> +		int ret;
> +
> +		ret = i2c_master_send(hdata->hdmiphy_port, buf, len);

reg_offset doesn't seem to be used in I2C code path in any way. Are you 
sure this is correct?

> +		if (ret == len)
> +			return 0;
> +		return ret;
> +	} else {
> +		int i;
> +		for (i = 0; i < len; i++)
> +			writeb(buf[i], hdata->regs_hdmiphy +
> +				((reg_offset + i)<<2));
> +		return 0;
> +	}
> +}

I wonder if those functions couldn't be abstracted as two callbacks in 
hdmi_driver_data struct to eliminate such if clauses as above.

--
Best regards,
Tomasz
