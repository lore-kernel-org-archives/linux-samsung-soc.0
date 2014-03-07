From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [RFC PATCH v2 19/21] ARM: dts: exynos5250-arndale: add dsi and
 panel nodes
Date: Fri, 7 Mar 2014 15:28:22 +0200
Message-ID: <5319C976.3060908@ti.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com> <1392204688-4591-20-git-send-email-a.hajda@samsung.com> <53108FA0.4040903@ti.com> <53109193.3000604@ti.com> <5315C07B.3090705@samsung.com> <CAAQKjZPVvAxC7=voKJ1Jid3Ynnrjcg6s5m95fwetx7iDeZUN+w@mail.gmail.com> <5319B9FF.50201@samsung.com> <5319BC45.4040308@ti.com> <5319C4A8.8080900@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="72FC8TDHKnxuR5Td4AE0lqxuO2KcGXrR1"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:59907 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752011AbaCGN2n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Mar 2014 08:28:43 -0500
In-Reply-To: <5319C4A8.8080900@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>

--72FC8TDHKnxuR5Td4AE0lqxuO2KcGXrR1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 07/03/14 15:07, Andrzej Hajda wrote:
> On 03/07/2014 01:32 PM, Tomi Valkeinen wrote:
>> On 07/03/14 14:22, Andrzej Hajda wrote:
>>
>>> I think we should even extend the bindings to fimd:
>>> dsi {
>>>     port@0 {
>>>         dsi_0: endpoint {
>>>             remote-endpoint=3D<&fimd_0>;
>>>         }
>>>     }
>>>     port@1 {
>>>         dsi_1: endpoint {
>>>             remote-endpoint=3D<&lvds_0>;
>>>         }
>>>     }
>>> }
>>>
>>> fimd {
>>>     port@0 {
>>>         fimd_0: endpoint {
>>>             remote-endpoint=3D<&dsi_0>;
>>>         }
>>>     }
>>> }
>> If both fimd and dsi are SoC components, I don't see any strict need f=
or
>> that. I think the ports/endpoints are only important when dealing with=

>> external components, which can be used on any platform. For SoC intern=
al
>> components you can have relevant data directly in the drivers, as it i=
s
>> fixed (for that SoC).
>>
>> Of course, if using ports for SoC internal components makes things
>> easier for you, I don't see any problems with it either.
> There are many possible connections from FIMD, some of them:
> FIMD ---> RGB panel, external
> FIMD ---> DSI, on SoC
> FIMD ---> eDP, on SoC
> FIMD ---> ImageEnhacer, on SoC

This sounds similar to OMAP, at least roughly.

> In the first case port should be created.
> In other cases connection could be determined by presence/absence
> of specific nodes, so in fact the port can be optional, almost like in
> my proposal :)

Well, I think not.

In the external encoder case, the ports are there, and they are used.
You just didn't specify them, and thus make the driver deduce them from
the DT.

In the FIMD case, if the the RGB port is needed, you need to specify it
in the DT data, and it's used. If you only need, say, DSI, the RGB port
is not used and thus it doesn't need to be present in the DT data.

It's fine to leave the port definition out if it is not used at all.

>> For OMAP, the SoC's display blocks are all inside one bigger DSS
>> "container", so I have not seen need to represent the connections
>> between the internal components in the DT data.
> How do you deal with situation when IPs in SoC can be connected in
> different ways ?

Basically so that (using exynos terms) if, say DSI panel is to be
enabled, the DSI panel driver will reserve the DSI master for itself,
and the DSI master will reserve the FIMD for itself, presuming FIMD has
not already been reserved. When the DSI panel is disabled, FIMD is freed.=


 Tomi



--72FC8TDHKnxuR5Td4AE0lqxuO2KcGXrR1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTGcl2AAoJEPo9qoy8lh71IngQAIeYDM3OiKUfbofy6o96pQvU
P1OVqZgM2WDPwhwu+uzHIw76S4XcMRSCmJSZnVrFs3/HlVaU8NoZran20b6aU7ZR
4y2HO5rjTnz0W6Hc72EyTztp3j+ZxuVdghb1NuiAwcFuvyeF8zwYtFvBOIt2xM+N
RSVMpRdzSlWoTZIiCsinJsFAnldy/9Rj3hDHzv7PbkcLdkKUMqFKh7yQ27KOJ5Qg
3oipWKdl4Jwuyg6VjV737R0CFAwwIE9Y6rNsm78WdiX9xjzVm5D6s4ImxxdXOBjv
68XrcyxXHl0k6JpWp7dPKNXfYsPuYyYEht3SmJKmR0+ssgXwxKpGQKcSO7difrTY
M7+IBzpEQmy7Kdp1htc9J6yZxTqQOID3n7ERms6fdVmrNs38pDdf4h5ZAmjmTxuo
2uYdgWLyl23rTYdjzefuN3r5kiIdFJwefzYaGhN6BcWC6u+Ogge6+AnAdxvhD5Dw
MlzwAjalJLV/pqVbBlOLr0xzvYq6EfVF/2I36o3MGu/pmt1VW1CHwAqPIGa/w0wg
koZ4Lz5VoJa05cPeB9sb+8/xPLjemur4tZm6wyGbFIzABUhxG7JgbvgrMlYJEFio
+Mtl49X4ivQEGdDu/EY4owznuSydasthAqWSH0Wc8F1A+SmqvigQBMuHPv27d4Lf
fYJ8WJ6t0oUBXCpS0Zf5
=YwRk
-----END PGP SIGNATURE-----

--72FC8TDHKnxuR5Td4AE0lqxuO2KcGXrR1--
