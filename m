From: =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio.lopez@collabora.co.uk>
Subject: Re: [PATCH 1/3] sysfs: Fix is_visible() support for binary attributes
Date: Tue, 8 Sep 2015 21:51:48 -0300
Message-ID: <55EF82A4.5000502@collabora.co.uk>
References: <1441714066-5599-1-git-send-email-emilio.lopez@collabora.co.uk>
 <1441714066-5599-2-git-send-email-emilio.lopez@collabora.co.uk>
 <20150908153013.GA6758@roeck-us.net> <20150908191002.GB10156@kroah.com>
 <20150908193052.GA11106@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:39157 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752673AbbIIAwI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Sep 2015 20:52:08 -0400
In-Reply-To: <20150908193052.GA11106@roeck-us.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, Greg KH <gregkh@linuxfoundation.org>
Cc: olof@lixom.net, kgene@kernel.org, k.kozlowski@samsung.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Greg & Guenter,

On 08/09/15 16:30, Guenter Roeck wrote:
> On Tue, Sep 08, 2015 at 12:10:02PM -0700, Greg KH wrote:
>> On Tue, Sep 08, 2015 at 08:30:13AM -0700, Guenter Roeck wrote:
>>> Emilio,
>>>
>>> On Tue, Sep 08, 2015 at 09:07:44AM -0300, Emilio L=F3pez wrote:
>>>> According to the sysfs header file:
>>>>
>>>>      "The returned value will replace static permissions defined i=
n
>>>>       struct attribute or struct bin_attribute."
>>>>
>>>> but this isn't the case, as is_visible is only called on
>>>> struct attribute only. This patch adds the code paths required
>>>> to support is_visible() on binary attributes.
>>>>
>>>> Signed-off-by: Emilio L=F3pez <emilio.lopez@collabora.co.uk>
>>>> ---
>>>>   fs/sysfs/group.c | 22 ++++++++++++++++++----
>>>>   1 file changed, 18 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
>>>> index 39a0199..eb6996a 100644
>>>> --- a/fs/sysfs/group.c
>>>> +++ b/fs/sysfs/group.c
>>>> @@ -37,10 +37,10 @@ static int create_files(struct kernfs_node *pa=
rent, struct kobject *kobj,
>>>>   {
>>>>   	struct attribute *const *attr;
>>>>   	struct bin_attribute *const *bin_attr;
>>>> -	int error =3D 0, i;
>>>> +	int error =3D 0, i =3D 0;
>>>>
>>>>   	if (grp->attrs) {
>>>> -		for (i =3D 0, attr =3D grp->attrs; *attr && !error; i++, attr++=
) {
>>>> +		for (attr =3D grp->attrs; *attr && !error; i++, attr++) {
>>>>   			umode_t mode =3D (*attr)->mode;
>>>>
>>>>   			/*
>>>> @@ -73,13 +73,27 @@ static int create_files(struct kernfs_node *pa=
rent, struct kobject *kobj,
>>>>   	}
>>>>
>>>>   	if (grp->bin_attrs) {
>>>> -		for (bin_attr =3D grp->bin_attrs; *bin_attr; bin_attr++) {
>>>> +		for (bin_attr =3D grp->bin_attrs; *bin_attr; i++, bin_attr++) {
>>>> +			umode_t mode =3D (*bin_attr)->attr.mode;
>>>> +
>>>>   			if (update)
>>>>   				kernfs_remove_by_name(parent,
>>>>   						(*bin_attr)->attr.name);
>>>> +			if (grp->is_visible) {
>>>> +				mode =3D grp->is_visible(kobj,
>>>> +						       &(*bin_attr)->attr, i);
>>>
>>> With this, if 'n' is the number of non-binary attributes,
>>>
>>> for i < n:
>>> 	The index passed to is_visible points to a non-binary attribute.
>>> for i >=3D n:
>>> 	The index passed to is_visible points to the (index - n)th binary
>>> 	attribute.
>>>
>>> Unless I am missing something, this is not explained anywhere, but =
it is
>>> not entirely trivial to understand. I think it should be documented=
=2E

I agree. I couldn't find any mention of what this int was supposed to b=
e=20
by looking at Documentation/ (is_visible is not even mentioned :/) or=20
include/linux/sysfs.h. Once we settle on something I'll document it=20
before sending a v2.

By the way, I wrote a quick coccinelle script to match is_visible()=20
users which reference the index (included below), and it found=20
references to drivers which do not seem to use any binary attributes, s=
o=20
I believe changing the index meaning shouldn't be an issue.

>> I agree, make i the number of the bin attribute and that should solv=
e
>> this issue.
>>
> No, that would conflict with the "normal" use of is_visible for non-b=
inary
> attributes, and make the index all but useless, since the is_visible =
function
> would have to search through all the attributes anyway to figure out =
which one
> is being checked.

Yeah, using the same indexes would be somewhat pointless, although not=20
many seem to be using it anyway (only 14 files matched). Others seem to=
=20
be comparing the attr* instead. An alternative would be to use negative=
=20
indexes for binary attributes and positive indexes for normal attribute=
s.

Cheers,
Emilio

---->8----


// Find out is_visible() users which reference the index
// somehow

virtual report

@ func @
identifier visiblefun, i, j, n;
@@

visiblefun(struct kobject *i, struct attribute *j, int n)
{
<+...n...+>
}

@ attrib depends on func @
identifier aops;
identifier func.visiblefun;
position p0;
@@

struct attribute_group aops@p0 =3D {
=2E..,
=2Eis_visible =3D visiblefun,
=2E..,
};

@script:python b_report depends on report@
p0 << attrib.p0;
@@

msg =3D "Suspicious is_visible(), please check."
coccilib.report.print_report(p0[0], msg)
