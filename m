From: Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2 5/5] iio: gyro: bmg160: use regmap to retrieve struct
 device
Date: Mon, 18 Apr 2016 08:03:31 -0700
Message-ID: <1460991811.8946.11.camel@linux.intel.com>
References: <cover.1460314070.git.amsfield22@gmail.com>
	 <63dd9227f9a7e56f7e03f8963e798e6d7d8bb70f.1460314070.git.amsfield22@gmail.com>
	 <57129157.3080603@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57129157.3080603-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alison Schofield <amsfield22-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, 2016-04-16 at 20:24 +0100, Jonathan Cameron wrote:
> On 10/04/16 20:08, Alison Schofield wrote:
> >=20
> > Driver includes struct regmap and struct device in its global data.
> > Remove the struct device and use regmap API to retrieve device
> > info.
> >=20
> > Patch created using Coccinelle plus manual edits.
> >=20
> > Signed-off-by: Alison Schofield <amsfield22-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

> Cc'd Srinivas
>=20
> Actually I'm curious as to why linux-arm-kernel and linux-samsung-soc=
=20
> are cc'd?
> Not terribly relevant lists...
> >=20
> > ---
> > =C2=A0drivers/iio/gyro/bmg160_core.c | 86 +++++++++++++++++++++----=
-----
> > ------------
> > =C2=A01 file changed, 44 insertions(+), 42 deletions(-)
> >=20
> > diff --git a/drivers/iio/gyro/bmg160_core.c
> > b/drivers/iio/gyro/bmg160_core.c
> > index 2493bb1..b2b1071 100644
> > --- a/drivers/iio/gyro/bmg160_core.c
> > +++ b/drivers/iio/gyro/bmg160_core.c
> > @@ -95,7 +95,6 @@
> > =C2=A0#define BMG160_AUTO_SUSPEND_DELAY_MS	2000
> > =C2=A0
> > =C2=A0struct bmg160_data {
> > -	struct device *dev;
> > =C2=A0	struct regmap *regmap;
> > =C2=A0	struct iio_trigger *dready_trig;
> > =C2=A0	struct iio_trigger *motion_trig;
> > @@ -137,11 +136,12 @@ static const struct {
> > =C2=A0
> > =C2=A0static int bmg160_set_mode(struct bmg160_data *data, u8 mode)
> > =C2=A0{
> > +	struct device *dev =3D regmap_get_device(data->regmap);
> > =C2=A0	int ret;
> > =C2=A0
> > =C2=A0	ret =3D regmap_write(data->regmap, BMG160_REG_PMU_LPW,
> > mode);
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev, "Error writing reg_pmu_lpw\n");
> > +		dev_err(dev, "Error writing reg_pmu_lpw\n");
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > @@ -162,6 +162,7 @@ static int bmg160_convert_freq_to_bit(int val)
> > =C2=A0
> > =C2=A0static int bmg160_set_bw(struct bmg160_data *data, int val)
> > =C2=A0{
> > +	struct device *dev =3D regmap_get_device(data->regmap);
> > =C2=A0	int ret;
> > =C2=A0	int bw_bits;
> > =C2=A0
> > @@ -171,7 +172,7 @@ static int bmg160_set_bw(struct bmg160_data
> > *data, int val)
> > =C2=A0
> > =C2=A0	ret =3D regmap_write(data->regmap, BMG160_REG_PMU_BW,
> > bw_bits);
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev, "Error writing reg_pmu_bw\n");
> > +		dev_err(dev, "Error writing reg_pmu_bw\n");
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > @@ -182,18 +183,19 @@ static int bmg160_set_bw(struct bmg160_data
> > *data, int val)
> > =C2=A0
> > =C2=A0static int bmg160_chip_init(struct bmg160_data *data)
> > =C2=A0{
> > +	struct device *dev =3D regmap_get_device(data->regmap);
> > =C2=A0	int ret;
> > =C2=A0	unsigned int val;
> > =C2=A0
> > =C2=A0	ret =3D regmap_read(data->regmap, BMG160_REG_CHIP_ID, &val);
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev, "Error reading reg_chip_id\n");
> > +		dev_err(dev, "Error reading reg_chip_id\n");
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > -	dev_dbg(data->dev, "Chip Id %x\n", val);
> > +	dev_dbg(dev, "Chip Id %x\n", val);
> > =C2=A0	if (val !=3D BMG160_CHIP_ID_VAL) {
> > -		dev_err(data->dev, "invalid chip %x\n", val);
> > +		dev_err(dev, "invalid chip %x\n", val);
> > =C2=A0		return -ENODEV;
> > =C2=A0	}
> > =C2=A0
> > @@ -212,14 +214,14 @@ static int bmg160_chip_init(struct
> > bmg160_data *data)
> > =C2=A0	/* Set Default Range */
> > =C2=A0	ret =3D regmap_write(data->regmap, BMG160_REG_RANGE,
> > BMG160_RANGE_500DPS);
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev, "Error writing reg_range\n");
> > +		dev_err(dev, "Error writing reg_range\n");
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0	data->dps_range =3D BMG160_RANGE_500DPS;
> > =C2=A0
> > =C2=A0	ret =3D regmap_read(data->regmap, BMG160_REG_SLOPE_THRES,
> > &val);
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev, "Error reading
> > reg_slope_thres\n");
> > +		dev_err(dev, "Error reading reg_slope_thres\n");
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0	data->slope_thres =3D val;
> > @@ -228,7 +230,7 @@ static int bmg160_chip_init(struct bmg160_data
> > *data)
> > =C2=A0	ret =3D regmap_update_bits(data->regmap,
> > BMG160_REG_INT_EN_1,
> > =C2=A0				=C2=A0BMG160_INT1_BIT_OD, 0);
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev, "Error updating bits in
> > reg_int_en_1\n");
> > +		dev_err(dev, "Error updating bits in
> > reg_int_en_1\n");
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > @@ -236,7 +238,7 @@ static int bmg160_chip_init(struct bmg160_data
> > *data)
> > =C2=A0			=C2=A0=C2=A0=C2=A0BMG160_INT_MODE_LATCH_INT |
> > =C2=A0			=C2=A0=C2=A0=C2=A0BMG160_INT_MODE_LATCH_RESET);
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev,
> > +		dev_err(dev,
> > =C2=A0			"Error writing reg_motion_intr\n");
> > =C2=A0		return ret;
> > =C2=A0	}
> > @@ -247,20 +249,21 @@ static int bmg160_chip_init(struct
> > bmg160_data *data)
> > =C2=A0static int bmg160_set_power_state(struct bmg160_data *data, b=
ool
> > on)
> > =C2=A0{
> > =C2=A0#ifdef CONFIG_PM
> > +	struct device *dev =3D regmap_get_device(data->regmap);
> > =C2=A0	int ret;
> > =C2=A0
> > =C2=A0	if (on)
> > -		ret =3D pm_runtime_get_sync(data->dev);
> > +		ret =3D pm_runtime_get_sync(dev);
> > =C2=A0	else {
> > -		pm_runtime_mark_last_busy(data->dev);
> > -		ret =3D pm_runtime_put_autosuspend(data->dev);
> > +		pm_runtime_mark_last_busy(dev);
> > +		ret =3D pm_runtime_put_autosuspend(dev);
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev,
> > -			"Failed: bmg160_set_power_state for %d\n",
> > on);
> > +		dev_err(dev, "Failed: bmg160_set_power_state for
> > %d\n", on);
> > +
> > =C2=A0		if (on)
> > -			pm_runtime_put_noidle(data->dev);
> > +			pm_runtime_put_noidle(dev);
> > =C2=A0
> > =C2=A0		return ret;
> > =C2=A0	}
> > @@ -272,6 +275,7 @@ static int bmg160_set_power_state(struct
> > bmg160_data *data, bool on)
> > =C2=A0static int bmg160_setup_any_motion_interrupt(struct bmg160_da=
ta
> > *data,
> > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool status)
> > =C2=A0{
> > +	struct device *dev =3D regmap_get_device(data->regmap);
> > =C2=A0	int ret;
> > =C2=A0
> > =C2=A0	/* Enable/Disable INT_MAP0 mapping */
> > @@ -279,7 +283,7 @@ static int
> > bmg160_setup_any_motion_interrupt(struct bmg160_data *data,
> > =C2=A0				=C2=A0BMG160_INT_MAP_0_BIT_ANY,
> > =C2=A0				=C2=A0(status ?
> > BMG160_INT_MAP_0_BIT_ANY : 0));
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev, "Error updating bits
> > reg_int_map0\n");
> > +		dev_err(dev, "Error updating bits
> > reg_int_map0\n");
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > @@ -289,8 +293,7 @@ static int
> > bmg160_setup_any_motion_interrupt(struct bmg160_data *data,
> > =C2=A0		ret =3D regmap_write(data->regmap,
> > BMG160_REG_SLOPE_THRES,
> > =C2=A0				=C2=A0=C2=A0=C2=A0data->slope_thres);
> > =C2=A0		if (ret < 0) {
> > -			dev_err(data->dev,
> > -				"Error writing
> > reg_slope_thres\n");
> > +			dev_err(dev, "Error writing
> > reg_slope_thres\n");
> > =C2=A0			return ret;
> > =C2=A0		}
> > =C2=A0
> > @@ -298,8 +301,7 @@ static int
> > bmg160_setup_any_motion_interrupt(struct bmg160_data *data,
> > =C2=A0				=C2=A0=C2=A0=C2=A0BMG160_INT_MOTION_X |
> > BMG160_INT_MOTION_Y |
> > =C2=A0				=C2=A0=C2=A0=C2=A0BMG160_INT_MOTION_Z);
> > =C2=A0		if (ret < 0) {
> > -			dev_err(data->dev,
> > -				"Error writing
> > reg_motion_intr\n");
> > +			dev_err(dev, "Error writing
> > reg_motion_intr\n");
> > =C2=A0			return ret;
> > =C2=A0		}
> > =C2=A0
> > @@ -314,8 +316,7 @@ static int
> > bmg160_setup_any_motion_interrupt(struct bmg160_data *data,
> > =C2=A0					=C2=A0=C2=A0=C2=A0BMG160_INT_MODE_LATCH_I
> > NT |
> > =C2=A0					=C2=A0=C2=A0=C2=A0BMG160_INT_MODE_LATCH_R
> > ESET);
> > =C2=A0			if (ret < 0) {
> > -				dev_err(data->dev,
> > -					"Error writing
> > reg_rst_latch\n");
> > +				dev_err(dev, "Error writing
> > reg_rst_latch\n");
> > =C2=A0				return ret;
> > =C2=A0			}
> > =C2=A0		}
> > @@ -328,7 +329,7 @@ static int
> > bmg160_setup_any_motion_interrupt(struct bmg160_data *data,
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev, "Error writing reg_int_en0\n");
> > +		dev_err(dev, "Error writing reg_int_en0\n");
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > @@ -338,6 +339,7 @@ static int
> > bmg160_setup_any_motion_interrupt(struct bmg160_data *data,
> > =C2=A0static int bmg160_setup_new_data_interrupt(struct bmg160_data
> > *data,
> > =C2=A0					=C2=A0=C2=A0=C2=A0bool status)
> > =C2=A0{
> > +	struct device *dev =3D regmap_get_device(data->regmap);
> > =C2=A0	int ret;
> > =C2=A0
> > =C2=A0	/* Enable/Disable INT_MAP1 mapping */
> > @@ -345,7 +347,7 @@ static int
> > bmg160_setup_new_data_interrupt(struct bmg160_data *data,
> > =C2=A0				=C2=A0BMG160_INT_MAP_1_BIT_NEW_DATA,
> > =C2=A0				=C2=A0(status ?
> > BMG160_INT_MAP_1_BIT_NEW_DATA : 0));
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev, "Error updating bits in
> > reg_int_map1\n");
> > +		dev_err(dev, "Error updating bits in
> > reg_int_map1\n");
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > @@ -354,9 +356,8 @@ static int
> > bmg160_setup_new_data_interrupt(struct bmg160_data *data,
> > =C2=A0				=C2=A0=C2=A0=C2=A0BMG160_INT_MODE_NON_LATCH_INT |
> > =C2=A0				=C2=A0=C2=A0=C2=A0BMG160_INT_MODE_LATCH_RESET);
> > =C2=A0		if (ret < 0) {
> > -			dev_err(data->dev,
> > -				"Error writing reg_rst_latch\n");
> > -				return ret;
> > +			dev_err(dev, "Error writing
> > reg_rst_latch\n");
> > +			return ret;
> > =C2=A0		}
> > =C2=A0
> > =C2=A0		ret =3D regmap_write(data->regmap,
> > BMG160_REG_INT_EN_0,
> > @@ -368,16 +369,15 @@ static int
> > bmg160_setup_new_data_interrupt(struct bmg160_data *data,
> > =C2=A0				=C2=A0=C2=A0=C2=A0BMG160_INT_MODE_LATCH_INT |
> > =C2=A0				=C2=A0=C2=A0=C2=A0BMG160_INT_MODE_LATCH_RESET);
> > =C2=A0		if (ret < 0) {
> > -			dev_err(data->dev,
> > -				"Error writing reg_rst_latch\n");
> > -				return ret;
> > +			dev_err(dev, "Error writing
> > reg_rst_latch\n");
> > +			return ret;
> > =C2=A0		}
> > =C2=A0
> > =C2=A0		ret =3D regmap_write(data->regmap,
> > BMG160_REG_INT_EN_0, 0);
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev, "Error writing reg_int_en0\n");
> > +		dev_err(dev, "Error writing reg_int_en0\n");
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > @@ -400,6 +400,7 @@ static int bmg160_get_bw(struct bmg160_data
> > *data, int *val)
> > =C2=A0
> > =C2=A0static int bmg160_set_scale(struct bmg160_data *data, int val=
)
> > =C2=A0{
> > +	struct device *dev =3D regmap_get_device(data->regmap);
> > =C2=A0	int ret, i;
> > =C2=A0
> > =C2=A0	for (i =3D 0; i < ARRAY_SIZE(bmg160_scale_table); ++i) {
> > @@ -407,8 +408,7 @@ static int bmg160_set_scale(struct bmg160_data
> > *data, int val)
> > =C2=A0			ret =3D regmap_write(data->regmap,
> > BMG160_REG_RANGE,
> > =C2=A0					=C2=A0=C2=A0=C2=A0bmg160_scale_table[i].d
> > ps_range);
> > =C2=A0			if (ret < 0) {
> > -				dev_err(data->dev,
> > -					"Error writing
> > reg_range\n");
> > +				dev_err(dev, "Error writing
> > reg_range\n");
> > =C2=A0				return ret;
> > =C2=A0			}
> > =C2=A0			data->dps_range =3D
> > bmg160_scale_table[i].dps_range;
> > @@ -421,6 +421,7 @@ static int bmg160_set_scale(struct bmg160_data
> > *data, int val)
> > =C2=A0
> > =C2=A0static int bmg160_get_temp(struct bmg160_data *data, int *val=
)
> > =C2=A0{
> > +	struct device *dev =3D regmap_get_device(data->regmap);
> > =C2=A0	int ret;
> > =C2=A0	unsigned int raw_val;
> > =C2=A0
> > @@ -433,7 +434,7 @@ static int bmg160_get_temp(struct bmg160_data
> > *data, int *val)
> > =C2=A0
> > =C2=A0	ret =3D regmap_read(data->regmap, BMG160_REG_TEMP,
> > &raw_val);
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev, "Error reading reg_temp\n");
> > +		dev_err(dev, "Error reading reg_temp\n");
> > =C2=A0		bmg160_set_power_state(data, false);
> > =C2=A0		mutex_unlock(&data->mutex);
> > =C2=A0		return ret;
> > @@ -450,6 +451,7 @@ static int bmg160_get_temp(struct bmg160_data
> > *data, int *val)
> > =C2=A0
> > =C2=A0static int bmg160_get_axis(struct bmg160_data *data, int axis=
, int
> > *val)
> > =C2=A0{
> > +	struct device *dev =3D regmap_get_device(data->regmap);
> > =C2=A0	int ret;
> > =C2=A0	unsigned int raw_val;
> > =C2=A0
> > @@ -463,7 +465,7 @@ static int bmg160_get_axis(struct bmg160_data
> > *data, int axis, int *val)
> > =C2=A0	ret =3D regmap_bulk_read(data->regmap,
> > BMG160_AXIS_TO_REG(axis), &raw_val,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02);
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev, "Error reading axis %d\n",
> > axis);
> > +		dev_err(dev, "Error reading axis %d\n", axis);
> > =C2=A0		bmg160_set_power_state(data, false);
> > =C2=A0		mutex_unlock(&data->mutex);
> > =C2=A0		return ret;
> > @@ -793,6 +795,7 @@ static int bmg160_trig_try_reen(struct
> > iio_trigger *trig)
> > =C2=A0{
> > =C2=A0	struct iio_dev *indio_dev =3D iio_trigger_get_drvdata(trig);
> > =C2=A0	struct bmg160_data *data =3D iio_priv(indio_dev);
> > +	struct device *dev =3D regmap_get_device(data->regmap);
> > =C2=A0	int ret;
> > =C2=A0
> > =C2=A0	/* new data interrupts don't need ack */
> > @@ -804,7 +807,7 @@ static int bmg160_trig_try_reen(struct
> > iio_trigger *trig)
> > =C2=A0			=C2=A0=C2=A0=C2=A0BMG160_INT_MODE_LATCH_INT |
> > =C2=A0			=C2=A0=C2=A0=C2=A0BMG160_INT_MODE_LATCH_RESET);
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev, "Error writing
> > reg_rst_latch\n");
> > +		dev_err(dev, "Error writing reg_rst_latch\n");
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > @@ -864,13 +867,14 @@ static irqreturn_t bmg160_event_handler(int
> > irq, void *private)
> > =C2=A0{
> > =C2=A0	struct iio_dev *indio_dev =3D private;
> > =C2=A0	struct bmg160_data *data =3D iio_priv(indio_dev);
> > +	struct device *dev =3D regmap_get_device(data->regmap);
> > =C2=A0	int ret;
> > =C2=A0	int dir;
> > =C2=A0	unsigned int val;
> > =C2=A0
> > =C2=A0	ret =3D regmap_read(data->regmap, BMG160_REG_INT_STATUS_2,
> > &val);
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev, "Error reading
> > reg_int_status2\n");
> > +		dev_err(dev, "Error reading reg_int_status2\n");
> > =C2=A0		goto ack_intr_status;
> > =C2=A0	}
> > =C2=A0
> > @@ -907,8 +911,7 @@ ack_intr_status:
> > =C2=A0				=C2=A0=C2=A0=C2=A0BMG160_INT_MODE_LATCH_INT |
> > =C2=A0				=C2=A0=C2=A0=C2=A0BMG160_INT_MODE_LATCH_RESET);
> > =C2=A0		if (ret < 0)
> > -			dev_err(data->dev,
> > -				"Error writing reg_rst_latch\n");
> > +			dev_err(dev, "Error writing
> > reg_rst_latch\n");
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	return IRQ_HANDLED;
> > @@ -976,7 +979,6 @@ int bmg160_core_probe(struct device *dev,
> > struct regmap *regmap, int irq,
> > =C2=A0
> > =C2=A0	data =3D iio_priv(indio_dev);
> > =C2=A0	dev_set_drvdata(dev, indio_dev);
> > -	data->dev =3D dev;
> > =C2=A0	data->irq =3D irq;
> > =C2=A0	data->regmap =3D regmap;
> > =C2=A0
> > @@ -1139,7 +1141,7 @@ static int bmg160_runtime_suspend(struct
> > device *dev)
> > =C2=A0
> > =C2=A0	ret =3D bmg160_set_mode(data, BMG160_MODE_SUSPEND);
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev, "set mode failed\n");
> > +		dev_err(dev, "set mode failed\n");
> > =C2=A0		return -EAGAIN;
> > =C2=A0	}
> > =C2=A0
> >=20
