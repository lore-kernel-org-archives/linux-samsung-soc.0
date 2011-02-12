From: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH/RFC 0/5] HDMI driver for Samsung S5PV310 platform
Date: Sat, 12 Feb 2011 13:38:54 -0500
Message-ID: <AANLkTin1x_A6FBEUZ2dm=27nqc3tGg2qxR0Fp0vh2RQC@mail.gmail.com>
References: <1297157427-14560-1-git-send-email-t.stanislaws@samsung.com>
	<201102081047.17840.hansverk@cisco.com>
	<AANLkTi=A=HiAvHojWP8HcFXpjXbZpq6UdHjOnWq-8jww@mail.gmail.com>
	<1297205267.2423.24.camel@localhost>
	<AANLkTimeYp=aJi40jH2Nwu25C_e1dJYxLXXXu-7zwZEp@mail.gmail.com>
	<1297299065.2428.125.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:49782 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751571Ab1BLSi4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 12 Feb 2011 13:38:56 -0500
In-Reply-To: <1297299065.2428.125.camel@localhost>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andy Walls <awalls@md.metrocast.net>
Cc: Hans Verkuil <hansverk@cisco.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, Maling list - DRI developers <dri-devel@lists.freedesktop.org>

On Wed, Feb 9, 2011 at 7:51 PM, Andy Walls <awalls@md.metrocast.net> wr=
ote:
> On Wed, 2011-02-09 at 02:12 -0500, Alex Deucher wrote:
>> On Tue, Feb 8, 2011 at 5:47 PM, Andy Walls <awalls@md.metrocast.net>=
 wrote:
>> > On Tue, 2011-02-08 at 10:28 -0500, Alex Deucher wrote:
>> >> On Tue, Feb 8, 2011 at 4:47 AM, Hans Verkuil <hansverk@cisco.com>=
 wrote:
>> >> > Just two quick notes. I'll try to do a full review this weekend=
=2E
>> >> >
>> >> > On Tuesday, February 08, 2011 10:30:22 Tomasz Stanislawski wrot=
e:
>> >> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >> >> =A0Introduction
>> >> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >> >>
>> >> >> The purpose of this RFC is to discuss the driver for a TV outp=
ut interface
>> >> >> available in upcoming Samsung SoC. The HW is able to generate =
digital and
>> >> >> analog signals. Current version of the driver supports only di=
gital output.
>> >> >>
>> >> >> Internally the driver uses videobuf2 framework, and CMA memory=
 allocator.
>> >> > Not
>> >> >> all of them are merged by now, but I decided to post the sourc=
es to start
>> >> >> discussion driver's design.
>> >
>> >> >
>> >> > Cisco (i.e. a few colleagues and myself) are working on this. W=
e hope to post
>> >> > an RFC by the end of this month. We also have a proposal for CE=
C support in
>> >> > the pipeline.
>> >>
>> >> Any reason to not use the drm kms APIs for modesetting, display
>> >> configuration, and hotplug support? =A0We already have the
>> >> infrastructure in place for complex display configurations and
>> >> generating events for hotplug interrupts. =A0It would seem to mak=
e more
>> >> sense to me to fix any deficiencies in the KMS APIs than to spin =
a new
>> >> API. =A0Things like CEC would be a natural fit since a lot of des=
ktop
>> >> GPUs support hdmi audio/3d/etc. and are already using kms.
>> >>
>> >> Alex
>> >
>> > I'll toss one out: lack of API documentation for driver or applica=
tion
>> > developers to use.
>> >
>> >
>> > When I last looked at converting ivtvfb to use DRM, KMS, TTM, etc.=
 (to
>> > possibly get rid of reliance on the ivtv X video driver
>> > http://dl.ivtvdriver.org/xf86-video-ivtv/ ), I found the documenta=
tion
>> > was really sparse.
>> >
>> > DRM had the most documentation under Documentation/DocBook/drm.tmp=
l, but
>> > the userland API wasn't fleshed out. =A0GEM was talked about a bit=
 in
>> > there as well, IIRC.
>> >
>> > TTM documentation was essentially non-existant.
>> >
>> > I can't find any KMS documentation either.
>> >
>> > I recall having to read much of the drm code, and having to look a=
t the
>> > radeon driver, just to tease out what the DRM ioctls needed to do.
>> >
>> > Am I missing a Documentation source for the APIs?
>> >
>>
>> Documentation is somewhat sparse compared to some other APIs. =A0Mos=
tly
>> inline kerneldoc comments in the core functions. =A0It would be nice=
 to
>> improve things. =A0 The modesetting API is very similar to the xrand=
r
>> API in the xserver.
>>
>> At the moment a device specific surface manager (Xorg ddx, or some
>> other userspace lib) is required to use kms due to device specific
>> requirements with respect to memory management and alignment for
>> acceleration. =A0The kms modesetting ioctls are common across all km=
s
>> drm drivers, but the memory management ioctls are device specific.
>> GEM itself is an Intel-specific memory manager, although radeon uses
>> similar ioctls. =A0TTM is used internally by radeon, nouveau, and sv=
ga
>> for managing memory gpu accessible memory pools. =A0Drivers are free=
 to
>> use whatever memory manager they want; an existing one shared with a
>> v4l or platform driver, TTM, or something new.
>> =A0 There is no generic
>> userspace kms driver/lib although Dave and others have done some wor=
k
>> to support that, but it's really hard to make a generic interface
>> flexible enough to handle all the strange acceleration requirements =
of
>> GPUs.
>
> All of the above unfortunately says to me that the KMS API has a fair=
ly
> tightly coupled set of userspace components, because userspace
> applications need have details about the specific underlying hardware
> embeeded in the application to effectively use the API.
>

At the moment, the only thing that uses the APIs are X-like things,
Xorg, but also, wayland and graphical boot managers like plymouth.
However, embedded devices with graphics often have similar usage
models so the APIs would work for them as well.  I'm sorry if I gave
the wrong impression, I was not implying you should use kms for video
capture, but rather it should be considered for video output type
things.  Right now just about every embedded device out there uses
some device specific hack (either a hacked up kernel fb interface or
some proprietary ioctls) to support video output and framebuffers.
The hardware is not that different from desktop hardware.

> If so, that's not really conducive to getting application developers =
to
> write applications to the API, since applications will get tied to
> specific sets of hardware.
>
> Lack of documentation on the API for userpace application writers to =
use
> exacerbates that issue, as there are no clearly stated guarantees on
>
> =A0 =A0 =A0 =A0device node conventions
> =A0 =A0 =A0 =A0ioctl's
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arguments and bounds on the arguments
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0expected error return values
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0behavior on error return and meaning o=
f error return
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0which are mandatory, which are optiona=
l
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0how to perform "atomic" transactions
> =A0 =A0 =A0 =A0Behavior of other fops:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Are multiple opens allowed or not?
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Is llseek() meaningful?
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Is poll() meaningful?
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Does final close() deallocate all memo=
ry objects?
> =A0 =A0 =A0 =A0sysfs nodes
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0location
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0expected names
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0data formats
> =A0 =A0 =A0 =A0how compliant or not any one driver is with the KMS AP=
Icontrol
> =A0 =A0 =A0 =A0where drivers are permitted to behave differently and =
where they are not
> =A0 =A0 =A0 =A0What include files do user space applications need to =
include

=46or things like 3D, the API is generally provided by large userspace
libraries that provide the actual API used by the applications.  The
API libs talk to the drm via their own device specific ioctls, there's
no real way around that.  However, your app can use the API provided
by that lib, e.g, OpenGL or X rendering.

However, modesetting is common enough across asics that it can and
does use a common API.  Once Dave's generic buffer allocation ioctls
land, you can create a general app that can allocate buffers and set
modes on multiple displays uses only the kms and generic buffer
ioctls.  If you want to do anything more advanced, you will need
device specific APIs.

It's easiest to use libdrm and include xf86drmMode.h.
http://cgit.freedesktop.org/mesa/drm/tree/

There are also device specific helper libs in the libdrm tree
(libdrm_radeon, libdrm_intel, etc.) that provide easy to use
interfaces for device specific ioctls like memory management an
acceleration.

With a combination of libdrm for modesetting and connecting to the
device and device specific libs for acceleration and memory
management, you can support just about any display-type setup you
might want.

>
>
> What device nodes should be opened?
> $ ls -al /dev/dri/*
> crw-rw----+ 1 root video 226, =A00 2011-02-09 17:27 /dev/dri/card0
> crw-rw-rw-. 1 root video 226, 64 2011-02-09 17:26 /dev/dri/controlD64
>
> What's the difference between them?
> What's the renderDnn node that can show up?
>
> Which of the below are mandatory for a KMS driver to support?
> Which are optional?
> Which were bad ideas and are deprecated?
>
> #define DRM_IOCTL_MODE_GETRESOURCES =A0 =A0 DRM_IOWR(0xA0, struct drm=
_mode_card_res)
> #define DRM_IOCTL_MODE_GETCRTC =A0 =A0 =A0 =A0 =A0DRM_IOWR(0xA1, stru=
ct drm_mode_crtc)
> #define DRM_IOCTL_MODE_SETCRTC =A0 =A0 =A0 =A0 =A0DRM_IOWR(0xA2, stru=
ct drm_mode_crtc)
> #define DRM_IOCTL_MODE_CURSOR =A0 =A0 =A0 =A0 =A0 DRM_IOWR(0xA3, stru=
ct drm_mode_cursor)
> #define DRM_IOCTL_MODE_GETGAMMA =A0 =A0 =A0 =A0 DRM_IOWR(0xA4, struct=
 drm_mode_crtc_lut)
> #define DRM_IOCTL_MODE_SETGAMMA =A0 =A0 =A0 =A0 DRM_IOWR(0xA5, struct=
 drm_mode_crtc_lut)
> #define DRM_IOCTL_MODE_GETENCODER =A0 =A0 =A0 DRM_IOWR(0xA6, struct d=
rm_mode_get_encoder)
> #define DRM_IOCTL_MODE_GETCONNECTOR =A0 =A0 DRM_IOWR(0xA7, struct drm=
_mode_get_connector)
> #define DRM_IOCTL_MODE_ATTACHMODE =A0 =A0 =A0 DRM_IOWR(0xA8, struct d=
rm_mode_mode_cmd)
> #define DRM_IOCTL_MODE_DETACHMODE =A0 =A0 =A0 DRM_IOWR(0xA9, struct d=
rm_mode_mode_cmd)
>
> #define DRM_IOCTL_MODE_GETPROPERTY =A0 =A0 =A0DRM_IOWR(0xAA, struct d=
rm_mode_get_property)
>
> =A0 =A0 =A0 =A0How does one iterate through multiple properties or al=
l they all returned at once?
> =A0 =A0 =A0 =A0The amount of data returned by drm_mode_get_property s=
eems unbounded
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0as the caller provides some pointers c=
ast to __u64.
> =A0 =A0 =A0 =A0How is the caller supposed to know how much space to r=
eserve?
> =A0 =A0 =A0 =A0Is the method consistent across all drivers?
> =A0 =A0 =A0 =A0What is a property? =A0Any random (name-tag, value) pa=
ir the driver wants to provide?
> =A0 =A0 =A0 =A0Are there any required properties consistent across al=
l drivers?
>
> #define DRM_IOCTL_MODE_SETPROPERTY =A0 =A0 =A0DRM_IOWR(0xAB, struct d=
rm_mode_connector_set_property)
> #define DRM_IOCTL_MODE_GETPROPBLOB =A0 =A0 =A0DRM_IOWR(0xAC, struct d=
rm_mode_get_blob)
> #define DRM_IOCTL_MODE_GETFB =A0 =A0 =A0 =A0 =A0 =A0DRM_IOWR(0xAD, st=
ruct drm_mode_fb_cmd)
> #define DRM_IOCTL_MODE_ADDFB =A0 =A0 =A0 =A0 =A0 =A0DRM_IOWR(0xAE, st=
ruct drm_mode_fb_cmd)
> #define DRM_IOCTL_MODE_RMFB =A0 =A0 =A0 =A0 =A0 =A0 DRM_IOWR(0xAF, un=
signed int)
> #define DRM_IOCTL_MODE_PAGE_FLIP =A0 =A0 =A0 =A0DRM_IOWR(0xB0, struct=
 drm_mode_crtc_page_flip)
> #define DRM_IOCTL_MODE_DIRTYFB =A0 =A0 =A0 =A0 =A0DRM_IOWR(0xB1, stru=
ct drm_mode_fb_dirty_cmd)
>
>
> If we ask application developers to "read the kernel source and figur=
e
> it out", who is really going to write any userland code to that API? =
=A0X
> and Wayland developers.
>
> What userspace application developer is going to crosswalk all the
> drivers and figure out what is universally supported by all the kerne=
l
> drivers, versus what is intel, radeon, or nouveau driver specific?

All kms drivers should support the features handled in the modesetting
fucntions in libdrm.

>
> What are the userspace applications currently using KMS: the Xserver,
> Plymouth, and Wayland? =A0Any others on the horizon?
>

In theory any display server type thing could use them.

>
>
>> =A0 kms does however provide a legacy kernel fb interface.
>
> That's another reason I had initally looked into it for replacing the
> ivtv X-driver. =A0I figured moving ivtvfb over to the DRM/KMS FB
> implementation interface could be a first easy step.
>
>
>> While the documentation is not great, the modesetting API is solid a=
nd
>> it would be nice to get more people involved and working on it (or a=
t
>> least looking at it)
>
> Does solid mean it is not going to change?

It will change as developers see fit, but so far, for user interfaces,
the current API seems to work fine.

>
>
>> =A0rather than starting something equivalent from
>> scratch or implementing a device specific modesetting API.
>
> It is too difficult for me to say if it would be equivalent.
>
> The one issue that often springs to mind is the security policy. =A0V=
ideo
> capture and presentation devices may require different user permissio=
ns
> than the Desktop, and console VTs.

Sorry, I wasn't talking about video capture, but video output configura=
tion.

>
> If using a common API means both Console and Video devices now have t=
o
> have the same security policy; requires someone to get new, elevated
> privileges; or now means joe-user can DoS the graphics memory system,
> then it is not worth it just for that.

There are several APIs provided by the kms drm, not all of which are re=
quired:
1. legacy kernel FB (for console)
2. KMS modesetting (for complex display configuration)
3. memory management (for allocating buffers)
4. acceleration APIs (for sending drawing commands to the GPU)

=46or console and apps the use the old kernel fb interface, 1. is all
you need.  If you want to support complex displays dynamically, you'd
need 2. and 3.  Right now 3 is device dependant, but a new set of
generic buffer ioctls are going in in 2.6.38.  For accelerated
desktop-type configurations you'd need 2., 3., and 4.  3., and 4. are
device dependant as acceleration and buffer management for
accelerations tend to be very device specific.

>
>> =A0 If you
>> have any questions about it, please ask on dri-devel (CCed).
>
> I've posed some of them both rhetorical and genuine.
>
> Regards,
> Andy
>
>
