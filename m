From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v4 14/16] drm: bridge: analogix/dp: try force hpd after
 plug in lookup failed
Date: Sun, 06 Sep 2015 11:59:08 +0800
Message-ID: <55EBBA0C.1030100@rock-chips.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
 <1441088079-25809-1-git-send-email-ykk@rock-chips.com>
 <CAL_JsqJDALnjVaVoEqGGsSLeE31m3MKOfbSoZ3M+g+zPZR2MFg@mail.gmail.com>
 <55E7CC43.7040608@rock-chips.com> <20150903090421.GC3784@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1687784072=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20150903090421.GC3784@ulmo.nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <treding@nvidia.com>, Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, seanpaul@chromium.com, djkurtz@chromium.com, Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, Rob Herring <robherring2@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Joe Perches <joe@perches.com>, Rob Herring <robh+dt@kernel.org>, dianders@chromium.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jingoo Han <jingoohan1@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung>
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.
--===============1687784072==
Content-Type: multipart/alternative;
 boundary="------------090007040306020006030300"

This is a multi-part message in MIME format.
--------------090007040306020006030300
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Thierry,

=E5=9C=A8 09/03/2015 05:04 PM, Thierry Reding =E5=86=99=E9=81=93:
> On Thu, Sep 03, 2015 at 12:27:47PM +0800, Yakir Yang wrote:
>> Hi Rob,
>>
>> =E5=9C=A8 09/03/2015 04:17 AM, Rob Herring =E5=86=99=E9=81=93:
>>> On Tue, Sep 1, 2015 at 1:14 AM, Yakir Yang <ykk@rock-chips.com> wrote=
:
>>>> Some edp screen do not have hpd signal, so we can't just return
>>>> failed when hpd plug in detect failed.
>>> This is a property of the panel (or connector perhaps), so this
>>> property should be located there. At least, it is a common issue and
>>> not specific to this chip. We could have an HDMI connector and failed
>>> to hook up HPD for example. A connector node is also where hpd-gpios
>>> should be located instead (and are already defined by
>>> ../bindings/video/hdmi-connector.txt). Perhaps we need a eDP connecto=
r
>>> binding, too.
>> Yep, I agree with your front point, it is a property of panel, not spe=
cific
>> to eDP controller, so this code should handle in connector logic.
>  From your description it sounds more like this is in fact a property o=
f
> the panel. Or maybe I should say "quirk". If the panel doesn't generate
> the HPD signal, then that should be a property of the panel, not the
> connector. The eDP specification mandates that connectors have a HPD
> signal, though it allows the "HPD conductor in the connector cable" to
> be omitted if not used by the source. I'd consider the cable to belong
> to the panel rather than the connector, so absence of HPD, either
> because the cable doesn't have the conductor or because the panel does
> not generate the signal, should be a quirk of the panel.
>
> That said you could have a panel that supports HPD connected via a cabl=
e
> that doesn't transmit it, so this would be a per-board variant and henc=
e
> should be a device tree property rather than hard-coded in some panel
> driver.
>
> Conversely, if the panel isn't capable of generating an HPD signal, the=
n
> I don't think it would be appropriate to make it a DT property. It woul=
d
> be better to hard-code it in the driver, lest someone forget to set the
> property in DT and get stuck with a device that isn't operational.

Oh, you're right, if it's a cable quirk, then DT property would be okay,=20
if it
is a problem of panel, then maybe hard-code in driver would be better.

After look up for the document of panel "innolux,n116bge", I haven't see
any description of hot plug signal, and even not found in PIN ASSIGNMENT.
So I believe it's a panel problem, that's to say it should handle in=20
panel driver.

Hmm... But I don't know how to cover the whole hpd situation in panel=20
detect,
it looks complicate  *_*

And Russell have remind that DRM .force is another way to handle this one=
,
but I haven't understand it very well. I see we need make connector->forc=
e =3D
DRM_FORCE_ON, then we can enable eDP in connector->funcs->force(). But
I don't how to handle connector->force automatically without DT property,
could some guys help here    :-D

Thanks,
- Yakir

--------------090007040306020006030300
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3Dutf-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    Hi Thierry,<br>
    <br>
    <div class=3D"moz-cite-prefix">=E5=9C=A8 09/03/2015 05:04 PM, Thierry=
 Reding
      =E5=86=99=E9=81=93:<br>
    </div>
    <blockquote cite=3D"mid:20150903090421.GC3784@ulmo.nvidia.com"
      type=3D"cite">
      <pre wrap=3D"">On Thu, Sep 03, 2015 at 12:27:47PM +0800, Yakir Yang=
 wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">Hi Rob,

=E5=9C=A8 09/03/2015 04:17 AM, Rob Herring =E5=86=99=E9=81=93:
</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"">On Tue, Sep 1, 2015 at 1:14 AM, Yakir Yang <a cl=
ass=3D"moz-txt-link-rfc2396E" href=3D"mailto:ykk@rock-chips.com">&lt;ykk@=
rock-chips.com&gt;</a> wrote:
</pre>
          <blockquote type=3D"cite">
            <pre wrap=3D"">Some edp screen do not have hpd signal, so we =
can't just return
failed when hpd plug in detect failed.
</pre>
          </blockquote>
          <pre wrap=3D"">This is a property of the panel (or connector pe=
rhaps), so this
property should be located there. At least, it is a common issue and
not specific to this chip. We could have an HDMI connector and failed
to hook up HPD for example. A connector node is also where hpd-gpios
should be located instead (and are already defined by
../bindings/video/hdmi-connector.txt). Perhaps we need a eDP connector
binding, too.
</pre>
        </blockquote>
        <pre wrap=3D"">
Yep, I agree with your front point, it is a property of panel, not specif=
ic
to eDP controller, so this code should handle in connector logic.
</pre>
      </blockquote>
      <pre wrap=3D"">
>From your description it sounds more like this is in fact a property of
the panel. Or maybe I should say "quirk". If the panel doesn't generate
the HPD signal, then that should be a property of the panel, not the
connector. The eDP specification mandates that connectors have a HPD
signal, though it allows the "HPD conductor in the connector cable" to
be omitted if not used by the source. I'd consider the cable to belong
to the panel rather than the connector, so absence of HPD, either
because the cable doesn't have the conductor or because the panel does
not generate the signal, should be a quirk of the panel.

That said you could have a panel that supports HPD connected via a cable
that doesn't transmit it, so this would be a per-board variant and hence
should be a device tree property rather than hard-coded in some panel
driver.

Conversely, if the panel isn't capable of generating an HPD signal, then
I don't think it would be appropriate to make it a DT property. It would
be better to hard-code it in the driver, lest someone forget to set the
property in DT and get stuck with a device that isn't operational.
</pre>
    </blockquote>
    <br>
    Oh, you're right, if it's a cable quirk, then DT property would be
    okay, if it<br>
    is a problem of panel, then maybe hard-code in driver would be
    better.<br>
    <br>
    After look up for the document of panel "innolux,n116bge", I haven't
    see<br>
    any description of hot plug signal, and even not found in
    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf=
-8">
    PIN ASSIGNMENT.<br>
    So I believe it's a panel problem, that's to say it should handle in
    panel driver.<br>
    <br>
    Hmm... But I don't know how to cover the whole hpd situation in
    panel detect,<br>
    it looks complicate=C2=A0 *_*<br>
    <br>
    And Russell have remind that DRM .force is another way to handle
    this one,<br>
    but I haven't understand it very well. I see we need make
    connector-&gt;force =3D<br>
    DRM_FORCE_ON, then we can enable eDP in
    connector-&gt;funcs-&gt;force(). But<br>
    I don't how to handle connector-&gt;force automatically without DT
    property,<br>
    could some guys help here =C2=A0=C2=A0 :-D<br>
    <br>
    Thanks,<br>
    - Yakir<br>
  </body>
</html>

--------------090007040306020006030300--


--===============1687784072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1687784072==--
