From: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH/RFC 0/5] HDMI driver for Samsung S5PV310 platform
Date: Tue, 8 Feb 2011 10:28:32 -0500
Message-ID: <AANLkTi=A=HiAvHojWP8HcFXpjXbZpq6UdHjOnWq-8jww@mail.gmail.com>
References: <1297157427-14560-1-git-send-email-t.stanislaws@samsung.com>
	<201102081047.17840.hansverk@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <201102081047.17840.hansverk@cisco.com>
Sender: linux-media-owner@vger.kernel.org
To: Hans Verkuil <hansverk@cisco.com>
Cc: Tomasz Stanislawski <t.stanislaws@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Feb 8, 2011 at 4:47 AM, Hans Verkuil <hansverk@cisco.com> wrote=
:
> Just two quick notes. I'll try to do a full review this weekend.
>
> On Tuesday, February 08, 2011 10:30:22 Tomasz Stanislawski wrote:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> =A0Introduction
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> The purpose of this RFC is to discuss the driver for a TV output int=
erface
>> available in upcoming Samsung SoC. The HW is able to generate digita=
l and
>> analog signals. Current version of the driver supports only digital =
output.
>>
>> Internally the driver uses videobuf2 framework, and CMA memory alloc=
ator.
> Not
>> all of them are merged by now, but I decided to post the sources to =
start
>> discussion driver's design.
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> =A0Hardware description
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> The SoC contains a few HW sub-blocks:
>>
>> 1. Video Processor (VP). It is used for processing of NV12 data. =A0=
An image
>> stored in RAM is accessed by DMA. Pixels are cropped, scaled. Additi=
onally,
>> post processing operations like brightness, sharpness and contrast
> adjustments
>> could be performed. The output in YCbCr444 format is send to Mixer.
>>
>> 2. Mixer (MXR). The piece of hardware responsible for mixing and ble=
nding
>> multiple data inputs before passing it to an output device. =A0The M=
XR is
> capable
>> of handling up to three image layers. One is the output of VP. =A0Ot=
her two
> are
>> images in RGB format (multiple variants are supported). =A0The layer=
s are
> scaled,
>> cropped and blended with background color. =A0The blending factor, a=
nd layers'
>> priority are controlled by MXR's registers. The output is passed eit=
her to
> HDMI
>> or TVOUT.
>>
>> 3. HDMI. The piece of HW responsible for generation of HDMI packets.=
 It
> takes
>> pixel data from mixer and transforms it into data frames. The output=
 is send
>> to HDMIPHY interface.
>>
>> 4. HDMIPHY. Physical interface for HDMI. Its duties are sending HDMI=
 packets
> to
>> HDMI connector. Basically, it contains a PLL that produces source cl=
ock for
>> Mixer, VP and HDMI during streaming.
>>
>> 5. TVOUT. Generation of TV analog signal. (driver not implemented)
>>
>> 6. VideoDAC. Modulator for TVOUT signal. (driver not implemented)
>>
>>
>> The diagram below depicts connection between all HW pieces.
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 +-----------+
>> NV12 data ---dma--->| =A0 Video =A0 |
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | Processor |
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 +-----------+
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 V
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 +-----------+
>> RGB data =A0---dma--->| =A0 =A0 =A0 =A0 =A0 |
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 Mixer =A0 |
>> RGB data =A0---dma--->| =A0 =A0 =A0 =A0 =A0 |
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 +-----------+
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * dmux
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 +-----* =A0 *------+
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
|
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 V =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
V
>> =A0 =A0 =A0 =A0 =A0 =A0 +-----------+ =A0 =A0+-----------+
>> =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0HDMI =A0 | =A0 =A0| =A0 TVOUT =A0 |
>> =A0 =A0 =A0 =A0 =A0 =A0 +-----------+ =A0 =A0+-----------+
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
|
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 V =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
V
>> =A0 =A0 =A0 =A0 =A0 =A0 +-----------+ =A0 =A0+-----------+
>> =A0 =A0 =A0 =A0 =A0 =A0 | =A0HDMIPHY =A0| =A0 =A0| =A0VideoDAC |
>> =A0 =A0 =A0 =A0 =A0 =A0 +-----------+ =A0 =A0+-----------+
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
|
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 V =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
V
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 HDMI =A0 =A0 =A0 =A0 =A0 Composite
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0connector =A0 =A0 =A0 =A0 connector
>>
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> =A0Driver interface
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> The posted driver implements three V4L2 nodes. Every video node impl=
ements
> V4L2
>> output buffer. One of nodes corresponds to input of Video Processor.=
 The
> other
>> two nodes correspond to RGB inputs of Mixer. All nodes share the sam=
e
> output.
>> It is one of the Mixer's outputs: TVOUT or HDMI. Changing output in =
one
> layer
>> using S_OUTPUT would change outputs of all other video nodes. The sa=
me thing
>> happens if one try to reconfigure output i.e. by calling S_DV_PRESET=
=2E
> However
>> it not possible to change or reconfigure the output while streaming.=
 To sum
> up,
>> all features in posted version of driver goes as follows:
>>
>> 1. QUERYCAP
>> 2. S_FMT, G_FMT - single and multiplanar API
>> =A0 a) node named video0 supports formats NV12, NV12, NV12T (tiled v=
ersion of
>> NV12), NV12MT (multiplane version of NV12T).
>> =A0 b) nodes named graph0 and graph1 support formats RGB565, ARGB155=
5,
> ARGB4444,
>> ARGB8888.
>
> graph0? Do you perhaps mean fb0? I haven't heard about nodes names 'g=
raph'
> before.
>
>> 3. Buffer with USERPTR and MMAP memory.
>> 4. Streaming and buffer control. (STREAMON, STREAMOFF, REQBUF, QBUF,=
 DQBUF)
>> 5. OUTPUT enumeration.
>> 6. DV preset control (SET, GET, ENUM). Currently modes 480P59_94, 72=
0P59_94,
>> 1080P30, 1080P59_94 and 1080P60 work.
>> 7. Positioning layer's window on output display using S_CROP, G_GROP=
,
> CROPCAP.
>> 8. Positioning and cropping data in buffer using S_CROP, G_GROP, CRO=
PCAP
> with
>> buffer type OVERLAY. *
>>
>> TODOs:
>> - add analog TVOUT driver
>> - add S_OUTPUT
>> - add S_STD ioctl
>> - add control of alpha blending / chroma keying via V4L2 controls
>> - add controls for luminance curve and sharpness in VP
>> - consider exporting all output functionalities to separate video no=
de
>> - consider media controller framework
>> - better control over debugging
>> - fix dependency between all TV drivers
>>
>> * The need of cropping in source buffers came from problem with MFC =
driver
> for
>> S5P. The MFC supports only width divisible by 64. If a width of a de=
coded
> movie
>> is not aligned do 64 then padding pixels are filled with zeros. This=
 is an
> ugly
>> green color in YCbCr colorspace. Filling it with zeros by a CPU is a=
 waste
> of
>> resources since an image can be cropped in VP. Is it possible to set=
 crops
> for
>> user data for M2M devices. V4L2 lacks such functionality of non-M2M =
devices.
>> Therefore cropping in buffer V4L2_BUF_TYPE_VIDEO_OVERLAY was used as=
 an work
>> around.
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> =A0Device Architecture
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> Three drivers are added in this patch.
>>
>> 1. HDMIPHY. It is an I2C driver for HDMIPHY interface. It exports fo=
llowing
>> callback by V4L2 subdevice:
>> - s_power: currently stub
>> - s_stream: configures and starts/stops HDMIPHY
>> - s_dv_preset: used to choose proper frequency of clock for other TV=
 devices
>>
>> 2. HDMI. The auxiliary driver used to control HDMI interface. It exp=
orts its
>> subdev to a subdev pool for use by other drivers. The following call=
backs
> are
>> implemented:
>> - s_power: runs HDMI hardware, regulators and clocks.
>> - s_stream: runs HDMIPHY and starts generation of video frames.
>> - enum_dv_presets
>> - s_dv_preset
>> - g_mbus_format: returns information on data format expected by on H=
DMI
> input
>> =A0 The driver supports an interrupt. It is used to detect plug/unpl=
ug events
> in
>> kernel debugs. =A0The API for detection of such an events in V4L2 AP=
I is to be
>> defined.
>
> Cisco (i.e. a few colleagues and myself) are working on this. We hope=
 to post
> an RFC by the end of this month. We also have a proposal for CEC supp=
ort in
> the pipeline.

Any reason to not use the drm kms APIs for modesetting, display
configuration, and hotplug support?  We already have the
infrastructure in place for complex display configurations and
generating events for hotplug interrupts.  It would seem to make more
sense to me to fix any deficiencies in the KMS APIs than to spin a new
API.  Things like CEC would be a natural fit since a lot of desktop
GPUs support hdmi audio/3d/etc. and are already using kms.

Alex

>
> Regards,
>
> =A0 =A0 =A0 =A0Hans
>
>
>>
>> 3. Mixer & Video Processor driver. It is called 's5p-mixer' because =
of
>> historical reasons. It was decided combine VP and MXR drivers into o=
ne
> because
>> of shared interrupt and very similar interface via V4L2 nodes. The d=
river is
> a
>> realization of many-to-many relation between multiple input layers a=
nd
> multiple
>> outputs. All shared resources are kept in struct mxr_device. It prov=
ides
>> utilities for management and synchronization of access to resources =
and
>> reference counting. The outputs are obtained from subdev pool basing=
 on
> names
>> supplied in platform data. One layer is a single video node. Since l=
ayers
>> differs simple inheritance is applied. Every layer type implements s=
et of
> ops.
>> There are different ops for Mixer layers and other for VP layer.
>>
>> The videobuf2 framework was used for the management of buffers and
> streaming.
>> All other V4L2 ioctls are processed in layers common interface. The =
CMA was
>> used as memory allocator for Mixer's buffers. It could be easily exc=
hanged
> with
>> any other allocator integrated with videobuf2 framework.
>>
>> Driver is not yet integrated with power domain driver. Moreover one =
of
> mixer's
>> clocks has to change parent while entering streaming mode. Therefore=
 all
> power
>> and clock management was moved to platform data until final solution=
s
> emerges.
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> =A0Usage summary
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> Follow steps below to display double-buffered animation on HDMI outp=
ut.
>>
>> 01. Open video node named graph0.
>> 02. S_FMT(type =3D OUTPUT, pixelformat =3D V4L2_PIX_FMT_RGB*, width,=
 height,
> ...)
>> 03. REQ_BUFS(type =3D OUTPUT, memory =3D MMAP, count =3D 2)
>> 04. MMAP(type =3D OUTPUT, index =3D 0)
>> 05. MMAP(type =3D OUTPUT, index =3D 1)
>> 06. Fill buffer 0 with data
>> 07. QBUF(type =3D OUTPUT, index =3D 0)
>> 08. STREAM_ON(type =3D OUTPUT)
>> 09. Fill buffer 1 with data
>> 10. QBUF(type =3D OUTPUT, index =3D 1)
>> 11. DQBUF(type =3D OUTPUT)
>> 12. QBUF(type =3D OUTPUT, index =3D 0)
>> 13. DQBUF(type =3D OUTPUT)
>> 14. Goto 09
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> =A0Patch Summary
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> Tomasz Stanislawski (5):
>> =A0 i2c-s3c2410: fix I2C dedicated for hdmiphy
>> =A0 universal: i2c: add I2C controller 8 (HDMIPHY)
>> =A0 v4l: add macro for 1080p59_54 preset
>> =A0 s5p-tv: add driver for HDMI output on S5PC210 platform
>> =A0 s5pc210: add s5p-tv to platform devices
>>
>> =A0arch/arm/mach-s5pv310/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A07 +
>> =A0arch/arm/mach-s5pv310/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A01 +
>> =A0arch/arm/mach-s5pv310/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0132 ++-
>> =A0arch/arm/mach-s5pv310/dev-tv.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0450 ++++++
>> =A0arch/arm/mach-s5pv310/include/mach/irqs.h =A0 =A0 =A0 | =A0 =A08 =
+
>> =A0arch/arm/mach-s5pv310/include/mach/map.h =A0 =A0 =A0 =A0| =A0 27 =
+
>> =A0arch/arm/mach-s5pv310/include/mach/regs-clock.h | =A0 15 +
>> =A0arch/arm/plat-samsung/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A05 +
>> =A0arch/arm/plat-samsung/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A01 +
>> =A0arch/arm/plat-samsung/dev-i2c8.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 68 +
>> =A0arch/arm/plat-samsung/include/plat/devs.h =A0 =A0 =A0 | =A0 =A03 =
+
>> =A0arch/arm/plat-samsung/include/plat/iic.h =A0 =A0 =A0 =A0| =A0 =A0=
1 +
>> =A0arch/arm/plat-samsung/include/plat/tv.h =A0 =A0 =A0 =A0 | =A0 36 =
+
>> =A0drivers/i2c/busses/i2c-s3c2410.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 36 +-
>> =A0drivers/media/video/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A08 +
>> =A0drivers/media/video/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A01 +
>> =A0drivers/media/video/s5p-tv/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 42 +
>> =A0drivers/media/video/s5p-tv/Makefile =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 15 +
>> =A0drivers/media/video/s5p-tv/hdmi.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 74 +
>> =A0drivers/media/video/s5p-tv/hdmi_drv.c =A0 =A0 =A0 =A0 =A0 | =A079=
5 ++++++++++
>> =A0drivers/media/video/s5p-tv/hdmiphy.h =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 37 +
>> =A0drivers/media/video/s5p-tv/hdmiphy_drv.c =A0 =A0 =A0 =A0| =A0228 =
+++
>> =A0drivers/media/video/s5p-tv/mixer.h =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
281 ++++
>> =A0drivers/media/video/s5p-tv/mixer_drv.c =A0 =A0 =A0 =A0 =A0| =A036=
2 +++++
>> =A0drivers/media/video/s5p-tv/mixer_grp_layer.c =A0 =A0| =A0181 +++
>> =A0drivers/media/video/s5p-tv/mixer_reg.c =A0 =A0 =A0 =A0 =A0| =A053=
2 +++++++
>> =A0drivers/media/video/s5p-tv/mixer_reg.h =A0 =A0 =A0 =A0 =A0| =A0 4=
4 +
>> =A0drivers/media/video/s5p-tv/mixer_video.c =A0 =A0 =A0 =A0| =A0834 =
++++++++++
>> =A0drivers/media/video/s5p-tv/mixer_vp_layer.c =A0 =A0 | =A0202 +++
>> =A0drivers/media/video/s5p-tv/regs-hdmi.h =A0 =A0 =A0 =A0 =A0| 1849
> +++++++++++++++++++++++
>> =A0drivers/media/video/s5p-tv/regs-vmx.h =A0 =A0 =A0 =A0 =A0 | =A019=
6 +++
>> =A0drivers/media/video/s5p-tv/regs-vp.h =A0 =A0 =A0 =A0 =A0 =A0| =A0=
277 ++++
>> =A0drivers/media/video/v4l2-common.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A01 +
>> =A0include/linux/videodev2.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A01 +
>> =A034 files changed, 6748 insertions(+), 2 deletions(-)
>> =A0create mode 100644 arch/arm/mach-s5pv310/dev-tv.c
>> =A0create mode 100644 arch/arm/plat-samsung/dev-i2c8.c
>> =A0create mode 100644 arch/arm/plat-samsung/include/plat/tv.h
>> =A0create mode 100644 drivers/media/video/s5p-tv/Kconfig
>> =A0create mode 100644 drivers/media/video/s5p-tv/Makefile
>> =A0create mode 100644 drivers/media/video/s5p-tv/hdmi.h
>> =A0create mode 100644 drivers/media/video/s5p-tv/hdmi_drv.c
>> =A0create mode 100644 drivers/media/video/s5p-tv/hdmiphy.h
>> =A0create mode 100644 drivers/media/video/s5p-tv/hdmiphy_drv.c
>> =A0create mode 100644 drivers/media/video/s5p-tv/mixer.h
>> =A0create mode 100644 drivers/media/video/s5p-tv/mixer_drv.c
>> =A0create mode 100644 drivers/media/video/s5p-tv/mixer_grp_layer.c
>> =A0create mode 100644 drivers/media/video/s5p-tv/mixer_reg.c
>> =A0create mode 100644 drivers/media/video/s5p-tv/mixer_reg.h
>> =A0create mode 100644 drivers/media/video/s5p-tv/mixer_video.c
>> =A0create mode 100644 drivers/media/video/s5p-tv/mixer_vp_layer.c
>> =A0create mode 100644 drivers/media/video/s5p-tv/regs-hdmi.h
>> =A0create mode 100644 drivers/media/video/s5p-tv/regs-vmx.h
>> =A0create mode 100644 drivers/media/video/s5p-tv/regs-vp.h
>>
>> --
>> 1.7.3.5
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-medi=
a" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-media=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
