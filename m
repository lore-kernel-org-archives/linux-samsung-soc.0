From: A H <andrzej.hajda@gmail.com>
Subject: Re: [RFC 00/15] Resource tracking/allocation framework
Date: Wed, 10 Dec 2014 18:23:49 +0100
Message-ID: <CA+tnuKYSDZ0mtzQ_g1QjovJwG01OgPjSXuozEBXQsEZv_2o-=w@mail.gmail.com>
References: <1418226513-14105-1-git-send-email-a.hajda@samsung.com>
 <20141210161620.GM11285@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0092008341=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20141210161620.GM11285@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Alexandre Courbot <gnurou@gmail.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, open list <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, Kishon Vijay Abraham I <kishon@ti.com>, Andrzej Hajda <a.hajda@samsung.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, "moderated list:ARM/CLKDEV SUPPORT" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--===============0092008341==
Content-Type: multipart/alternative; boundary=001a11c38be840a7290509dfec03

--001a11c38be840a7290509dfec03
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

10 gru 2014 17:16 "Russell King - ARM Linux" <linux@arm.linux.org.uk>
napisa=C5=82(a):
>
> On Wed, Dec 10, 2014 at 04:48:18PM +0100, Andrzej Hajda wrote:
> > 3. There are drivers which can work without specific resource, but if
> >   the resource becomes available/unavailable it can do some additional
stuff.
> >   An example of such driver is DRM driver (more precisely
drm_connector) -
> >   it can start without attached drm_panel, but if the panel becomes
available it
> >   can react by generating HPD event and start using it.
>
> Bad example, and actually incorrect.  DRM connectors are referenced in
> userspace by an IDR number, which can be re-used in the case of a
> connector appearing, disappearing, and then a different connector
> re-appearing.

But it is not about reappearing of drm_connector, it is about reappearing
of drm_panel which is fortunately not a part of drm driver. Connector here
is only consumer of drm_panel which should have possibility to receive
notifications on panel (dis-)appearance.

Regards
Andrzej

>
> DRM really is *not* safe to hotplug like this: DRM is more a card-level
> thing, which is why we have the component helpers - which allow us to
> merge several devices into one logical card-like device in a generic
> manner.
>
> DRM needs a stable picture of the CRTCs, encoders and connectors, which
> should _never_ change during the lifetime of the DRM device.  Devices
> attached to connectors can be hotplugged, but that's about the limit of
> hot-plugging in DRM.
>
> --
> FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
> according to speedtest.net.
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

--001a11c38be840a7290509dfec03
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
10 gru 2014 17:16 &quot;Russell King - ARM Linux&quot; &lt;<a href=3D"mailt=
o:linux@arm.linux.org.uk">linux@arm.linux.org.uk</a>&gt; napisa=C5=82(a):<b=
r>
&gt;<br>
&gt; On Wed, Dec 10, 2014 at 04:48:18PM +0100, Andrzej Hajda wrote:<br>
&gt; &gt; 3. There are drivers which can work without specific resource, bu=
t if<br>
&gt; &gt;=C2=A0 =C2=A0the resource becomes available/unavailable it can do =
some additional stuff.<br>
&gt; &gt;=C2=A0 =C2=A0An example of such driver is DRM driver (more precise=
ly drm_connector) -<br>
&gt; &gt;=C2=A0 =C2=A0it can start without attached drm_panel, but if the p=
anel becomes available it<br>
&gt; &gt;=C2=A0 =C2=A0can react by generating HPD event and start using it.=
<br>
&gt;<br>
&gt; Bad example, and actually incorrect.=C2=A0 DRM connectors are referenc=
ed in<br>
&gt; userspace by an IDR number, which can be re-used in the case of a<br>
&gt; connector appearing, disappearing, and then a different connector<br>
&gt; re-appearing.</p>
<p dir=3D"ltr">But it is not about reappearing of drm_connector, it is abou=
t reappearing of drm_panel which is fortunately not a part of drm driver. C=
onnector here is only consumer of drm_panel which should have possibility t=
o receive notifications on panel (dis-)appearance. </p>
<p dir=3D"ltr">Regards<br>
Andrzej</p>
<p dir=3D"ltr">&gt;<br>
&gt; DRM really is *not* safe to hotplug like this: DRM is more a card-leve=
l<br>
&gt; thing, which is why we have the component helpers - which allow us to<=
br>
&gt; merge several devices into one logical card-like device in a generic<b=
r>
&gt; manner.<br>
&gt;<br>
&gt; DRM needs a stable picture of the CRTCs, encoders and connectors, whic=
h<br>
&gt; should _never_ change during the lifetime of the DRM device.=C2=A0 Dev=
ices<br>
&gt; attached to connectors can be hotplugged, but that&#39;s about the lim=
it of<br>
&gt; hot-plugging in DRM.<br>
&gt;<br>
&gt; --<br>
&gt; FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up<=
br>
&gt; according to <a href=3D"http://speedtest.net">speedtest.net</a>.<br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.fre=
edesktop.org</a><br>
&gt; <a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel">ht=
tp://lists.freedesktop.org/mailman/listinfo/dri-devel</a></p>

--001a11c38be840a7290509dfec03--

--===============0092008341==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0092008341==--
