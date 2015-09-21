From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v4 14/16] drm: bridge: analogix/dp: try force hpd after
 plug in lookup failed
Date: Mon, 21 Sep 2015 17:10:35 +0800
Message-ID: <55FFC98B.9030800@rock-chips.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
 <1441088079-25809-1-git-send-email-ykk@rock-chips.com>
 <CAL_JsqJDALnjVaVoEqGGsSLeE31m3MKOfbSoZ3M+g+zPZR2MFg@mail.gmail.com>
 <55E7CC43.7040608@rock-chips.com> <20150903090421.GC3784@ulmo.nvidia.com>
 <55EBBA0C.1030100@rock-chips.com> <20150907082017.GB19961@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1135467975=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20150907082017.GB19961@ulmo.nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <treding@nvidia.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, seanpaul@chromium.com, djkurtz@chromium.com, Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, Rob Herring <robherring2@gmail.com>, Russell King <rmk+kernel@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ajay kumar <ajaynumb@gmail.com>, Rob Herring <robh+dt@kernel.org>, dianders@chromium.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jingoo Han <jingoohan1@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.ker>
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.
--===============1135467975==
Content-Type: multipart/alternative;
 boundary="------------070209080107090807000900"

This is a multi-part message in MIME format.
--------------070209080107090807000900
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Thierry & Rob,

Sorry, apologize for the delay in replying  :-)


On 09/07/2015 04:20 PM, Thierry Reding wrote:
> On Sun, Sep 06, 2015 at 11:59:08AM +0800, Yakir Yang wrote:
>> Hi Thierry,
>>
>> =E5=9C=A8 09/03/2015 05:04 PM, Thierry Reding =E5=86=99=E9=81=93:
>>> On Thu, Sep 03, 2015 at 12:27:47PM +0800, Yakir Yang wrote:
>>>> Hi Rob,
>>>>
>>>> =E5=9C=A8 09/03/2015 04:17 AM, Rob Herring =E5=86=99=E9=81=93:
>>>>> On Tue, Sep 1, 2015 at 1:14 AM, Yakir Yang <ykk@rock-chips.com> wro=
te:
>>>>>> Some edp screen do not have hpd signal, so we can't just return
>>>>>> failed when hpd plug in detect failed.
>>>>> This is a property of the panel (or connector perhaps), so this
>>>>> property should be located there. At least, it is a common issue an=
d
>>>>> not specific to this chip. We could have an HDMI connector and fail=
ed
>>>>> to hook up HPD for example. A connector node is also where hpd-gpio=
s
>>>>> should be located instead (and are already defined by
>>>>> ../bindings/video/hdmi-connector.txt). Perhaps we need a eDP connec=
tor
>>>>> binding, too.
>>>> Yep, I agree with your front point, it is a property of panel, not s=
pecific
>>>> to eDP controller, so this code should handle in connector logic.
>>>  From your description it sounds more like this is in fact a property=
 of
>>> the panel. Or maybe I should say "quirk". If the panel doesn't genera=
te
>>> the HPD signal, then that should be a property of the panel, not the
>>> connector. The eDP specification mandates that connectors have a HPD
>>> signal, though it allows the "HPD conductor in the connector cable" t=
o
>>> be omitted if not used by the source. I'd consider the cable to belon=
g
>>> to the panel rather than the connector, so absence of HPD, either
>>> because the cable doesn't have the conductor or because the panel doe=
s
>>> not generate the signal, should be a quirk of the panel.
>>>
>>> That said you could have a panel that supports HPD connected via a ca=
ble
>>> that doesn't transmit it, so this would be a per-board variant and he=
nce
>>> should be a device tree property rather than hard-coded in some panel
>>> driver.
>>>
>>> Conversely, if the panel isn't capable of generating an HPD signal, t=
hen
>>> I don't think it would be appropriate to make it a DT property. It wo=
uld
>>> be better to hard-code it in the driver, lest someone forget to set t=
he
>>> property in DT and get stuck with a device that isn't operational.
>> Oh, you're right, if it's a cable quirk, then DT property would be oka=
y, if
>> it
>> is a problem of panel, then maybe hard-code in driver would be better.
>>
>> After look up for the document of panel "innolux,n116bge", I haven't s=
ee
>> any description of hot plug signal, and even not found in PIN ASSIGNME=
NT.
>> So I believe it's a panel problem, that's to say it should handle in p=
anel
>> driver.
> The datasheet that I have for that panel lists HPD as pin 17. Also I
> used to have a setup with that panel and I distinctly remember hotplug
> working just fine. Perhaps this is an issue with a specific variant of
> the panel? Or perhaps this is indeed a problem with the cable that's
> connecting the panel to the board. It could be one of those cases where
> they left out the HPD conductor to save money.

You're right, I guess I just download the wrong datasheet "N116BGE-L41.pd=
f"
which the video interfaces is "LVDS", thanks for you point out.

And I double checked with the guys who work with this screen vendor, he s=
aid
that it's the fault that vendor missed HPD pin on the screen board, and=20
vendor
have fixed this problem later.

But there are still some machine didn't contain the HPD signal, and you a=
lso
mention that in some cases where vendor would left out the HPD conductor,
so I still wish to support those "quirk" screen in the later version.=20
But I wish
you could share your opinion whether this could exist in the mainline
kernel.

If the answer is no, okay, I would remove this from the next versions.=20
but If
the answer is yes, wow, I may still can use the DT property to satisfied=20
this
demand (I guess it's okay to keep the DT property way from previous=20
discussion).

Thanks,
- Yakir

>
> Thierry
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


--------------070209080107090807000900
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3DUTF-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    Hi Thierry &amp; Rob,<br>
    <br>
    Sorry, apologize for the delay in replying=C2=A0 :-)<br>
    <br>
    <br>
    <div class=3D"moz-cite-prefix">On 09/07/2015 04:20 PM, Thierry Reding
      wrote:<br>
    </div>
    <blockquote cite=3D"mid:20150907082017.GB19961@ulmo.nvidia.com"
      type=3D"cite">
      <pre wrap=3D"">On Sun, Sep 06, 2015 at 11:59:08AM +0800, Yakir Yang=
 wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">Hi Thierry,

=E5=9C=A8 09/03/2015 05:04 PM, Thierry Reding =E5=86=99=E9=81=93:
</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"">On Thu, Sep 03, 2015 at 12:27:47PM +0800, Yakir =
Yang wrote:
</pre>
          <blockquote type=3D"cite">
            <pre wrap=3D"">Hi Rob,

=E5=9C=A8 09/03/2015 04:17 AM, Rob Herring =E5=86=99=E9=81=93:
</pre>
            <blockquote type=3D"cite">
              <pre wrap=3D"">On Tue, Sep 1, 2015 at 1:14 AM, Yakir Yang <=
a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ykk@rock-chips.com">&lt;=
ykk@rock-chips.com&gt;</a> wrote:
</pre>
              <blockquote type=3D"cite">
                <pre wrap=3D"">Some edp screen do not have hpd signal, so=
 we can't just return
failed when hpd plug in detect failed.
</pre>
              </blockquote>
              <pre wrap=3D"">This is a property of the panel (or connecto=
r perhaps), so this
property should be located there. At least, it is a common issue and
not specific to this chip. We could have an HDMI connector and failed
to hook up HPD for example. A connector node is also where hpd-gpios
should be located instead (and are already defined by
../bindings/video/hdmi-connector.txt). Perhaps we need a eDP connector
binding, too.
</pre>
            </blockquote>
            <pre wrap=3D"">Yep, I agree with your front point, it is a pr=
operty of panel, not specific
to eDP controller, so this code should handle in connector logic.
</pre>
          </blockquote>
          <pre wrap=3D"">From your description it sounds more like this i=
s in fact a property of
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
        <pre wrap=3D"">
Oh, you're right, if it's a cable quirk, then DT property would be okay, =
if
it
is a problem of panel, then maybe hard-code in driver would be better.

After look up for the document of panel "innolux,n116bge", I haven't see
any description of hot plug signal, and even not found in PIN ASSIGNMENT.
So I believe it's a panel problem, that's to say it should handle in pane=
l
driver.
</pre>
      </blockquote>
      <pre wrap=3D"">
The datasheet that I have for that panel lists HPD as pin 17. Also I
used to have a setup with that panel and I distinctly remember hotplug
working just fine. Perhaps this is an issue with a specific variant of
the panel? Or perhaps this is indeed a problem with the cable that's
connecting the panel to the board. It could be one of those cases where
they left out the HPD conductor to save money.</pre>
    </blockquote>
    <br>
    You're right, I guess I just download the wrong datasheet
    "N116BGE-L41.pdf"<br>
    which the video interfaces is "LVDS", thanks for you point out.<br>
    <br>
    And I double checked with the guys who work with this screen vendor,
    he said<br>
    that it's the fault that vendor missed HPD pin on the screen board,
    and vendor<br>
    have fixed this problem later.<br>
    <br>
    But there are still some machine didn't contain the HPD signal, and
    you also<br>
    mention that in some cases where vendor would left out the HPD
    conductor,<br>
    so I still wish to support those "quirk" screen in the later
    version. But I wish<br>
    you could share your opinion whether this could exist in the
    mainline<br>
    kernel. <br>
    <br>
    If the answer is no, okay, I would remove this from the next
    versions. but If<br>
    the answer is yes, wow, I may still can use the DT property to
    satisfied this<br>
    demand (I guess it's okay to keep the DT property way from previous
    discussion).<br>
    <br>
    Thanks,<br>
    - Yakir<br>
    <br>
    <blockquote cite=3D"mid:20150907082017.GB19961@ulmo.nvidia.com"
      type=3D"cite">
      <pre wrap=3D"">

Thierry
</pre>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap=3D"">_______________________________________________
Linux-rockchip mailing list
<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Linux-rockchip@lists=
.infradead.org">Linux-rockchip@lists.infradead.org</a>
<a class=3D"moz-txt-link-freetext" href=3D"http://lists.infradead.org/mai=
lman/listinfo/linux-rockchip">http://lists.infradead.org/mailman/listinfo=
/linux-rockchip</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------070209080107090807000900--


--===============1135467975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1135467975==--
