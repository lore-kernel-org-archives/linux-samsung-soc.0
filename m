From: Corbin Simpson <mostawesomedude@gmail.com>
Subject: Re: [PATCH/RFC 0/5] HDMI driver for Samsung S5PV310 platform
Date: Wed, 9 Feb 2011 10:45:12 -0800
Message-ID: <AANLkTimA4kpfSgJQyoLCfp7wemixYrB5pd-j2ntpobKP@mail.gmail.com>
References: <1297157427-14560-1-git-send-email-t.stanislaws@samsung.com>
	<201102081047.17840.hansverk@cisco.com>
	<AANLkTi=A=HiAvHojWP8HcFXpjXbZpq6UdHjOnWq-8jww@mail.gmail.com>
	<201102090959.29732.hansverk@cisco.com>
	<AANLkTi=0-GWXGHLOAf5vvx6bL=wjYpSMF=Z5Q=jLzE06@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:46394 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754958Ab1BISpN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Feb 2011 13:45:13 -0500
In-Reply-To: <AANLkTi=0-GWXGHLOAf5vvx6bL=wjYpSMF=Z5Q=jLzE06@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Hans Verkuil <hansverk@cisco.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, linux-samsung-soc@vger.kernel.org, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, kyungmin.park@samsung.com, linux-media@vger.kernel.org, m.szyprowski@samsung.com

On Wed, Feb 9, 2011 at 9:55 AM, Alex Deucher <alexdeucher@gmail.com> wr=
ote:
> On Wed, Feb 9, 2011 at 3:59 AM, Hans Verkuil <hansverk@cisco.com> wro=
te:
>> On Tuesday, February 08, 2011 16:28:32 Alex Deucher wrote:
>>> On Tue, Feb 8, 2011 at 4:47 AM, Hans Verkuil <hansverk@cisco.com> w=
rote:
>>
>> <snip>
>>
>>> >> =A0 The driver supports an interrupt. It is used to detect plug/=
unplug
>> events
>>> > in
>>> >> kernel debugs. =A0The API for detection of such an events in V4L=
2 API is to
>> be
>>> >> defined.
>>> >
>>> > Cisco (i.e. a few colleagues and myself) are working on this. We =
hope to
>> post
>>> > an RFC by the end of this month. We also have a proposal for CEC =
support
>> in
>>> > the pipeline.
>>>
>>> Any reason to not use the drm kms APIs for modesetting, display
>>> configuration, and hotplug support? =A0We already have the
>>> infrastructure in place for complex display configurations and
>>> generating events for hotplug interrupts. =A0It would seem to make =
more
>>> sense to me to fix any deficiencies in the KMS APIs than to spin a =
new
>>> API. =A0Things like CEC would be a natural fit since a lot of deskt=
op
>>> GPUs support hdmi audio/3d/etc. and are already using kms.
>>
>> There are various reasons for not going down that road. The most imp=
ortant one
>> is that mixing APIs is actually a bad idea. I've done that once in t=
he past
>> and I've regretted ever since. The problem with doing that is that i=
t is
>> pretty hard on applications who have to mix two different styles of =
API,
>> somehow know where to find the documentation for each and know that =
both APIs
>> can in fact be used on the same device.
>>
>> Now, if there was a lot of code that could be shared, then that migh=
t be
>> enough reason to go that way, but in practice there is very little o=
verlap.
>> Take CEC: all the V4L API will do is to pass the CEC packets from ke=
rnel to
>> userspace and vice versa. There is no parsing at all. This is typica=
lly used
>> by embedded apps that want to do their own CEC processing.
>>
>> An exception might be a PCI(e) card with HDMI input/output that want=
s to
>> handle CEC internally. At that point we might look at sharing CEC pa=
rsing
>> code. A similar story is true for EDID handling.
>>
>> One area that might be nice to look at would be to share drivers for=
 HDMI
>> receivers and transmitters. However, the infrastructure for such dri=
vers is
>> wildly different between how it is used for GPUs versus V4L and has =
been for
>> 10 years or so. I also suspect that most GPUs have there own HDMI in=
ternal
>> implementation so code sharing will probably be quite limited.
>>
>
> You don't need to worry about the rest of the 3D and acceleration
> stuff to use the kms modesetting API. =A0For video output, you have a
> timing generator, an encoder that translates a bitstream into
> voltages, and an connector that you plug into a monitor. =A0Additiona=
lly
> you may want to read an edid or generate a hotplug event and use some
> modeline handling helpers. =A0The kms api provides core modesetting c=
ode
> and a set of modesetting driver callbacks for crtcs, encoders, and
> connectors. =A0The hardware implementations will vary, but modesettin=
g
> is the same. =A0From drm_crtc_helper.h:
>
> The driver provides the following callbacks for the crtc. =A0The crtc
> loosely refers to the part of the display pipe that generates timing
> and framebuffer scanout position.
>
> struct drm_crtc_helper_funcs {
> =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 * Control power levels on the CRTC. =A0If the mode pa=
ssed in is
> =A0 =A0 =A0 =A0 * unsupported, the provider must use the next lowest =
power
> level.
> =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0void (*dpms)(struct drm_crtc *crtc, int mode);
> =A0 =A0 =A0 =A0void (*prepare)(struct drm_crtc *crtc);
> =A0 =A0 =A0 =A0void (*commit)(struct drm_crtc *crtc);
>
> =A0 =A0 =A0 =A0/* Provider can fixup or change mode timings before mo=
deset occurs */
> =A0 =A0 =A0 =A0bool (*mode_fixup)(struct drm_crtc *crtc,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct drm_displa=
y_mode *mode,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct drm_displa=
y_mode *adjusted_mode);
> =A0 =A0 =A0 =A0/* Actually set the mode */
> =A0 =A0 =A0 =A0int (*mode_set)(struct drm_crtc *crtc, struct drm_disp=
lay_mode *mode,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct drm_display_mod=
e *adjusted_mode, int x, int y,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct drm_framebuffer=
 *old_fb);
>
> =A0 =A0 =A0 =A0/* Move the crtc on the current fb to the given positi=
on *optional* */
> =A0 =A0 =A0 =A0int (*mode_set_base)(struct drm_crtc *crtc, int x, int=
 y,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct drm_fr=
amebuffer *old_fb);
> =A0 =A0 =A0 =A0int (*mode_set_base_atomic)(struct drm_crtc *crtc,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
struct drm_framebuffer *fb, int x, int y,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
enum mode_set_atomic);
>
> =A0 =A0 =A0 =A0/* reload the current crtc LUT */
> =A0 =A0 =A0 =A0void (*load_lut)(struct drm_crtc *crtc);
>
> =A0 =A0 =A0 =A0/* disable crtc when not in use - more explicit than d=
pms off */
> =A0 =A0 =A0 =A0void (*disable)(struct drm_crtc *crtc);
> };
>
> encoders take the bitstream from the crtc and convert it into a set o=
f
> voltages understood by the monitor, e.g., TMDS or LVDS encoders. =A0T=
he
> callbacks follow a similar pattern to crtcs.
>
> struct drm_encoder_helper_funcs {
> =A0 =A0 =A0 =A0void (*dpms)(struct drm_encoder *encoder, int mode);
> =A0 =A0 =A0 =A0void (*save)(struct drm_encoder *encoder);
> =A0 =A0 =A0 =A0void (*restore)(struct drm_encoder *encoder);
>
> =A0 =A0 =A0 =A0bool (*mode_fixup)(struct drm_encoder *encoder,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct drm_displa=
y_mode *mode,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct drm_displa=
y_mode *adjusted_mode);
> =A0 =A0 =A0 =A0void (*prepare)(struct drm_encoder *encoder);
> =A0 =A0 =A0 =A0void (*commit)(struct drm_encoder *encoder);
> =A0 =A0 =A0 =A0void (*mode_set)(struct drm_encoder *encoder,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct drm_display_mo=
de *mode,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct drm_display_mo=
de *adjusted_mode);
> =A0 =A0 =A0 =A0struct drm_crtc *(*get_crtc)(struct drm_encoder *encod=
er);
> =A0 =A0 =A0 =A0/* detect for DAC style encoders */
> =A0 =A0 =A0 =A0enum drm_connector_status (*detect)(struct drm_encoder=
 *encoder,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0struct drm_connector *connector);
> =A0 =A0 =A0 =A0/* disable encoder when not in use - more explicit tha=
n dpms off */
> =A0 =A0 =A0 =A0void (*disable)(struct drm_encoder *encoder);
> };
>
>
> And finally connectors. =A0These are the actual physical connectors o=
n
> the board (DVI-I, HDMI-A, VGA, S-video, etc.). =A0Things like ddc lin=
es
> are generally tied to a connector so functions relevant to getting
> modelines are associated with connectors.
>
> struct drm_connector_helper_funcs {
> =A0 =A0 =A0 =A0int (*get_modes)(struct drm_connector *connector);
> =A0 =A0 =A0 =A0int (*mode_valid)(struct drm_connector *connector,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct drm_display=
_mode *mode);
> =A0 =A0 =A0 =A0struct drm_encoder *(*best_encoder)(struct drm_connect=
or *connector);
> };
>
> See drm_crtc_helper.c to see how the callbacks are used. =A0The code =
can
> handle crtcs that can be routed to different encoders dynamically or
> crtcs that are hardcoded to specific encoders. =A0Additionally, it ca=
n
> handle encoders that are shared between multiple connectors (e.g., a
> DAC shared between VGA and S-video), or multiple encoders tied to a
> single connector (e.g., DAC and TMDS encoders tied to a single DVI-I
> connector).
>
> Let's look at two scenarios where you want a system to display an
> interactive RGB desktop and provide video capture and video output.
> You'd need to use different sets of APIs depending on what hardware
> you use:
>
> 1. SoC with an LVDS panel and HDMI output and a capture unit
> 2. PC with a GPU with an LVDS panel and an HDMI output and a capture =
unit.
>
> As I understand it, to use the scenario 1 would use the following:
>
> - LVDS uses some new v4l interface or a hacked up kernel fb interface
> to support multiple displays
> - HDMI uses some new v4l interface or a hacked up kernel fb interface
> to support multiple displays
> - capture unit uses V4L
>
> Scenario 2 would use:
>
> - LVDS uses KMS API
> - HDMI uses KMS API
> - capture unit uses V4L
>
> Why not use KMS? =A0A modesetting API is a huge amount of work. =A0I
> haven't seen anything in these SoC platforms that makes them so
> radically different that they need their own API. =A0If there are any=
,
> we'd love to hear about them so they can be addressed.
>
> Alex
>
>> So, no, there are no plans to share anything between the two (except=
 perhaps
>> EDID and CEC parsing should that become relevant).
>>
>> Oh, and let me join Andy in saying that the drm/kms/whatever API doc=
umentation
>> *really* needs a lot of work.

I know this is sort of a "me too" as none of my code's upstream yet,
but the barrier posed by the lack of documentation for KMS is
*massive* since the only KMS drivers are for highly complex pieces of
hardware, making them difficult to read. The entire KMS API can be
implemented in a single C file for simple hardware, just like the FB
API, but you'd never know it by looking at the existing drivers.

~ C.

--=20
When the facts change, I change my mind. What do you do, sir? ~ Keynes

Corbin Simpson
<MostAwesomeDude@gmail.com>
