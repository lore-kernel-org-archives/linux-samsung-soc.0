From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [RFC 3/4] drm: add generic blob properties for image enhancement
Date: Mon, 10 Mar 2014 09:50:14 +0530
Message-ID: <CAPdUM4OyQjtOsW1KZRJP0SU2FbFEm+FUFg18r9aiAqvTM7SqEA@mail.gmail.com>
References: <1394086334-20967-1-git-send-email-rahul.sharma@samsung.com>
	<1394086334-20967-4-git-send-email-rahul.sharma@samsung.com>
	<20140307083624.GB25837@phenom.ffwll.local>
	<CAPdUM4NGC_KHxt4GmRxvT9z_AM5G9_AhrnXXrSAWb3yjfv5W5Q@mail.gmail.com>
	<20140308004633.GD3546@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f178.google.com ([74.125.82.178]:43298 "EHLO
	mail-we0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750893AbaCJEUQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Mar 2014 00:20:16 -0400
Received: by mail-we0-f178.google.com with SMTP id u56so7704091wes.23
        for <linux-samsung-soc@vger.kernel.org>; Sun, 09 Mar 2014 21:20:14 -0700 (PDT)
In-Reply-To: <20140308004633.GD3546@intel.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, marcheu@chromium.org, Prashanth G <prashanth.g@samsung.com>, ajaykumar.rs@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>

On 8 March 2014 06:16, Matt Roper <matthew.d.roper@intel.com> wrote:
> On Fri, Mar 07, 2014 at 03:50:54PM +0530, Rahul Sharma wrote:
>> Hi Daniel,
>>
>> On 7 March 2014 14:06, Daniel Vetter <daniel@ffwll.ch> wrote:
>> > On Thu, Mar 06, 2014 at 11:42:13AM +0530, Rahul Sharma wrote:
>> >> Add generic KMS blob properties to core drm framework. These
>> >> are writable blob properties which can be used to set Image
>> >> Enhancement parameters. The properties which are added here
>> >> are meant for color reproduction, color saturation and edge
>> >> enhancement.
>> >>
>> >> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ...
>> > Tbh I don't really understand why we can't use normal properties for this.
>> > We might want to add a new RBG type of property (or YUV fwiw, both with
>> > and without alpha) to make this standardized (maybe with some fixed point
>> > value for non-normalizes).
>>
>> I dropped Normal properties (the ones which accepts 64 bit data)
>> because there will be too many of them. As you can see the
>> count is going upto 24 parameters, means 24 such properties, as
>> each can carry one parameter. This is too much of overhead.
>> Please correct me if you mean something different.
>>
>> I am not sure what are RGB type properties? I know only about 64-bit
>> normal properties which are too compact to carry above structures. Are
>> you talking about set_gamma type of ioctls. Each "set_gamma" type
>> ioctl needs a addition in callbacks till down the layer which looks bit
>> unnecessary, while writable blob properties are using same set_property
>> and get_property infrastructure.
>>
>> >
>> > If the only reason you group them is to atomically commit them, then the
>> > only thing we need is the atomic ioctl, which can shovel entire groups of
>> > properties over the wire at once.
>>
>> Atomic commit is not an explicit requirement. But splitting them to
>> many small pieces (in case of normal properties) are resulting into
>> many user-kernel switching overhead, which seems avoidable.
>
> The idea with atomic modeset / nuclear pageflip is that you collect a
> whole bunch of individual property updates into a "property set"
> container in userspace (libdrm).  When you're done setting all the
> values you want and "commit" the property set, all of the values that
> you collected get passed to the kernel in one go via a new ioctl (and
> are then updated in an atomic manner by the DRM driver).  So performing
> your 24 different property updates via the upcoming atomic API's
> shouldn't be a problem and shouldn't add any unnecessary overhead.
>
> The kernel-side of atomic modeset / nuclear pageflip is still a WIP, so
> it isn't upstream yet, but you can see the userspace-facing API in Rob
> Clark's repo here:
>
>         https://github.com/robclark/libdrm/blob/atomic/xf86drmMode.h
>
> Note the drmModePropertySet{Alloc,Add,Commit,Free}() functions near the
> bottom.
>

Thanks Matt,

I went through the share link. Got the idea of atomic
modeset. It is a good solution for setting 24 properties
in one go. But another issue is still unaddressed. I
mean still need to declare 24 properties which are not
"Really 24 different properties".

These are sub-parameters to 3 properties (color
reproduction, color saturation and edge enhancement).
Splitting them to 24 pieces, just because we don't have a
a provision in KMS, is a work around to get things
working. And, properties like "saturation_hue_gain_red",
"saturation_hue_gain_green" ... will be undoubtedly ugly.

In Rob Clark's tree, I noticed

extern int drmModePropertySetAddBlob(drmModePropertySetPtr set,
    uint32_t object_id,
    uint32_t property_id,
    uint64_t length,
    void *blob);

Seems, already some implementation of writable blobs is
there. I am not able to see the kernel though.

I request experts, to review this solution again. I found it
quite useful and hold good with the idea of Atomic modeset.

Regards,
Rahul Sharma

>
> Matt
>
> --
> Matt Roper
> Graphics Software Engineer
> ISG Platform Enabling & Development
> Intel Corporation
> (916) 356-2795
