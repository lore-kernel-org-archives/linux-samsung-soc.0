From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 03/14] mfd/rtc: sec/s5m: Rename SEC* symbols to S5M
Date: Thu, 13 Feb 2014 10:11:13 +0000
Message-ID: <20140213101113.GE32508@lee--X1>
References: <1392282847-25444-1-git-send-email-k.kozlowski@samsung.com>
 <1392282847-25444-4-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f178.google.com ([74.125.82.178]:48533 "EHLO
	mail-we0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752989AbaBMKLU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Feb 2014 05:11:20 -0500
Received: by mail-we0-f178.google.com with SMTP id q59so7068753wes.23
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Feb 2014 02:11:19 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1392282847-25444-4-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com

On Thu, 13 Feb 2014, Krzysztof Kozlowski wrote:

> This patch prepares for adding support for S2MPS14 RTC device to the
> rtc-s5m driver:
> 1. Renames SEC* symbols to S5M.
> 2. Adds S5M prefix to some of defines which are different between S5M=
876X
> and S2MPS14.
>=20
> This is only a rename-like patch, new code is not added.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: rtc-linux@googlegroups.com

I Acked the MFD parts of this already.

> ---
>  drivers/mfd/sec-core.c          |    2 +-
>  drivers/rtc/rtc-s5m.c           |   64 ++++++++++++++++-------------=
----
>  include/linux/mfd/samsung/rtc.h |   76 +++++++++++++++++++----------=
----------
>  3 files changed, 71 insertions(+), 71 deletions(-)
>=20
> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> index 0efa69e123ee..8504de82b7e0 100644
> --- a/drivers/mfd/sec-core.c
> +++ b/drivers/mfd/sec-core.c
> @@ -142,7 +142,7 @@ static const struct regmap_config sec_rtc_regmap_=
config =3D {
>  	.reg_bits =3D 8,
>  	.val_bits =3D 8,
> =20
> -	.max_register =3D SEC_RTC_REG_MAX,
> +	.max_register =3D S5M_RTC_REG_MAX,
>  };
> =20
>  #ifdef CONFIG_OF
> diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
> index 476af93543f6..d26e2480f8b3 100644
> --- a/drivers/rtc/rtc-s5m.c
> +++ b/drivers/rtc/rtc-s5m.c
> @@ -30,10 +30,10 @@
> =20
>  /*
>   * Maximum number of retries for checking changes in UDR field
> - * of SEC_RTC_UDR_CON register (to limit possible endless loop).
> + * of S5M_RTC_UDR_CON register (to limit possible endless loop).
>   *
>   * After writing to RTC registers (setting time or alarm) read the U=
DR field
> - * in SEC_RTC_UDR_CON register. UDR is auto-cleared when data have
> + * in S5M_RTC_UDR_CON register. UDR is auto-cleared when data have
>   * been transferred.
>   */
>  #define UDR_READ_RETRY_CNT	5
> @@ -104,8 +104,8 @@ static inline int s5m8767_wait_for_udr_update(str=
uct s5m_rtc_info *info)
>  	unsigned int data;
> =20
>  	do {
> -		ret =3D regmap_read(info->regmap, SEC_RTC_UDR_CON, &data);
> -	} while (--retry && (data & RTC_UDR_MASK) && !ret);
> +		ret =3D regmap_read(info->regmap, S5M_RTC_UDR_CON, &data);
> +	} while (--retry && (data & S5M_RTC_UDR_MASK) && !ret);
> =20
>  	if (!retry)
>  		dev_err(info->dev, "waiting for UDR update, reached max number of =
retries\n");
> @@ -118,16 +118,16 @@ static inline int s5m8767_rtc_set_time_reg(stru=
ct s5m_rtc_info *info)
>  	int ret;
>  	unsigned int data;
> =20
> -	ret =3D regmap_read(info->regmap, SEC_RTC_UDR_CON, &data);
> +	ret =3D regmap_read(info->regmap, S5M_RTC_UDR_CON, &data);
>  	if (ret < 0) {
>  		dev_err(info->dev, "failed to read update reg(%d)\n", ret);
>  		return ret;
>  	}
> =20
> -	data |=3D RTC_TIME_EN_MASK;
> -	data |=3D RTC_UDR_MASK;
> +	data |=3D S5M_RTC_TIME_EN_MASK;
> +	data |=3D S5M_RTC_UDR_MASK;
> =20
> -	ret =3D regmap_write(info->regmap, SEC_RTC_UDR_CON, data);
> +	ret =3D regmap_write(info->regmap, S5M_RTC_UDR_CON, data);
>  	if (ret < 0) {
>  		dev_err(info->dev, "failed to write update reg(%d)\n", ret);
>  		return ret;
> @@ -143,17 +143,17 @@ static inline int s5m8767_rtc_set_alarm_reg(str=
uct s5m_rtc_info *info)
>  	int ret;
>  	unsigned int data;
> =20
> -	ret =3D regmap_read(info->regmap, SEC_RTC_UDR_CON, &data);
> +	ret =3D regmap_read(info->regmap, S5M_RTC_UDR_CON, &data);
>  	if (ret < 0) {
>  		dev_err(info->dev, "%s: fail to read update reg(%d)\n",
>  			__func__, ret);
>  		return ret;
>  	}
> =20
> -	data &=3D ~RTC_TIME_EN_MASK;
> -	data |=3D RTC_UDR_MASK;
> +	data &=3D ~S5M_RTC_TIME_EN_MASK;
> +	data |=3D S5M_RTC_UDR_MASK;
> =20
> -	ret =3D regmap_write(info->regmap, SEC_RTC_UDR_CON, data);
> +	ret =3D regmap_write(info->regmap, S5M_RTC_UDR_CON, data);
>  	if (ret < 0) {
>  		dev_err(info->dev, "%s: fail to write update reg(%d)\n",
>  			__func__, ret);
> @@ -203,7 +203,7 @@ static int s5m_rtc_read_time(struct device *dev, =
struct rtc_time *tm)
>  	u8 data[8];
>  	int ret;
> =20
> -	ret =3D regmap_bulk_read(info->regmap, SEC_RTC_SEC, data, 8);
> +	ret =3D regmap_bulk_read(info->regmap, S5M_RTC_SEC, data, 8);
>  	if (ret < 0)
>  		return ret;
> =20
> @@ -251,7 +251,7 @@ static int s5m_rtc_set_time(struct device *dev, s=
truct rtc_time *tm)
>  		1900 + tm->tm_year, 1 + tm->tm_mon, tm->tm_mday,
>  		tm->tm_hour, tm->tm_min, tm->tm_sec, tm->tm_wday);
> =20
> -	ret =3D regmap_raw_write(info->regmap, SEC_RTC_SEC, data, 8);
> +	ret =3D regmap_raw_write(info->regmap, S5M_RTC_SEC, data, 8);
>  	if (ret < 0)
>  		return ret;
> =20
> @@ -267,20 +267,20 @@ static int s5m_rtc_read_alarm(struct device *de=
v, struct rtc_wkalrm *alrm)
>  	unsigned int val;
>  	int ret, i;
> =20
> -	ret =3D regmap_bulk_read(info->regmap, SEC_ALARM0_SEC, data, 8);
> +	ret =3D regmap_bulk_read(info->regmap, S5M_ALARM0_SEC, data, 8);
>  	if (ret < 0)
>  		return ret;
> =20
>  	switch (info->device_type) {
>  	case S5M8763X:
>  		s5m8763_data_to_tm(data, &alrm->time);
> -		ret =3D regmap_read(info->regmap, SEC_ALARM0_CONF, &val);
> +		ret =3D regmap_read(info->regmap, S5M_ALARM0_CONF, &val);
>  		if (ret < 0)
>  			return ret;
> =20
>  		alrm->enabled =3D !!val;
> =20
> -		ret =3D regmap_read(info->regmap, SEC_RTC_STATUS, &val);
> +		ret =3D regmap_read(info->regmap, S5M_RTC_STATUS, &val);
>  		if (ret < 0)
>  			return ret;
> =20
> @@ -303,7 +303,7 @@ static int s5m_rtc_read_alarm(struct device *dev,=
 struct rtc_wkalrm *alrm)
>  		}
> =20
>  		alrm->pending =3D 0;
> -		ret =3D regmap_read(info->regmap, SEC_RTC_STATUS, &val);
> +		ret =3D regmap_read(info->regmap, S5M_RTC_STATUS, &val);
>  		if (ret < 0)
>  			return ret;
>  		break;
> @@ -312,7 +312,7 @@ static int s5m_rtc_read_alarm(struct device *dev,=
 struct rtc_wkalrm *alrm)
>  		return -EINVAL;
>  	}
> =20
> -	if (val & ALARM0_STATUS)
> +	if (val & S5M_ALARM0_STATUS)
>  		alrm->pending =3D 1;
>  	else
>  		alrm->pending =3D 0;
> @@ -326,7 +326,7 @@ static int s5m_rtc_stop_alarm(struct s5m_rtc_info=
 *info)
>  	int ret, i;
>  	struct rtc_time tm;
> =20
> -	ret =3D regmap_bulk_read(info->regmap, SEC_ALARM0_SEC, data, 8);
> +	ret =3D regmap_bulk_read(info->regmap, S5M_ALARM0_SEC, data, 8);
>  	if (ret < 0)
>  		return ret;
> =20
> @@ -337,14 +337,14 @@ static int s5m_rtc_stop_alarm(struct s5m_rtc_in=
fo *info)
> =20
>  	switch (info->device_type) {
>  	case S5M8763X:
> -		ret =3D regmap_write(info->regmap, SEC_ALARM0_CONF, 0);
> +		ret =3D regmap_write(info->regmap, S5M_ALARM0_CONF, 0);
>  		break;
> =20
>  	case S5M8767X:
>  		for (i =3D 0; i < 7; i++)
>  			data[i] &=3D ~ALARM_ENABLE_MASK;
> =20
> -		ret =3D regmap_raw_write(info->regmap, SEC_ALARM0_SEC, data, 8);
> +		ret =3D regmap_raw_write(info->regmap, S5M_ALARM0_SEC, data, 8);
>  		if (ret < 0)
>  			return ret;
> =20
> @@ -366,7 +366,7 @@ static int s5m_rtc_start_alarm(struct s5m_rtc_inf=
o *info)
>  	u8 alarm0_conf;
>  	struct rtc_time tm;
> =20
> -	ret =3D regmap_bulk_read(info->regmap, SEC_ALARM0_SEC, data, 8);
> +	ret =3D regmap_bulk_read(info->regmap, S5M_ALARM0_SEC, data, 8);
>  	if (ret < 0)
>  		return ret;
> =20
> @@ -378,7 +378,7 @@ static int s5m_rtc_start_alarm(struct s5m_rtc_inf=
o *info)
>  	switch (info->device_type) {
>  	case S5M8763X:
>  		alarm0_conf =3D 0x77;
> -		ret =3D regmap_write(info->regmap, SEC_ALARM0_CONF, alarm0_conf);
> +		ret =3D regmap_write(info->regmap, S5M_ALARM0_CONF, alarm0_conf);
>  		break;
> =20
>  	case S5M8767X:
> @@ -393,7 +393,7 @@ static int s5m_rtc_start_alarm(struct s5m_rtc_inf=
o *info)
>  		if (data[RTC_YEAR1] & 0x7f)
>  			data[RTC_YEAR1] |=3D ALARM_ENABLE_MASK;
> =20
> -		ret =3D regmap_raw_write(info->regmap, SEC_ALARM0_SEC, data, 8);
> +		ret =3D regmap_raw_write(info->regmap, S5M_ALARM0_SEC, data, 8);
>  		if (ret < 0)
>  			return ret;
>  		ret =3D s5m8767_rtc_set_alarm_reg(info);
> @@ -435,7 +435,7 @@ static int s5m_rtc_set_alarm(struct device *dev, =
struct rtc_wkalrm *alrm)
>  	if (ret < 0)
>  		return ret;
> =20
> -	ret =3D regmap_raw_write(info->regmap, SEC_ALARM0_SEC, data, 8);
> +	ret =3D regmap_raw_write(info->regmap, S5M_ALARM0_SEC, data, 8);
>  	if (ret < 0)
>  		return ret;
> =20
> @@ -480,7 +480,7 @@ static const struct rtc_class_ops s5m_rtc_ops =3D=
 {
>  static void s5m_rtc_enable_wtsr(struct s5m_rtc_info *info, bool enab=
le)
>  {
>  	int ret;
> -	ret =3D regmap_update_bits(info->regmap, SEC_WTSR_SMPL_CNTL,
> +	ret =3D regmap_update_bits(info->regmap, S5M_WTSR_SMPL_CNTL,
>  				 WTSR_ENABLE_MASK,
>  				 enable ? WTSR_ENABLE_MASK : 0);
>  	if (ret < 0)
> @@ -491,7 +491,7 @@ static void s5m_rtc_enable_wtsr(struct s5m_rtc_in=
fo *info, bool enable)
>  static void s5m_rtc_enable_smpl(struct s5m_rtc_info *info, bool enab=
le)
>  {
>  	int ret;
> -	ret =3D regmap_update_bits(info->regmap, SEC_WTSR_SMPL_CNTL,
> +	ret =3D regmap_update_bits(info->regmap, S5M_WTSR_SMPL_CNTL,
>  				 SMPL_ENABLE_MASK,
>  				 enable ? SMPL_ENABLE_MASK : 0);
>  	if (ret < 0)
> @@ -506,7 +506,7 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_in=
fo *info)
>  	int ret;
>  	struct rtc_time tm;
> =20
> -	ret =3D regmap_read(info->regmap, SEC_RTC_UDR_CON, &tp_read);
> +	ret =3D regmap_read(info->regmap, S5M_RTC_UDR_CON, &tp_read);
>  	if (ret < 0) {
>  		dev_err(info->dev, "%s: fail to read control reg(%d)\n",
>  			__func__, ret);
> @@ -518,7 +518,7 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_in=
fo *info)
>  	data[1] =3D (0 << BCD_EN_SHIFT) | (1 << MODEL24_SHIFT);
> =20
>  	info->rtc_24hr_mode =3D 1;
> -	ret =3D regmap_raw_write(info->regmap, SEC_ALARM0_CONF, data, 2);
> +	ret =3D regmap_raw_write(info->regmap, S5M_ALARM0_CONF, data, 2);
>  	if (ret < 0) {
>  		dev_err(info->dev, "%s: fail to write controlm reg(%d)\n",
>  			__func__, ret);
> @@ -540,7 +540,7 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_in=
fo *info)
>  		ret =3D s5m_rtc_set_time(info->dev, &tm);
>  	}
> =20
> -	ret =3D regmap_update_bits(info->regmap, SEC_RTC_UDR_CON,
> +	ret =3D regmap_update_bits(info->regmap, S5M_RTC_UDR_CON,
>  				 RTC_TCON_MASK, tp_read | RTC_TCON_MASK);
>  	if (ret < 0)
>  		dev_err(info->dev, "%s: fail to update TCON reg(%d)\n",
> @@ -623,7 +623,7 @@ static void s5m_rtc_shutdown(struct platform_devi=
ce *pdev)
>  	if (info->wtsr_smpl) {
>  		for (i =3D 0; i < 3; i++) {
>  			s5m_rtc_enable_wtsr(info, false);
> -			regmap_read(info->regmap, SEC_WTSR_SMPL_CNTL, &val);
> +			regmap_read(info->regmap, S5M_WTSR_SMPL_CNTL, &val);
>  			pr_debug("%s: WTSR_SMPL reg(0x%02x)\n", __func__, val);
>  			if (val & WTSR_ENABLE_MASK)
>  				pr_emerg("%s: fail to disable WTSR\n",
> diff --git a/include/linux/mfd/samsung/rtc.h b/include/linux/mfd/sams=
ung/rtc.h
> index 4627f59ebd84..bdf0573891d0 100644
> --- a/include/linux/mfd/samsung/rtc.h
> +++ b/include/linux/mfd/samsung/rtc.h
> @@ -13,38 +13,38 @@
>  #ifndef __LINUX_MFD_SEC_RTC_H
>  #define __LINUX_MFD_SEC_RTC_H
> =20
> -enum sec_rtc_reg {
> -	SEC_RTC_SEC,
> -	SEC_RTC_MIN,
> -	SEC_RTC_HOUR,
> -	SEC_RTC_WEEKDAY,
> -	SEC_RTC_DATE,
> -	SEC_RTC_MONTH,
> -	SEC_RTC_YEAR1,
> -	SEC_RTC_YEAR2,
> -	SEC_ALARM0_SEC,
> -	SEC_ALARM0_MIN,
> -	SEC_ALARM0_HOUR,
> -	SEC_ALARM0_WEEKDAY,
> -	SEC_ALARM0_DATE,
> -	SEC_ALARM0_MONTH,
> -	SEC_ALARM0_YEAR1,
> -	SEC_ALARM0_YEAR2,
> -	SEC_ALARM1_SEC,
> -	SEC_ALARM1_MIN,
> -	SEC_ALARM1_HOUR,
> -	SEC_ALARM1_WEEKDAY,
> -	SEC_ALARM1_DATE,
> -	SEC_ALARM1_MONTH,
> -	SEC_ALARM1_YEAR1,
> -	SEC_ALARM1_YEAR2,
> -	SEC_ALARM0_CONF,
> -	SEC_ALARM1_CONF,
> -	SEC_RTC_STATUS,
> -	SEC_WTSR_SMPL_CNTL,
> -	SEC_RTC_UDR_CON,
> +enum s5m_rtc_reg {
> +	S5M_RTC_SEC,
> +	S5M_RTC_MIN,
> +	S5M_RTC_HOUR,
> +	S5M_RTC_WEEKDAY,
> +	S5M_RTC_DATE,
> +	S5M_RTC_MONTH,
> +	S5M_RTC_YEAR1,
> +	S5M_RTC_YEAR2,
> +	S5M_ALARM0_SEC,
> +	S5M_ALARM0_MIN,
> +	S5M_ALARM0_HOUR,
> +	S5M_ALARM0_WEEKDAY,
> +	S5M_ALARM0_DATE,
> +	S5M_ALARM0_MONTH,
> +	S5M_ALARM0_YEAR1,
> +	S5M_ALARM0_YEAR2,
> +	S5M_ALARM1_SEC,
> +	S5M_ALARM1_MIN,
> +	S5M_ALARM1_HOUR,
> +	S5M_ALARM1_WEEKDAY,
> +	S5M_ALARM1_DATE,
> +	S5M_ALARM1_MONTH,
> +	S5M_ALARM1_YEAR1,
> +	S5M_ALARM1_YEAR2,
> +	S5M_ALARM0_CONF,
> +	S5M_ALARM1_CONF,
> +	S5M_RTC_STATUS,
> +	S5M_WTSR_SMPL_CNTL,
> +	S5M_RTC_UDR_CON,
> =20
> -	SEC_RTC_REG_MAX,
> +	S5M_RTC_REG_MAX,
>  };
> =20
>  #define RTC_I2C_ADDR		(0x0C >> 1)
> @@ -52,9 +52,9 @@ enum sec_rtc_reg {
>  #define HOUR_12			(1 << 7)
>  #define HOUR_AMPM		(1 << 6)
>  #define HOUR_PM			(1 << 5)
> -#define ALARM0_STATUS		(1 << 1)
> -#define ALARM1_STATUS		(1 << 2)
> -#define UPDATE_AD		(1 << 0)
> +#define S5M_ALARM0_STATUS	(1 << 1)
> +#define S5M_ALARM1_STATUS	(1 << 2)
> +#define S5M_UPDATE_AD		(1 << 0)
> =20
>  /* RTC Control Register */
>  #define BCD_EN_SHIFT		0
> @@ -62,12 +62,12 @@ enum sec_rtc_reg {
>  #define MODEL24_SHIFT		1
>  #define MODEL24_MASK		(1 << MODEL24_SHIFT)
>  /* RTC Update Register1 */
> -#define RTC_UDR_SHIFT		0
> -#define RTC_UDR_MASK		(1 << RTC_UDR_SHIFT)
> +#define S5M_RTC_UDR_SHIFT	0
> +#define S5M_RTC_UDR_MASK	(1 << S5M_RTC_UDR_SHIFT)
>  #define RTC_TCON_SHIFT		1
>  #define RTC_TCON_MASK		(1 << RTC_TCON_SHIFT)
> -#define RTC_TIME_EN_SHIFT	3
> -#define RTC_TIME_EN_MASK	(1 << RTC_TIME_EN_SHIFT)
> +#define S5M_RTC_TIME_EN_SHIFT	3
> +#define S5M_RTC_TIME_EN_MASK	(1 << S5M_RTC_TIME_EN_SHIFT)
> =20
>  /* RTC Hour register */
>  #define HOUR_PM_SHIFT		6

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
