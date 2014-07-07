From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v7 23/24] rtc: Add driver for Maxim 77802 PMIC
 Real-Time-Clock
Date: Mon, 07 Jul 2014 08:06:50 +0200
Message-ID: <1404713210.4367.0.camel@AMDC1943>
References: <1404505467-26526-1-git-send-email-javier.martinez@collabora.co.uk>
 <1404505467-26526-24-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:24680 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750859AbaGGGGz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Jul 2014 02:06:55 -0400
In-reply-to: <1404505467-26526-24-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Tushar Behera <trblinux@gmail.com>, Andreas Farber <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On pi=C4=85, 2014-07-04 at 22:24 +0200, Javier Martinez Canillas wrote:
> The MAX7802 PMIC has a Real-Time-Clock (RTC) with two alarms.
> This patch adds support for the RTC and is based on a driver
> added by Simon Glass to the Chrome OS kernel 3.8 tree.
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> ---
>=20
> Changes since v6:
>  - Remove unused code for SMPL and WTSR. Suggested by Krzysztof Kozlo=
wski.
>  - Don't spam the kernel log with unimportant info and just print for=
 debug.
>    Suggested by Krzysztof Kozlowski.
>  - Use ARRAY_SIZE() instead of constant value. Suggested by Krzysztof=
 Kozlowski.
>  - Remove duplicated register setup. Suggested by Krzysztof Kozlowski=
=2E
>  - Don't free/unregister managed allocated resources.
>    Suggested by Krzysztof Kozlowski.
> ---
>  drivers/rtc/Kconfig        |  10 +
>  drivers/rtc/Makefile       |   1 +
>  drivers/rtc/rtc-max77802.c | 508 +++++++++++++++++++++++++++++++++++=
++++++++++
>  3 files changed, 519 insertions(+)
>  create mode 100644 drivers/rtc/rtc-max77802.c


Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof


>=20
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index a672dd1..243ac72 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -288,6 +288,16 @@ config RTC_DRV_MAX77686
>  	  This driver can also be built as a module. If so, the module
>  	  will be called rtc-max77686.
> =20
> +config RTC_DRV_MAX77802
> +	tristate "Maxim 77802 RTC"
> +	depends on MFD_MAX77686
> +	help
> +	  If you say yes here you will get support for the
> +	  RTC of Maxim MAX77802 PMIC.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called rtc-max77802.
> +
>  config RTC_DRV_RS5C372
>  	tristate "Ricoh R2025S/D, RS5C372A/B, RV5C386, RV5C387A"
>  	help
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 70347d0..247de78 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -81,6 +81,7 @@ obj-$(CONFIG_RTC_DRV_MAX8998)	+=3D rtc-max8998.o
>  obj-$(CONFIG_RTC_DRV_MAX8997)	+=3D rtc-max8997.o
>  obj-$(CONFIG_RTC_DRV_MAX6902)	+=3D rtc-max6902.o
>  obj-$(CONFIG_RTC_DRV_MAX77686)	+=3D rtc-max77686.o
> +obj-$(CONFIG_RTC_DRV_MAX77802)  +=3D rtc-max77802.o
>  obj-$(CONFIG_RTC_DRV_MC13XXX)	+=3D rtc-mc13xxx.o
>  obj-$(CONFIG_RTC_DRV_MCP795)	+=3D rtc-mcp795.o
>  obj-$(CONFIG_RTC_DRV_MSM6242)	+=3D rtc-msm6242.o
> diff --git a/drivers/rtc/rtc-max77802.c b/drivers/rtc/rtc-max77802.c
> new file mode 100644
> index 0000000..f8898ff
> --- /dev/null
> +++ b/drivers/rtc/rtc-max77802.c
> @@ -0,0 +1,508 @@
> +/*
> + * RTC driver for Maxim MAX77802
> + *
> + * Copyright (C) 2013 Google, Inc
> + *
> + * Copyright (C) 2012 Samsung Electronics Co.Ltd
> + *
> + *  based on rtc-max8997.c
> + *
> + *  This program is free software; you can redistribute  it and/or m=
odify it
> + *  under  the terms of  the GNU General  Public License as publishe=
d by the
> + *  Free Software Foundation;  either version 2 of the  License, or =
(at your
> + *  option) any later version.
> + *
> + */
> +
> +#include <linux/slab.h>
> +#include <linux/rtc.h>
> +#include <linux/delay.h>
> +#include <linux/mutex.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/mfd/max77686-private.h>
> +#include <linux/irqdomain.h>
> +#include <linux/regmap.h>
> +
> +/* RTC Control Register */
> +#define BCD_EN_SHIFT			0
> +#define BCD_EN_MASK			(1 << BCD_EN_SHIFT)
> +#define MODEL24_SHIFT			1
> +#define MODEL24_MASK			(1 << MODEL24_SHIFT)
> +/* RTC Update Register1 */
> +#define RTC_UDR_SHIFT			0
> +#define RTC_UDR_MASK			(1 << RTC_UDR_SHIFT)
> +#define RTC_RBUDR_SHIFT			4
> +#define RTC_RBUDR_MASK			(1 << RTC_RBUDR_SHIFT)
> +/* RTC Hour register */
> +#define HOUR_PM_SHIFT			6
> +#define HOUR_PM_MASK			(1 << HOUR_PM_SHIFT)
> +/* RTC Alarm Enable */
> +#define ALARM_ENABLE_SHIFT		7
> +#define ALARM_ENABLE_MASK		(1 << ALARM_ENABLE_SHIFT)
> +
> +/* For the RTCAE1 register, we write this value to enable the alarm =
*/
> +#define ALARM_ENABLE_VALUE		0x77
> +
> +#define MAX77802_RTC_UPDATE_DELAY_US	200
> +
> +enum {
> +	RTC_SEC =3D 0,
> +	RTC_MIN,
> +	RTC_HOUR,
> +	RTC_WEEKDAY,
> +	RTC_MONTH,
> +	RTC_YEAR,
> +	RTC_DATE,
> +	RTC_NR_TIME
> +};
> +
> +struct max77802_rtc_info {
> +	struct device		*dev;
> +	struct max77686_dev	*max77802;
> +	struct i2c_client	*rtc;
> +	struct rtc_device	*rtc_dev;
> +	struct mutex		lock;
> +
> +	struct regmap		*regmap;
> +
> +	int virq;
> +	int rtc_24hr_mode;
> +};
> +
> +enum MAX77802_RTC_OP {
> +	MAX77802_RTC_WRITE,
> +	MAX77802_RTC_READ,
> +};
> +
> +static inline int max77802_rtc_calculate_wday(u8 shifted)
> +{
> +	int counter =3D -1;
> +
> +	while (shifted) {
> +		shifted >>=3D 1;
> +		counter++;
> +	}
> +
> +	return counter;
> +}
> +
> +static void max77802_rtc_data_to_tm(u8 *data, struct rtc_time *tm,
> +				   int rtc_24hr_mode)
> +{
> +	tm->tm_sec =3D data[RTC_SEC] & 0xff;
> +	tm->tm_min =3D data[RTC_MIN] & 0xff;
> +	if (rtc_24hr_mode)
> +		tm->tm_hour =3D data[RTC_HOUR] & 0x1f;
> +	else {
> +		tm->tm_hour =3D data[RTC_HOUR] & 0x0f;
> +		if (data[RTC_HOUR] & HOUR_PM_MASK)
> +			tm->tm_hour +=3D 12;
> +	}
> +
> +	tm->tm_wday =3D max77802_rtc_calculate_wday(data[RTC_WEEKDAY] & 0xf=
f);
> +	tm->tm_mday =3D data[RTC_DATE] & 0x1f;
> +	tm->tm_mon =3D (data[RTC_MONTH] & 0x0f) - 1;
> +
> +	tm->tm_year =3D data[RTC_YEAR] & 0xff;
> +	tm->tm_yday =3D 0;
> +	tm->tm_isdst =3D 0;
> +}
> +
> +static int max77802_rtc_tm_to_data(struct rtc_time *tm, u8 *data)
> +{
> +	data[RTC_SEC] =3D tm->tm_sec;
> +	data[RTC_MIN] =3D tm->tm_min;
> +	data[RTC_HOUR] =3D tm->tm_hour;
> +	data[RTC_WEEKDAY] =3D 1 << tm->tm_wday;
> +	data[RTC_DATE] =3D tm->tm_mday;
> +	data[RTC_MONTH] =3D tm->tm_mon + 1;
> +	data[RTC_YEAR] =3D tm->tm_year;
> +
> +	return 0;
> +}
> +
> +static int max77802_rtc_update(struct max77802_rtc_info *info,
> +	enum MAX77802_RTC_OP op)
> +{
> +	int ret;
> +	unsigned int data;
> +
> +	if (op =3D=3D MAX77802_RTC_WRITE)
> +		data =3D 1 << RTC_UDR_SHIFT;
> +	else
> +		data =3D 1 << RTC_RBUDR_SHIFT;
> +
> +	ret =3D regmap_update_bits(info->max77802->regmap,
> +				 MAX77802_RTC_UPDATE0, data, data);
> +	if (ret < 0)
> +		dev_err(info->dev, "%s: fail to write update reg(ret=3D%d, data=3D=
0x%x)\n",
> +				__func__, ret, data);
> +	else {
> +		/* Minimum delay required before RTC update. */
> +		usleep_range(MAX77802_RTC_UPDATE_DELAY_US,
> +			     MAX77802_RTC_UPDATE_DELAY_US * 2);
> +	}
> +
> +	return ret;
> +}
> +
> +static int max77802_rtc_read_time(struct device *dev, struct rtc_tim=
e *tm)
> +{
> +	struct max77802_rtc_info *info =3D dev_get_drvdata(dev);
> +	u8 data[RTC_NR_TIME];
> +	int ret;
> +
> +	mutex_lock(&info->lock);
> +
> +	ret =3D max77802_rtc_update(info, MAX77802_RTC_READ);
> +	if (ret < 0)
> +		goto out;
> +
> +	ret =3D regmap_bulk_read(info->max77802->regmap,
> +				MAX77802_RTC_SEC, data, RTC_NR_TIME);
> +	if (ret < 0) {
> +		dev_err(info->dev, "%s: fail to read time reg(%d)\n", __func__,
> +			ret);
> +		goto out;
> +	}
> +
> +	max77802_rtc_data_to_tm(data, tm, info->rtc_24hr_mode);
> +
> +	ret =3D rtc_valid_tm(tm);
> +
> +out:
> +	mutex_unlock(&info->lock);
> +	return ret;
> +}
> +
> +static int max77802_rtc_set_time(struct device *dev, struct rtc_time=
 *tm)
> +{
> +	struct max77802_rtc_info *info =3D dev_get_drvdata(dev);
> +	u8 data[RTC_NR_TIME];
> +	int ret;
> +
> +	ret =3D max77802_rtc_tm_to_data(tm, data);
> +	if (ret < 0)
> +		return ret;
> +
> +	mutex_lock(&info->lock);
> +
> +	ret =3D regmap_bulk_write(info->max77802->regmap,
> +				 MAX77802_RTC_SEC, data, RTC_NR_TIME);
> +	if (ret < 0) {
> +		dev_err(info->dev, "%s: fail to write time reg(%d)\n", __func__,
> +			ret);
> +		goto out;
> +	}
> +
> +	ret =3D max77802_rtc_update(info, MAX77802_RTC_WRITE);
> +
> +out:
> +	mutex_unlock(&info->lock);
> +	return ret;
> +}
> +
> +static int max77802_rtc_read_alarm(struct device *dev, struct rtc_wk=
alrm *alrm)
> +{
> +	struct max77802_rtc_info *info =3D dev_get_drvdata(dev);
> +	u8 data[RTC_NR_TIME];
> +	unsigned int val;
> +	int ret;
> +
> +	mutex_lock(&info->lock);
> +
> +	ret =3D max77802_rtc_update(info, MAX77802_RTC_READ);
> +	if (ret < 0)
> +		goto out;
> +
> +	ret =3D regmap_bulk_read(info->max77802->regmap,
> +				 MAX77802_ALARM1_SEC, data, RTC_NR_TIME);
> +	if (ret < 0) {
> +		dev_err(info->dev, "%s:%d fail to read alarm reg(%d)\n",
> +				__func__, __LINE__, ret);
> +		goto out;
> +	}
> +
> +	max77802_rtc_data_to_tm(data, &alrm->time, info->rtc_24hr_mode);
> +
> +	alrm->enabled =3D 0;
> +	ret =3D regmap_read(info->max77802->regmap,
> +			  MAX77802_RTC_AE1, &val);
> +	if (ret < 0) {
> +		dev_err(info->dev, "%s:%d fail to read alarm enable(%d)\n",
> +			__func__, __LINE__, ret);
> +		goto out;
> +	}
> +	if (val)
> +		alrm->enabled =3D 1;
> +
> +	alrm->pending =3D 0;
> +	ret =3D regmap_read(info->max77802->regmap, MAX77802_REG_STATUS2, &=
val);
> +	if (ret < 0) {
> +		dev_err(info->dev, "%s:%d fail to read status2 reg(%d)\n",
> +				__func__, __LINE__, ret);
> +		goto out;
> +	}
> +
> +	if (val & (1 << 2)) /* RTCA1 */
> +		alrm->pending =3D 1;
> +
> +out:
> +	mutex_unlock(&info->lock);
> +	return 0;
> +}
> +
> +static int max77802_rtc_stop_alarm(struct max77802_rtc_info *info)
> +{
> +	int ret;
> +
> +	if (!mutex_is_locked(&info->lock))
> +		dev_warn(info->dev, "%s: should have mutex locked\n", __func__);
> +
> +	ret =3D max77802_rtc_update(info, MAX77802_RTC_READ);
> +	if (ret < 0)
> +		goto out;
> +
> +	ret =3D regmap_write(info->max77802->regmap,
> +			   MAX77802_RTC_AE1, 0);
> +	if (ret < 0) {
> +		dev_err(info->dev, "%s: fail to write alarm reg(%d)\n",
> +			__func__, ret);
> +		goto out;
> +	}
> +
> +	ret =3D max77802_rtc_update(info, MAX77802_RTC_WRITE);
> +out:
> +	return ret;
> +}
> +
> +static int max77802_rtc_start_alarm(struct max77802_rtc_info *info)
> +{
> +	int ret;
> +
> +	if (!mutex_is_locked(&info->lock))
> +		dev_warn(info->dev, "%s: should have mutex locked\n",
> +			 __func__);
> +
> +	ret =3D max77802_rtc_update(info, MAX77802_RTC_READ);
> +	if (ret < 0)
> +		goto out;
> +
> +	ret =3D regmap_write(info->max77802->regmap,
> +				   MAX77802_RTC_AE1,
> +				   ALARM_ENABLE_VALUE);
> +
> +	if (ret < 0) {
> +		dev_err(info->dev, "%s: fail to read alarm reg(%d)\n",
> +				__func__, ret);
> +		goto out;
> +	}
> +
> +	ret =3D max77802_rtc_update(info, MAX77802_RTC_WRITE);
> +out:
> +	return ret;
> +}
> +
> +static int max77802_rtc_set_alarm(struct device *dev, struct rtc_wka=
lrm *alrm)
> +{
> +	struct max77802_rtc_info *info =3D dev_get_drvdata(dev);
> +	u8 data[RTC_NR_TIME];
> +	int ret;
> +
> +	ret =3D max77802_rtc_tm_to_data(&alrm->time, data);
> +	if (ret < 0)
> +		return ret;
> +
> +	mutex_lock(&info->lock);
> +
> +	ret =3D max77802_rtc_stop_alarm(info);
> +	if (ret < 0)
> +		goto out;
> +
> +	ret =3D regmap_bulk_write(info->max77802->regmap,
> +				 MAX77802_ALARM1_SEC, data, RTC_NR_TIME);
> +
> +	if (ret < 0) {
> +		dev_err(info->dev, "%s: fail to write alarm reg(%d)\n",
> +				__func__, ret);
> +		goto out;
> +	}
> +
> +	ret =3D max77802_rtc_update(info, MAX77802_RTC_WRITE);
> +	if (ret < 0)
> +		goto out;
> +
> +	if (alrm->enabled)
> +		ret =3D max77802_rtc_start_alarm(info);
> +out:
> +	mutex_unlock(&info->lock);
> +	return ret;
> +}
> +
> +static int max77802_rtc_alarm_irq_enable(struct device *dev,
> +					 unsigned int enabled)
> +{
> +	struct max77802_rtc_info *info =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	mutex_lock(&info->lock);
> +	if (enabled)
> +		ret =3D max77802_rtc_start_alarm(info);
> +	else
> +		ret =3D max77802_rtc_stop_alarm(info);
> +	mutex_unlock(&info->lock);
> +
> +	return ret;
> +}
> +
> +static irqreturn_t max77802_rtc_alarm_irq(int irq, void *data)
> +{
> +	struct max77802_rtc_info *info =3D data;
> +
> +	dev_dbg(info->dev, "%s:irq(%d)\n", __func__, irq);
> +
> +	rtc_update_irq(info->rtc_dev, 1, RTC_IRQF | RTC_AF);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static const struct rtc_class_ops max77802_rtc_ops =3D {
> +	.read_time =3D max77802_rtc_read_time,
> +	.set_time =3D max77802_rtc_set_time,
> +	.read_alarm =3D max77802_rtc_read_alarm,
> +	.set_alarm =3D max77802_rtc_set_alarm,
> +	.alarm_irq_enable =3D max77802_rtc_alarm_irq_enable,
> +};
> +
> +static int max77802_rtc_init_reg(struct max77802_rtc_info *info)
> +{
> +	u8 data[2];
> +	int ret;
> +
> +	max77802_rtc_update(info, MAX77802_RTC_READ);
> +
> +	/* Set RTC control register : Binary mode, 24hour mdoe */
> +	data[0] =3D (1 << BCD_EN_SHIFT) | (1 << MODEL24_SHIFT);
> +	data[1] =3D (0 << BCD_EN_SHIFT) | (1 << MODEL24_SHIFT);
> +
> +	info->rtc_24hr_mode =3D 1;
> +
> +	ret =3D regmap_bulk_write(info->max77802->regmap,
> +				MAX77802_RTC_CONTROLM, data, ARRAY_SIZE(data));
> +	if (ret < 0) {
> +		dev_err(info->dev, "%s: fail to write controlm reg(%d)\n",
> +				__func__, ret);
> +		return ret;
> +	}
> +
> +	ret =3D max77802_rtc_update(info, MAX77802_RTC_WRITE);
> +	return ret;
> +}
> +
> +static int max77802_rtc_probe(struct platform_device *pdev)
> +{
> +	struct max77686_dev *max77802 =3D dev_get_drvdata(pdev->dev.parent)=
;
> +	struct max77802_rtc_info *info;
> +	int ret;
> +
> +	dev_dbg(&pdev->dev, "%s\n", __func__);
> +
> +	info =3D devm_kzalloc(&pdev->dev, sizeof(struct max77802_rtc_info),
> +			    GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	mutex_init(&info->lock);
> +	info->dev =3D &pdev->dev;
> +	info->max77802 =3D max77802;
> +	info->rtc =3D max77802->i2c;
> +
> +	platform_set_drvdata(pdev, info);
> +
> +	ret =3D max77802_rtc_init_reg(info);
> +
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Failed to initialize RTC reg:%d\n", ret);
> +		return ret;
> +	}
> +
> +	device_init_wakeup(&pdev->dev, 1);
> +
> +	info->rtc_dev =3D devm_rtc_device_register(&pdev->dev, "max77802-rt=
c",
> +						 &max77802_rtc_ops, THIS_MODULE);
> +
> +	if (IS_ERR(info->rtc_dev)) {
> +		ret =3D PTR_ERR(info->rtc_dev);
> +		dev_err(&pdev->dev, "Failed to register RTC device: %d\n", ret);
> +		if (ret =3D=3D 0)
> +			ret =3D -EINVAL;
> +		return ret;
> +	}
> +	info->virq =3D regmap_irq_get_virq(max77802->rtc_irq_data,
> +					 MAX77686_RTCIRQ_RTCA1);
> +
> +	if (info->virq <=3D 0) {
> +		dev_err(&pdev->dev, "Failed to get virtual IRQ %d\n",
> +			MAX77686_RTCIRQ_RTCA1);
> +		ret =3D -EINVAL;
> +		return ret;
> +	}
> +
> +	ret =3D devm_request_threaded_irq(&pdev->dev, info->virq, NULL,
> +					max77802_rtc_alarm_irq, 0, "rtc-alarm1",
> +					info);
> +	if (ret < 0)
> +		dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
> +			info->virq, ret);
> +
> +	return ret;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int max77802_rtc_suspend(struct device *dev)
> +{
> +	if (device_may_wakeup(dev)) {
> +		struct max77802_rtc_info *info =3D dev_get_drvdata(dev);
> +
> +		return enable_irq_wake(info->virq);
> +	}
> +
> +	return 0;
> +}
> +
> +static int max77802_rtc_resume(struct device *dev)
> +{
> +	if (device_may_wakeup(dev)) {
> +		struct max77802_rtc_info *info =3D dev_get_drvdata(dev);
> +
> +		return disable_irq_wake(info->virq);
> +	}
> +
> +	return 0;
> +}
> +#endif
> +
> +static SIMPLE_DEV_PM_OPS(max77802_rtc_pm_ops,
> +			 max77802_rtc_suspend, max77802_rtc_resume);
> +
> +static const struct platform_device_id rtc_id[] =3D {
> +	{ "max77802-rtc", 0 },
> +	{},
> +};
> +
> +static struct platform_driver max77802_rtc_driver =3D {
> +	.driver		=3D {
> +		.name	=3D "max77802-rtc",
> +		.owner	=3D THIS_MODULE,
> +		.pm	=3D &max77802_rtc_pm_ops,
> +	},
> +	.probe		=3D max77802_rtc_probe,
> +	.id_table	=3D rtc_id,
> +};
> +
> +module_platform_driver(max77802_rtc_driver);
> +
> +MODULE_DESCRIPTION("Maxim MAX77802 RTC driver");
> +MODULE_AUTHOR("Simon Glass <sjg@chromium.org>");
> +MODULE_LICENSE("GPL");
