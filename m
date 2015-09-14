From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/3] sysfs: Support is_visible() on binary attributes
Date: Mon, 14 Sep 2015 08:33:58 -0700
Message-ID: <55F6E8E6.9030509@roeck-us.net>
References: <1442234049-18637-1-git-send-email-emilio.lopez@collabora.co.uk>
 <1442234049-18637-2-git-send-email-emilio.lopez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:34736 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752655AbbINPeF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Sep 2015 11:34:05 -0400
In-Reply-To: <1442234049-18637-2-git-send-email-emilio.lopez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio.lopez@collabora.co.uk>, gregkh@linuxfoundation.org, olof@lixom.net, kgene@kernel.org, k.kozlowski@samsung.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 09/14/2015 05:34 AM, Emilio L=C3=B3pez wrote:
> According to the sysfs header file:
>
>      "The returned value will replace static permissions defined in
>       struct attribute or struct bin_attribute."
>
> but this isn't the case, as is_visible is only called on struct attri=
bute
> only. This patch introduces a new is_bin_visible() function to implem=
ent
> the same functionality for binary attributes, and updates documentati=
on
> accordingly.
>
> Signed-off-by: Emilio L=C3=B3pez <emilio.lopez@collabora.co.uk>

Nitpick below, but otherwise looks ok to me.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
>
> Changes from v1:
>   - Don't overload is_visible, introduce is_bin_visible instead as
>     discussed on the list.
>
>   fs/sysfs/group.c      | 17 +++++++++++++++--
>   include/linux/sysfs.h | 18 ++++++++++++++----
>   2 files changed, 29 insertions(+), 6 deletions(-)
>
> diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
> index 39a0199..51b56e6 100644
> --- a/fs/sysfs/group.c
> +++ b/fs/sysfs/group.c
> @@ -73,13 +73,26 @@ static int create_files(struct kernfs_node *paren=
t, struct kobject *kobj,
>   	}
>
>   	if (grp->bin_attrs) {
> -		for (bin_attr =3D grp->bin_attrs; *bin_attr; bin_attr++) {
> +		for (i =3D 0, bin_attr =3D grp->bin_attrs; *bin_attr; i++, bin_att=
r++) {
> +			umode_t mode =3D (*bin_attr)->attr.mode;
> +
>   			if (update)
>   				kernfs_remove_by_name(parent,
>   						(*bin_attr)->attr.name);
> +			if (grp->is_bin_visible) {
> +				mode =3D grp->is_bin_visible(kobj, *bin_attr, i);
> +				if (!mode)
> +					continue;
> +			}
> +
> +			WARN(mode & ~(SYSFS_PREALLOC | 0664),
> +			     "Attribute %s: Invalid permissions 0%o\n",
> +			     (*bin_attr)->attr.name, mode);
> +
> +			mode &=3D SYSFS_PREALLOC | 0664;

Strictly speaking, the mode validation for binary attributes is new and=
 logically
separate. Should it be mentioned in the commit log, or even be a separa=
te patch ?

>   			error =3D sysfs_add_file_mode_ns(parent,
>   					&(*bin_attr)->attr, true,
> -					(*bin_attr)->attr.mode, NULL);
> +					mode, NULL);
>   			if (error)
>   				break;
>   		}
> diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> index 9f65758..2f66050 100644
> --- a/include/linux/sysfs.h
> +++ b/include/linux/sysfs.h
> @@ -64,10 +64,18 @@ do {							\
>    *		a new subdirectory with this name.
>    * @is_visible:	Optional: Function to return permissions associated=
 with an
>    *		attribute of the group. Will be called repeatedly for each
> - *		attribute in the group. Only read/write permissions as well as
> - *		SYSFS_PREALLOC are accepted. Must return 0 if an attribute is
> - *		not visible. The returned value will replace static permissions
> - *		defined in struct attribute or struct bin_attribute.
> + *		non-binary attribute in the group. Only read/write
> + *		permissions as well as SYSFS_PREALLOC are accepted. Must
> + *		return 0 if an attribute is not visible. The returned value
> + *		will replace static permissions defined in struct attribute.
> + * @is_bin_visible:
> + *		Optional: Function to return permissions associated with a
> + *		binary attribute of the group. Will be called repeatedly
> + *		for each binary attribute in the group. Only read/write
> + *		permissions as well as SYSFS_PREALLOC are accepted. Must
> + *		return 0 if a binary attribute is not visible. The returned
> + *		value will replace static permissions defined in
> + *		struct bin_attribute.
>    * @attrs:	Pointer to NULL terminated list of attributes.
>    * @bin_attrs:	Pointer to NULL terminated list of binary attributes=
=2E
>    *		Either attrs or bin_attrs or both must be provided.
> @@ -76,6 +84,8 @@ struct attribute_group {
>   	const char		*name;
>   	umode_t			(*is_visible)(struct kobject *,
>   					      struct attribute *, int);
> +	umode_t			(*is_bin_visible)(struct kobject *,
> +						  struct bin_attribute *, int);
>   	struct attribute	**attrs;
>   	struct bin_attribute	**bin_attrs;
>   };
>
