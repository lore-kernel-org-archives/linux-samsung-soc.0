From: Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2 1/5] iio: accel: bmc150: use regmap to retrieve
 struct device
Date: Mon, 18 Apr 2016 07:59:38 -0700
Message-ID: <1460991578.8946.10.camel@linux.intel.com>
References: <cover.1460314070.git.amsfield22@gmail.com>
	 <f3cae5dd803486a774248afad096032f3f0546a2.1460314070.git.amsfield22@gmail.com>
	 <57129064.9050508@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57129064.9050508-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alison Schofield <amsfield22-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Irina Tirdea <irina.tirdea-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, 2016-04-16 at 20:20 +0100, Jonathan Cameron wrote:
> On 10/04/16 20:05, Alison Schofield wrote:
> >=20
> > Driver includes struct regmap and struct device in its global data.
> > Remove the struct device and use regmap API to retrieve device
> > info.
> >=20
> > Patch created using Coccinelle plus manual edits.
> >=20
> > Signed-off-by: Alison Schofield <amsfield22-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

> I'm happy with this but please do make sure to cc the maintainer /
> author
> of drivers if possible (often the email addresses are out of date!)
>=20
> Srinivas, this is one of yours.=C2=A0=C2=A0Are you happy with this?
> I've also cc'd Irina who has worked on this driver recently for any
> comments.
>=20
> If no one comments in the meantime I'll probably pick these up
> sometime
> in the next week.
>=20
> Jonathan
> >=20
> > ---
> > =C2=A0drivers/iio/accel/bmc150-accel-core.c | 99 ++++++++++++++++++=
+--
> > --------------
> > =C2=A01 file changed, 54 insertions(+), 45 deletions(-)
> >=20
> > diff --git a/drivers/iio/accel/bmc150-accel-core.c
> > b/drivers/iio/accel/bmc150-accel-core.c
> > index f3d096f..ad5310b 100644
> > --- a/drivers/iio/accel/bmc150-accel-core.c
> > +++ b/drivers/iio/accel/bmc150-accel-core.c
> > @@ -188,7 +188,6 @@ enum bmc150_accel_trigger_id {
> > =C2=A0
> > =C2=A0struct bmc150_accel_data {
> > =C2=A0	struct regmap *regmap;
> > -	struct device *dev;
> > =C2=A0	int irq;
> > =C2=A0	struct bmc150_accel_interrupt
> > interrupts[BMC150_ACCEL_INTERRUPTS];
> > =C2=A0	atomic_t active_intr;
> > @@ -256,6 +255,7 @@ static int bmc150_accel_set_mode(struct
> > bmc150_accel_data *data,
> > =C2=A0				=C2=A0enum bmc150_power_modes mode,
> > =C2=A0				=C2=A0int dur_us)
> > =C2=A0{
> > +	struct device *dev =3D regmap_get_device(data->regmap);
> > =C2=A0	int i;
> > =C2=A0	int ret;
> > =C2=A0	u8 lpw_bits;
> > @@ -279,11 +279,11 @@ static int bmc150_accel_set_mode(struct
> > bmc150_accel_data *data,
> > =C2=A0	lpw_bits =3D mode << BMC150_ACCEL_PMU_MODE_SHIFT;
> > =C2=A0	lpw_bits |=3D (dur_val <<
> > BMC150_ACCEL_PMU_BIT_SLEEP_DUR_SHIFT);
> > =C2=A0
> > -	dev_dbg(data->dev, "Set Mode bits %x\n", lpw_bits);
> > +	dev_dbg(dev, "Set Mode bits %x\n", lpw_bits);
> > =C2=A0
> > =C2=A0	ret =3D regmap_write(data->regmap, BMC150_ACCEL_REG_PMU_LPW,
> > lpw_bits);
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev, "Error writing reg_pmu_lpw\n");
> > +		dev_err(dev, "Error writing reg_pmu_lpw\n");
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > @@ -316,23 +316,24 @@ static int bmc150_accel_set_bw(struct
> > bmc150_accel_data *data, int val,
> > =C2=A0
> > =C2=A0static int bmc150_accel_update_slope(struct bmc150_accel_data
> > *data)
> > =C2=A0{
> > +	struct device *dev =3D regmap_get_device(data->regmap);
> > =C2=A0	int ret;
> > =C2=A0
> > =C2=A0	ret =3D regmap_write(data->regmap, BMC150_ACCEL_REG_INT_6,
> > =C2=A0					data->slope_thres);
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev, "Error writing reg_int_6\n");
> > +		dev_err(dev, "Error writing reg_int_6\n");
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	ret =3D regmap_update_bits(data->regmap,
> > BMC150_ACCEL_REG_INT_5,
> > =C2=A0				=C2=A0BMC150_ACCEL_SLOPE_DUR_MASK,
> > data->slope_dur);
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev, "Error updating reg_int_5\n");
> > +		dev_err(dev, "Error updating reg_int_5\n");
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > -	dev_dbg(data->dev, "%s: %x %x\n", __func__, data-
> > >slope_thres,
> > +	dev_dbg(dev, "%s: %x %x\n", __func__, data->slope_thres,
> > =C2=A0		data->slope_dur);
> > =C2=A0
> > =C2=A0	return ret;
> > @@ -378,20 +379,21 @@ static int
> > bmc150_accel_get_startup_times(struct bmc150_accel_data *data)
> > =C2=A0
> > =C2=A0static int bmc150_accel_set_power_state(struct bmc150_accel_d=
ata
> > *data, bool on)
> > =C2=A0{
> > +	struct device *dev =3D regmap_get_device(data->regmap);
> > =C2=A0	int ret;
> > =C2=A0
> > =C2=A0	if (on) {
> > -		ret =3D pm_runtime_get_sync(data->dev);
> > +		ret =3D pm_runtime_get_sync(dev);
> > =C2=A0	} else {
> > -		pm_runtime_mark_last_busy(data->dev);
> > -		ret =3D pm_runtime_put_autosuspend(data->dev);
> > +		pm_runtime_mark_last_busy(dev);
> > +		ret =3D pm_runtime_put_autosuspend(dev);
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev,
> > +		dev_err(dev,
> > =C2=A0			"Failed: bmc150_accel_set_power_state for
> > %d\n", on);
> > =C2=A0		if (on)
> > -			pm_runtime_put_noidle(data->dev);
> > +			pm_runtime_put_noidle(dev);
> > =C2=A0
> > =C2=A0		return ret;
> > =C2=A0	}
> > @@ -445,6 +447,7 @@ static void
> > bmc150_accel_interrupts_setup(struct iio_dev *indio_dev,
> > =C2=A0static int bmc150_accel_set_interrupt(struct bmc150_accel_dat=
a
> > *data, int i,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool state)
> > =C2=A0{
> > +	struct device *dev =3D regmap_get_device(data->regmap);
> > =C2=A0	struct bmc150_accel_interrupt *intr =3D &data-
> > >interrupts[i];
> > =C2=A0	const struct bmc150_accel_interrupt_info *info =3D intr-
> > >info;
> > =C2=A0	int ret;
> > @@ -474,7 +477,7 @@ static int bmc150_accel_set_interrupt(struct
> > bmc150_accel_data *data, int i,
> > =C2=A0	ret =3D regmap_update_bits(data->regmap, info->map_reg,
> > info->map_bitmask,
> > =C2=A0				=C2=A0(state ? info->map_bitmask : 0));
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev, "Error updating
> > reg_int_map\n");
> > +		dev_err(dev, "Error updating reg_int_map\n");
> > =C2=A0		goto out_fix_power_state;
> > =C2=A0	}
> > =C2=A0
> > @@ -482,7 +485,7 @@ static int bmc150_accel_set_interrupt(struct
> > bmc150_accel_data *data, int i,
> > =C2=A0	ret =3D regmap_update_bits(data->regmap, info->en_reg, info-
> > >en_bitmask,
> > =C2=A0				=C2=A0(state ? info->en_bitmask : 0));
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev, "Error updating reg_int_en\n");
> > +		dev_err(dev, "Error updating reg_int_en\n");
> > =C2=A0		goto out_fix_power_state;
> > =C2=A0	}
> > =C2=A0
> > @@ -500,6 +503,7 @@ out_fix_power_state:
> > =C2=A0
> > =C2=A0static int bmc150_accel_set_scale(struct bmc150_accel_data *d=
ata,
> > int val)
> > =C2=A0{
> > +	struct device *dev =3D regmap_get_device(data->regmap);
> > =C2=A0	int ret, i;
> > =C2=A0
> > =C2=A0	for (i =3D 0; i < ARRAY_SIZE(data->chip_info->scale_table);
> > ++i) {
> > @@ -508,8 +512,7 @@ static int bmc150_accel_set_scale(struct
> > bmc150_accel_data *data, int val)
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0BMC150_ACCEL_REG_PMU_RANGE,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0data->chip_info-
> > >scale_table[i].reg_range);
> > =C2=A0			if (ret < 0) {
> > -				dev_err(data->dev,
> > -					"Error writing
> > pmu_range\n");
> > +				dev_err(dev, "Error writing
> > pmu_range\n");
> > =C2=A0				return ret;
> > =C2=A0			}
> > =C2=A0
> > @@ -523,6 +526,7 @@ static int bmc150_accel_set_scale(struct
> > bmc150_accel_data *data, int val)
> > =C2=A0
> > =C2=A0static int bmc150_accel_get_temp(struct bmc150_accel_data *da=
ta,
> > int *val)
> > =C2=A0{
> > +	struct device *dev =3D regmap_get_device(data->regmap);
> > =C2=A0	int ret;
> > =C2=A0	unsigned int value;
> > =C2=A0
> > @@ -530,7 +534,7 @@ static int bmc150_accel_get_temp(struct
> > bmc150_accel_data *data, int *val)
> > =C2=A0
> > =C2=A0	ret =3D regmap_read(data->regmap, BMC150_ACCEL_REG_TEMP,
> > &value);
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev, "Error reading reg_temp\n");
> > +		dev_err(dev, "Error reading reg_temp\n");
> > =C2=A0		mutex_unlock(&data->mutex);
> > =C2=A0		return ret;
> > =C2=A0	}
> > @@ -545,6 +549,7 @@ static int bmc150_accel_get_axis(struct
> > bmc150_accel_data *data,
> > =C2=A0				=C2=A0struct iio_chan_spec const *chan,
> > =C2=A0				=C2=A0int *val)
> > =C2=A0{
> > +	struct device *dev =3D regmap_get_device(data->regmap);
> > =C2=A0	int ret;
> > =C2=A0	int axis =3D chan->scan_index;
> > =C2=A0	unsigned int raw_val;
> > @@ -559,7 +564,7 @@ static int bmc150_accel_get_axis(struct
> > bmc150_accel_data *data,
> > =C2=A0	ret =3D regmap_bulk_read(data->regmap,
> > BMC150_ACCEL_AXIS_TO_REG(axis),
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&raw_val, 2);
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev, "Error reading axis %d\n",
> > axis);
> > +		dev_err(dev, "Error reading axis %d\n", axis);
> > =C2=A0		bmc150_accel_set_power_state(data, false);
> > =C2=A0		mutex_unlock(&data->mutex);
> > =C2=A0		return ret;
> > @@ -831,6 +836,7 @@ static int bmc150_accel_set_watermark(struct
> > iio_dev *indio_dev, unsigned val)
> > =C2=A0static int bmc150_accel_fifo_transfer(struct bmc150_accel_dat=
a
> > *data,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char *buffer, int sam=
ples)
> > =C2=A0{
> > +	struct device *dev =3D regmap_get_device(data->regmap);
> > =C2=A0	int sample_length =3D 3 * 2;
> > =C2=A0	int ret;
> > =C2=A0	int total_length =3D samples * sample_length;
> > @@ -854,7 +860,8 @@ static int bmc150_accel_fifo_transfer(struct
> > bmc150_accel_data *data,
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	if (ret)
> > -		dev_err(data->dev, "Error transferring data from
> > fifo in single steps of %zu\n",
> > +		dev_err(dev,
> > +			"Error transferring data from fifo in
> > single steps of %zu\n",
> > =C2=A0			step);
> > =C2=A0
> > =C2=A0	return ret;
> > @@ -864,6 +871,7 @@ static int __bmc150_accel_fifo_flush(struct
> > iio_dev *indio_dev,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned samples, bool irq)
> > =C2=A0{
> > =C2=A0	struct bmc150_accel_data *data =3D iio_priv(indio_dev);
> > +	struct device *dev =3D regmap_get_device(data->regmap);
> > =C2=A0	int ret, i;
> > =C2=A0	u8 count;
> > =C2=A0	u16 buffer[BMC150_ACCEL_FIFO_LENGTH * 3];
> > @@ -873,7 +881,7 @@ static int __bmc150_accel_fifo_flush(struct
> > iio_dev *indio_dev,
> > =C2=A0
> > =C2=A0	ret =3D regmap_read(data->regmap,
> > BMC150_ACCEL_REG_FIFO_STATUS, &val);
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev, "Error reading
> > reg_fifo_status\n");
> > +		dev_err(dev, "Error reading reg_fifo_status\n");
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > @@ -1135,6 +1143,7 @@ static int bmc150_accel_trig_try_reen(struct
> > iio_trigger *trig)
> > =C2=A0{
> > =C2=A0	struct bmc150_accel_trigger *t =3D
> > iio_trigger_get_drvdata(trig);
> > =C2=A0	struct bmc150_accel_data *data =3D t->data;
> > +	struct device *dev =3D regmap_get_device(data->regmap);
> > =C2=A0	int ret;
> > =C2=A0
> > =C2=A0	/* new data interrupts don't need ack */
> > @@ -1148,8 +1157,7 @@ static int bmc150_accel_trig_try_reen(struct
> > iio_trigger *trig)
> > =C2=A0			=C2=A0=C2=A0=C2=A0BMC150_ACCEL_INT_MODE_LATCH_RESET);
> > =C2=A0	mutex_unlock(&data->mutex);
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev,
> > -			"Error writing reg_int_rst_latch\n");
> > +		dev_err(dev, "Error writing reg_int_rst_latch\n");
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > @@ -1200,13 +1208,14 @@ static const struct iio_trigger_ops
> > bmc150_accel_trigger_ops =3D {
> > =C2=A0static int bmc150_accel_handle_roc_event(struct iio_dev
> > *indio_dev)
> > =C2=A0{
> > =C2=A0	struct bmc150_accel_data *data =3D iio_priv(indio_dev);
> > +	struct device *dev =3D regmap_get_device(data->regmap);
> > =C2=A0	int dir;
> > =C2=A0	int ret;
> > =C2=A0	unsigned int val;
> > =C2=A0
> > =C2=A0	ret =3D regmap_read(data->regmap,
> > BMC150_ACCEL_REG_INT_STATUS_2, &val);
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev, "Error reading
> > reg_int_status_2\n");
> > +		dev_err(dev, "Error reading reg_int_status_2\n");
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > @@ -1249,6 +1258,7 @@ static irqreturn_t
> > bmc150_accel_irq_thread_handler(int irq, void *private)
> > =C2=A0{
> > =C2=A0	struct iio_dev *indio_dev =3D private;
> > =C2=A0	struct bmc150_accel_data *data =3D iio_priv(indio_dev);
> > +	struct device *dev =3D regmap_get_device(data->regmap);
> > =C2=A0	bool ack =3D false;
> > =C2=A0	int ret;
> > =C2=A0
> > @@ -1272,7 +1282,7 @@ static irqreturn_t
> > bmc150_accel_irq_thread_handler(int irq, void *private)
> > =C2=A0				=C2=A0=C2=A0=C2=A0BMC150_ACCEL_INT_MODE_LATCH_INT
> > |
> > =C2=A0				=C2=A0=C2=A0=C2=A0BMC150_ACCEL_INT_MODE_LATCH_RES
> > ET);
> > =C2=A0		if (ret)
> > -			dev_err(data->dev, "Error writing
> > reg_int_rst_latch\n");
> > +			dev_err(dev, "Error writing
> > reg_int_rst_latch\n");
> > =C2=A0
> > =C2=A0		ret =3D IRQ_HANDLED;
> > =C2=A0	} else {
> > @@ -1343,13 +1353,14 @@ static void
> > bmc150_accel_unregister_triggers(struct bmc150_accel_data *data,
> > =C2=A0static int bmc150_accel_triggers_setup(struct iio_dev *indio_=
dev,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct bmc150_a=
ccel_data
> > *data)
> > =C2=A0{
> > +	struct device *dev =3D regmap_get_device(data->regmap);
> > =C2=A0	int i, ret;
> > =C2=A0
> > =C2=A0	for (i =3D 0; i < BMC150_ACCEL_TRIGGERS; i++) {
> > =C2=A0		struct bmc150_accel_trigger *t =3D &data-
> > >triggers[i];
> > =C2=A0
> > -		t->indio_trig =3D devm_iio_trigger_alloc(data->dev,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bmc150_accel_trigge
> > rs[i].name,
> > +		t->indio_trig =3D devm_iio_trigger_alloc(dev,
> > +					bmc150_accel_triggers[i].n
> > ame,
> > =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0indio_dev-
> > >name,
> > =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0indio_dev-
> > >id);
> > =C2=A0		if (!t->indio_trig) {
> > @@ -1357,7 +1368,7 @@ static int bmc150_accel_triggers_setup(struct
> > iio_dev *indio_dev,
> > =C2=A0			break;
> > =C2=A0		}
> > =C2=A0
> > -		t->indio_trig->dev.parent =3D data->dev;
> > +		t->indio_trig->dev.parent =3D dev;
> > =C2=A0		t->indio_trig->ops =3D &bmc150_accel_trigger_ops;
> > =C2=A0		t->intr =3D bmc150_accel_triggers[i].intr;
> > =C2=A0		t->data =3D data;
> > @@ -1381,12 +1392,13 @@ static int
> > bmc150_accel_triggers_setup(struct iio_dev *indio_dev,
> > =C2=A0
> > =C2=A0static int bmc150_accel_fifo_set_mode(struct bmc150_accel_dat=
a
> > *data)
> > =C2=A0{
> > +	struct device *dev =3D regmap_get_device(data->regmap);
> > =C2=A0	u8 reg =3D BMC150_ACCEL_REG_FIFO_CONFIG1;
> > =C2=A0	int ret;
> > =C2=A0
> > =C2=A0	ret =3D regmap_write(data->regmap, reg, data->fifo_mode);
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev, "Error writing
> > reg_fifo_config1\n");
> > +		dev_err(dev, "Error writing reg_fifo_config1\n");
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > @@ -1396,7 +1408,7 @@ static int bmc150_accel_fifo_set_mode(struct
> > bmc150_accel_data *data)
> > =C2=A0	ret =3D regmap_write(data->regmap,
> > BMC150_ACCEL_REG_FIFO_CONFIG0,
> > =C2=A0			=C2=A0=C2=A0=C2=A0data->watermark);
> > =C2=A0	if (ret < 0)
> > -		dev_err(data->dev, "Error writing
> > reg_fifo_config0\n");
> > +		dev_err(dev, "Error writing reg_fifo_config0\n");
> > =C2=A0
> > =C2=A0	return ret;
> > =C2=A0}
> > @@ -1480,17 +1492,17 @@ static const struct iio_buffer_setup_ops
> > bmc150_accel_buffer_ops =3D {
> > =C2=A0
> > =C2=A0static int bmc150_accel_chip_init(struct bmc150_accel_data *d=
ata)
> > =C2=A0{
> > +	struct device *dev =3D regmap_get_device(data->regmap);
> > =C2=A0	int ret, i;
> > =C2=A0	unsigned int val;
> > =C2=A0
> > =C2=A0	ret =3D regmap_read(data->regmap, BMC150_ACCEL_REG_CHIP_ID,
> > &val);
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev,
> > -			"Error: Reading chip id\n");
> > +		dev_err(dev, "Error: Reading chip id\n");
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > -	dev_dbg(data->dev, "Chip Id %x\n", val);
> > +	dev_dbg(dev, "Chip Id %x\n", val);
> > =C2=A0	for (i =3D 0; i < ARRAY_SIZE(bmc150_accel_chip_info_tbl);
> > i++) {
> > =C2=A0		if (bmc150_accel_chip_info_tbl[i].chip_id =3D=3D val)
> > {
> > =C2=A0			data->chip_info =3D
> > &bmc150_accel_chip_info_tbl[i];
> > @@ -1499,7 +1511,7 @@ static int bmc150_accel_chip_init(struct
> > bmc150_accel_data *data)
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	if (!data->chip_info) {
> > -		dev_err(data->dev, "Invalid chip %x\n", val);
> > +		dev_err(dev, "Invalid chip %x\n", val);
> > =C2=A0		return -ENODEV;
> > =C2=A0	}
> > =C2=A0
> > @@ -1516,8 +1528,7 @@ static int bmc150_accel_chip_init(struct
> > bmc150_accel_data *data)
> > =C2=A0	ret =3D regmap_write(data->regmap,
> > BMC150_ACCEL_REG_PMU_RANGE,
> > =C2=A0			=C2=A0=C2=A0=C2=A0BMC150_ACCEL_DEF_RANGE_4G);
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev,
> > -					"Error writing
> > reg_pmu_range\n");
> > +		dev_err(dev, "Error writing reg_pmu_range\n");
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > @@ -1535,8 +1546,7 @@ static int bmc150_accel_chip_init(struct
> > bmc150_accel_data *data)
> > =C2=A0			=C2=A0=C2=A0=C2=A0BMC150_ACCEL_INT_MODE_LATCH_INT |
> > =C2=A0			=C2=A0=C2=A0=C2=A0BMC150_ACCEL_INT_MODE_LATCH_RESET);
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev,
> > -			"Error writing reg_int_rst_latch\n");
> > +		dev_err(dev, "Error writing reg_int_rst_latch\n");
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > @@ -1556,7 +1566,6 @@ int bmc150_accel_core_probe(struct device
> > *dev, struct regmap *regmap, int irq,
> > =C2=A0
> > =C2=A0	data =3D iio_priv(indio_dev);
> > =C2=A0	dev_set_drvdata(dev, indio_dev);
> > -	data->dev =3D dev;
> > =C2=A0	data->irq =3D irq;
> > =C2=A0
> > =C2=A0	data->regmap =3D regmap;
> > @@ -1580,13 +1589,13 @@ int bmc150_accel_core_probe(struct device
> > *dev, struct regmap *regmap, int irq,
> > =C2=A0					=C2=A0bmc150_accel_trigger_hand
> > ler,
> > =C2=A0					=C2=A0&bmc150_accel_buffer_ops)
> > ;
> > =C2=A0	if (ret < 0) {
> > -		dev_err(data->dev, "Failed: iio triggered buffer
> > setup\n");
> > +		dev_err(dev, "Failed: iio triggered buffer
> > setup\n");
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	if (data->irq > 0) {
> > =C2=A0		ret =3D devm_request_threaded_irq(
> > -						data->dev, data-
> > >irq,
> > +						dev, data->irq,
> > =C2=A0						bmc150_accel_irq_h
> > andler,
> > =C2=A0						bmc150_accel_irq_t
> > hread_handler,
> > =C2=A0						IRQF_TRIGGER_RISIN
> > G,
> > @@ -1604,7 +1613,7 @@ int bmc150_accel_core_probe(struct device
> > *dev, struct regmap *regmap, int irq,
> > =C2=A0		ret =3D regmap_write(data->regmap,
> > BMC150_ACCEL_REG_INT_RST_LATCH,
> > =C2=A0				=C2=A0=C2=A0=C2=A0BMC150_ACCEL_INT_MODE_LATCH_RES
> > ET);
> > =C2=A0		if (ret < 0) {
> > -			dev_err(data->dev, "Error writing
> > reg_int_rst_latch\n");
> > +			dev_err(dev, "Error writing
> > reg_int_rst_latch\n");
> > =C2=A0			goto err_buffer_cleanup;
> > =C2=A0		}
> > =C2=A0
> > @@ -1653,9 +1662,9 @@ int bmc150_accel_core_remove(struct device
> > *dev)
> > =C2=A0
> > =C2=A0	iio_device_unregister(indio_dev);
> > =C2=A0
> > -	pm_runtime_disable(data->dev);
> > -	pm_runtime_set_suspended(data->dev);
> > -	pm_runtime_put_noidle(data->dev);
> > +	pm_runtime_disable(dev);
> > +	pm_runtime_set_suspended(dev);
> > +	pm_runtime_put_noidle(dev);
> > =C2=A0
> > =C2=A0	bmc150_accel_unregister_triggers(data,
> > BMC150_ACCEL_TRIGGERS - 1);
> > =C2=A0
> > @@ -1704,7 +1713,7 @@ static int
> > bmc150_accel_runtime_suspend(struct device *dev)
> > =C2=A0	struct bmc150_accel_data *data =3D iio_priv(indio_dev);
> > =C2=A0	int ret;
> > =C2=A0
> > -	dev_dbg(data->dev,=C2=A0=C2=A0__func__);
> > +	dev_dbg(dev,=C2=A0=C2=A0__func__);
> > =C2=A0	ret =3D bmc150_accel_set_mode(data,
> > BMC150_ACCEL_SLEEP_MODE_SUSPEND, 0);
> > =C2=A0	if (ret < 0)
> > =C2=A0		return -EAGAIN;
> > @@ -1719,7 +1728,7 @@ static int bmc150_accel_runtime_resume(struct
> > device *dev)
> > =C2=A0	int ret;
> > =C2=A0	int sleep_val;
> > =C2=A0
> > -	dev_dbg(data->dev,=C2=A0=C2=A0__func__);
> > +	dev_dbg(dev,=C2=A0=C2=A0__func__);
> > =C2=A0
> > =C2=A0	ret =3D bmc150_accel_set_mode(data,
> > BMC150_ACCEL_SLEEP_MODE_NORMAL, 0);
> > =C2=A0	if (ret < 0)
> >=20
