From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 0/7] drm/exynos: move hdmiphy related code to hdmiphy driver
Date: Mon, 2 Sep 2013 14:36:15 +0530
Message-ID: <CAPdUM4PE+gtsi+_notRO6WUNeXgTx5TVGghxZ9htaJ_wgXHaSA@mail.gmail.com>
References: <1377845974-28373-1-git-send-email-rahul.sharma@samsung.com>
	<02dd01cea55b$98d117d0$ca734770$%dae@samsung.com>
	<CAPdUM4ORmf9P_HK7ajg6yw7mCaKF_eM=ZsbY7fPPMMbPNLG_iQ@mail.gmail.com>
	<018b01cea79a$6fbdb970$4f392c50$%dae@samsung.com>
	<CAPdUM4MByf+mjEvHhPECtOzD6SMbeeJdNsEJmvCRoj7_hX2Bcg@mail.gmail.com>
	<01a401cea7ad$247ff730$6d7fe590$%dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:44240 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758154Ab3IBJGR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Sep 2013 05:06:17 -0400
Received: by mail-wi0-f176.google.com with SMTP id cb5so401435wib.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Sep 2013 02:06:15 -0700 (PDT)
In-Reply-To: <01a401cea7ad$247ff730$6d7fe590$%dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene.kim@samsung.com>, "sw0312.kim" <sw0312.kim@samsung.com>, Sean Paul <seanpaul@chromium.org>, Lucas Stach <l.stach@pengutronix.de>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, sunil joshi <joshi@samsung.com>

On 2 September 2013 12:52, Inki Dae <inki.dae@samsung.com> wrote:
>
>
>> -----Original Message-----
>> From: Rahul Sharma [mailto:r.sh.open@gmail.com]
>> Sent: Monday, September 02, 2013 3:28 PM
>> To: Inki Dae
>> Cc: Rahul Sharma; linux-samsung-soc; dri-devel@lists.freedesktop.org;
>> Kukjin Kim; sw0312.kim; Sean Paul; Lucas Stach; Tomasz Figa; Sylwester
>> Nawrocki; sunil joshi
>> Subject: Re: [PATCH 0/7] drm/exynos: move hdmiphy related code to hdmiphy
>> driver
>>
>> On 2 September 2013 10:38, Inki Dae <inki.dae@samsung.com> wrote:
>> > Hi Rahul,
>> >
>> >> -----Original Message-----
>> >> From: linux-samsung-soc-owner@vger.kernel.org [mailto:linux-samsung-
>> soc-
>> >> owner@vger.kernel.org] On Behalf Of Rahul Sharma
>> >> Sent: Friday, August 30, 2013 7:06 PM
>> >> To: Inki Dae
>> >> Cc: Rahul Sharma; linux-samsung-soc; dri-devel@lists.freedesktop.org;
>> >> Kukjin Kim; sw0312.kim; Sean Paul; Lucas Stach; Tomasz Figa; Sylwester
>> >> Nawrocki; sunil joshi
>> >> Subject: Re: [PATCH 0/7] drm/exynos: move hdmiphy related code to
>> hdmiphy
>> >> driver
>> >>
>> >> Thanks Mr. Dae,
>> >>
>> >> I have some points for discussion.
>> >>
>> >> On 30 August 2013 14:03, Inki Dae <inki.dae@samsung.com> wrote:
>> >> > Hi Rahul.
>> >> >
>> >> > Thanks for your patch set.
>> >> >
>> >> > I had just quick review to all patch series. And I think we could
>> fully
>> >> hide
>> >> > hdmiphy interfaces,
>> >> > exynos_hdmiphy_enable/disable/check_mode/set_mode/conf_apply, from
>> hdmi
>> >> > driver.
>> >> > That may be prototyped like below,
>> >> >
>> >> > at exynos_hdmi.h
>> >> >
>> >> > /* Define hdmiphy callbacks. */
>> >> > struct exynos_hdmiphy_ops {
>> >> >         void (*enable)(struct device *dev);
>> >> >         void (*disable)(struct device *dev);
>> >> >         int (*check_mode)(struct device *dev, struct drm_display_mode
>> >> > *mode);
>> >> >         int (*set_mode)(struct device *dev, struct drm_display_mode
>> > *mode);
>> >> >         int (*apply)(struct device *dev);
>> >> > };
>> >> >
>> >>
>> >> Above looks fine to me. I will hide the ops as you suggested.
>> >>
>> >> >
>> >> > at exynos_hdmi.c
>> >> >
>> >> > /*
>> >> >   * Add a new structure for hdmi driver data.
>> >> >   * type could be HDMI_TYPE13 or HDMI_TYPE14.
>> >> >   * i2c_hdmiphy could be true or false: true means that current hdmi
>> >> device
>> >> > uses i2c
>> >> >   * based hdmiphy device, otherwise platform device based one.
>> >> >   */
>> >> > struct hdmi_drv_data {
>> >> >         unsigned int type;
>> >> >         unsigned int i2c_hdmiphy;
>> >> > };
>> >> >
>> >> > ...
>> >> >
>> >> > /* Add new members to hdmi context. */
>> >> > struct hdmi_context {
>> >> >         ...
>> >> >         struct hdmi_drv_data *drv_data;
>> >> >         struct hdmiphy_ops *ops;
>> >> >         ...
>> >> > };
>> >> >
>> >> >
>> >> > /* Add hdmi device data according Exynos SoC. */
>> >> > static struct hdmi_drv_data exynos4212_hdmi_drv_data = {
>> >> >         .type = HDMI_TYPE14,
>> >> >         .i2c_hdmiphy = true
>> >> > };
>> >> >
>> >> > static struct hdmi_drv_data exynos5420_hdmi_drv_data = {
>> >> >         .type = HDMI_TYPE14,
>> >> >         .i2c_hdmiphy = false
>> >> > };
>> >> >
>> >> >
>> >> > static struct of_device_id hdmi_match_types[] = {
>> >> >         {
>> >> >                 .compatible = "samsung,exynos4212-hdmi",
>> >> >                 .data           = (void *)&exynos4212_hdmi_drv_data,
>> >> >         }, {
>> >> >         ...
>> >> >
>> >> >                 .compatible = "samsung,exynos5420-hdmi",
>> >> >                 .data           = (void *)&exynos5420_hdmi_drv_data,
>> >> >         }, {
>> >> >         }
>> >> > };
>> >> >
>> >> > /* the below example function shows how hdmiphy interfaces can be
>> hided
>> >> from
>> >> > hdmi driver. */
>> >> > static void hdmi_mode_set(...)
>> >> > {
>> >> >         ...
>> >> >         hdata->ops->set_mode(hdata->hdmiphy_dev, mode);
>> >>
>> >> This looks fine.
>> >>
>> >> > }
>> >> >
>> >> > static int hdmi_get_phy_device(struct hdmi_context *hdata)
>> >> > {
>> >> >         struct hdmi_drv_data *data = hdata->drv_data;
>> >> >
>> >> >         ...
>> >> >         /* Register hdmiphy driver according to i2c_hdmiphy value. */
>> >> >         ret = exynos_hdmiphy_driver_register(data->i2c_hdmiphy);
>> >> >         ...
>> >> >         /* Get hdmiphy driver ops according to i2c_hdmiphy value. */
>> >> >         hdata->ops = exynos_hdmiphy_get_ops(data->i2c_hdmiphy);
>> >> >         ...
>> >> > }
>> >> >
>> >> >
>> >> > at exynos_hdmiphy.c
>> >> >
>> >> > /* Define hdmiphy ops respectively. */
>> >> > struct exynos_hdmiphy_ops hdmiphy_i2c_ops = {
>> >> >         .enable = exynos_hdmiphy_i2c_enable,
>> >> >         .disable = exynos_hdmiphy_i2c_disable,
>> >> >         ...
>> >> > };
>> >> >
>> >> > struct exynos_hdmiphy_ops hdmiphy_platdev_ops = {
>> >> >         .enable = exynos_hdmiphy_platdev_enable,
>> >> >         .disable = exynos_hdmiphy_platdev_disable,
>> >> >         ...
>> >> > };
>> >>
>> >> Actually, Ops for Hdmiphy I2c and platform devices are exactly
>> >> same. We don't need 2 sets. Only difference is in static function to
>> >> write configuration values to phy. Based on i2c_verify_client(hdata-
>> >dev),
>> >> we use i2c_master_send or writeb.
>> >>
>> >> >
>> >> > struct exynos_hdmiphy_ops *exynos_hdmiphy_get_ops(unsigned int
>> >> i2c_hdmiphy)
>> >> > {
>> >> >         /* Return hdmiphy ops appropriately according to i2c_hdmiphy.
>> */
>> >> >         if (i2c_hdmiphy)
>> >> >                 return &hdmiphy_i2c_ops;
>> >> >
>> >> >         return &hdmiphy_platdev_ops;
>> >> > }
>> >>
>> >> We don't need i2c_hdmiphy flag from the hdmi driver. After probe,
>> >> this information is available in hdmiphy driver itself.
>> >>
>> >> >
>> >> > int exynos_hdmiphy_driver_register(unsigned int i2c_hdmiphy)
>> >> > {
>> >> >         ...
>> >> >         /* Register hdmiphy driver appropriately according to
>> > i2c_hdmiphy.
>> >> > */
>> >> >         if (i2c_hdmiphy) {
>> >> >                 ret = i2c_add_driver(&hdmiphy_i2c_driver);
>> >> >                 ...
>> >> >         } else {
>> >> >                 ret =
>> > platform_driver_register(&hdmiphy_platform_driver);
>> >> >                 ...
>> >> >         }
>> >> >
>> >>
>> >> Here i2c_hdmiphy flag helps in avoiding registering both i2c
>> >> and platform drivers for phy. But is it a concern that we should
>> >> not register 2 drivers on different buses for single hw device. I am
>> >> still not clear on this.
>> >>
>> >> Otherwise we do not need to maintain i2c_hdmiphy flag.
>> >>
>> >> Secondly, we always have registration of i2c driver for ddc and
>> >> hdmiphy driver in hdmi probe. It works. I have also tested above
>> >> series for 5420 and 5250 smdk board. There are no issues.
>> >>
>> >
>> > Can you re-check it? I guess platform_driver_register function would be
>> > failed. Actually, I had faced with same issue at hdmi initial work. And
>> then
>> > only thing we have to discuss  is different buses issue on single hw
>> device
>> > if the above case really works fine.
>> >
>> Mr. dae,
>>
>> I have re-confirmed. It is working fine. No failure during registering
>> platform
>> device. Probe hits immediately after registration. I tried 8~9 times.
>> No failure.
>> see logs:
>>
>> # dmesg | grep -i RSH
>> [    0.895000] [RSH][hdmi_probe][1719] Starting phy registeration
>> [    0.900000] [RSH][hdmiphy_platform_device_probe Enter][644]
>> [    0.905000] [RSH][hdmiphy_platform_device_probe Exit Success][683]
>> [    0.910000] [RSH][exynos_hdmiphy_driver_register][768] Phy
>> registeration Success.
>> [    0.915000] [RSH][hdmi_probe][1729] Phy registeration completed.
>>
>
> Great. I will also re-check it.
>
>> > For this, my opinion is to separate the hdmiphy driver into i2c based
>> and
>> > platform device based drivers; they include same common header file
>> > containing phy configuration data. And it makes hdmi driver call
>> > exynos_hdmiphy_driver_register function in i2c based hdmiphy or platform
>> > device based hdmiphy drivers according to hdmi driver data.
>> >
>>
>> I am fine with it. We can register hdmiphy-i2c or hdmiphy-platform
>> driver based on the flag from hdmi driver. But we can still keep both
>> the drivers in exynos_hdmiphy.c. file and let them share most of the
>> other callbacks.
>>
>
> Is there any mainline driver that keeps two bus drivers; i2c and platform
> device, in one file? I'm not sure that this is a good way. So it seems good

I haven't come across any such mainline driver. I always have this doubt.
If it is not fitting properly, I will implement 2 different drivers in 2 files
(exynos_hdmiphy_i2c.c and exynos_hdmiphy_platform.c).

Regards,
Rahul Sharma.

> to keep two hdmiphy drivers: One is based on i2c bus, and other is based on
> platform device. Anyway, we should keep different type's drivers because
> Exynos SoC has different type's hdmiphy IP; based on i2c or memory mapped
> IO.
>
> Thanks,
> Inki Dae
>
>> regards,
>> Rahul Sharma.
>>
>> > However, we may need to re-design it if the above case is failed.
>> >
>> > Thanks,
>> > Inki Dae
>> >
>> >
>> >> regards,
>> >> Rahul Sharma.
>> >>
>> >> >         return ret;
>> >> > }
>> >> >
>> >> > Thanks,
>> >> > Inki Dae
>> >> >
>> >> >> -----Original Message-----
>> >> >> From: Rahul Sharma [mailto:rahul.sharma@samsung.com]
>> >> >> Sent: Friday, August 30, 2013 3:59 PM
>> >> >> To: linux-samsung-soc@vger.kernel.org; dri-
>> devel@lists.freedesktop.org
>> >> >> Cc: kgene.kim@samsung.com; sw0312.kim@samsung.com;
>> > inki.dae@samsung.com;
>> >> >> seanpaul@chromium.org; l.stach@pengutronix.de;
> tomasz.figa@gmail.com;
>> >> >> s.nawrocki@samsung.com; joshi@samsung.com; r.sh.open@gmail.com;
>> Rahul
>> >> >> Sharma
>> >> >> Subject: [PATCH 0/7] drm/exynos: move hdmiphy related code to
>> hdmiphy
>> >> >> driver
>> >> >>
>> >> >> Currently, exynos hdmiphy operations and configs are kept
>> >> >> inside the hdmi driver. Hdmiphy related code is tightly
>> >> >> coupled with hdmi IP driver.
>> >> >>
>> >> >> This series also removes hdmiphy dummy clock for hdmiphy
>> >> >> and replace it with Phy PMU Control from the hdmiphy driver.
>> >> >>
>> >> >> At the end, support for exynos5420 hdmiphy is added to the
>> >> >> hdmiphy driver which is a platform device.
>> >> >>
>> >> >> Drm related paches are based on exynos-drm-next branch at
>> >> >> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
>> >> >>
>> >> >> Arch patches are dependent on
>> >> >> http://www.mail-archive.com/linux-samsung-
>> >> >> soc@vger.kernel.org/msg22195.html
>> >> >>
>> >> >> Rahul Sharma (7):
>> >> >>   drm/exynos: move hdmiphy related code to hdmiphy driver
>> >> >>   drm/exynos: remove dummy hdmiphy clock
>> >> >>   drm/exynos: add hdmiphy pmu bit control in hdmiphy driver
>> >> >>   drm/exynos: add support for exynos5420 hdmiphy
>> >> >>   exynos/drm: fix ddc i2c device probe failure
>> >> >>   ARM: dts: update hdmiphy dt node for exynos5250
>> >> >>   ARM: dts: update hdmiphy dt node for exynos5420
>> >> >>
>> >> >>  .../devicetree/bindings/video/exynos_hdmi.txt      |    2 +
>> >> >>  .../devicetree/bindings/video/exynos_hdmiphy.txt   |    6 +
>> >> >>  arch/arm/boot/dts/exynos5250-smdk5250.dts          |    9 +-
>> >> >>  arch/arm/boot/dts/exynos5420.dtsi                  |   12 +
>> >> >>  drivers/gpu/drm/exynos/exynos_ddc.c                |    5 +
>> >> >>  drivers/gpu/drm/exynos/exynos_drm_hdmi.h           |   13 +
>> >> >>  drivers/gpu/drm/exynos/exynos_hdmi.c               |  353
> ++--------
>> >> >>  drivers/gpu/drm/exynos/exynos_hdmiphy.c            |  738
>> >> >> +++++++++++++++++++-
>> >> >>  drivers/gpu/drm/exynos/regs-hdmiphy.h              |   35 +
>> >> >>  9 files changed, 868 insertions(+), 305 deletions(-)
>> >> >>  create mode 100644 drivers/gpu/drm/exynos/regs-hdmiphy.h
>> >> >>
>> >> >> --
>> >> >> 1.7.10.4
>> >> >
>> >> --
>> >> To unsubscribe from this list: send the line "unsubscribe linux-
>> samsung-
>> >> soc" in
>> >> the body of a message to majordomo@vger.kernel.org
>> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> >
>
