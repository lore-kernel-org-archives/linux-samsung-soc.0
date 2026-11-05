Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868808;
	b=Th++SmocyDuWK8EkLZcD3CJaeKicn8S9ZkXGAN2xCz2/p7eUJRzRbCUpm1iVImC5ZPO+
	 GHoAQWjSsE5/hNdS6zAebwN2S9LtICULU3S52onHBfBbAzuwIBOA2Jf887dB4iYKx6H0+
	 9t1gT7wn2pRZDWAQ3WOabgGgKXqOvFljee4/jaob1EgB+pLogyXmwgZRYNh4hdwCkPmFi
	 NC0LVtBcX8v8fI0Q1IQ8aDId2Ib0Q2zi9tou8Hqry7zFCA9icGcAZg7r29ZMen3E0wFSM
	 pZeK92hwbXesMTytK5hKg5qPL13aGrorJE29v3g1jFoymZRSz8vupPJQHrorzLw4usQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868808;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=M/kDgzAlqHjxLUPza8aSEnwmJgf7ioPTzemjTUlAEYo=;
	b=zm0Dd1d3xk733bagXdWZbPgn4og8UQsBBfn3CREtn7hUosWHObbiWybKGlLh0z6g+bqN
	 2qzdAb4lQiNn4rJs0IHOnCR2LinRM1q8HiEu6BJKS9IqyojpppwHnbXABMzczdhzMs4yM
	 Z9qZ0RP2CgcezIrx6Y8QqNQpwNxhkOynRJFair+NuHFthlnbTh7u2uQc4fjb66kE+QmiR
	 RvlJYhbw5vtl0jedkEgD8Wo88jdq5LSVxKyuxeftQuidOgivaXaTrGRT6V0ckOnJNbAy1
	 8G4dsMsEmhu9i1aWY0LZd2QMBxskfQm8jtle8XyuFfcbsG3JHaN0OI1OpSte1siiDwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tp5COg9e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B411C606A31B;
	Thu,  5 Nov 2026 08:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tp5COg9e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8981F00919;
	Thu,  5 Nov 2026 08:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793868807;
	bh=M/kDgzAlqHjxLUPza8aSEnwmJgf7ioPTzemjTUlAEYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tp5COg9ea+pwc+JaE/ure9QOIXPVPTd+MK5k/FscIjDFsajZLRotk8KfK3H9HbMpP
	 zoqKvnPJcRZDOt8Fi6cGkmTY5Na61BcOHm9Sy/mortW9VlrD3rO6/8nZHAS6zyYd2N
	 SPw2rIgC6lkD6oNjwRqw6ZN4Ii0WOro6kDZqay19kVukaQeqEAtkTpY2hPSfvd7gcb
	 YZUoI2IQasW60N5JnwGKtdSaP8tNBEEsyzrKzY5rvoVEgpaJZuODZMsENU9F/zRRjB
	 3EswgSP4O1koRAJJmIHkSxRGzbxRewJtlqgbZMHVC8pRXmXzAgKtuiPuWZeQGlbxHU
	 MsJDMLL95VVTg==
Date: Thu, 5 Nov 2026 08:53:21 +0000
From: Lee Jones <lee@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>,
	mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC
 regulators
Message-ID: <20261105085321.GG1650678@google.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
 <20261104181429.GE1650678@google.com>
 <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>

On Wed, 04 Nov 2026, Dmitry Torokhov wrote:

> Hi Lee,
> 
> On Wed, Nov 04, 2026 at 06:14:29PM +0000, Lee Jones wrote:
> > On Sat, 24 Oct 2026, Dmitry Torokhov wrote:
> > > +static int wm831x_add_devices(struct wm831x *wm831x, int wm831x_num,
> > > +			      const struct mfd_cell *cells, int num_cells)
> > > +{
> > > +	struct wm831x_pdata *pdata = &wm831x->pdata;
> > > +	int i;
> > > +
> > > +	struct mfd_cell *local_cells __free(kfree) =
> > > +		kmemdup_array(cells, num_cells, sizeof(*cells), GFP_KERNEL);
> > > +	if (!local_cells)
> > > +		return -ENOMEM;
> > > +
> > > +	for (i = 0; i < num_cells; i++) {
> > > +		struct mfd_cell *cell = &local_cells[i];
> > > +
> > > +		if (strcmp(cell->name, "wm831x-buckv") == 0) {
> > > +			int id = cell->id - 1;
> > > +
> > > +			if (id >= 0 && id < WM831X_MAX_DCDC)
> > > +				cell->swnode = pdata->dcdc_swnodes[id];
> > > +		}
> > > +	}
> >
> > I can't begin to tell you how much I hate this.
> >
> > Why are we duplicating massive static const structs just to add a S/W
> > node?  Is there no other way we can do this statically?
> 
> The software node itself is defined statically in the board file
> (crag_dcdc1_swnode in arch/arm/mach-s3c/mach-crag6410.c in patch 2/4),
> as it describes board-specific and PMIC-instance-specific wiring -
> specifically the host SoC GPIO wired to the PMIC's DVS pin (GPK(0) on
> Cragganmore 6410).
> 
> Because wm831x-core.c is a generic PMIC driver that can be instantiated
> on different boards or even multiple times on the same board (for
> example, Cragganmore 6410 has two WM831x PMIC instances, only one of
> which has a DVS GPIO wired to DCDC1), the shared static mfd_cell arrays
> in wm831x-core.c cannot point to a board's software node at compile
> time.
> 
> Note that local_cells is annotated with __free(kfree), so the duplicate
> array only lives for the duration of the mfd_add_devices() call (which
> makes its own per-device copy of each mfd_cell anyway) and is freed
> immediately before wm831x_add_devices() returns.
> 
> > Since pdata is being populated already, why not just pass that on to the
> > consuming child device (the regulator)?
> 
> The regulator driver (wm831x_buckv_dvs_init() in
> drivers/regulator/wm831x-dcdc.c) acquires the DVS GPIO using
> devm_gpiod_get(&pdev->dev, "dvs", ...). When converting the board file
> away from legacy gpiod_lookup_table to software nodes (to drop the
> fragile MFD device name matching and fix the GPIO chip label lookup),
> gpiolib resolves the "dvs-gpios" property against the consumer device's
> fwnode (&pdev->dev), so the software node needs to be attached to the
> wm831x-buckv platform device.
> 
> In v2 of this series I actually tried passing the software_node pointer
> through wm831x_buckv_pdata and attaching it to &pdev->dev inside the
> regulator driver's probe() [1]. However, attaching a software node to
> an already-registered platform device inside probe() is awkward and
> requires manual teardown in the child driver, whereas mfd-core already
> has built-in support for cell->swnode in mfd_add_device() (attaching
> the node via device_add_software_node() before platform_device_add(),
> and cleaning it up via device_remove_software_node() on error or
> removal). Populating cell->swnode lets mfd-core manage the software
> node lifecycle cleanly and keeps the regulator driver untouched.

Why do you need to attach the software_node to &pdev->dev at all?

All of the other DVS configuration (dvs_control_src, dvs_init_state) is
already passed to wm831x_buckv_dvs_init() via pdata.  If you put the
software node pointer in 'wm831x_buckv_pdata' (with the rest of the DVS
parameters, where it belongs), wm831x_buckv_dvs_init() can simply use
devm_fwnode_gpiod_get() to fetch it.

This then requires no device_add_software_node(), no manual tear-down in
the regulator driver and no "middle-man" changes to MFD at all.

> If you prefer not to kmemdup the full cell table, another option would
> be to split the buckv cells out of the main wm831x cell arrays and
> register them via a separate mfd_add_devices() call, though that seemed
> more intrusive across wm8310/wm8311/wm8312/wm8320. Please let me know
> what you would prefer here.

If there is a good reason why the above cannot be done in the regulator
driver (which I doubt), then yes, factoring the two identical
wm831x-buckv cells out of wm8310_devs/wm8311_devs/wm8312_devs/wm8320_devs
(just like touch_devs, rtc_devs and backlight_devs already are) is still
far better than kmemdup'ing the static const tables and matching cell
names with strcmp() in a loop.

> [1] https://lore.kernel.org/all/20260708-samsung-kp-v2-7-3c6ed4c9b3b6@gmail.com/

[2] Code talks, BS walks  =:-)

diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index 2264beef6dda..9657d74ca0c5 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -456,9 +456,21 @@ static struct pca953x_platform_data crag6410_pca_data = {
 	.irq_base	= -1,
 };
 
+static const struct property_entry crag_dcdc1_properties[] = {
+	PROPERTY_ENTRY_GPIO("dvs-gpios", SAMSUNG_GPIO_NODE('K'), 0, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node crag_dcdc1_swnode = {
+	.name = "wm831x-buckv-dcdc1",
+	.properties = crag_dcdc1_properties,
+};
+
 /* VDDARM is controlled by DVS1 connected to GPK(0) */
 static struct wm831x_buckv_pdata vddarm_pdata = {
 	.dvs_control_src = 1,
+	.swnode = &crag_dcdc1_swnode,
 };
 
 static struct regulator_consumer_supply vddarm_consumers[] = {
@@ -656,24 +668,6 @@ static struct wm831x_pdata crag_pmic_pdata = {
 	.touch = &touch_pdata,
 };
 
-/*
- * VDDARM is eventually ending up as a regulator hanging on the MFD cell device
- * "wm831x-buckv.1" spawn from drivers/mfd/wm831x-core.c.
- *
- * From the note on the platform data we can see that this is clearly DVS1
- * and assigned as dcdc1 resource to the MFD core which sets .id of the cell
- * spawning the DVS1 platform device to 1, then the cell platform device
- * name is calculated from 10*instance + id resulting in the device name
- * "wm831x-buckv.11"
- */
-static struct gpiod_lookup_table crag_pmic_gpiod_table = {
-	.dev_id = "wm831x-buckv.11",
-	.table = {
-		GPIO_LOOKUP("GPIOK", 0, "dvs", GPIO_ACTIVE_HIGH),
-		{ },
-	},
-};
-
 static struct i2c_board_info i2c_devs0[] = {
 	{ I2C_BOARD_INFO("24c08", 0x50), },
 	{ I2C_BOARD_INFO("tca6408", 0x20),
@@ -931,7 +925,7 @@ static void __init crag6410_machine_init(void)
 	s3c_fb_set_platdata(&crag6410_lcd_pdata);
 	dwc2_hsotg_set_platdata(&crag6410_hsotg_pdata);
 
-	gpiod_add_lookup_table(&crag_pmic_gpiod_table);
+	software_node_register(&crag_dcdc1_swnode);
 	i2c_register_board_info(0, i2c_devs0, ARRAY_SIZE(i2c_devs0));
 	gpiod_add_lookup_table(&crag_wm1250_ev1_gpiod_table);
 	i2c_register_board_info(1, i2c_devs1, ARRAY_SIZE(i2c_devs1));
diff --git a/drivers/regulator/wm831x-dcdc.c b/drivers/regulator/wm831x-dcdc.c
index 834d7c181971..957da3195974 100644
--- a/drivers/regulator/wm831x-dcdc.c
+++ b/drivers/regulator/wm831x-dcdc.c
@@ -16,6 +16,7 @@
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/gpio/consumer.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 
 #include <linux/mfd/wm831x/core.h>
@@ -330,6 +331,8 @@ static void wm831x_buckv_dvs_init(struct platform_device *pdev,
 				 struct wm831x_buckv_pdata *pdata)
 {
 	struct wm831x *wm831x = dcdc->wm831x;
+	struct fwnode_handle *fwnode;
+	enum gpiod_flags flags;
 	int ret;
 	u16 ctrl;
 
@@ -341,8 +344,15 @@ static void wm831x_buckv_dvs_init(struct platform_device *pdev,
 	*/
 	dcdc->dvs_gpio_state = pdata->dvs_init_state;
 
-	dcdc->dvs_gpiod = devm_gpiod_get(&pdev->dev, "dvs",
-			dcdc->dvs_gpio_state ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW);
+	flags = dcdc->dvs_gpio_state ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
+	if (pdata->swnode) {
+		fwnode = software_node_fwnode(pdata->swnode);
+		dcdc->dvs_gpiod = devm_fwnode_gpiod_get(&pdev->dev, fwnode,
+						"dvs", flags, dcdc->name);
+	} else {
+		dcdc->dvs_gpiod = devm_gpiod_get(&pdev->dev, "dvs", flags);
+	}
+
 	if (IS_ERR(dcdc->dvs_gpiod)) {
 		dev_err(wm831x->dev, "Failed to get %s DVS GPIO: %ld\n",
 			dcdc->name, PTR_ERR(dcdc->dvs_gpiod));
diff --git a/include/linux/mfd/wm831x/pdata.h b/include/linux/mfd/wm831x/pdata.h
index 75aa94dadf1c..49501f155cc5 100644
--- a/include/linux/mfd/wm831x/pdata.h
+++ b/include/linux/mfd/wm831x/pdata.h
@@ -12,6 +12,7 @@
 
 struct wm831x;
 struct regulator_init_data;
+struct software_node;
 
 struct wm831x_backlight_pdata {
 	int isink;     /** ISINK to use, 1 or 2 */
@@ -50,6 +51,7 @@ struct wm831x_buckv_pdata {
 	int dvs_control_src; /** Hardware DVS source to use (1 or 2) */
 	int dvs_init_state;  /** DVS state to expect on startup */
 	int dvs_state_gpio;  /** CPU GPIO to use for monitoring status */
+	const struct software_node *swnode; /** Software node for DVS GPIOs */
 };
 
 /* Sources for status LED configuration.  Values are register values

-- 
Lee Jones
