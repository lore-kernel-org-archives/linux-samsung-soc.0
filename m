From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v4 14/16] drm: bridge: analogix/dp: try force hpd after
 plug in lookup failed
Date: Mon, 7 Sep 2015 11:01:53 +0200
Message-ID: <20150907090151.GD19961@ulmo.nvidia.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
 <1441088079-25809-1-git-send-email-ykk@rock-chips.com>
 <CAL_JsqJDALnjVaVoEqGGsSLeE31m3MKOfbSoZ3M+g+zPZR2MFg@mail.gmail.com>
 <55E7CC43.7040608@rock-chips.com>
 <20150903090421.GC3784@ulmo.nvidia.com>
 <20150904102003.GE21084@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3Pql8miugIZX0722"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:9849 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751018AbbIGJCD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Sep 2015 05:02:03 -0400
In-Reply-To: <20150904102003.GE21084@n2100.arm.linux.org.uk>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Yakir Yang <ykk@rock-chips.com>, Rob Herring <robherring2@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, Joe Perches <joe@perches.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Yao <mark.yao@rock-chips.com>, djkurtz@chromium.com, dianders@chromium.com, seanpaul@chromium.com, Ajay kumar <ajaynumb@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, architt@codeaurora.org, dri-devel <dri-devel@lists.freede>

--3Pql8miugIZX0722
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2015 at 11:20:03AM +0100, Russell King - ARM Linux wrote:
> On Thu, Sep 03, 2015 at 11:04:40AM +0200, Thierry Reding wrote:
> > Conversely, if the panel isn't capable of generating an HPD signal, then
> > I don't think it would be appropriate to make it a DT property. It would
> > be better to hard-code it in the driver, lest someone forget to set the
> > property in DT and get stuck with a device that isn't operational.
>=20
> There is another way to deal with this: DRM supports the idea of connector
> forcing - where you can force the connector to think that it's connected
> or disconnected.

Yes, this could work well for RGB/LVDS or DSI connectors perhaps. For
eDP there is added complexity because the HPD interrupt function is also
used to signal loss of link integrity. That is, after receiving an HPD
interrupt you are supposed to retrain the link (or at least check the
link status to see if the interrupt cause is loss of integrity). While
the eDP specification makes HPD optional, it also says that if HPD isn't
available, then the source must use polling to monitor link integrity
instead.

DRM does provide a mechanism for that as well. You can set the
connector's ->polled field to DRM_CONNECTOR_POLL_CONNECT |
DRM_CONNECTOR_POLL_DISCONNECT and have the core actively poll for the
connector status (i.e. call ->detect() every 100 ms).

I think use of polling would be more appropriate in case of eDP.

> One of the problems is that not many ARM DRM drivers implement it - maybe
> it should be a requirement for code to be accepted? :)

I suspect that many drivers may roll their own. In fact I'm guilty of
that myself. On Tegra we have a default implementation for outputs which
will default to the state of an HPD GPIO where available and fall back
to "always connected" for outputs that have a panel connected. Outputs
that have a separate mechanism to signal hotplug detection (such as DP)
simply use a custom ->detect() implementation.

The overhead of rolling one's own is almost zero and connector forcing
has the disadvantage of being available via sysfs and debugfs, so the
default set by drivers could be overwritten by users at runtime with no
easy way back.

Given the above I'm not sure enforcing connector forcing would be
beneficial.

Thierry

--3Pql8miugIZX0722
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV7VJ9AAoJEN0jrNd/PrOhfgkP/RlwOrDrAwZXU15zGH3SOz/G
OCsdQLfpLsfIaTBMTwZcuvdjSzLGJ1b3agE/F7D1SrZHFEZDnh0A7yobFaXwjPgP
kH0iP7Hi+sKdkxcJQZSFYlI57yHOlK2fEDzokmLidsevAn2Yf9W0o+2QwF7yOiTF
tZfDWdPET6pqT+DtZOcONS9oMInyW9m4czUY1qa7dAhkJcy/492BeMTyrwO9PWt9
BWnkG8gPk0op4dJ7OAo0rCxpmNpQSwXDemHXwj08jMdTI5fGWfjgX8kZk+Tm9AQ4
KoQpENmI6xU+kdv7RdsDeWDIm7/FUUzqQdCiRBOhpZBQqUYAXZPDkfVpC7ukLyYR
Mz0aQqrEhvERKywkBlYldX7Pg54Ia0ZQKaPK5koX8bvA0QnFSiUmNJl0bt8Y42F4
xDaTCS679V7izzMt1mlHtqG35XEJvvNgQJHbiSMtmsGlXJMmMkFJHrMwe/it2msu
iW4QmCs3oZliYXnLngBMV4tmz9/lMLfhDRT3TfSyhwBX9QK9muGXVCz9DlTNYbYa
Wqpdk3myXyJYyLaaZgJXTcyUB91egwtWQEowSoVJCIoBzNiR75VzulxcvbnL5ERQ
jsTFT9YQSUgQqe/dz45er5Leh/TeFe/BthCB+liKnePb96mZtCZMCbJFHY/xAkZi
JM5ZU3FwUhwRqn4PE2wF
=rg7+
-----END PGP SIGNATURE-----

--3Pql8miugIZX0722--
