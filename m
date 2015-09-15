From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v2 2/3] platform/chrome: Support reading/writing the vboot context
Date: Tue, 15 Sep 2015 15:47:57 +0200
Message-ID: <CABxcv=m23sfK=jOCswirQRB1SbP70VnomKp6hhwFhRLHiabq4w@mail.gmail.com>
References: <1442234049-18637-1-git-send-email-emilio.lopez@collabora.co.uk>
	<1442234049-18637-3-git-send-email-emilio.lopez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f179.google.com ([209.85.160.179]:33423 "EHLO
	mail-yk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751633AbbIONr6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Sep 2015 09:47:58 -0400
Received: by ykft14 with SMTP id t14so33728845ykf.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2015 06:47:57 -0700 (PDT)
In-Reply-To: <1442234049-18637-3-git-send-email-emilio.lopez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio.lopez@collabora.co.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene@kernel.org>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Linux Kernel <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hello Emilio,

Patch looks mostly good to me, I just have a few comments.

On Mon, Sep 14, 2015 at 2:34 PM, Emilio L=C3=B3pez
<emilio.lopez@collabora.co.uk> wrote:
> Some EC implementations include a small nvram space used to store
> verified boot context data. This patch offers a way to expose this
> data to userspace.
>
> Signed-off-by: Emilio L=C3=B3pez <emilio.lopez@collabora.co.uk>
> ---
> Changes from v1:
>  - Use is_bin_visible instead of is_visible
>
>  Documentation/devicetree/bindings/mfd/cros-ec.txt |   4 +
>  drivers/platform/chrome/Makefile                  |   5 +-
>  drivers/platform/chrome/cros_ec_dev.c             |   1 +
>  drivers/platform/chrome/cros_ec_vbc.c             | 137 ++++++++++++=
++++++++++
>  include/linux/mfd/cros_ec.h                       |   1 +
>  5 files changed, 147 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/platform/chrome/cros_ec_vbc.c
>
> diff --git a/Documentation/devicetree/bindings/mfd/cros-ec.txt b/Docu=
mentation/devicetree/bindings/mfd/cros-ec.txt
> index 1777916..136e0c2 100644
> --- a/Documentation/devicetree/bindings/mfd/cros-ec.txt
> +++ b/Documentation/devicetree/bindings/mfd/cros-ec.txt
> @@ -34,6 +34,10 @@ Required properties (LPC):
>  - compatible: "google,cros-ec-lpc"
>  - reg: List of (IO address, size) pairs defining the interface uses
>
> +Optional properties (all):
> +- google,has-vbc-nvram: Some implementations of the EC include a sma=
ll
> +  nvram space used to store verified boot context data. This boolean=
 flag
> +  is used to specify whether this nvram is present or not.
>
>  Example for I2C:
>

I would split the DT binding part from the actual implementation, see
Documentation/devicetree/bindings/submitting-patches.txt.

> diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chro=
me/Makefile
> index 4a11b01..787be61 100644
> --- a/drivers/platform/chrome/Makefile
> +++ b/drivers/platform/chrome/Makefile
> @@ -1,7 +1,10 @@
>
>  obj-$(CONFIG_CHROMEOS_LAPTOP)  +=3D chromeos_laptop.o
>  obj-$(CONFIG_CHROMEOS_PSTORE)  +=3D chromeos_pstore.o
> -cros_ec_devs-objs               :=3D cros_ec_dev.o cros_ec_sysfs.o c=
ros_ec_lightbar.o
> +cros_ec_devs-objs               :=3D cros_ec_dev.o
> +cros_ec_devs-objs               +=3D cros_ec_lightbar.o
> +cros_ec_devs-objs               +=3D cros_ec_sysfs.o
> +cros_ec_devs-objs               +=3D cros_ec_vbc.o

Why are you changing the Makefile? AFAIK +=3D is usually used when the
compilation is conditional based on a Kconfig symbol but since these
are build unconditionally, I'll just keep it as foo :=3D bar baz

Which makes me think, do we need a Kconfig option for this feature
since not all machines have it?

>  obj-$(CONFIG_CROS_EC_CHARDEV)   +=3D cros_ec_devs.o
>  obj-$(CONFIG_CROS_EC_LPC)       +=3D cros_ec_lpc.o
>  obj-$(CONFIG_CROS_EC_PROTO)    +=3D cros_ec_proto.o
> diff --git a/drivers/platform/chrome/cros_ec_dev.c b/drivers/platform=
/chrome/cros_ec_dev.c
> index e8fcdc2..d19263f 100644
> --- a/drivers/platform/chrome/cros_ec_dev.c
> +++ b/drivers/platform/chrome/cros_ec_dev.c
> @@ -32,6 +32,7 @@ static int ec_major;
>  static const struct attribute_group *cros_ec_groups[] =3D {
>         &cros_ec_attr_group,
>         &cros_ec_lightbar_attr_group,
> +       &cros_ec_vbc_attr_group,
>         NULL,
>  };
>
> diff --git a/drivers/platform/chrome/cros_ec_vbc.c b/drivers/platform=
/chrome/cros_ec_vbc.c
> new file mode 100644
> index 0000000..a0e8d38
> --- /dev/null
> +++ b/drivers/platform/chrome/cros_ec_vbc.c
> @@ -0,0 +1,137 @@
> +/*
> + * cros_ec_vbc - Expose the vboot context nvram to userspace
> + *
> + * Copyright (C) 2015 Collabora Ltd.
> + *
> + * based on vendor driver,
> + *
> + * Copyright (C) 2012 The Chromium OS Authors
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/mfd/cros_ec.h>
> +#include <linux/mfd/cros_ec_commands.h>
> +#include <linux/slab.h>
> +
> +static ssize_t vboot_context_read(struct file *filp, struct kobject =
*kobj,
> +                                 struct bin_attribute *att, char *bu=
f,
> +                                 loff_t pos, size_t count)
> +{
> +       struct device *dev =3D container_of(kobj, struct device, kobj=
);
> +       struct cros_ec_dev *ec =3D container_of(dev, struct cros_ec_d=
ev,
> +                                             class_dev);
> +       struct cros_ec_device *ecdev =3D ec->ec_dev;
> +       struct ec_params_vbnvcontext *params;
> +       struct cros_ec_command *msg;
> +       int err;
> +       const size_t para_sz =3D sizeof(struct ec_params_vbnvcontext)=
;
> +       const size_t resp_sz =3D sizeof(struct ec_response_vbnvcontex=
t);
> +       const size_t payload =3D max(para_sz, resp_sz);
> +
> +       msg =3D kmalloc(sizeof(*msg) + payload, GFP_KERNEL);
> +       if (!msg)
> +               return -ENOMEM;
> +
> +       params =3D (struct ec_params_vbnvcontext *)msg->data;
> +       params->op =3D EC_VBNV_CONTEXT_OP_READ;
> +
> +       msg->version =3D EC_VER_VBNV_CONTEXT;
> +       msg->command =3D EC_CMD_VBNV_CONTEXT;
> +       msg->outsize =3D sizeof(params->op);

Shouldn't this be para_sz ? Since you are sending to the EC the whole
struct ec_params_vbnvcontext and not only the op field.

Or if the EC only expects to get the u32 op field, then I think your
max payload calculation is not correct.

> +       msg->insize =3D resp_sz;
> +
> +       err =3D cros_ec_cmd_xfer(ecdev, msg);
> +       if (err < 0) {
> +               dev_err(dev, "Error sending read request: %d\n", err)=
;
> +               kfree(msg);
> +               return err;
> +       }
> +
> +       BUILD_BUG_ON(resp_sz > PAGE_SIZE);

Why you need this? struct ec_response_vbnvcontext is really small AFAIC=
T.

> +       memcpy(buf, msg->data, resp_sz);
> +
> +       kfree(msg);
> +       return resp_sz;
> +}
> +
> +static ssize_t vboot_context_write(struct file *filp, struct kobject=
 *kobj,
> +                                  struct bin_attribute *attr, char *=
buf,
> +                                  loff_t pos, size_t count)
> +{
> +       struct device *dev =3D container_of(kobj, struct device, kobj=
);
> +       struct cros_ec_dev *ec =3D container_of(dev, struct cros_ec_d=
ev,
> +                                             class_dev);
> +       struct cros_ec_device *ecdev =3D ec->ec_dev;
> +       struct ec_params_vbnvcontext *params;
> +       struct cros_ec_command *msg;
> +       int err;
> +       const size_t para_sz =3D sizeof(*params);
> +       const size_t data_sz =3D sizeof(params->block);
> +
> +       /* Only write full values */
> +       if (count !=3D data_sz)
> +               return -EINVAL;
> +
> +       msg =3D kmalloc(sizeof(*msg) + para_sz, GFP_KERNEL);
> +       if (!msg)
> +               return -ENOMEM;
> +
> +       params =3D (struct ec_params_vbnvcontext *)msg->data;
> +       params->op =3D EC_VBNV_CONTEXT_OP_WRITE;
> +       memcpy(params->block, buf, data_sz);
> +
> +       msg->version =3D EC_VER_VBNV_CONTEXT;
> +       msg->command =3D EC_CMD_VBNV_CONTEXT;
> +       msg->outsize =3D para_sz;
> +       msg->insize =3D 0;
> +
> +       err =3D cros_ec_cmd_xfer(ecdev, msg);
> +       if (err < 0) {
> +               dev_err(dev, "Error sending write request: %d\n", err=
);
> +               kfree(msg);
> +               return err;
> +       }
> +
> +       kfree(msg);
> +       return data_sz;
> +}
> +
> +static umode_t cros_ec_vbc_is_visible(struct kobject *kobj,
> +                                     struct bin_attribute *a, int n)
> +{
> +       struct device *dev =3D container_of(kobj, struct device, kobj=
);
> +       struct cros_ec_dev *ec =3D container_of(dev, struct cros_ec_d=
ev,
> +                                             class_dev);
> +       struct device_node *np =3D ec->ec_dev->dev->of_node;
> +
> +       if (IS_ENABLED(CONFIG_OF) && np) {
> +               if (of_property_read_bool(np, "google,has-vbc-nvram")=
)
> +                       return a->attr.mode;
> +       }
> +
> +       return 0;
> +}
> +
> +static BIN_ATTR_RW(vboot_context, 16);
> +
> +static struct bin_attribute *cros_ec_vbc_bin_attrs[] =3D {
> +       &bin_attr_vboot_context,
> +       NULL
> +};
> +
> +struct attribute_group cros_ec_vbc_attr_group =3D {
> +       .name =3D "vbc",
> +       .bin_attrs =3D cros_ec_vbc_bin_attrs,
> +       .is_bin_visible =3D cros_ec_vbc_is_visible,
> +};
> diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.=
h
> index da72671..494682c 100644
> --- a/include/linux/mfd/cros_ec.h
> +++ b/include/linux/mfd/cros_ec.h
> @@ -255,5 +255,6 @@ int cros_ec_query_all(struct cros_ec_device *ec_d=
ev);
>  /* sysfs stuff */
>  extern struct attribute_group cros_ec_attr_group;
>  extern struct attribute_group cros_ec_lightbar_attr_group;
> +extern struct attribute_group cros_ec_vbc_attr_group;
>
>  #endif /* __LINUX_MFD_CROS_EC_H */
> --
> 2.1.4

Best regards,
Javier
