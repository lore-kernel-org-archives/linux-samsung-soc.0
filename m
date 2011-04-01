From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [RFC/PATCH 0/2] FrameBuffer emulator for V4L2/VideoBuf2
Date: Fri, 01 Apr 2011 11:05:34 +0200
Message-ID: <004601cbf04b$f929a2e0$eb7ce8a0$%szyprowski@samsung.com>
References: <1301468448-25524-1-git-send-email-m.szyprowski@samsung.com>
 <002a01cbf049$b824cf10$286e6d30$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: 7BIT
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <002a01cbf049$b824cf10$286e6d30$%han@samsung.com>
Content-language: pl
Sender: linux-media-owner@vger.kernel.org
To: 'Jonghun Han' <jonghun.han@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org
Cc: kyungmin.park@samsung.com, Tomasz Stanislawski <t.stanislaws@samsung.com>, =?ks_c_5601-1987?B?J7DtwOe47Sc=?= <jemings@samsung.com>, =?ks_c_5601-1987?B?J8DMwM/Ioyc=?= <ilho215.lee@samsung.com>, pawel@osciak.com
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

On Friday, April 01, 2011 10:49 AM Jonghun Han wrote:

> On Wednesday, March 30, 2011 4:01 PM Marek Szyprowski wrote:
> > Hello,
> >
> > On V4L2 brainstorming meeting in Warsaw we discussed the need of a
> > framebuffer userspace interface for video output devices. Such
> > framebuffer interface is aimed mainly for legacy applications and/or
> > interoperatibility with Xfbdev.
> >
> > I proposed to give the idea of generic fb-on-top-of-video-node a second
> > try, now using the power of videobuf2.
> >
> > This short patch series demonstrates that this approach is possible. We
> > succesfully implemented a framebuffer emulator and tested it with
> > s5p-hdmi driver on Samsung Exynos4 platform.
> >
> > This initial version provides a basic non-accelerated framebuffer
> > device. The emulation is started on the first open of the framebuffer
> > device and stopped on last close. The framebuffer boots in 'blanked'
> > mode, so one also needs to make a call to blank ioctl (with
> > FB_BLANK_UNBLANK argument) to enable video output.
> >
> > We successfully managed to get vanilla Xfbdev server working on top of
> > it without ANY changes in X server sources.
> >
> > The framebuffer resolution and pixel format is autoconfigured from the
> > parameters of the corresponding video output node. One can use v4l2-ctrl
> > (or similar) tool to select pixel format, resolution, output, etc (and
> > in the near future also the composition on the target video device).
> >
> > There a few requirements for the video output driver:
> > 1. support for single-buffering mode
> > 2. support for videoc_ioctl interface (this might change in the future)
> > 3. use memory allocator that allows coherent mappings (mmaped framebuffer
> >    will be accessed by application while it is displayed by dma engine).
> >
> > The changes that are needed in the video output driver are really
> > simple. Mainly one need to add just a call to vb2_fb_register(q, vfd)
> > and vb2_fb_register(fb) functions.
> >
> > The future versions might aslo include the following features:
> > - vsync event translation into WAIT_VSYNC framebuffer ioctl
> > - support for frame buffer panning with upcoming S_COMPOSE ioctl
> >
> 
> As I know, the panning is different from upcoming S_COMPOSE.
> The panning selects the frame buffer area which will be read by display
> controller to support virtual screen feature.
> But as I remember, the S_COMPOSE is related in positioning on the display
> device like HDMI.
> IMO, VIDIOC_S_EXTCROP makes sense for panning.

Right, I was thinking of S_EXTCROP but I wrote S_COMPOSE. I'm sorry for the
confusion.

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
