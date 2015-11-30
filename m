From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v2 2/4] driver core: handle -EPROBE_DEFER from bus_type.match()
Date: Mon, 30 Nov 2015 14:36:28 +0100
Message-ID: <CAPDyKFrhWeY_2-1np72TLbibMUPJ2s+As48WMGgfbj2CS-waBw@mail.gmail.com>
References: <1448542190-19498-1-git-send-email-m.szyprowski@samsung.com>
	<1448542190-19498-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f176.google.com ([209.85.160.176]:33654 "EHLO
	mail-yk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754022AbbK3Ng3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Nov 2015 08:36:29 -0500
Received: by ykdv3 with SMTP id v3so183032993ykd.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Nov 2015 05:36:28 -0800 (PST)
In-Reply-To: <1448542190-19498-3-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 26 November 2015 at 13:49, Marek Szyprowski <m.szyprowski@samsung.co=
m> wrote:
> From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>
> Lets implementations of the match() callback in struct bus_type to

/s/Lets/Allow

> return errors and if it's -EPROBE_DEFER then queue the device for
> deferred probing.
>
> This is useful to buses such as AMBA in which devices are registered
> before their matching information can be retrieved from the HW
> (typically because a clock driver hasn't probed yet).
>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/base/dd.c      | 24 ++++++++++++++++++++++--
>  include/linux/device.h |  2 +-
>  2 files changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index a641cf3..a20c119 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -490,6 +490,7 @@ static int __device_attach_driver(struct device_d=
river *drv, void *_data)
>         struct device_attach_data *data =3D _data;
>         struct device *dev =3D data->dev;
>         bool async_allowed;
> +       int ret;
>
>         /*
>          * Check if device has already been claimed. This may
> @@ -500,8 +501,17 @@ static int __device_attach_driver(struct device_=
driver *drv, void *_data)
>         if (dev->driver)
>                 return -EBUSY;
>
> -       if (!driver_match_device(drv, dev))
> +       ret =3D driver_match_device(drv, dev);
> +       if (!ret)
>                 return 0;
> +       else if (ret < 0) {

Depending on what happens with the added dev_warn() below, perhaps a
switch statement can make it a bit clearer, instead of these messy if
clauses?

> +               if (ret =3D=3D -EPROBE_DEFER) {
> +                       dev_dbg(dev, "Device match requests probe def=
erral\n");
> +                       driver_deferred_probe_add(dev);
> +               } else
> +                       dev_warn(dev, "Bus failed to match device: %d=
", ret);

Greg commented on this before, as it may introduce some noise [1].

I started browsing various bus=E2=80=99s implementation of the ->match(=
)
callback. A quick search tells me that most implementations are
following the Documentation/driver-model/porting.txt, which means
returning 0 or 1. Actually I couldn't find anyone returning any other
value, though it was a quick search.

On the other hand, include/linux/device.h states a "non-zero" value is
allowed to be return, so there's a tiny conflict between the code and
the documentation. I guess we should fix that!?

No matter what, I realize that it could be useful to print a message
when receiving a negative error code, maybe dev_dbg() could be
sufficient?

> +               return ret;
> +       }
>
>         async_allowed =3D driver_allows_async_probing(drv);
>
> @@ -621,6 +631,7 @@ void device_initial_probe(struct device *dev)
>  static int __driver_attach(struct device *dev, void *data)
>  {
>         struct device_driver *drv =3D data;
> +       int ret;
>
>         /*
>          * Lock device and try to bind to it. We drop the error
> @@ -632,8 +643,17 @@ static int __driver_attach(struct device *dev, v=
oid *data)
>          * is an error.
>          */
>
> -       if (!driver_match_device(drv, dev))
> +       ret =3D driver_match_device(drv, dev);
> +       if (!ret)
> +               return 0;
> +       else if (ret < 0) {
> +               if (ret =3D=3D -EPROBE_DEFER) {
> +                       dev_dbg(dev, "Device match requests probe def=
erral\n");
> +                       driver_deferred_probe_add(dev);
> +               } else
> +                       dev_warn(dev, "Bus failed to match device: %d=
", ret);
>                 return 0;
> +       }
>
>         if (dev->parent)        /* Needed for USB */
>                 device_lock(dev->parent);
> diff --git a/include/linux/device.h b/include/linux/device.h
> index b8f411b..d4e7d1f 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -70,7 +70,7 @@ extern void bus_remove_file(struct bus_type *, stru=
ct bus_attribute *);
>   * @dev_groups:        Default attributes of the devices on the bus.
>   * @drv_groups: Default attributes of the device drivers on the bus.
>   * @match:     Called, perhaps multiple times, whenever a new device=
 or driver
> - *             is added for this bus. It should return a nonzero val=
ue if the
> + *             is added for this bus. It should return a positive va=
lue if the
>   *             given device can be handled by the given driver.
>   * @uevent:    Called when a device is added, removed, or a few othe=
r things
>   *             that generate uevents to add the environment variable=
s.
> --
> 1.9.2
>

Kind regards
Uffe

[1]
https://lkml.org/lkml/2015/10/17/24
