From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v5 05/14] drm/exynos: dsi: add pass TE host ops to support
 LCD I80 interface
Date: Thu, 17 Jul 2014 11:15:07 +0900
Message-ID: <53C731AB.4030407@samsung.com>
References: <1404779987-5337-6-git-send-email-yj44.cho@samsung.com>
 <20140709152207.GA17359@ulmo> <53BDE6FF.1000600@samsung.com>
 <20140710073826.GB17918@ulmo> <53C3A15F.4020401@samsung.com>
 <20140714094130.GD9755@ulmo> <53C3B4C8.1070601@samsung.com>
 <20140714110326.GA31460@ulmo> <53C49336.5050909@samsung.com>
 <53C5E20D.5010704@samsung.com> <20140716075457.GH7978@ulmo>
 <53C65024.7080606@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:12139 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750956AbaGQCPK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Jul 2014 22:15:10 -0400
In-reply-to: <53C65024.7080606@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: YoungJun Cho <yj44.cho@samsung.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com

On 2014=EB=85=84 07=EC=9B=94 16=EC=9D=BC 19:12, YoungJun Cho wrote:
> Hi Thierry,
>=20
> On 07/16/2014 04:54 PM, Thierry Reding wrote:
>> On Wed, Jul 16, 2014 at 11:23:09AM +0900, YoungJun Cho wrote:
>>> Hi Inki,
>>>
>>> On 07/15/2014 11:34 AM, Inki Dae wrote:
>>>> On 2014=EB=85=84 07=EC=9B=94 14=EC=9D=BC 20:03, Thierry Reding wro=
te:
>>>>> On Mon, Jul 14, 2014 at 07:45:28PM +0900, YoungJun Cho wrote:
>>>>>> On 07/14/2014 06:41 PM, Thierry Reding wrote:
>>>>> [...]
>>>>>>> That said, I've been doing some research and it seems like we h=
ave a
>>>>>>> somewhat similar feature on Tegra. What happens there is that
>>>>>>> there are
>>>>>>> three GPIO pins that can be repurposed for TE signalling. But a=
s
>>>>>>> opposed
>>>>>>> to using them as interrupts the display controller can be
>>>>>>> configured to
>>>>>>> use them, upon which it will automatically handle the TE signal=
 by
>>>>>>> sending the next frame.
>>>>>>
>>>>>> Could you explain more detail how the Tegra display controller
>>>>>> could be
>>>>>> configured with this GPIO pins?
>>>>>> I have no idea except that the display controller registers this
>>>>>> GPIO as an
>>>>>> IRQ.
>>>>>
>>>>> On Tegra the display controller has a special register that can b=
e
>>>>> programmed to use one of the three GPIOs as TE signal. Then the
>>>>> display
>>>>> controller can be configured in one-shot (non-continuous) mode, w=
hich
>>>>> means that software needs to explicitly set a trigger bit to tell=
 the
>>>>> display controller to send a new frame. If TE signalling is enabl=
ed,
>>>>> then the display controller will not immediately send a new frame=
 when
>>>>> triggered but wait for signalling of this GPIO.
>>>>>
>>>>>>> So we have at least two very different implementations of this =
on
>>>>>>> two
>>>>>>> different SoCs. Further the specification explicitly recommends
>>>>>>> using
>>>>>>> the BTA sequence and DSI protocol to wait for TE. So I still
>>>>>>> think that
>>>>>>> controllers that provide an additional, non-spec compliant meth=
od to
>>>>>>> signal TE should handle it separately rather than within DSI.
>>>>>>> Otherwise
>>>>>>> we essentially need to make the DSI "core" aware of all these
>>>>>>> quirks,
>>>>>>> and I'd rather avoid that.
>>>>>>
>>>>>> You mean, the DSI specification guides to use BTA, so it's bette=
r
>>>>>> to use
>>>>>> display controller rather than DSIM, right?
>>>>>
>>>>> What I'm saying is that there's nothing about a side-band TE wire
>>>>> in the
>>>>> DSI spec. In fact the spec explicitly says that this mechanism of=
 an
>>>>> external TE wire from older protocols (DBI) was replaced by the B=
TA
>>>>> sequence over the protocol.
>>>>>
>>>>> Now, my understanding is that using the BTA sequence over the DSI
>>>>> protocol would introduce some latency and that forces some panel
>>>>> vendors
>>>>> to still provide a side-band TE wire even in DSI compliant panels=
=2E But
>>>>> since this is not part of the specification there is no standard
>>>>> way to
>>>>> do this (as evidenced by Tegra and Exynos). Therefore putting suc=
h
>>>>> functionality into the core DSI code is bad.
>>>>>
>>>>> But that doesn't mean that you have to put this functionality int=
o the
>>>>> display controller driver on Exynos. What I'm saying is that it s=
hould
>>>>> be handled by the SoC driver rather than the core. Where exactly
>>>>> probably depends on the particular case.
>>>>>
>>>>>>>> As Inki commented before, I'll try to use remote-endpoint
>>>>>>>> property of DSI
>>>>>>>> device node in exynos DSIM driver and call FIMD notifier.
>>>>>>>
>>>>>>> Sounds like it matches what I said above. I'm not a huge fan of
>>>>>>> notifiers, but if it works for you I suppose that's fine. The
>>>>>>> alternative would be to directly call a FIMD function, which is
>>>>>>> somewhat more explicit than a notifier.
>>>>>>
>>>>>> Yes, I also like explicit call, so I want to use dsi_host_ops an=
d
>>>>>> calls it
>>>>>> in panel. But there is an objection to use dis_host_ops, we thin=
k
>>>>>> notifier
>>>>>> in exynos dsim for fimd(display controller).
>>>>>
>>>>> There are other ways to explicitly call into the display
>>>>> controller. You
>>>>> could for example get access to the CRTC that DSIM is currently
>>>>> connected to (via exynos_dsi.encoder->crtc) and then cast that to=
 a
>>>>> struct exynos_drm_crtc and call a function to trigger a new frame
>>>>> to be
>>>>> sent (for example exynos_drm_crtc_send_frame()). This assumes tha=
t you
>>>>> can safely cast struct drm_crtc * to struct exynos_drm_crtc *, bu=
t
>>>>> that
>>>>> shouldn't be a problem.
>>>>>
>>>>> With the above, you could make the DSIM handle the TE signal
>>>>> interrupts
>>>>> and trigger the DC using the new exynos_drm_crtc_send_frame()
>>>>> function.
>>>>>
>>>>
>>>> It seems better than the use of notifier. Actually, original patch=
 used
>>>> this way except TE event.
>>>> Mr. Cho, let's use remote-endpoint property and this way instead o=
f
>>>> notifier.
>>>>
>>>
>>> The struct exynos_dsi has panel_node, which is valid by
>>> exynos_dsi_host_attach() is called from panel, we could use it
>>> instead of
>>> getting new remote-endpoint node.
>>>
>>> So after called exynos_dsi_host_attach(), the dsi driver could know
>>> that the
>>> panel supports mipi command mode or video mode,
>>> and if the panel is for mipi command mode one, dsi driver gets pane=
l
>>> te gpio
>>> and registers its irq.
>>
>> Why does the TE GPIO even need to be in the panel's device tree node=
?
>> Wouldn't it make more sense for it to be in the DSIM node? After all
>> that's what the GPIO is connected to, right? Well, at least logicall=
y
>> if not physically.
>>
>=20
> I also agree that the GPIO in DT means the connection after all.
>=20
> But the panel provides the TE pin(this is obvious) and decides the DS=
IM
> mode(command or video).
> This TE pin is useless in video mode.
>=20
> So I think it's better for panel to decide and provide all related th=
ings.
>=20

+1

device tree already connects them using endpoint node logically. And it
wouldn't make sense for TE gpio pin to be in dsi node: TE pin belongs t=
o
panel device, not dsi.

And if dsi node has te gpio property, where i80 based parallel panel's
te pin should be in? Display controller? if TE pin is placed in panel
node, and fimd and parallel panel or dsi and mipi panel are connected
logically using device tree (graph), that case would be clear.

Thanks,
Inki Dae

> Thank you.
> Best regards YJ
>=20
>> Thierry
>>
>=20
> --=20
> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
