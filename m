From: =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio.lopez@collabora.co.uk>
Subject: Re: [PATCH v2 2/3] platform/chrome: Support reading/writing the vboot
 context
Date: Tue, 15 Sep 2015 16:16:04 -0300
Message-ID: <55F86E74.9010907@collabora.co.uk>
References: <1442234049-18637-1-git-send-email-emilio.lopez@collabora.co.uk>
 <1442234049-18637-3-git-send-email-emilio.lopez@collabora.co.uk>
 <CABxcv=m23sfK=jOCswirQRB1SbP70VnomKp6hhwFhRLHiabq4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:50022 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752065AbbIOTQ1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Sep 2015 15:16:27 -0400
In-Reply-To: <CABxcv=m23sfK=jOCswirQRB1SbP70VnomKp6hhwFhRLHiabq4w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene@kernel.org>, =?UTF-8?Q?Krzysztof_Koz=c5=82owski?= <k.kozlowski@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Linux Kernel <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Javier,

Thanks for the review. You'll find my answers inline

On 15/09/15 10:47, Javier Martinez Canillas wrote:
> Hello Emilio,
>
> Patch looks mostly good to me, I just have a few comments.
>
> On Mon, Sep 14, 2015 at 2:34 PM, Emilio L=C3=B3pez
> <emilio.lopez@collabora.co.uk> wrote:
>> Some EC implementations include a small nvram space used to store
>> verified boot context data. This patch offers a way to expose this
>> data to userspace.
>>
>> Signed-off-by: Emilio L=C3=B3pez <emilio.lopez@collabora.co.uk>
>> ---
>> Changes from v1:
>>   - Use is_bin_visible instead of is_visible
>>
>>   Documentation/devicetree/bindings/mfd/cros-ec.txt |   4 +
>>   drivers/platform/chrome/Makefile                  |   5 +-
>>   drivers/platform/chrome/cros_ec_dev.c             |   1 +
>>   drivers/platform/chrome/cros_ec_vbc.c             | 137 ++++++++++=
++++++++++++
>>   include/linux/mfd/cros_ec.h                       |   1 +
>>   5 files changed, 147 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/platform/chrome/cros_ec_vbc.c
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/cros-ec.txt b/Doc=
umentation/devicetree/bindings/mfd/cros-ec.txt
>> index 1777916..136e0c2 100644
>> --- a/Documentation/devicetree/bindings/mfd/cros-ec.txt
>> +++ b/Documentation/devicetree/bindings/mfd/cros-ec.txt
>> @@ -34,6 +34,10 @@ Required properties (LPC):
>>   - compatible: "google,cros-ec-lpc"
>>   - reg: List of (IO address, size) pairs defining the interface use=
s
>>
>> +Optional properties (all):
>> +- google,has-vbc-nvram: Some implementations of the EC include a sm=
all
>> +  nvram space used to store verified boot context data. This boolea=
n flag
>> +  is used to specify whether this nvram is present or not.
>>
>>   Example for I2C:
>>
>
> I would split the DT binding part from the actual implementation, see
> Documentation/devicetree/bindings/submitting-patches.txt.

Ok, I'll do

>> diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chr=
ome/Makefile
>> index 4a11b01..787be61 100644
>> --- a/drivers/platform/chrome/Makefile
>> +++ b/drivers/platform/chrome/Makefile
>> @@ -1,7 +1,10 @@
>>
>>   obj-$(CONFIG_CHROMEOS_LAPTOP)  +=3D chromeos_laptop.o
>>   obj-$(CONFIG_CHROMEOS_PSTORE)  +=3D chromeos_pstore.o
>> -cros_ec_devs-objs               :=3D cros_ec_dev.o cros_ec_sysfs.o =
cros_ec_lightbar.o
>> +cros_ec_devs-objs               :=3D cros_ec_dev.o
>> +cros_ec_devs-objs               +=3D cros_ec_lightbar.o
>> +cros_ec_devs-objs               +=3D cros_ec_sysfs.o
>> +cros_ec_devs-objs               +=3D cros_ec_vbc.o
>
> Why are you changing the Makefile? AFAIK +=3D is usually used when th=
e
> compilation is conditional based on a Kconfig symbol but since these
> are build unconditionally, I'll just keep it as foo :=3D bar baz

As far as I'm aware, +=3D is append[0]. It's used for stuff like
obj-$(CONFIG_CHROMEOS_LAPTOP)  +=3D chromeos_laptop.o
because the left part will resolve to "obj-y" or similar, and you want=20
to add to it, not replace it. I only changed the Makefile here because=20
the line was growing too long, and I thought it looked neater this way;=
=20
it shouldn't cause any functional change apart from the intended one.

[0] https://www.gnu.org/software/make/manual/html_node/Appending.html

> Which makes me think, do we need a Kconfig option for this feature
> since not all machines have it?

Not all machines have a lightbar either; both of the features are=20
runtime-conditional. IMO, it makes more sense this way when you conside=
r=20
a kernel will likely support multiple platforms.

>>   obj-$(CONFIG_CROS_EC_CHARDEV)   +=3D cros_ec_devs.o
>>   obj-$(CONFIG_CROS_EC_LPC)       +=3D cros_ec_lpc.o
>>   obj-$(CONFIG_CROS_EC_PROTO)    +=3D cros_ec_proto.o
>> diff --git a/drivers/platform/chrome/cros_ec_dev.c b/drivers/platfor=
m/chrome/cros_ec_dev.c
>> index e8fcdc2..d19263f 100644
>> --- a/drivers/platform/chrome/cros_ec_dev.c
>> +++ b/drivers/platform/chrome/cros_ec_dev.c
>> @@ -32,6 +32,7 @@ static int ec_major;
>>   static const struct attribute_group *cros_ec_groups[] =3D {
>>          &cros_ec_attr_group,
>>          &cros_ec_lightbar_attr_group,
>> +       &cros_ec_vbc_attr_group,
>>          NULL,
>>   };
>>
>> diff --git a/drivers/platform/chrome/cros_ec_vbc.c b/drivers/platfor=
m/chrome/cros_ec_vbc.c
>> new file mode 100644
>> index 0000000..a0e8d38
>> --- /dev/null
>> +++ b/drivers/platform/chrome/cros_ec_vbc.c
>> @@ -0,0 +1,137 @@
>> +/*
>> + * cros_ec_vbc - Expose the vboot context nvram to userspace
>> + *
>> + * Copyright (C) 2015 Collabora Ltd.
>> + *
>> + * based on vendor driver,
>> + *
>> + * Copyright (C) 2012 The Chromium OS Authors
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License as publishe=
d by
>> + * the Free Software Foundation; either version 2 of the License, o=
r
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/mfd/cros_ec.h>
>> +#include <linux/mfd/cros_ec_commands.h>
>> +#include <linux/slab.h>
>> +
>> +static ssize_t vboot_context_read(struct file *filp, struct kobject=
 *kobj,
>> +                                 struct bin_attribute *att, char *b=
uf,
>> +                                 loff_t pos, size_t count)
>> +{
>> +       struct device *dev =3D container_of(kobj, struct device, kob=
j);
>> +       struct cros_ec_dev *ec =3D container_of(dev, struct cros_ec_=
dev,
>> +                                             class_dev);
>> +       struct cros_ec_device *ecdev =3D ec->ec_dev;
>> +       struct ec_params_vbnvcontext *params;
>> +       struct cros_ec_command *msg;
>> +       int err;
>> +       const size_t para_sz =3D sizeof(struct ec_params_vbnvcontext=
);
>> +       const size_t resp_sz =3D sizeof(struct ec_response_vbnvconte=
xt);
>> +       const size_t payload =3D max(para_sz, resp_sz);
>> +
>> +       msg =3D kmalloc(sizeof(*msg) + payload, GFP_KERNEL);
>> +       if (!msg)
>> +               return -ENOMEM;
>> +
>> +       params =3D (struct ec_params_vbnvcontext *)msg->data;
>> +       params->op =3D EC_VBNV_CONTEXT_OP_READ;
>> +
>> +       msg->version =3D EC_VER_VBNV_CONTEXT;
>> +       msg->command =3D EC_CMD_VBNV_CONTEXT;
>> +       msg->outsize =3D sizeof(params->op);
>
> Shouldn't this be para_sz ? Since you are sending to the EC the whole
> struct ec_params_vbnvcontext and not only the op field.
>
> Or if the EC only expects to get the u32 op field, then I think your
> max payload calculation is not correct.

The params struct is the same for both read and write ops, so it has th=
e=20
op flag and a buffer for the write op. During the read op I believe=20
there's no need to send this potentially-garbage-filled buffer to the=20
EC, so outsize is set accordingly here.

The vendor tree does it this way, but I can change it to send the full=20
buffer if you prefer so.

ec code is at=20
https://chromium.googlesource.com/chromiumos/platform/ec/+/master/commo=
n/system.c=20
L1086+ if you want to take a look

>> +       msg->insize =3D resp_sz;
>> +
>> +       err =3D cros_ec_cmd_xfer(ecdev, msg);
>> +       if (err < 0) {
>> +               dev_err(dev, "Error sending read request: %d\n", err=
);
>> +               kfree(msg);
>> +               return err;
>> +       }
>> +
>> +       BUILD_BUG_ON(resp_sz > PAGE_SIZE);
>
> Why you need this? struct ec_response_vbnvcontext is really small AFA=
ICT.

This is just me being paranoid about memcpy :) Indeed, the struct shoul=
d=20
be way smaller than a page. I can drop it if you think it's too much.

>> +       memcpy(buf, msg->data, resp_sz);
>> +
>> +       kfree(msg);
>> +       return resp_sz;
>> +}
>> +

Thanks!
Emilio
