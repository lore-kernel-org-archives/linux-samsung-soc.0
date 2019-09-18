From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v1 2/9] mfd: wm8994: Add support for MCLKn clock control
Date: Wed, 18 Sep 2019 12:59:28 +0200
Message-ID: <49ef7282-3765-9149-285d-a4025417eb58@samsung.com>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce@eucas1p1.samsung.com>
 <20190918104634.15216-3-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190918104634.15216-3-s.nawrocki@samsung.com>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: broonie@kernel.org
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com, b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com, lgirdwood@gmail.com, krzk@kernel.org, robh+dt@kernel.org, lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Cc: lee.jones@linaro.org

Excuse me Lee, I forgot to Cc entire series to you, will do it in case
of posting v2.

On 9/18/19 12:46, Sylwester Nawrocki wrote:
> The WM1811/WM8994/WM8958 audio CODEC DT bindings specify two optional
> clocks: "MCLK1", "MCLK2". Add code for getting those clocks in the MFD
> part of the wm8994 driver so they can be further handled in the audio
> CODEC part.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  drivers/mfd/wm8994-core.c       | 9 +++++++++
>  include/linux/mfd/wm8994/core.h | 9 +++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/mfd/wm8994-core.c b/drivers/mfd/wm8994-core.c
> index 1e9fe7d92597..02c19a0bdeb0 100644
> --- a/drivers/mfd/wm8994-core.c
> +++ b/drivers/mfd/wm8994-core.c
> @@ -7,6 +7,7 @@
>   * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> @@ -333,6 +334,14 @@ static int wm8994_device_init(struct wm8994 *wm8994, int irq)
>  
>  	dev_set_drvdata(wm8994->dev, wm8994);
>  
> +	wm8994->mclk[WM8994_MCLK1].id = "MCLK1";
> +	wm8994->mclk[WM8994_MCLK2].id = "MCLK2";
> +
> +	ret = devm_clk_bulk_get_optional(wm8994->dev, ARRAY_SIZE(wm8994->mclk),
> +					 wm8994->mclk);
> +	if (ret != 0)
> +		return ret;
> +
>  	/* Add the on-chip regulators first for bootstrapping */
>  	ret = mfd_add_devices(wm8994->dev, 0,
>  			      wm8994_regulator_devs,
> diff --git a/include/linux/mfd/wm8994/core.h b/include/linux/mfd/wm8994/core.h
> index e8b093522ffd..320297a1b70c 100644
> --- a/include/linux/mfd/wm8994/core.h
> +++ b/include/linux/mfd/wm8994/core.h
> @@ -10,12 +10,19 @@
>  #ifndef __MFD_WM8994_CORE_H__
>  #define __MFD_WM8994_CORE_H__
>  
> +#include <linux/clk.h>
>  #include <linux/mutex.h>
>  #include <linux/interrupt.h>
>  #include <linux/regmap.h>
>  
>  #include <linux/mfd/wm8994/pdata.h>
>  
> +enum {
> +	WM8994_MCLK1,
> +	WM8994_MCLK2,
> +	WM8994_NUM_MCLK
> +};
> +
>  enum wm8994_type {
>  	WM8994 = 0,
>  	WM8958 = 1,
> @@ -60,6 +67,8 @@ struct wm8994 {
>  	struct device *dev;
>  	struct regmap *regmap;
>  
> +	struct clk_bulk_data mclk[WM8994_NUM_MCLK];
> +
>  	bool ldo_ena_always_driven;
>  
>  	int gpio_base;
 -- 
Regards,
Sylwester
