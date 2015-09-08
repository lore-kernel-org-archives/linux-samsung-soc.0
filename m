From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/3] sysfs: Fix is_visible() support for binary attributes
Date: Tue, 8 Sep 2015 12:30:52 -0700
Message-ID: <20150908193052.GA11106@roeck-us.net>
References: <1441714066-5599-1-git-send-email-emilio.lopez@collabora.co.uk>
 <1441714066-5599-2-git-send-email-emilio.lopez@collabora.co.uk>
 <20150908153013.GA6758@roeck-us.net>
 <20150908191002.GB10156@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:51364 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751136AbbIHTa6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Sep 2015 15:30:58 -0400
Content-Disposition: inline
In-Reply-To: <20150908191002.GB10156@kroah.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio.lopez@collabora.co.uk>, olof@lixom.net, kgene@kernel.org, k.kozlowski@samsung.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Tue, Sep 08, 2015 at 12:10:02PM -0700, Greg KH wrote:
> On Tue, Sep 08, 2015 at 08:30:13AM -0700, Guenter Roeck wrote:
> > Emilio,
> >=20
> > On Tue, Sep 08, 2015 at 09:07:44AM -0300, Emilio L=F3pez wrote:
> > > According to the sysfs header file:
> > >=20
> > >     "The returned value will replace static permissions defined i=
n
> > >      struct attribute or struct bin_attribute."
> > >=20
> > > but this isn't the case, as is_visible is only called on
> > > struct attribute only. This patch adds the code paths required
> > > to support is_visible() on binary attributes.
> > >=20
> > > Signed-off-by: Emilio L=F3pez <emilio.lopez@collabora.co.uk>
> > > ---
> > >  fs/sysfs/group.c | 22 ++++++++++++++++++----
> > >  1 file changed, 18 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
> > > index 39a0199..eb6996a 100644
> > > --- a/fs/sysfs/group.c
> > > +++ b/fs/sysfs/group.c
> > > @@ -37,10 +37,10 @@ static int create_files(struct kernfs_node *p=
arent, struct kobject *kobj,
> > >  {
> > >  	struct attribute *const *attr;
> > >  	struct bin_attribute *const *bin_attr;
> > > -	int error =3D 0, i;
> > > +	int error =3D 0, i =3D 0;
> > > =20
> > >  	if (grp->attrs) {
> > > -		for (i =3D 0, attr =3D grp->attrs; *attr && !error; i++, attr+=
+) {
> > > +		for (attr =3D grp->attrs; *attr && !error; i++, attr++) {
> > >  			umode_t mode =3D (*attr)->mode;
> > > =20
> > >  			/*
> > > @@ -73,13 +73,27 @@ static int create_files(struct kernfs_node *p=
arent, struct kobject *kobj,
> > >  	}
> > > =20
> > >  	if (grp->bin_attrs) {
> > > -		for (bin_attr =3D grp->bin_attrs; *bin_attr; bin_attr++) {
> > > +		for (bin_attr =3D grp->bin_attrs; *bin_attr; i++, bin_attr++) =
{
> > > +			umode_t mode =3D (*bin_attr)->attr.mode;
> > > +
> > >  			if (update)
> > >  				kernfs_remove_by_name(parent,
> > >  						(*bin_attr)->attr.name);
> > > +			if (grp->is_visible) {
> > > +				mode =3D grp->is_visible(kobj,
> > > +						       &(*bin_attr)->attr, i);
> >=20
> > With this, if 'n' is the number of non-binary attributes,
> >=20
> > for i < n:
> > 	The index passed to is_visible points to a non-binary attribute.
> > for i >=3D n:
> > 	The index passed to is_visible points to the (index - n)th binary
> > 	attribute.
> >=20
> > Unless I am missing something, this is not explained anywhere, but =
it is
> > not entirely trivial to understand. I think it should be documented=
=2E
>=20
> I agree, make i the number of the bin attribute and that should solve
> this issue.
>=20
No, that would conflict with the "normal" use of is_visible for non-bin=
ary
attributes, and make the index all but useless, since the is_visible fu=
nction
would have to search through all the attributes anyway to figure out wh=
ich one
is being checked.

Guenter
