From: Inki Dae <inki.dae@samsung.com>
Subject: RE: [PATCH 0/7] drm/exynos: move hdmiphy related code to hdmiphy driver
Date: Fri, 30 Aug 2013 17:33:26 +0900
Message-ID: <02dd01cea55b$98d117d0$ca734770$%dae@samsung.com>
References: <1377845974-28373-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:49893 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752529Ab3H3Id3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Aug 2013 04:33:29 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MSC00MYJ53RZRC0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 30 Aug 2013 17:33:27 +0900 (KST)
In-reply-to: <1377845974-28373-1-git-send-email-rahul.sharma@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Rahul Sharma' <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, tomasz.figa@gmail.com, s.nawrocki@samsung.com, joshi@samsung.com, r.sh.open@gmail.com

Hi Rahul.

Thanks for your patch set.

I had just quick review to all patch series. And I think we could fully hide
hdmiphy interfaces,
exynos_hdmiphy_enable/disable/check_mode/set_mode/conf_apply, from hdmi
driver.
That may be prototyped like below,

at exynos_hdmi.h

/* Define hdmiphy callbacks. */
struct exynos_hdmiphy_ops {
	void (*enable)(struct device *dev);
	void (*disable)(struct device *dev);
	int (*check_mode)(struct device *dev, struct drm_display_mode
*mode);
	int (*set_mode)(struct device *dev, struct drm_display_mode *mode);
	int (*apply)(struct device *dev);
};


at exynos_hdmi.c

/*
  * Add a new structure for hdmi driver data.
  * type could be HDMI_TYPE13 or HDMI_TYPE14.
  * i2c_hdmiphy could be true or false: true means that current hdmi device
uses i2c
  * based hdmiphy device, otherwise platform device based one.
  */
struct hdmi_drv_data {
	unsigned int type;
	unsigned int i2c_hdmiphy;
};

...

/* Add new members to hdmi context. */
struct hdmi_context {
	...
	struct hdmi_drv_data *drv_data;
	struct hdmiphy_ops *ops;
	...
};


/* Add hdmi device data according Exynos SoC. */
static struct hdmi_drv_data exynos4212_hdmi_drv_data = {
	.type = HDMI_TYPE14,
	.i2c_hdmiphy = true
};

static struct hdmi_drv_data exynos5420_hdmi_drv_data = {
	.type = HDMI_TYPE14,
	.i2c_hdmiphy = false
};


static struct of_device_id hdmi_match_types[] = {
	{
		.compatible = "samsung,exynos4212-hdmi",
		.data		= (void *)&exynos4212_hdmi_drv_data,
	}, {
	...

		.compatible = "samsung,exynos5420-hdmi",
		.data		= (void *)&exynos5420_hdmi_drv_data,
	}, {
	}
};

/* the below example function shows how hdmiphy interfaces can be hided from
hdmi driver. */
static void hdmi_mode_set(...)
{
	...
	hdata->ops->set_mode(hdata->hdmiphy_dev, mode);
}

static int hdmi_get_phy_device(struct hdmi_context *hdata)
{
	struct hdmi_drv_data *data = hdata->drv_data;

	...
	/* Register hdmiphy driver according to i2c_hdmiphy value. */
	ret = exynos_hdmiphy_driver_register(data->i2c_hdmiphy);
	...
	/* Get hdmiphy driver ops according to i2c_hdmiphy value. */
	hdata->ops = exynos_hdmiphy_get_ops(data->i2c_hdmiphy);
	...
}


at exynos_hdmiphy.c

/* Define hdmiphy ops respectively. */
struct exynos_hdmiphy_ops hdmiphy_i2c_ops = {
	.enable = exynos_hdmiphy_i2c_enable,
	.disable = exynos_hdmiphy_i2c_disable,
	...
};

struct exynos_hdmiphy_ops hdmiphy_platdev_ops = {
	.enable = exynos_hdmiphy_platdev_enable,
	.disable = exynos_hdmiphy_platdev_disable,
	...
};

struct exynos_hdmiphy_ops *exynos_hdmiphy_get_ops(unsigned int i2c_hdmiphy)
{
	/* Return hdmiphy ops appropriately according to i2c_hdmiphy. */
	if (i2c_hdmiphy)
		return &hdmiphy_i2c_ops;

	return &hdmiphy_platdev_ops;
}

int exynos_hdmiphy_driver_register(unsigned int i2c_hdmiphy)
{
	...
	/* Register hdmiphy driver appropriately according to i2c_hdmiphy.
*/
	if (i2c_hdmiphy) {
		ret = i2c_add_driver(&hdmiphy_i2c_driver);
		...
	} else {
		ret = platform_driver_register(&hdmiphy_platform_driver);
		...
	}

	return ret;		
}

Thanks,
Inki Dae

> -----Original Message-----
> From: Rahul Sharma [mailto:rahul.sharma@samsung.com]
> Sent: Friday, August 30, 2013 3:59 PM
> To: linux-samsung-soc@vger.kernel.org; dri-devel@lists.freedesktop.org
> Cc: kgene.kim@samsung.com; sw0312.kim@samsung.com; inki.dae@samsung.com;
> seanpaul@chromium.org; l.stach@pengutronix.de; tomasz.figa@gmail.com;
> s.nawrocki@samsung.com; joshi@samsung.com; r.sh.open@gmail.com; Rahul
> Sharma
> Subject: [PATCH 0/7] drm/exynos: move hdmiphy related code to hdmiphy
> driver
> 
> Currently, exynos hdmiphy operations and configs are kept
> inside the hdmi driver. Hdmiphy related code is tightly
> coupled with hdmi IP driver.
> 
> This series also removes hdmiphy dummy clock for hdmiphy
> and replace it with Phy PMU Control from the hdmiphy driver.
> 
> At the end, support for exynos5420 hdmiphy is added to the
> hdmiphy driver which is a platform device.
> 
> Drm related paches are based on exynos-drm-next branch at
> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
> 
> Arch patches are dependent on
> http://www.mail-archive.com/linux-samsung-
> soc@vger.kernel.org/msg22195.html
> 
> Rahul Sharma (7):
>   drm/exynos: move hdmiphy related code to hdmiphy driver
>   drm/exynos: remove dummy hdmiphy clock
>   drm/exynos: add hdmiphy pmu bit control in hdmiphy driver
>   drm/exynos: add support for exynos5420 hdmiphy
>   exynos/drm: fix ddc i2c device probe failure
>   ARM: dts: update hdmiphy dt node for exynos5250
>   ARM: dts: update hdmiphy dt node for exynos5420
> 
>  .../devicetree/bindings/video/exynos_hdmi.txt      |    2 +
>  .../devicetree/bindings/video/exynos_hdmiphy.txt   |    6 +
>  arch/arm/boot/dts/exynos5250-smdk5250.dts          |    9 +-
>  arch/arm/boot/dts/exynos5420.dtsi                  |   12 +
>  drivers/gpu/drm/exynos/exynos_ddc.c                |    5 +
>  drivers/gpu/drm/exynos/exynos_drm_hdmi.h           |   13 +
>  drivers/gpu/drm/exynos/exynos_hdmi.c               |  353 ++--------
>  drivers/gpu/drm/exynos/exynos_hdmiphy.c            |  738
> +++++++++++++++++++-
>  drivers/gpu/drm/exynos/regs-hdmiphy.h              |   35 +
>  9 files changed, 868 insertions(+), 305 deletions(-)
>  create mode 100644 drivers/gpu/drm/exynos/regs-hdmiphy.h
> 
> --
> 1.7.10.4
