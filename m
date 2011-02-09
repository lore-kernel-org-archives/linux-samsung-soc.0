From: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH/RFC 0/5] HDMI driver for Samsung S5PV310 platform
Date: Wed, 9 Feb 2011 02:12:25 -0500
Message-ID: <AANLkTimeYp=aJi40jH2Nwu25C_e1dJYxLXXXu-7zwZEp@mail.gmail.com>
References: <1297157427-14560-1-git-send-email-t.stanislaws@samsung.com>
	<201102081047.17840.hansverk@cisco.com>
	<AANLkTi=A=HiAvHojWP8HcFXpjXbZpq6UdHjOnWq-8jww@mail.gmail.com>
	<1297205267.2423.24.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:41684 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750801Ab1BIHM1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Feb 2011 02:12:27 -0500
In-Reply-To: <1297205267.2423.24.camel@localhost>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andy Walls <awalls@md.metrocast.net>
Cc: Hans Verkuil <hansverk@cisco.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, Maling list - DRI developers <dri-devel@lists.freedesktop.org>

On Tue, Feb 8, 2011 at 5:47 PM, Andy Walls <awalls@md.metrocast.net> wr=
ote:
> On Tue, 2011-02-08 at 10:28 -0500, Alex Deucher wrote:
>> On Tue, Feb 8, 2011 at 4:47 AM, Hans Verkuil <hansverk@cisco.com> wr=
ote:
>> > Just two quick notes. I'll try to do a full review this weekend.
>> >
>> > On Tuesday, February 08, 2011 10:30:22 Tomasz Stanislawski wrote:
>> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >> =A0Introduction
>> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >>
>> >> The purpose of this RFC is to discuss the driver for a TV output =
interface
>> >> available in upcoming Samsung SoC. The HW is able to generate dig=
ital and
>> >> analog signals. Current version of the driver supports only digit=
al output.
>> >>
>> >> Internally the driver uses videobuf2 framework, and CMA memory al=
locator.
>> > Not
>> >> all of them are merged by now, but I decided to post the sources =
to start
>> >> discussion driver's design.
>
>> >
>> > Cisco (i.e. a few colleagues and myself) are working on this. We h=
ope to post
>> > an RFC by the end of this month. We also have a proposal for CEC s=
upport in
>> > the pipeline.
>>
>> Any reason to not use the drm kms APIs for modesetting, display
>> configuration, and hotplug support? =A0We already have the
>> infrastructure in place for complex display configurations and
>> generating events for hotplug interrupts. =A0It would seem to make m=
ore
>> sense to me to fix any deficiencies in the KMS APIs than to spin a n=
ew
>> API. =A0Things like CEC would be a natural fit since a lot of deskto=
p
>> GPUs support hdmi audio/3d/etc. and are already using kms.
>>
>> Alex
>
> I'll toss one out: lack of API documentation for driver or applicatio=
n
> developers to use.
>
>
> When I last looked at converting ivtvfb to use DRM, KMS, TTM, etc. (t=
o
> possibly get rid of reliance on the ivtv X video driver
> http://dl.ivtvdriver.org/xf86-video-ivtv/ ), I found the documentatio=
n
> was really sparse.
>
> DRM had the most documentation under Documentation/DocBook/drm.tmpl, =
but
> the userland API wasn't fleshed out. =A0GEM was talked about a bit in
> there as well, IIRC.
>
> TTM documentation was essentially non-existant.
>
> I can't find any KMS documentation either.
>
> I recall having to read much of the drm code, and having to look at t=
he
> radeon driver, just to tease out what the DRM ioctls needed to do.
>
> Am I missing a Documentation source for the APIs?
>

Documentation is somewhat sparse compared to some other APIs.  Mostly
inline kerneldoc comments in the core functions.  It would be nice to
improve things.   The modesetting API is very similar to the xrandr
API in the xserver.

At the moment a device specific surface manager (Xorg ddx, or some
other userspace lib) is required to use kms due to device specific
requirements with respect to memory management and alignment for
acceleration.  The kms modesetting ioctls are common across all kms
drm drivers, but the memory management ioctls are device specific.
GEM itself is an Intel-specific memory manager, although radeon uses
similar ioctls.  TTM is used internally by radeon, nouveau, and svga
for managing memory gpu accessible memory pools.  Drivers are free to
use whatever memory manager they want; an existing one shared with a
v4l or platform driver, TTM, or something new.  There is no generic
userspace kms driver/lib although Dave and others have done some work
to support that, but it's really hard to make a generic interface
flexible enough to handle all the strange acceleration requirements of
GPUs.  kms does however provide a legacy kernel fb interface.

While the documentation is not great, the modesetting API is solid and
it would be nice to get more people involved and working on it (or at
least looking at it) rather than starting something equivalent from
scratch or implementing a device specific modesetting API.  If you
have any questions about it, please ask on dri-devel (CCed).

Alex

>
>
> For V4L2 and DVB on ther other hand, one can point to pretty verbose
> documentation that application developers can use:
>
> =A0 =A0 =A0 =A0http://linuxtv.org/downloads/v4l-dvb-apis/
>
>
>
> Regards,
> Andy
>
>
>
