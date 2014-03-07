From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [RFC PATCH v2 19/21] ARM: dts: exynos5250-arndale: add dsi and
 panel nodes
Date: Fri, 7 Mar 2014 16:36:59 +0200
Message-ID: <5319D98B.4080709@ti.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com> <1392204688-4591-20-git-send-email-a.hajda@samsung.com> <53108FA0.4040903@ti.com> <53109193.3000604@ti.com> <5315C07B.3090705@samsung.com> <CAAQKjZPVvAxC7=voKJ1Jid3Ynnrjcg6s5m95fwetx7iDeZUN+w@mail.gmail.com> <5319B9FF.50201@samsung.com> <5319BC45.4040308@ti.com> <5319C4A8.8080900@samsung.com> <5319C976.3060908@ti.com> <5319D4FC.5090703@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="HkiL4VlBwLR7XNghgEJHPC4mBiiS5jk68"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:59602 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751545AbaCGOhW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Mar 2014 09:37:22 -0500
In-Reply-To: <5319D4FC.5090703@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>

--HkiL4VlBwLR7XNghgEJHPC4mBiiS5jk68
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 07/03/14 16:17, Andrzej Hajda wrote:
> On 03/07/2014 02:28 PM, Tomi Valkeinen wrote:
> (...)
>> There are many possible connections from FIMD, some of them:
>> FIMD ---> RGB panel, external
>> FIMD ---> DSI, on SoC
>> FIMD ---> eDP, on SoC
>> FIMD ---> ImageEnhacer, on SoC
>> This sounds similar to OMAP, at least roughly.
>>
>>> In the first case port should be created.
>>> In other cases connection could be determined by presence/absence
>>> of specific nodes, so in fact the port can be optional, almost like i=
n
>>> my proposal :)
>> Well, I think not.
>>
>> In the external encoder case, the ports are there, and they are used.
>> You just didn't specify them, and thus make the driver deduce them fro=
m
>> the DT.
>>
>> In the FIMD case, if the the RGB port is needed, you need to specify i=
t
>> in the DT data, and it's used. If you only need, say, DSI, the RGB por=
t
>> is not used and thus it doesn't need to be present in the DT data.
>>
>> It's fine to leave the port definition out if it is not used at all.
> On Exynos, DSI is in fact RGB/DSI encoder (or I80/DSI). DSI and RGB pin=
s
> are connected to the same FIMD output. So from FIMD point of view
> RGB port is used in both cases.

I guessed as much, as it's the same on OMAP.

But I think it's still fine to have a port only for RGB panel. For the
RGB panel, you have pins on the SoC to which the RGB data goes to. The
RGB port in DT represents these pins. You don't have pins for the
FIMD->DSI case.

But as I said, it's fine to use ports for internal connections also if
it works for you.

I still don't like the idea of having the port as optional in DT for
cases where the port comes from the parent device. Sure, it removes some
lines from the DT, but I think it makes it more confusing. Especially as
I think it's a very rare case where you could use that optional format,
as usually you will have some properties in the endpoint node.

 Tomi



--HkiL4VlBwLR7XNghgEJHPC4mBiiS5jk68
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTGdmLAAoJEPo9qoy8lh71t7IP/1dj2iZMo3hKpJNX6+Avbm67
R9nUhgRy7+cP3gxQIPScrdngit+TayjDij2Tnb5RX3ExAoR5EFsRJGm+OM2GTYSS
vKCX3muHoHK0kWho1EWVEyOWQroIHjyzybQEm11Gzn3HGfwtARtD2FzjFW3omdrO
WJSFNOelMNj5YwowL+RZiv1RzmsgRulRb2igC7YbIOTyqBn48Gy9P99Ow1rygazA
WW/Z2HaoBMKgmrsjVDO9OjKi7a04n7GtYjGSVvOrs/4tNgqH+tgJHxiXK19b589V
dOYAY8YYj9CkYlpqUrG5RBvmSLs/GaSxhh7/7xdjfXHhqAMHsuVBVu5+noWY3llU
Mq86o63ey1RM7fad9pvWBtJ08rVBWqBmlqDaKeGND4J9E6LymktVb4ZrL/BZYvbe
Poc3i/OQbVmZnix6GBwjWINrVDDOGwg/taqZmUaimPJgnkOQcUckLiNjaYYd8Yta
+W/7lkbUg3zrwOFKFUc50ujqpdxqAYd4b5HFOcavq2vgTOhrwAe9XVUapMdph0cR
lt93j9agV51BWI3SQrWdxOrFO1HvWt2+R7QEvzR1l5QCkHdzye9pR/mMYrwu6Hl0
1bLJcQqvqidSEueFSesGUk9mb+s4AtqzuB6YYdaowulhRvJk9/LBj+WvXtfFRzfZ
ZwV4qmyM7K8BSGilEJ+9
=hcR/
-----END PGP SIGNATURE-----

--HkiL4VlBwLR7XNghgEJHPC4mBiiS5jk68--
