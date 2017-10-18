From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 2/2] extcon: max88743: Add support for SmartDock
 accessory
Date: Wed, 18 Oct 2017 18:45:04 +0900
Message-ID: <59E722A0.6050801@samsung.com>
References: <20171018092802.25390-1-m.szyprowski@samsung.com>
        <CGME20171018092808eucas1p1752a01e42342115ff15ce76cf3a8ec1d@eucas1p1.samsung.com>
        <20171018092802.25390-3-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20171018092802.25390-3-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Lee Jones <lee.jones@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Marek,

Also, this patch need to fix the patch subject as following:
- max88743 -> max77843

If you fix the subject, feel free to add my acked-tag.
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

After finishing the review from MFD maintainer, I'll merge them.

Regards,
Chanwoo Choi

On 2017년 10월 18일 18:28, Marek Szyprowski wrote:
> SmartDock uses ADC_RESERVED_ACC_3 (0x10) ADC ID type and provides following
> features:
> 1. USB host with embedded USB hub (2-4 ports) for mice, keyboard, etc,
> 2. MHL for video output,
> 3. charging.
> 
> Tested with Unitek Y-2165 MHL+OTG Hub Smart Phone Dock.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/extcon/extcon-max77843.c     | 77 +++++++++++++++++++++++++++++-------
>  include/linux/mfd/max77843-private.h |  2 +
>  2 files changed, 65 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-max77843.c b/drivers/extcon/extcon-max77843.c
> index 217c743405f8..cc28d2622ae7 100644
> --- a/drivers/extcon/extcon-max77843.c
> +++ b/drivers/extcon/extcon-max77843.c
> @@ -80,7 +80,7 @@ enum max77843_muic_accessory_type {
>  	MAX77843_MUIC_ADC_REMOTE_S12_BUTTON,
>  	MAX77843_MUIC_ADC_RESERVED_ACC_1,
>  	MAX77843_MUIC_ADC_RESERVED_ACC_2,
> -	MAX77843_MUIC_ADC_RESERVED_ACC_3,
> +	MAX77843_MUIC_ADC_RESERVED_ACC_3, /* SmartDock */
>  	MAX77843_MUIC_ADC_RESERVED_ACC_4,
>  	MAX77843_MUIC_ADC_RESERVED_ACC_5,
>  	MAX77843_MUIC_ADC_AUDIO_DEVICE_TYPE2,
> @@ -119,6 +119,7 @@ enum max77843_muic_charger_type {
>  	MAX77843_MUIC_CHG_SPECIAL_BIAS,
>  	MAX77843_MUIC_CHG_RESERVED,
>  	MAX77843_MUIC_CHG_GND,
> +	MAX77843_MUIC_CHG_DOCK,
>  };
>  
>  static const unsigned int max77843_extcon_cable[] = {
> @@ -130,6 +131,7 @@ static const unsigned int max77843_extcon_cable[] = {
>  	EXTCON_CHG_USB_FAST,
>  	EXTCON_CHG_USB_SLOW,
>  	EXTCON_DISP_MHL,
> +	EXTCON_DOCK,
>  	EXTCON_JIG,
>  	EXTCON_NONE,
>  };
> @@ -200,7 +202,7 @@ static const struct regmap_irq_chip max77843_muic_irq_chip = {
>  };
>  
>  static int max77843_muic_set_path(struct max77843_muic_info *info,
> -		u8 val, bool attached)
> +		u8 val, bool attached, bool nobccomp)
>  {
>  	struct max77693_dev *max77843 = info->max77843;
>  	int ret = 0;
> @@ -210,10 +212,16 @@ static int max77843_muic_set_path(struct max77843_muic_info *info,
>  		ctrl1 = val;
>  	else
>  		ctrl1 = MAX77843_MUIC_CONTROL1_SW_OPEN;
> +	if (nobccomp) {
> +		/* Disable BC1.2 protocol and force manual switch control */
> +		ctrl1 |= MAX77843_MUIC_CONTROL1_NOBCCOMP_MASK;
> +	}
>  
>  	ret = regmap_update_bits(max77843->regmap_muic,
>  			MAX77843_MUIC_REG_CONTROL1,
> -			MAX77843_MUIC_CONTROL1_COM_SW, ctrl1);
> +			MAX77843_MUIC_CONTROL1_COM_SW |
> +				MAX77843_MUIC_CONTROL1_NOBCCOMP_MASK,
> +			ctrl1);
>  	if (ret < 0) {
>  		dev_err(info->dev, "Cannot switch MUIC port\n");
>  		return ret;
> @@ -303,6 +311,19 @@ static int max77843_muic_get_cable_type(struct max77843_muic_info *info,
>  			break;
>  		}
>  
> +		if (adc == MAX77843_MUIC_ADC_RESERVED_ACC_3) { /* SmartDock */
> +			if (chg_type == MAX77843_MUIC_CHG_NONE) {
> +				*attached = false;
> +				cable_type = info->prev_chg_type;
> +				info->prev_chg_type = MAX77843_MUIC_CHG_NONE;
> +			} else {
> +				*attached = true;
> +				cable_type = MAX77843_MUIC_CHG_DOCK;
> +				info->prev_chg_type = MAX77843_MUIC_CHG_DOCK;
> +			}
> +			break;
> +		}
> +
>  		if (chg_type == MAX77843_MUIC_CHG_NONE) {
>  			*attached = false;
>  			cable_type = info->prev_chg_type;
> @@ -365,7 +386,7 @@ static int max77843_muic_adc_gnd_handler(struct max77843_muic_info *info)
>  	case MAX77843_MUIC_GND_USB_HOST_VB:
>  		ret = max77843_muic_set_path(info,
>  					     MAX77843_MUIC_CONTROL1_SW_USB,
> -					     attached);
> +					     attached, false);
>  		if (ret < 0)
>  			return ret;
>  
> @@ -376,7 +397,7 @@ static int max77843_muic_adc_gnd_handler(struct max77843_muic_info *info)
>  	case MAX77843_MUIC_GND_MHL:
>  		ret = max77843_muic_set_path(info,
>  					     MAX77843_MUIC_CONTROL1_SW_OPEN,
> -					     attached);
> +					     attached, false);
>  		if (ret < 0)
>  			return ret;
>  
> @@ -412,7 +433,7 @@ static int max77843_muic_jig_handler(struct max77843_muic_info *info,
>  		return -EINVAL;
>  	}
>  
> -	ret = max77843_muic_set_path(info, path, attached);
> +	ret = max77843_muic_set_path(info, path, attached, false);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -421,6 +442,26 @@ static int max77843_muic_jig_handler(struct max77843_muic_info *info,
>  	return 0;
>  }
>  
> +static int max77843_muic_dock_handler(struct max77843_muic_info *info,
> +		bool attached)
> +{
> +	int ret;
> +
> +	dev_dbg(info->dev, "external connector is %s (adc: 0x10)\n",
> +			attached ? "attached" : "detached");
> +
> +	ret = max77843_muic_set_path(info, MAX77843_MUIC_CONTROL1_SW_USB,
> +				     attached, attached);
> +	if (ret < 0)
> +		return ret;
> +
> +	extcon_set_state_sync(info->edev, EXTCON_DISP_MHL, attached);
> +	extcon_set_state_sync(info->edev, EXTCON_USB_HOST, attached);
> +	extcon_set_state_sync(info->edev, EXTCON_DOCK, attached);
> +
> +	return 0;
> +}
> +
>  static int max77843_muic_adc_handler(struct max77843_muic_info *info)
>  {
>  	int ret, cable_type;
> @@ -435,6 +476,11 @@ static int max77843_muic_adc_handler(struct max77843_muic_info *info)
>  		info->prev_cable_type);
>  
>  	switch (cable_type) {
> +	case MAX77843_MUIC_ADC_RESERVED_ACC_3: /* SmartDock */
> +		ret = max77843_muic_dock_handler(info, attached);
> +		if (ret < 0)
> +			return ret;
> +		break;
>  	case MAX77843_MUIC_ADC_GROUND:
>  		ret = max77843_muic_adc_gnd_handler(info);
>  		if (ret < 0)
> @@ -462,7 +508,6 @@ static int max77843_muic_adc_handler(struct max77843_muic_info *info)
>  	case MAX77843_MUIC_ADC_REMOTE_S12_BUTTON:
>  	case MAX77843_MUIC_ADC_RESERVED_ACC_1:
>  	case MAX77843_MUIC_ADC_RESERVED_ACC_2:
> -	case MAX77843_MUIC_ADC_RESERVED_ACC_3:
>  	case MAX77843_MUIC_ADC_RESERVED_ACC_4:
>  	case MAX77843_MUIC_ADC_RESERVED_ACC_5:
>  	case MAX77843_MUIC_ADC_AUDIO_DEVICE_TYPE2:
> @@ -506,7 +551,7 @@ static int max77843_muic_chg_handler(struct max77843_muic_info *info)
>  	case MAX77843_MUIC_CHG_USB:
>  		ret = max77843_muic_set_path(info,
>  					     MAX77843_MUIC_CONTROL1_SW_USB,
> -					     attached);
> +					     attached, false);
>  		if (ret < 0)
>  			return ret;
>  
> @@ -517,7 +562,7 @@ static int max77843_muic_chg_handler(struct max77843_muic_info *info)
>  	case MAX77843_MUIC_CHG_DOWNSTREAM:
>  		ret = max77843_muic_set_path(info,
>  					     MAX77843_MUIC_CONTROL1_SW_OPEN,
> -					     attached);
> +					     attached, false);
>  		if (ret < 0)
>  			return ret;
>  
> @@ -527,7 +572,7 @@ static int max77843_muic_chg_handler(struct max77843_muic_info *info)
>  	case MAX77843_MUIC_CHG_DEDICATED:
>  		ret = max77843_muic_set_path(info,
>  					     MAX77843_MUIC_CONTROL1_SW_OPEN,
> -					     attached);
> +					     attached, false);
>  		if (ret < 0)
>  			return ret;
>  
> @@ -537,7 +582,7 @@ static int max77843_muic_chg_handler(struct max77843_muic_info *info)
>  	case MAX77843_MUIC_CHG_SPECIAL_500MA:
>  		ret = max77843_muic_set_path(info,
>  					     MAX77843_MUIC_CONTROL1_SW_OPEN,
> -					     attached);
> +					     attached, false);
>  		if (ret < 0)
>  			return ret;
>  
> @@ -547,7 +592,7 @@ static int max77843_muic_chg_handler(struct max77843_muic_info *info)
>  	case MAX77843_MUIC_CHG_SPECIAL_1A:
>  		ret = max77843_muic_set_path(info,
>  					     MAX77843_MUIC_CONTROL1_SW_OPEN,
> -					     attached);
> +					     attached, false);
>  		if (ret < 0)
>  			return ret;
>  
> @@ -566,6 +611,9 @@ static int max77843_muic_chg_handler(struct max77843_muic_info *info)
>  			extcon_set_state_sync(info->edev, EXTCON_CHG_USB_DCP,
>  						false);
>  		break;
> +	case MAX77843_MUIC_CHG_DOCK:
> +		extcon_set_state_sync(info->edev, EXTCON_CHG_USB_DCP, attached);
> +		break;
>  	case MAX77843_MUIC_CHG_NONE:
>  		break;
>  	default:
> @@ -574,7 +622,7 @@ static int max77843_muic_chg_handler(struct max77843_muic_info *info)
>  			attached ? "attached" : "detached", chg_type);
>  
>  		max77843_muic_set_path(info, MAX77843_MUIC_CONTROL1_SW_OPEN,
> -				       attached);
> +				       attached, false);
>  		return -EINVAL;
>  	}
>  
> @@ -814,7 +862,8 @@ static int max77843_muic_probe(struct platform_device *pdev)
>  	max77843_muic_set_debounce_time(info, MAX77843_DEBOUNCE_TIME_25MS);
>  
>  	/* Set initial path for UART */
> -	max77843_muic_set_path(info, MAX77843_MUIC_CONTROL1_SW_UART, true);
> +	max77843_muic_set_path(info, MAX77843_MUIC_CONTROL1_SW_UART, true,
> +			       false);
>  
>  	/* Check revision number of MUIC device */
>  	ret = regmap_read(max77843->regmap_muic, MAX77843_MUIC_REG_ID, &id);
> diff --git a/include/linux/mfd/max77843-private.h b/include/linux/mfd/max77843-private.h
> index 0223cd5941c8..b8908bf8d315 100644
> --- a/include/linux/mfd/max77843-private.h
> +++ b/include/linux/mfd/max77843-private.h
> @@ -350,6 +350,7 @@ enum max77843_irq_muic {
>  /* MAX77843 CONTROL register */
>  #define MAX77843_MUIC_CONTROL1_COMP1SW_SHIFT	0
>  #define MAX77843_MUIC_CONTROL1_COMP2SW_SHIFT	3
> +#define MAX77843_MUIC_CONTROL1_NOBCCOMP_SHIFT	6
>  #define MAX77843_MUIC_CONTROL1_IDBEN_SHIFT	7
>  #define MAX77843_MUIC_CONTROL2_LOWPWR_SHIFT	0
>  #define MAX77843_MUIC_CONTROL2_ADCEN_SHIFT	1
> @@ -366,6 +367,7 @@ enum max77843_irq_muic {
>  #define MAX77843_MUIC_CONTROL1_COMP1SW_MASK	(0x7 << MAX77843_MUIC_CONTROL1_COMP1SW_SHIFT)
>  #define MAX77843_MUIC_CONTROL1_COMP2SW_MASK	(0x7 << MAX77843_MUIC_CONTROL1_COMP2SW_SHIFT)
>  #define MAX77843_MUIC_CONTROL1_IDBEN_MASK	BIT(MAX77843_MUIC_CONTROL1_IDBEN_SHIFT)
> +#define MAX77843_MUIC_CONTROL1_NOBCCOMP_MASK	BIT(MAX77843_MUIC_CONTROL1_NOBCCOMP_SHIFT)
>  #define MAX77843_MUIC_CONTROL2_LOWPWR_MASK	BIT(MAX77843_MUIC_CONTROL2_LOWPWR_SHIFT)
>  #define MAX77843_MUIC_CONTROL2_ADCEN_MASK	BIT(MAX77843_MUIC_CONTROL2_ADCEN_SHIFT)
>  #define MAX77843_MUIC_CONTROL2_CPEN_MASK	BIT(MAX77843_MUIC_CONTROL2_CPEN_SHIFT)
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
