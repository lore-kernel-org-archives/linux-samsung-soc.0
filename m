From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: Adding set_blob ioctl to DRM
Date: Wed, 5 Mar 2014 14:21:14 +0530
Message-ID: <CAPdUM4M=7SuNi2ELRFsSKP_3HeNfNrqsUKNj8i=J2c4LpRASGw@mail.gmail.com>
References: <CAPdUM4PXxXgywMA8KnLhwAToHqfc0EP7HNDKjKJLK3T1HA7_eQ@mail.gmail.com>
	<CAPM=9tz6TzVyyCsNAGqt4Vy+WoKjcc-yvq7fSiLhNUKeWFO6bA@mail.gmail.com>
	<20140304083557.GM17001@phenom.ffwll.local>
	<20140304093955.5df67721@bpaauwe-desk.fm.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f42.google.com ([209.85.219.42]:49629 "EHLO
	mail-oa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752016AbaCEIvP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Mar 2014 03:51:15 -0500
Received: by mail-oa0-f42.google.com with SMTP id i4so724059oah.15
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Mar 2014 00:51:14 -0800 (PST)
In-Reply-To: <20140304093955.5df67721@bpaauwe-desk.fm.intel.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bob Paauwe <bob.j.paauwe@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Prashanth G <prashanth.g@samsung.com>, Sean Paul <seanpaul@chromium.org>, marcheu@chromium.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Rahul Sharma <rahul.sharma@samsung.com>

Thanks Daniel and Bob,

Agree, DT is good enough for initial settings. But when need to support
on the fly parameter changes, we will end up with 2 solutions. Adding KMS
ioctls or improvising blob prop infrastructure (Ruled out existing KMS 64bit
props as list of parameters is close to 30, as if now).

Later seems better for three reasons; writable blobs are more scalable and
can be used for any type of parameter groups. Secondly these are very similar
to 64 bit props and use same set_property, get_property infrastructure
(else need
to add set_gamma kind of callbacks till down the layer). And at last, it looks
more complete and appropriate to provide writable blobs just like other KMS
property.

I am ready with RFC and posting it today. We can also continue this discussion
in RFC thread.

Regards,
Rahul Sharma.

On 4 March 2014 23:09, Bob Paauwe <bob.j.paauwe@intel.com> wrote:
> On Tue, 4 Mar 2014 09:35:57 +0100
> Daniel Vetter <daniel@ffwll.ch> wrote:
>
>> On Thu, Feb 20, 2014 at 11:24:40AM +1000, Dave Airlie wrote:
>> > > I am working on enabling a Color Enhancement block for primary display
>> > > for Exynos SoC. I need to
>> > > set a bunch of parameters like Color Conversion matrix, Contrast
>> > > Improvement parameters etc ~ 30 parameters from User Space.
>> > >
>> > > I am planning to use KDS blob property to receive these parameters.
>> > > Currently drivers are not allowed to create a blob property inside
>> > > drm. Neither, user space can set the blob. There is no ioctl provided
>> > > for same.
>> >
>> > I don't really like the idea of sticking unstructured data into an
>> > ioctl, for the driver to interpret,
>> >
>> > it opens the door to all kinds of ugly driver hacks, so I think we
>> > should have writable blobs,
>> > but with well defined structures inside them, not per-driver ones.
>> >
>> > Per-driver structures will lead to binary userspace drivers that start
>> > sticking a pll timings blob on the end and require it to set a mode,
>> > because I know driver developers will abuse any interface in the worst
>> > way possible.
>> >
>> > Currently the only blob we really have is EDID and its well defined,
>> > so if we are going to add writable blobs, they need to be well defined
>> > and as little as possible driver specific, just to avoid driver
>> > writings doing what driver writers do.
>>
>> tbh I don't see a use for structured blobs at all and would much more
>> prefer a pile of properties. With the atomic modeset ioctl proposals
>> floating around we could then pass in an entire sets of properties, which
>> is essentially what the blob prop would be doing.
>>
>> The upshot of going all-in with explicitly named properties is that we can
>> shovel kms configuration descriptions into different formats. I'm thinking
>> of shovelling an initial config into DT or something similar as an
>> example.  For i915 we have some experimental patches which load a DT blob
>> as a firmware file and use the property values to set things up.
>
> I have most of this working with i915 now.  Using a DT configuration I
> can set module parameters, select which crtc's to enable, which
> connectors to enable, set connector properties at init time.  I'm
> working on some plane property code now.
>
> It's close to being ready for initial review/feedback but there's one
> problem, you can't currently build an x86_64 (32 bit is fine) kernel
> with DT enabled because of an unresolved symbol in the apic code.
>
>>
>> So imo a blob property needs some _really_ good justification. My default
>> stance is to oppose it ;-)
>>
>> Cheers, Daniel
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
