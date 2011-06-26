From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/6] serial: samsung: Add device tree support for s5pv210
	uart driver
Date: Sun, 26 Jun 2011 17:27:13 -0600
Message-ID: <BANLkTi=7zYkrLmSEiZZ69gACaG+8k4oa_Q@mail.gmail.com>
References: <1308567752-13451-1-git-send-email-thomas.abraham@linaro.org>
	<1308567752-13451-3-git-send-email-thomas.abraham@linaro.org>
	<BANLkTi=+FKz-uPtSv572y5ORorMeGR8Anw@mail.gmail.com>
	<BANLkTi=RxEpBrALEQbBD_z6ZiEW24-wsng@mail.gmail.com>
	<BANLkTi=EVA6LckzWSFMQ07okD4gw-z5Zag@mail.gmail.com>
	<BANLkTimyEQfRjfbOj9ULnTcmQ3GLJnWxrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <BANLkTimyEQfRjfbOj9ULnTcmQ3GLJnWxrw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jun 24, 2011 at 6:27 AM, Thomas Abraham
<thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Hi Grant,
>
> On 24 June 2011 01:38, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>> Despite the fact that this is exactly what I asked you to write, this
>> ends up being rather ugly. =A0(I originally put in the '*4' to match the
>> behaviour of the existing of_read_number(), but that was a mistake.
>> tglx also pointed it out). =A0How about this instead:
>
> Your draft implementation below is suggesting that the offset should
> be in bytes and not cells and so maybe you are suggesting the new
> approach to support multi-format property values. I have changed the
> implementation as per your code below.

I've been going back and forth on this.  The offset is most flexible
if it is in bytes, but most DT data is organized into cells, so a byte
offset is a little intuitive.  For string properties, it really
doesn't make sense to have the offset in bytes because the offset
generally either cannot be known until after reading earlier values in
the property, or is meaningless without the earlier data in the case
of mixed value properties.  However, I think I've gotten caught up
into a case of feature creep on these functions and I've tried to make
them as flexible as possible.  The reality is that it will almost
never be useful to obtain only the 2nd or 3rd cell in a property.  In
those cases, the driver probably needs to parse all the data in the
property, and therefore it is better to obtain a pointer to the entire
data block for parsing instead of searching for the property over and
over again (which is what of_getprop_u32() will do).

So, I'm changing the design (for the last time, I promise!).  Rather
than trying to solve some future theoretical use case, the functions
should focus on what is actually needed immediately.  Let's drop the
u64 version, and only implement of_getprop_u32() and
of_getprop_string().  u64 can always be added at a later date if we
need it.  Also, we'll drop the offset parameter because I don't
foresee any situation where it is the right thing to do.  Something
like this (modifying your latest code):

/**
 * of_property_read_u32 - Find a property in a device node and read a
32-bit value
 * @np: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0device node from which the property =
value is to be read.
 * @propname: =A0 name of the property to be searched.
 * @out_value: returned value.
 *
 * Search for a property in a device node and read a 32-bit value from a
 * property. Returns -EINVAL, if the property does not exist, -ENODATA, if
 * property does not have a value, -EOVERFLOW, if the property data isn't l=
arge
 * enough, and 0 on success.
 *
 * The out_value is only modified if a valid u32 can be decoded.
 */
int of_property_read_u32(struct device_node *np, char *propname, u32 *out_v=
alue)
{
 =A0 =A0 =A0 struct property *prop =3D of_find_property(np, propname, NULL),
 =A0 =A0 =A0 if (!prop)
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
 =A0 =A0 =A0 if (!prop->value)
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODATA;
 =A0 =A0 =A0 if (sizeof(*out_value) > prop->length)
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EOVERFLOW;
 =A0 =A0 =A0 *out_value =3D be32_to_cpup(prop->value);
 =A0 =A0 =A0 return 0;
}
EXPORT_SYMBOL_GPL(of_property_read_u32);

/**
 * of_property_read_u32 - Find a property in a device node and read a
32-bit value
 * @np: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0device node from which the property =
value is to be read.
 * @propname: =A0 name of the property to be searched.
 * @out_string: =A0 =A0pointer to a null terminated string, valid only if t=
he return
 * =A0 =A0 =A0 =A0 =A0 =A0 value is 0.
 *
 * Returns a pointer to a null terminated property string value.
Returns -EINVAL,
 * if the property does not exist, -ENODATA, if property does not have a va=
lue,
 * -EILSEQ, if the string is not null-terminated within the length of
the property.
 *
 * The out_string value is only modified if a valid string can be decoded.
 */
int of_property_read_u32(struct device_node *np, char *propname, char
**out_string)
{
 =A0 =A0 =A0 struct property *prop =3D of_find_property(np, propname, NULL),
 =A0 =A0 =A0 if (!prop)
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
 =A0 =A0 =A0 if (!prop->value)
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODATA;
 =A0 =A0 =A0 if (strnlen(prop->value, prop->length) =3D=3D prop->length)
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EILSEQ;
 =A0 =A0 =A0 *out_string =3D prop->value;
 =A0 =A0 =A0 return 0;
}
EXPORT_SYMBOL_GPL(of_property_read_u32);

I think overall this will be the most useful, and it can always be
expanded at a later date if more use cases show up.

g.
