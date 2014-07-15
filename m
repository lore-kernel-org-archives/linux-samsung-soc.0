From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v5 05/14] drm/exynos: dsi: add pass TE host ops to support
 LCD I80 interface
Date: Tue, 15 Jul 2014 11:34:30 +0900
Message-ID: <53C49336.5050909@samsung.com>
References: <1404779987-5337-1-git-send-email-yj44.cho@samsung.com>
 <1404779987-5337-6-git-send-email-yj44.cho@samsung.com>
 <20140709152207.GA17359@ulmo> <53BDE6FF.1000600@samsung.com>
 <20140710073826.GB17918@ulmo> <53C3A15F.4020401@samsung.com>
 <20140714094130.GD9755@ulmo> <53C3B4C8.1070601@samsung.com>
 <20140714110326.GA31460@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:17908 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753670AbaGOCed (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 22:34:33 -0400
In-reply-to: <20140714110326.GA31460@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: YoungJun Cho <yj44.cho@samsung.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com

On 2014=EB=85=84 07=EC=9B=94 14=EC=9D=BC 20:03, Thierry Reding wrote:
> On Mon, Jul 14, 2014 at 07:45:28PM +0900, YoungJun Cho wrote:
>> On 07/14/2014 06:41 PM, Thierry Reding wrote:
> [...]
>>> That said, I've been doing some research and it seems like we have =
a
>>> somewhat similar feature on Tegra. What happens there is that there=
 are
>>> three GPIO pins that can be repurposed for TE signalling. But as op=
posed
>>> to using them as interrupts the display controller can be configure=
d to
>>> use them, upon which it will automatically handle the TE signal by
>>> sending the next frame.
>>
>> Could you explain more detail how the Tegra display controller could=
 be
>> configured with this GPIO pins?
>> I have no idea except that the display controller registers this GPI=
O as an
>> IRQ.
>=20
> On Tegra the display controller has a special register that can be
> programmed to use one of the three GPIOs as TE signal. Then the displ=
ay
> controller can be configured in one-shot (non-continuous) mode, which
> means that software needs to explicitly set a trigger bit to tell the
> display controller to send a new frame. If TE signalling is enabled,
> then the display controller will not immediately send a new frame whe=
n
> triggered but wait for signalling of this GPIO.
>=20
>>> So we have at least two very different implementations of this on t=
wo
>>> different SoCs. Further the specification explicitly recommends usi=
ng
>>> the BTA sequence and DSI protocol to wait for TE. So I still think =
that
>>> controllers that provide an additional, non-spec compliant method t=
o
>>> signal TE should handle it separately rather than within DSI. Other=
wise
>>> we essentially need to make the DSI "core" aware of all these quirk=
s,
>>> and I'd rather avoid that.
>>
>> You mean, the DSI specification guides to use BTA, so it's better to=
 use
>> display controller rather than DSIM, right?
>=20
> What I'm saying is that there's nothing about a side-band TE wire in =
the
> DSI spec. In fact the spec explicitly says that this mechanism of an
> external TE wire from older protocols (DBI) was replaced by the BTA
> sequence over the protocol.
>=20
> Now, my understanding is that using the BTA sequence over the DSI
> protocol would introduce some latency and that forces some panel vend=
ors
> to still provide a side-band TE wire even in DSI compliant panels. Bu=
t
> since this is not part of the specification there is no standard way =
to
> do this (as evidenced by Tegra and Exynos). Therefore putting such
> functionality into the core DSI code is bad.
>=20
> But that doesn't mean that you have to put this functionality into th=
e
> display controller driver on Exynos. What I'm saying is that it shoul=
d
> be handled by the SoC driver rather than the core. Where exactly
> probably depends on the particular case.
>=20
>>>> As Inki commented before, I'll try to use remote-endpoint property=
 of DSI
>>>> device node in exynos DSIM driver and call FIMD notifier.
>>>
>>> Sounds like it matches what I said above. I'm not a huge fan of
>>> notifiers, but if it works for you I suppose that's fine. The
>>> alternative would be to directly call a FIMD function, which is
>>> somewhat more explicit than a notifier.
>>
>> Yes, I also like explicit call, so I want to use dsi_host_ops and ca=
lls it
>> in panel. But there is an objection to use dis_host_ops, we think no=
tifier
>> in exynos dsim for fimd(display controller).
>=20
> There are other ways to explicitly call into the display controller. =
You
> could for example get access to the CRTC that DSIM is currently
> connected to (via exynos_dsi.encoder->crtc) and then cast that to a
> struct exynos_drm_crtc and call a function to trigger a new frame to =
be
> sent (for example exynos_drm_crtc_send_frame()). This assumes that yo=
u
> can safely cast struct drm_crtc * to struct exynos_drm_crtc *, but th=
at
> shouldn't be a problem.
>=20
> With the above, you could make the DSIM handle the TE signal interrup=
ts
> and trigger the DC using the new exynos_drm_crtc_send_frame() functio=
n.
>=20

It seems better than the use of notifier. Actually, original patch used
this way except TE event.
Mr. Cho, let's use remote-endpoint property and this way instead of
notifier.

Thanks,
Inki Dae

> Thierry
>=20
