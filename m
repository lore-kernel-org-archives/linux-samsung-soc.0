From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 2/6] serial: samsung: Add device tree support for s5pv210
 uart driver
Date: Fri, 24 Jun 2011 17:57:59 +0530
Message-ID: <BANLkTimyEQfRjfbOj9ULnTcmQ3GLJnWxrw@mail.gmail.com>
References: <1308567752-13451-1-git-send-email-thomas.abraham@linaro.org>
	<1308567752-13451-3-git-send-email-thomas.abraham@linaro.org>
	<BANLkTi=+FKz-uPtSv572y5ORorMeGR8Anw@mail.gmail.com>
	<BANLkTi=RxEpBrALEQbBD_z6ZiEW24-wsng@mail.gmail.com>
	<BANLkTi=EVA6LckzWSFMQ07okD4gw-z5Zag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:47427 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754140Ab1FXM2A convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Jun 2011 08:28:00 -0400
Received: by qwk3 with SMTP id 3so1309621qwk.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Jun 2011 05:27:59 -0700 (PDT)
In-Reply-To: <BANLkTi=EVA6LckzWSFMQ07okD4gw-z5Zag@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robherring2@gmail.com>

Hi Grant,

On 24 June 2011 01:38, Grant Likely <grant.likely@secretlab.ca> wrote:
> Despite the fact that this is exactly what I asked you to write, this
> ends up being rather ugly. =A0(I originally put in the '*4' to match =
the
> behaviour of the existing of_read_number(), but that was a mistake.
> tglx also pointed it out). =A0How about this instead:

Your draft implementation below is suggesting that the offset should
be in bytes and not cells and so maybe you are suggesting the new
approach to support multi-format property values. I have changed the
implementation as per your code below.

>
> int of_read_property_u32(struct property *prop, unsigned int offset,
> u32 *out_value)
> {
> =A0 =A0 =A0 =A0if (!prop || !out_value)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> =A0 =A0 =A0 =A0if (!prop->value)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENODATA;
> =A0 =A0 =A0 =A0if (offset + sizeof(*out_value) > prop->length)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EOVERFLOW;
> =A0 =A0 =A0 =A0*out_value =3D be32_to_cpup(prop->data + offset);
> =A0 =A0 =A0 =A0return 0;
> }

[...]

>> +/**
>> + * of_read_property_string - Returns a pointer to a indexed null te=
rminated
>> + * =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 property=
 value string
>> + * @prop: =A0 =A0 =A0property to read from.
>> + * @offset: =A0 =A0index of the property string to be read.
>> + * @string: =A0 =A0pointer to a null terminated string, valid only =
if the return
>> + * =A0 =A0 =A0 =A0 =A0 =A0 value is 0.
>> + *
>> + * Returns a pointer to a indexed null terminated property cell str=
ing, -EINVAL
>> + * in case the cell does not exist.
>> + */
>> +int of_read_property_string(struct property *prop, int offset, char=
 **string)
>> +{
>> + =A0 =A0 =A0 char *c;
>> +
>> + =A0 =A0 =A0 if (!prop || !prop->value)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>
> Ditto here about return values.
>
>> +
>> + =A0 =A0 =A0 c =3D (char *)prop->value;
>
> You don't need the cast. =A0prop->value is a void* pointer. =A0Howeve=
r,
> 'c' does need to be const char.
>
>> + =A0 =A0 =A0 while (offset--)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (*c++)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ;
>
> Rather than open coding this, you should use the string library
> functions. =A0Something like:
>
> =A0 =A0 =A0 =A0c =3D prop->value;
> =A0 =A0 =A0 =A0while (offset-- && (c - prop->value) < prop->size)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0c +=3D strlen(c) + 1;
> =A0 =A0 =A0 =A0if ((c - prop->value) + strlen(c) >=3D prop->size)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EOVERFLOW;
> =A0 =A0 =A0 =A0*out_value =3D c;
>
> Plus it catches more error conditions that way.

If we change the offset to represent bytes and not cell index in the
u32 and u64 versions, shouldn't offset represent bytes for the string
version as well? In case of multi-format property values, there could
be u32 or u64 values intermixed with string values. So, some
modifications have been made to your above implementation of the
string version.

The new diff is listed below. Would there be any changes required. If
this is acceptable, I will submit a separate patch.

 drivers/of/base.c  |  142 ++++++++++++++++++++++++++++++++++++++++++++=
++++++++
 include/linux/of.h |   12 ++++
 2 files changed, 154 insertions(+), 0 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 632ebae..e9acbea 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -596,6 +596,148 @@ struct device_node
*of_find_node_by_phandle(phandle handle)
 EXPORT_SYMBOL(of_find_node_by_phandle);

 /**
+ * of_read_property_u32 - Reads a 32-bit property value
+ * @prop:	property to read from.
+ * @offset:	offset into property value to read from (in bytes).
+ * @out_value:	returned value.
+ *
+ * Returns a 32-bit value from a property. Returns -EINVAL, if the
property does
+ * not exist, -ENODATA, if property does not have a value, -EOVERFLOW,=
 if
+ * reading from offset overshoots the length of the property.
+ */
+int of_read_property_u32(struct property *prop, u32 offset, u32 *out_v=
alue)
+{
+	if (!prop || !out_value)
+		return -EINVAL;
+	if (!prop->value)
+		return -ENODATA;
+	if (offset + sizeof(*out_value) > prop->length)
+		return -EOVERFLOW;
+
+	*out_value =3D be32_to_cpup(prop->value + offset);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_read_property_u32);
+
+/**
+ * of_getprop_u32 - Find a property in a device node and read a 32-bit=
 value
+ * @np:		device node from which the property value is to be read.
+ * @propname	name of the property to be searched.
+ * @offset:	offset into property value to read from (in bytes).
+ * @out_value:	returned value.
+ *
+ * Search for a property in a device node and read a 32-bit value from=
 a
+ * property. Returns -EINVAL, if the property does not exist, -ENODATA=
, if
+ * property does not have a value, -EOVERFLOW, if reading from offset
overshoots
+ * the length of the property.
+ */
+int of_getprop_u32(struct device_node *np, char *propname, int offset,
+			u32 *out_value)
+{
+	return of_read_property_u32(of_find_property(np, propname, NULL),
+					offset, out_value);
+}
+EXPORT_SYMBOL_GPL(of_getprop_u32);
+
+/**
+ * of_read_property_u64 - Reads a 64-bit property value
+ * @prop:	property to read from.
+ * @offset:	offset into property value to read from (in bytes).
+ * @out_value:	returned value.
+ *
+ * Returns a 64-bit value from a property. Returns -EINVAL, if the
property does
+ * not exist, -ENODATA, if property does not have a value, -EOVERFLOW,=
 if
+ * reading from offset overshoots the length of the property.
+ */
+int of_read_property_u64(struct property *prop, int offset, u64 *out_v=
alue)
+{
+	if (!prop || !out_value)
+		return -EINVAL;
+	if (!prop->value)
+		return -ENODATA;
+	if (offset + sizeof(*out_value) > prop->length)
+		return -EOVERFLOW;
+	*out_value =3D be32_to_cpup(prop->value + offset);
+	*out_value =3D (*out_value << 32) |
+			be32_to_cpup(prop->value + offset + sizeof(u32));
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_read_property_u64);
+
+/**
+ * of_getprop_u64 - Find a property in a device node and read a 64-bit=
 value
+ * @np:		device node from which the property value is to be read.
+ * @propname	name of the property to be searched.
+ * @offset:	offset into property value to read from (in bytes).
+ * @out_value:	returned value.
+ *
+ * Search for a property in a device node and read a 64-bit value from=
 a
+ * property. Returns -EINVAL, if the property does not exist, -ENODATA=
, if
+ * property does not have a value, -EOVERFLOW, if reading from offset
overshoots
+ * the length of the property.
+ */
+int of_getprop_u64(struct device_node *np, char *propname, int offset,
+			u64 *out_value)
+{
+	return of_read_property_u64(of_find_property(np, propname, NULL),
+					offset, out_value);
+}
+EXPORT_SYMBOL_GPL(of_getprop_u64);
+
+/**
+ * of_read_property_string - Returns a pointer to a null terminated
+ *				property string value
+ * @prop:	property to read from.
+ * @offset:	offset into property value to read from (in bytes).
+ * @string:	pointer to a null terminated string, valid only if the ret=
urn
+ *		value is 0.
+ *
+ * Returns a pointer to a null terminated property string value.
Returns -EINVAL,
+ * if the property does not exist, -ENODATA, if property does not have=
 a value,
+ * -EOVERFLOW, if the offset overshoots the length of the property, -E=
ILSEQ, if
+ * the string is not null-terminated within the length of the property=
=2E
+ */
+int
+of_read_property_string(struct property *prop, int offset, char **out_=
string)
+{
+	if (!prop || !out_string)
+		return -EINVAL;
+	if (!prop->value)
+		return -ENODATA;
+	if (offset >=3D prop->length)
+		return -EOVERFLOW;
+	if (strnlen(prop->value + offset, prop->length - offset)
+			+ offset =3D=3D prop->length)
+		return -EILSEQ;
+	*out_string =3D prop->value + offset;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_read_property_string);
+
+/**
+ * of_getprop_string - Find a property in a device node and read a nul=
l
+ *			terminated string value
+ * @np:		device node from which the property value is to be read.
+ * @propname	name of the property to be searched.
+ * @offset:	offset into property value to read from (in bytes).
+ * @out_string:	pointer to a null terminated string, valid only if the=
 return
+ *		value is 0.
+ *
+ * Search for a property in a device node and return a pointer to a st=
ring
+ * value of a property. Returns -EINVAL, if the property does not exis=
t,
+ * -ENODATA, if property does not have a value, -EOVERFLOW, if the off=
set
+ * overshoots the length of the property, -EILSEQ, if the string is no=
t
+ * null-terminated within the length of the property.
+ */
+int of_getprop_string(struct device_node *np, char *propname, int offs=
et,
+			char **out_string)
+{
+	return of_read_property_string(of_find_property(np, propname, NULL),
+					offset, out_string);
+}
+EXPORT_SYMBOL_GPL(of_getprop_string);
+
+/**
  * of_parse_phandle - Resolve a phandle property to a device_node poin=
ter
  * @np: Pointer to device node holding phandle property
  * @phandle_name: Name of property holding a phandle value
diff --git a/include/linux/of.h b/include/linux/of.h
index bfc0ed1..f5c1065 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -195,6 +195,18 @@ extern struct device_node *of_find_node_with_prope=
rty(
 extern struct property *of_find_property(const struct device_node *np,
 					 const char *name,
 					 int *lenp);
+extern int of_read_property_u32(struct property *prop, u32 offset,
+				u32 *out_value);
+extern int of_getprop_u32(struct device_node *np, char *propname, int =
offset,
+				u32 *out_value);
+extern int of_read_property_u64(struct property *prop, int offset,
+				u64 *out_value);
+extern int of_getprop_u64(struct device_node *np, char *propname, int =
offset,
+				u64 *out_value);
+extern int of_read_property_string(struct property *prop, int offset,
+				char **out_string);
+extern int of_getprop_string(struct device_node *np, char *propname,
int offset,
+				char **out_string);
 extern int of_device_is_compatible(const struct device_node *device,
 				   const char *);
 extern int of_device_is_available(const struct device_node *device);


Thanks,
Thomas.
