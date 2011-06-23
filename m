From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 2/6] serial: samsung: Add device tree support for s5pv210
 uart driver
Date: Thu, 23 Jun 2011 14:08:17 -0600
Message-ID: <BANLkTi=EVA6LckzWSFMQ07okD4gw-z5Zag@mail.gmail.com>
References: <1308567752-13451-1-git-send-email-thomas.abraham@linaro.org>
 <1308567752-13451-3-git-send-email-thomas.abraham@linaro.org>
 <BANLkTi=+FKz-uPtSv572y5ORorMeGR8Anw@mail.gmail.com> <BANLkTi=RxEpBrALEQbBD_z6ZiEW24-wsng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:33086 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932831Ab1FWUIi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Jun 2011 16:08:38 -0400
Received: by ywe9 with SMTP id 9so854176ywe.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jun 2011 13:08:37 -0700 (PDT)
In-Reply-To: <BANLkTi=RxEpBrALEQbBD_z6ZiEW24-wsng@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robherring2@gmail.com>

On Wed, Jun 22, 2011 at 10:22 AM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:
>
> I have added the functions as you have suggested and the diff is
> listed below. Could you please review the diff and suggest any change=
s
> required.

Thanks Thomas.  Comments below...

> =A0drivers/of/base.c =A0| =A0129 ++++++++++++++++++++++++++++++++++++=
++++++++++++++++
> =A0include/linux/of.h | =A0 10 ++++
> =A02 files changed, 139 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 632ebae..73f0144 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -596,6 +596,135 @@ struct device_node
> *of_find_node_by_phandle(phandle handle)
> =A0EXPORT_SYMBOL(of_find_node_by_phandle);
>
> =A0/**
> + * of_read_property_u32 - Reads a indexed 32-bit property value
> + * @prop: =A0 =A0 =A0property to read from.
> + * @offset: =A0 =A0cell number to read.
> + * value: =A0 =A0 =A0returned cell value
> + *
> + * Returns a indexed 32-bit value of a property cell, -EINVAL in cas=
e the cell
> + * does not exist
> + */
> +int of_read_property_u32(struct property *prop, u32 offset, u32 *val=
ue)
> +{
> + =A0 =A0 =A0 if (!prop || !prop->value)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;

Hmmm, it would probably be a good idea to differentiate return code
depending on whether or not the property was found vs. the property
data not large enough.

> + =A0 =A0 =A0 if ((offset + 1) * 4 > prop->length)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> +
> + =A0 =A0 =A0 *value =3D of_read_ulong(prop->value + (offset * 4), 1)=
;
> + =A0 =A0 =A0 return 0;

Despite the fact that this is exactly what I asked you to write, this
ends up being rather ugly.  (I originally put in the '*4' to match the
behaviour of the existing of_read_number(), but that was a mistake.
tglx also pointed it out).  How about this instead:

int of_read_property_u32(struct property *prop, unsigned int offset,
u32 *out_value)
{
        if (!prop || !out_value)
                return -EINVAL;
        if (!prop->value)
                return -ENODATA;
        if (offset + sizeof(*out_value) > prop->length)
                return -EOVERFLOW;
        *out_value =3D be32_to_cpup(prop->data + offset);
        return 0;
}
int of_read_property_u64(struct property *prop, unsigned int offset,
u64 *out_value)
{
        if (!prop || !out_value)
                return -EINVAL;
        if (!prop->value)
                return -ENODATA;
        if (offset + sizeof(*out_value) > prop->length)
                return -EOVERFLOW;
        *out_value =3D be32_to_cpup(prop->value + offset);
        *out_value =3D (*out_value << 32) | be32_to_cpup(prop->value +
offset + sizeof(u32));
        return 0;
}


> +}
> +EXPORT_SYMBOL(of_read_property_u32);

EXPORT_SYMBOL_GPL()

> +
> +/**
> + * of_getprop_u32 - Find a property in a device node and read a 32-b=
it value
> + * @np: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0device node from which the pr=
operty value is to be read.
> + * @propname =A0 name of the property to be searched.
> + * @offset: =A0 =A0cell number to read.
> + * @value: =A0 =A0 returned value of the cell
> + *
> + * Search for a property in a device node and read a indexed 32-bit =
value of a
> + * property cell. Returns the 32-bit cell value, -EINVAL in case the
> property or
> + * the indexed cell does not exist.
> + */
> +int
> +of_getprop_u32(struct device_node *np, char *propname, int offset, u=
32 *value)
> +{
> + =A0 =A0 =A0 return of_read_property_u32(of_find_property(np, propna=
me, NULL),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 offset, value);
> +}
> +EXPORT_SYMBOL(of_getprop_u32);
> +
> +/**
> + * of_read_property_u64 - Reads a indexed 64-bit property value
> + * @prop: =A0 =A0 =A0property to read from.
> + * @offset: =A0 =A0cell number to read (each cell is 64-bits).
> + * @value: =A0 =A0 returned cell value
> + *
> + * Returns a indexed 64-bit value of a property cell, -EINVAL in cas=
e the cell
> + * does not exist
> + */
> +int of_read_property_u64(struct property *prop, int offset, u64 *val=
ue)
> +{
> + =A0 =A0 =A0 if (!prop || !prop->value)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 if ((offset + 1) * 8 > prop->length)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> +
> + =A0 =A0 =A0 *value =3D of_read_number(prop->value + (offset * 8), 2=
);
> + =A0 =A0 =A0 return 0;
> +}
> +EXPORT_SYMBOL(of_read_property_u64);
> +
> +/**
> + * of_getprop_u64 - Find a property in a device node and read a 64-b=
it value
> + * @np: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0device node from which the pr=
operty value is to be read.
> + * @propname =A0 name of the property to be searched.
> + * @offset: =A0 =A0cell number to read (each cell is 64-bits).
> + * @value: =A0 =A0 returned value of the cell
> + *
> + * Search for a property in a device node and read a indexed 64-bit =
value of a
> + * property cell. Returns the 64-bit cell value, -EINVAL in case the
> property or
> + * the indexed cell does not exist.
> + */
> +int
> +of_getprop_u64(struct device_node *np, char *propname, int offset, u=
64 *value)
> +{
> + =A0 =A0 =A0 return of_read_property_u64(of_find_property(np, propna=
me, NULL),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 offset, value);
> +}
> +EXPORT_SYMBOL(of_getprop_u64);
> +
> +/**
> + * of_read_property_string - Returns a pointer to a indexed null ter=
minated
> + * =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 property =
value string
> + * @prop: =A0 =A0 =A0property to read from.
> + * @offset: =A0 =A0index of the property string to be read.
> + * @string: =A0 =A0pointer to a null terminated string, valid only i=
f the return
> + * =A0 =A0 =A0 =A0 =A0 =A0 value is 0.
> + *
> + * Returns a pointer to a indexed null terminated property cell stri=
ng, -EINVAL
> + * in case the cell does not exist.
> + */
> +int of_read_property_string(struct property *prop, int offset, char =
**string)
> +{
> + =A0 =A0 =A0 char *c;
> +
> + =A0 =A0 =A0 if (!prop || !prop->value)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;

Ditto here about return values.

> +
> + =A0 =A0 =A0 c =3D (char *)prop->value;

You don't need the cast.  prop->value is a void* pointer.  However,
'c' does need to be const char.

> + =A0 =A0 =A0 while (offset--)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (*c++)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ;

Rather than open coding this, you should use the string library
functions.  Something like:

        c =3D prop->value;
        while (offset-- && (c - prop->value) < prop->size)
                c +=3D strlen(c) + 1;
        if ((c - prop->value) + strlen(c) >=3D prop->size)
                return -EOVERFLOW;
        *out_value =3D c;

Plus it catches more error conditions that way.

g.
