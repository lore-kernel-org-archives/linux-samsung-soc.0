Return-Path: <SRS0=idU0=EL=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD9CC4741F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 08:31:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 880C32080D
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 08:31:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729604AbgKEIb6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Nov 2020 03:31:58 -0500
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:44272 "EHLO
        wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726400AbgKEIb5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 03:31:57 -0500
Received: from [2003:a:659:3f00:1e6f:65ff:fe31:d1d5] (helo=hermes.fivetechno.de); authenticated
        by wp126.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1kaagS-0003sI-O9; Thu, 05 Nov 2020 09:31:52 +0100
X-Virus-Scanned: by amavisd-new 2.11.1 using newest ClamAV at
        linuxbbg.five-lan.de
Received: from [192.168.34.101] (p5098d998.dip0.t-ipconnect.de [80.152.217.152])
        (authenticated bits=0)
        by hermes.fivetechno.de (8.15.2/8.14.5/SuSE Linux 0.8) with ESMTPSA id 0A58Vp93016259
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Thu, 5 Nov 2020 09:31:51 +0100
Subject: Re: [PATCH] ARM: dts: exynos: Assign a fixed index to mmc devices on
 exynos4412 based ODROID boards
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CGME20201104102634eucas1p2ec7b705dd5092afa25d9877d1014f46a@eucas1p2.samsung.com>
 <20201104102558.11070-1-m.reichl@fivetechno.de>
 <efe8a911-6072-59fb-8a8e-d5cdb4352cab@samsung.com>
 <5800260a-5332-f627-eb36-32df4fbf05e3@fivetechno.de>
 <c1040872-0ae1-3988-29d0-60c8a711cdb1@samsung.com>
 <71e4ecca-b980-e224-0fbe-b30330e490fb@samsung.com>
From:   Markus Reichl <m.reichl@fivetechno.de>
Organization: five technologies GmbH
Message-ID: <2ddf7343-799b-418b-bb00-a926f1030db7@fivetechno.de>
Date:   Thu, 5 Nov 2020 09:31:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <71e4ecca-b980-e224-0fbe-b30330e490fb@samsung.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SUOzVV9nJY38FvPCPZJ5I9yRe11nBH3HE"
X-bounce-key: webpack.hosteurope.de;m.reichl@fivetechno.de;1604565116;6a36cebd;
X-HE-SMSGID: 1kaagS-0003sI-O9
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SUOzVV9nJY38FvPCPZJ5I9yRe11nBH3HE
Content-Type: multipart/mixed; boundary="zHl1cYUM9exYlpHUjGV70Khy7z5FjhCli";
 protected-headers="v1"
From: Markus Reichl <m.reichl@fivetechno.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <2ddf7343-799b-418b-bb00-a926f1030db7@fivetechno.de>
Subject: Re: [PATCH] ARM: dts: exynos: Assign a fixed index to mmc devices on
 exynos4412 based ODROID boards
References: <CGME20201104102634eucas1p2ec7b705dd5092afa25d9877d1014f46a@eucas1p2.samsung.com>
 <20201104102558.11070-1-m.reichl@fivetechno.de>
 <efe8a911-6072-59fb-8a8e-d5cdb4352cab@samsung.com>
 <5800260a-5332-f627-eb36-32df4fbf05e3@fivetechno.de>
 <c1040872-0ae1-3988-29d0-60c8a711cdb1@samsung.com>
 <71e4ecca-b980-e224-0fbe-b30330e490fb@samsung.com>
In-Reply-To: <71e4ecca-b980-e224-0fbe-b30330e490fb@samsung.com>

--zHl1cYUM9exYlpHUjGV70Khy7z5FjhCli
Content-Type: multipart/mixed;
 boundary="------------23F30937D93758DE7E7441DB"
Content-Language: de-DE

This is a multi-part message in MIME format.
--------------23F30937D93758DE7E7441DB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Marek,

on rk3399 the proposed ordering [1] is according to base address in DT.

[1]
https://patchwork.kernel.org/patch/11881427

Am 04.11.20 um 14:44 schrieb Marek Szyprowski:
> On 04.11.2020 14:13, Marek Szyprowski wrote:
>> On 04.11.2020 14:06, Markus Reichl wrote:
>>> Am 04.11.20 um 13:25 schrieb Marek Szyprowski:
>>>> On 04.11.2020 11:25, Markus Reichl wrote:
>>>>> Recently introduced async probe on mmc devices can shuffle block ID=
s.
>>>>> Pin them to fixed values to ease booting in evironments where UUIDs=

>>>>> ar not practical.
>>>>> Use newly introduced aliases for mmcblk devices from [1].
>>>>>
>>>>> [1]
>>>>> https://patchwork.kernel.org/patch/11747669/
>>>>>
>>>>> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
>>>>> ---
>>>>>  =C2=A0 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 5 +++++
>>>>>  =C2=A0 1 file changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>>>> b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>>>> index a5c1ce1e396c..aa10d5bc7e1c 100644
>>>>> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>>>> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>>>> @@ -13,6 +13,11 @@
>>>>>  =C2=A0 #include "exynos-mfc-reserved-memory.dtsi"
>>>>>  =C2=A0 =C2=A0 / {
>>>>> +=C2=A0=C2=A0=C2=A0 aliases {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmc0 =3D &sdhci_2;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmc1 =3D &mshc_0;
>>>> Like in the OdroidXU3-family patch, I would use 0 for the eMMC (mshc=
_0)
>>>> and 2 for the SD-card (sdhci_2).
>>> How to deal then with sdhci_0 (from exynos4.dtsi) vc. mshc_0 (from
>>> exynos4412.dts)?
>> sdhci_0 and mshc_0 both operate on the same physical MMC0 bus, so this=

>> is not an issue. They cannot be used simultaneously. The latter is jus=
t
>> faster, the first one has been left there mainly for the software
>> compatibility.
>=20
> I've thought a bit more on this and I would simply prefer to add generi=
c
> MMC aliases to the top-level Exynos dtsi files (3250, 4210, 4412, 5250,=

> 5410, 5420) to keep Linux logical MMC bus numbers in sync with the HW
> bus numbers on all boards.
>=20
> Best regards
>=20

Gru=C3=9F,
--=20
Markus Reichl

--------------23F30937D93758DE7E7441DB
Content-Type: application/pgp-keys;
 name="OpenPGP_0x3A25DE0E6B1AFDB2.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0x3A25DE0E6B1AFDB2.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsDNBFs02GcBDADRBOYE75/gs54okjHfQ1LK8FfNH5yMq1/3MxhqP7gsCol5ZGbdNhJ7lnxXj=
IEI
lYfd6EgJMJV6E69uHe4JF9RO0BDdIy79ruoxnYaurxB40qPtb+YyTy3YjeNF3NBRE+4EffvY5=
AQv
t3aIUP83u7xbNzMfV4JuxaopB+yiQkGo0eIAYqdy+L+5sHkxj/MptMAfDKvM8rvT4LaeqiGG4=
b8x
sQRQNqbfIq1VbNEx/sPXFv6XDYMehYcbppMW6Zpowd46aZ5/CqP6neQYiCu2rT1pf/s3hIJ6h=
dau
k3V5U8GH/vupCNKA2M2inrnsRDVsYfrGHC59JAB545/Vt8VNJT5BAPKPka4lgIofVmErILAhL=
txu
3iSH6gnHWTroccM/j0kHOmrMrAmCcLrenLMmB6a/m7Xve5J7F96zLAWW6niQyN757MpgVQWsD=
kY2
c5tQeTIHRlsZ5AXxOFzA44IuDNIS7pa603AJWC+ZVqujr80orChE99LDPe1zZUd2Une43jEAE=
QEA
Ac0iTWFya3VzIFJlaWNobCA8cmVpY2hsQHQtb25saW5lLmRlPsLA8AQTAQoAGgQLCQgHAhUKA=
hYB
AhkBBYJbNNhnAp4BApsDAAoJEDol3g5rGv2ygaMMAMuGjrnzf6BOeXQvadxcZTVas9HJv7Y0T=
RgS
hl4ItT6u63+mvOSrns/w6iNpwZxzhlP9OIrbv2gorWDvW8VUXaCpA81EEz7LTrq+PYFEfIdtG=
gKX
COqn0Om8AHx5EmEuPF+dvUjESVoG85hLQ6r6PJUh8xhYGMUYMer/ka2jAu2hT1sLpmPijXnw9=
TvC
2K9W3paouf4u5ZtG32fegvUeoQ1Rt30k0bYRNqX8xboD1mMKgc4IWLsH6I0MROwTF7JvarkC9=
rU/
M6OL6dwnNuauLvGVs/aXLrn2UYxas9erPOwr+M45f8OR7O8xxvKoP5WSU6qWB/EExfm/ZBUkD=
Kq8
nDgItEpm+UUxpS9EpyvCTIQ3qkqHGn1cf2+XRUjaCGsRG6fyY7XM4v5ariuMrg8RV7ec2jxIs=
354
6pXx4GFP6rBcZZoWf6y2A6h47rWGHAhbZ6cnJp/PMDIQrnVkzQHYBkTuhTp1bzUGhCfKLhz2M=
/UA
Io+4VNUicJ56PgDT5NYvvc0mTWFya3VzIFJlaWNobCA8bS5yZWljaGxAZml2ZXRlY2huby5kZ=
T7C
wPAEEwEKABoECwkIBwIVCgIWAQIZAAWCWzTYZwKeAQKbAwAKCRA6Jd4Oaxr9snO7DAC/0qxsF=
cwX
7ZfEz0oVkOTBPFOElMfx0/YSyznTCbqjgrKtQgTNXUtlKUNFI3xhMHRVGGybOUUNw37RZ5K3t=
daO
9RE7TiKjzetMeaCVBULoUU2Hho5/EavESnfCmfmtqvwWRJ7haE7ccxvMZFPfcDq6XJyz5ZBKG=
yCM
xOiYETmWRFgHIenIfyptGxw40tvuLNbUkw5DaiuifPem55EI/K5drO7xEIt+E9HnhiOX6++fY=
YBl
OvHxIeXNalNbZU09HEYozZgqnaFa6a4Gy7oC1sbzHUtRktkR9X/RvBWWLFp177ZM2u431WqC0=
Yt4
CYKDkGhNMu/vGwDFssmGtz33bn+PNkCQeGjo0yHLsFM2zLmwsGFp183AMn8m1H6Znc0DSaTTG=
zEv
pU4GWp7iPQcdQ8mwTi43cyfREC+CIRAdX8xwON3gXGiOS09Eg3CCUYdCv2+hySEs+HqHCkzjq=
c+G
lasyeX50hGRcxLjcuYBcjBG8F/hcIjDy2FRe/bKA4ErfOp/OwM0EWzTYZwEMAJm5mH5FezwN8=
67L
3qq2lCK8+U3jXSNxjzv5AVjxV3vxAmgqFyFX2nE1fJoh78alPdla/+2cO5ZWp3flIB2uzBpSX=
zR6
KlyFS/GVgI/phn+IzKNNkvl7VL3S+y7QC0MF5U+xg9HvRH8pPwFfby/GorHk/0pluvrAIbPUO=
1z7
2VhPzBNTP1kZQ7It9oNOJpLzsxv2xjfQ3vi6EoJ/9ttLnU4C6atmiRGBoL4GUVQynjhknj/XA=
CmE
D47FtKJBX1cns2bmzRy8Hco1RcRgdlyB/1yFaNdxNkhb1h63Y5gnGXpN+5OLn7XWBvdIgV0tw=
7ad
LvO8ojiKC9j1zPKi1NvhYV6YY3HuhH995ykKXpVi18Za11K9ZTpjUwB31SLCphrEQakQZqYSz=
CTn
8g+np2EdAf3/rC1Q7ShazM4ZI6r2p8JXEJG6Teg7w+NPUEWlMMUIlGgnKZVKh5ybynYzu8wiO=
Luk
+oY73Iga4BAQfrjdebhoPizg0WeFHtCmlqIh+p9SMQARAQABwsDfBBgBCgAJBYJbNNhnApsMA=
AoJ
EDol3g5rGv2ylhYMAMN4XNQRguuQYYXGMopKkTSOo5x0FQtvWsdUU4owtjyWeQLfrgEmAMvew=
Nlo
wi91HS1PwesoXBLd1OoMEIEG362zzm43mYvF0kMz9qmSPLq45yD1Bu1mAyvIKxaqY7wFjwYaU=
geQ
njGiAovaaWZ6pBN/3fzTFxwlP6mwEaQEyRjg5OuBpyRJ5Ulg21n04BFHfpZ1EFSgGX8uWeaGG=
m6R
qRubQzOPS8bguGaU5Col/nk9WMbCh/XwkhZxE0eeGVQkuzUAzk7aRwwNkM9ont7DQh+2Mh+fN=
Ivc
58Hj8oQhUEHl/o6Nq9hkNL/pDkKy/cMJblusTVgWpIS2p0Bax8qZ+2s6TgmiK6Vn8TpvQjxJO=
Mxo
0JhO7FtR3yHWAt/TnhBJ6D3ZzRsZ+7H+hbr/n2oQLPJbN9yQXbRADy4kfA5uNx2cEwVz8GrBR=
5xp
BddDe2l396/FmKXLW2WJXE+RFfZvYuI31qBsx0uVeA15r+jgZnS2JHg/17+ErCtiUzuJ5EGMP=
A=3D=3D
=3DDTVP
-----END PGP PUBLIC KEY BLOCK-----

--------------23F30937D93758DE7E7441DB--

--zHl1cYUM9exYlpHUjGV70Khy7z5FjhCli--

--SUOzVV9nJY38FvPCPZJ5I9yRe11nBH3HE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEVKeIeBh0ZWJOldzLOiXeDmsa/bIFAl+juHcFAwAAAAAACgkQOiXeDmsa/bKp
4gwAvnEmlxU5+Q57h825prxCTjmipq0/4HA9AyLh8wOHMZBI6qoHhKWp4+cZkcADc0KfayFMj5x3
HXVgLD+mw2Qn0kjvjSmEU56uUYqs3J9gB2qdcgRQ+LJrbDYzM1DLfjR0FDdUkD4jQ0nVD3jpFPe7
sbI9dz0/Ct8Nai8bcr9yHzOLXAYecZ6hXuwJd2p1eG3Lj3lYHvraEeNFJUbMd1DpxHekuf7ZF5qx
/mLfMwVT1noXJOV8kFGRRA3UnUG/QP6p5UdOyW29pg7/2Ezf3BSW1DOMdSXK0mTnDj9/XrQeyP8E
35RQw2+yqE/7F9AC1BD148ef0Rp1/3zxh4/VNq6SzPAEq7kH/p3+HzhN74ey9mUI8qT6VtvmJ9zp
xSaIZIgXNufAfFIpHZzw+5vAG2MNEhActbaZO+xxr2+54b8FZ9YEKoh86dDvxqrRQx/wHXRmnqF5
HXjbj9yiZgZ8Xtn9IodVS0PoBCrDdcohZaAXNk0fGIlX8g2JvjYGLdJm8sfv
=rerr
-----END PGP SIGNATURE-----

--SUOzVV9nJY38FvPCPZJ5I9yRe11nBH3HE--
