From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 13/18] ARM: dts: s6e3fa0: add DT bindings
Date: Wed, 28 May 2014 08:44:33 +0200
Message-ID: <538585D1.9030305@samsung.com>
References: <1400647390-26590-1-git-send-email-yj44.cho@samsung.com>
 <1400647390-26590-14-git-send-email-yj44.cho@samsung.com>
 <20140526134153.GA2373@ulmo> <538430A4.8020702@samsung.com>
 <20140527075328.GA13081@ulmo>
 <CAAQKjZOGLPoGbZ7G3+BFd3ydRC2HGmz8JKqFiytdSvxN3T5U_w@mail.gmail.com>
 <20140527202122.GA10609@mithrandir> <53856B0D.6010501@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:56764 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754050AbaE1GpG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 May 2014 02:45:06 -0400
In-reply-to: <53856B0D.6010501@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com, s.trumtrar@pengutronix.de, laurent.pinchart@ideasonboard.com

On 05/28/2014 06:50 AM, Inki Dae wrote:
> On 2014=EB=85=84 05=EC=9B=94 28=EC=9D=BC 05:21, Thierry Reding wrote:
>> On Tue, May 27, 2014 at 11:24:49PM +0900, Inki Dae wrote:
>>> 2014-05-27 16:53 GMT+09:00 Thierry Reding <thierry.reding@gmail.com=
>:
>>>> On Tue, May 27, 2014 at 08:28:52AM +0200, Andrzej Hajda wrote:
>>>>> Hi Thierry,
>>>>>
>>>>> On 05/26/2014 03:41 PM, Thierry Reding wrote:
>>>>>> On Wed, May 21, 2014 at 01:43:05PM +0900, YoungJun Cho wrote:
>>>>>>> This patch adds DT bindings for s6e3fa0 panel.
>>>>>>> The bindings describes panel resources, display timings and cpu=
 mode timings.
>>>>>>>
>>>>>>> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
>>>>>>> Acked-by: Inki Dae <inki.dae@samsung.com>
>>>>>>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>>>>>>> ---
>>>>>>>  .../devicetree/bindings/panel/samsung,s6e3fa0.txt  |   45 ++++=
++++++++++++++++
>>>>>>>  1 file changed, 45 insertions(+)
>>>>>>>  create mode 100644 Documentation/devicetree/bindings/panel/sam=
sung,s6e3fa0.txt
>>>>>> You're totally confusing me here. Half of this patch series is a=
bout
>>>>>> adding i80 support to Exynos FIMD, and then you go and add what =
is
>>>>>> apparently a DSI peripheral driver here that's supposed to be us=
ed by
>>>>>> this new i80 support. Nothing I've been able to dig up indicates=
 that
>>>>>> i80 or DSI are in anyway related.
>>>>> FIMD can produce parallel RGB output or command mode in i80 style=
 output
>>>>> via parallel lines.
>>>>> DSIM can accept parallel RGB stream in this case it produces MIPI=
 DSI
>>>>> video mode signal or it can accept i80 and in this case it transl=
ates it
>>>>> to MIPI DSI command mode.
>>>> Then the command mode timings aren't a property of the panel at al=
l.
>>> Then the video mode timings aren't also a property of the panel.
>>>
>>> Which interface mipi and display controller should use would be
>>> decided by lcd panel type: display controller can use i80 interface
>>> based lcd panel, and also mipi controller can use i80 interface bas=
ed
>>> lcd panel.
>>> In here, the only difference is that lcd panel receives  packets,
>>> which includes video data or command data, packed with mipi protoco=
l
>>> via lane lines or receives video data or command data via parallel
>>> lines.
>>>
>>> And the below is LCD types,
>>>         RGB interface panel.
>>>         i80 interface panel.
>>>         MIPI based RGB interface panel.
>>>         MIPI based i80 interface panel.
>>>
>>> RGB interface also is called video mode, and i80 interface also is
>>> called cpu mode. In case of omap SoC, it is also called Smart panel=
=2E
>>> i80 interface is just one of LCD types. So I think this interface
>>> timings should be handled by frameworks related to mode in same way=
 as
>>> RGB interface.

Some clarification about names.
I am not an expert in command/cpu mode interface, so feel free to
correct me.
Those different terms were quite confusing for me so after some digging
(for example here [1])
I have found/ensured  there is a following relation between different n=
ames:
MIPI DPI - RGB interface
MIPI DBI type A - CPU mode m68 style
MIPI DBI type B - CPU mode i80 style
MIPI DBI type C - SPI, maybe also other serial interfaces (?)
MIPI DSI - based on D-PHY-s serial protocol which can work in video or
command mode.

To add more confusion CPU mode is also named MPU mode or sys mode.

To avoid confusion in the discussion I propose use i80 only to describe
DBI type B interface,
and DSI command mode, DSI video mode to describe DSI modes.

[1]: http://www.allshore.com/pdf/DA8620.pdf


>> LCD is a display technology, it has nothing to do with the interface=
=2E My
>> point is that from Andrzej's description, and in fact from this patc=
h
>> series in general, the S6E3FA0 panel is a DSI panel. Associating tim=
ings
>> that are i80 specific to it is therefore wrong.
>>
>> Consider for instance what would happen if somebody were to use the =
same
>> panel on some other device (connected to a DSI controller). If you
>> specify i80 timings for the panel then the new device won't know wha=
t to
>> do with them because it expects DSI-related timings.
>>
>> Let me try to summarize the above to make sure we're all on the same
>> page:
>>
>> 	- FIMD is a display controller that can be configured to either
>> 	  send RGB data or i80 data
>> 	- DSIM takes either RGB as input and outputs DSI (video mode) or
>> 	  i80 as input and outputs DSI (command mode)
>>
>> In both cases the panel is connected to DSIM and it takes DSI as inp=
ut,
>> because it is a DSI panel (it doesn't understand RGB or i80). The pa=
nel
>> needs to describe the properties of the DSI interface so that DSIM c=
an
>> be configured appropriately. DSIM in turn works as a bridge or encod=
er
>> that converts RGB or i80 to DSI (video or command mode). So it makes=
 no
>> sense to describe the i80 timings for the panel because it has nothi=
ng
>> to do with i80. Instead the DSIM is the hardware that needs to speci=
fy
>> the i80 timings, so that FIMD can be configured to generate the timi=
ngs
>> that DSIM needs.
>             CPU interface                     MIPI lane
> FIMD ----------------------- DSIM --------------------- LCD Panel
>
> Hmm... reasonable. So your point is that command mode timing should b=
e
> placed in fimd device node, not panel device node? And panel device n=
ode
> should provide only a property that DSIM driver can set LCD mode
> properly to i80 or rgb interface mode, and also FIMD driver can set L=
CD
> mode to i80 or rgb interface mode.

I have no access to s6e3fa0 datasheet and Exynos datasheet I have acces=
s to
is not very verbose on the subject but it seems to be reasonable that
cs-setup, wr-setup, wr-active and wr-hold are properties only of i80
interface,
ie interface between FIMD and DSIM and they have nothing to do with DSI
command mode panel.
Those properties should be provided by DSIM to FIMD, I guess they can b=
e
even hardcoded
in DSIM driver, no bindings required. There is still a question how DSI=
M
should tell FIMD about them.
I am not sure about mechanism of passing them from DSIM to FIMD, maybe
adjusting drm_display_mode
is a solution, maybe different way of communication should be used (I
see here again interface_tracker use case [2]).

[2]:
http://permalink.gmane.org/gmane.linux.drivers.video-input-infrastructu=
re/77451

On the other side width, height and clock are properties of the panel s=
o
they should stay
with the panel, maybe width and height could be moved from dts to
driver, I am not sure about frequency.

>
> Is there my missing point?
>
> And in case of Exynos, now video timing property is also placed in pa=
nel
> device node so it needs to move to fimd device node.

No, video timings are properties of panels so they should stay in
panels, display
controllers should just ask panels about them.

>
> Andrzej, do you have other opinion? I have looked into dts files for
> other SoC and In most SoC, it seems that display controller node has
> video timing property, not panel node. Thierry's pointing seems
> reasonable to me.
I guess there could be many reasons: historical, backward compatibility=
,
laziness of developers :).
I agree with Thierry also.

So if everybody agrees there is only one serious issue: how the i80
properties
should be passed from DSIM to FIMD, am I right?

Regards
Andrzej

>
> Thanks,
> Inki Dae
>
>> Thierry
>>
>
