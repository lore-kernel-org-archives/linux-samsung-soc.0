From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v2 2/3] platform/chrome: Support reading/writing the vboot context
Date: Tue, 15 Sep 2015 21:43:35 +0200
Message-ID: <CABxcv=mnCNQPtVBU4tPOWD237_-RojoW+RVLTj+F=3PHbUHfQQ@mail.gmail.com>
References: <1442234049-18637-1-git-send-email-emilio.lopez@collabora.co.uk>
	<1442234049-18637-3-git-send-email-emilio.lopez@collabora.co.uk>
	<CABxcv=m23sfK=jOCswirQRB1SbP70VnomKp6hhwFhRLHiabq4w@mail.gmail.com>
	<55F86E74.9010907@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f175.google.com ([209.85.160.175]:35243 "EHLO
	mail-yk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751014AbbIOTng convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Sep 2015 15:43:36 -0400
Received: by ykdu9 with SMTP id u9so197956895ykd.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2015 12:43:35 -0700 (PDT)
In-Reply-To: <55F86E74.9010907@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio.lopez@collabora.co.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene@kernel.org>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Linux Kernel <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hello Emilio,

On Tue, Sep 15, 2015 at 9:16 PM, Emilio L=C3=B3pez
<emilio.lopez@collabora.co.uk> wrote:

[snip]

>>>
>>>   obj-$(CONFIG_CHROMEOS_LAPTOP)  +=3D chromeos_laptop.o
>>>   obj-$(CONFIG_CHROMEOS_PSTORE)  +=3D chromeos_pstore.o
>>> -cros_ec_devs-objs               :=3D cros_ec_dev.o cros_ec_sysfs.o
>>> cros_ec_lightbar.o
>>> +cros_ec_devs-objs               :=3D cros_ec_dev.o
>>> +cros_ec_devs-objs               +=3D cros_ec_lightbar.o
>>> +cros_ec_devs-objs               +=3D cros_ec_sysfs.o
>>> +cros_ec_devs-objs               +=3D cros_ec_vbc.o
>>
>>
>> Why are you changing the Makefile? AFAIK +=3D is usually used when t=
he
>> compilation is conditional based on a Kconfig symbol but since these
>> are build unconditionally, I'll just keep it as foo :=3D bar baz
>
>
> As far as I'm aware, +=3D is append[0]. It's used for stuff like
> obj-$(CONFIG_CHROMEOS_LAPTOP)  +=3D chromeos_laptop.o
> because the left part will resolve to "obj-y" or similar, and you wan=
t to
> add to it, not replace it. I only changed the Makefile here because t=
he line
> was growing too long, and I thought it looked neater this way; it sho=
uldn't
> cause any functional change apart from the intended one.
>
> [0] https://www.gnu.org/software/make/manual/html_node/Appending.html
>

Yes, I know how Kbuild works. What I tried to say is that you usually
append based on a Kconfig symbol. In fact even you are mentioning such
an example.
So appending unconditionally like you are doing makes the Makefile
harder to read IMHO. If the line grows to long you can use a backlash
(\) char to split the line.

>> Which makes me think, do we need a Kconfig option for this feature
>> since not all machines have it?
>
>
> Not all machines have a lightbar either; both of the features are
> runtime-conditional. IMO, it makes more sense this way when you consi=
der a
> kernel will likely support multiple platforms.
>

Ok, thanks for the clarification.

>
>>>   obj-$(CONFIG_CROS_EC_CHARDEV)   +=3D cros_ec_devs.o
>>>   obj-$(CONFIG_CROS_EC_LPC)       +=3D cros_ec_lpc.o
>>>   obj-$(CONFIG_CROS_EC_PROTO)    +=3D cros_ec_proto.o
>>> diff --git a/drivers/platform/chrome/cros_ec_dev.c
>>> b/drivers/platform/chrome/cros_ec_dev.c
>>> index e8fcdc2..d19263f 100644
>>> --- a/drivers/platform/chrome/cros_ec_dev.c
>>> +++ b/drivers/platform/chrome/cros_ec_dev.c
>>> @@ -32,6 +32,7 @@ static int ec_major;
>>>   static const struct attribute_group *cros_ec_groups[] =3D {
>>>          &cros_ec_attr_group,
>>>          &cros_ec_lightbar_attr_group,
>>> +       &cros_ec_vbc_attr_group,
>>>          NULL,
>>>   };
>>>
>>> diff --git a/drivers/platform/chrome/cros_ec_vbc.c
>>> b/drivers/platform/chrome/cros_ec_vbc.c
>>> new file mode 100644
>>> index 0000000..a0e8d38
>>> --- /dev/null
>>> +++ b/drivers/platform/chrome/cros_ec_vbc.c
>>> @@ -0,0 +1,137 @@
>>> +/*
>>> + * cros_ec_vbc - Expose the vboot context nvram to userspace
>>> + *
>>> + * Copyright (C) 2015 Collabora Ltd.
>>> + *
>>> + * based on vendor driver,
>>> + *
>>> + * Copyright (C) 2012 The Chromium OS Authors
>>> + *
>>> + * This program is free software; you can redistribute it and/or m=
odify
>>> + * it under the terms of the GNU General Public License as publish=
ed by
>>> + * the Free Software Foundation; either version 2 of the License, =
or
>>> + * (at your option) any later version.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + */
>>> +
>>> +#include <linux/of.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/mfd/cros_ec.h>
>>> +#include <linux/mfd/cros_ec_commands.h>
>>> +#include <linux/slab.h>
>>> +
>>> +static ssize_t vboot_context_read(struct file *filp, struct kobjec=
t
>>> *kobj,
>>> +                                 struct bin_attribute *att, char *=
buf,
>>> +                                 loff_t pos, size_t count)
>>> +{
>>> +       struct device *dev =3D container_of(kobj, struct device, ko=
bj);
>>> +       struct cros_ec_dev *ec =3D container_of(dev, struct cros_ec=
_dev,
>>> +                                             class_dev);
>>> +       struct cros_ec_device *ecdev =3D ec->ec_dev;
>>> +       struct ec_params_vbnvcontext *params;
>>> +       struct cros_ec_command *msg;
>>> +       int err;
>>> +       const size_t para_sz =3D sizeof(struct ec_params_vbnvcontex=
t);
>>> +       const size_t resp_sz =3D sizeof(struct ec_response_vbnvcont=
ext);
>>> +       const size_t payload =3D max(para_sz, resp_sz);
>>> +
>>> +       msg =3D kmalloc(sizeof(*msg) + payload, GFP_KERNEL);
>>> +       if (!msg)
>>> +               return -ENOMEM;
>>> +
>>> +       params =3D (struct ec_params_vbnvcontext *)msg->data;
>>> +       params->op =3D EC_VBNV_CONTEXT_OP_READ;
>>> +
>>> +       msg->version =3D EC_VER_VBNV_CONTEXT;
>>> +       msg->command =3D EC_CMD_VBNV_CONTEXT;
>>> +       msg->outsize =3D sizeof(params->op);
>>
>>
>> Shouldn't this be para_sz ? Since you are sending to the EC the whol=
e
>> struct ec_params_vbnvcontext and not only the op field.
>>
>> Or if the EC only expects to get the u32 op field, then I think your
>> max payload calculation is not correct.
>
>
> The params struct is the same for both read and write ops, so it has =
the op

That's not true, struct ec_response_vbnvcontext has only the block
field while struct ec_param_vbnvcontext has both the op and block
fields.

> flag and a buffer for the write op. During the read op I believe ther=
e's no
> need to send this potentially-garbage-filled buffer to the EC, so out=
size is
> set accordingly here.

Yes, I agree with you but then as I mentioned I think your payload
calculation is wrong since you want instead max(sizeof(struct
ec_response_vbnvcontext), sizeof(param->op)). Otherwise you are
allocating 4 bytes more than needed.
>
> The vendor tree does it this way, but I can change it to send the ful=
l
> buffer if you prefer so.
>
> ec code is at
> https://chromium.googlesource.com/chromiumos/platform/ec/+/master/com=
mon/system.c
> L1086+ if you want to take a look
>
>>> +       msg->insize =3D resp_sz;
>>> +
>>> +       err =3D cros_ec_cmd_xfer(ecdev, msg);
>>> +       if (err < 0) {
>>> +               dev_err(dev, "Error sending read request: %d\n", er=
r);
>>> +               kfree(msg);
>>> +               return err;
>>> +       }
>>> +
>>> +       BUILD_BUG_ON(resp_sz > PAGE_SIZE);
>>
>>
>> Why you need this? struct ec_response_vbnvcontext is really small AF=
AICT.
>
>
> This is just me being paranoid about memcpy :) Indeed, the struct sho=
uld be
> way smaller than a page. I can drop it if you think it's too much.
>

I think it can be dropped but it's up to you.

>>> +       memcpy(buf, msg->data, resp_sz);
>>> +
>>> +       kfree(msg);
>>> +       return resp_sz;
>>> +}
>>> +
>
>
> Thanks!
> Emilio

with the needed changes, feel free to add my:

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
Javier
