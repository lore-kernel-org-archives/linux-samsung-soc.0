Return-Path: <SRS0=2c9Z=DI=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77BE1C47423
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  1 Oct 2020 10:10:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 177882137B
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  1 Oct 2020 10:10:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="UBVCT2g7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731937AbgJAKK5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 1 Oct 2020 06:10:57 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:57861 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731682AbgJAKKy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Oct 2020 06:10:54 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201001101052euoutp026dc73cd951631790e5b3bbb6efc291ed~51o8PsBn_0878308783euoutp02O;
        Thu,  1 Oct 2020 10:10:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201001101052euoutp026dc73cd951631790e5b3bbb6efc291ed~51o8PsBn_0878308783euoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1601547052;
        bh=FDkCZfXAdn7nAXHfdgXn6IGM+MGM14NmfFoTLDDPNYo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UBVCT2g7aEClIp86VYEqn47/k8+1QkMeyOp9HrEjgvlnJ0Eaxk1AJk9SNAPYC2Gkc
         +T9MJndR7vhHZWSticXzE7Yz7k/oRopEptPapP3139tOo0XM/o0mIC6hsiSQ1OcAmd
         UUqxHmtd407xWLHz5dUMBLWCx38Ok3hkGoq+d6Xk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201001101052eucas1p2cc8fa4f2bb10262e914baa861e21de26~51o752MdS0995309953eucas1p2-;
        Thu,  1 Oct 2020 10:10:52 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 25.14.05997.B2BA57F5; Thu,  1
        Oct 2020 11:10:52 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201001101051eucas1p2d6237daf16a89831e9b7b5bf106c7074~51o7bKmfj1052610526eucas1p2Q;
        Thu,  1 Oct 2020 10:10:51 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201001101051eusmtrp13df0850895e39ed943e2b0ae0ecb494f~51o7aZR9h0379403794eusmtrp1u;
        Thu,  1 Oct 2020 10:10:51 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-16-5f75ab2bb37d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 54.45.06017.B2BA57F5; Thu,  1
        Oct 2020 11:10:51 +0100 (BST)
Received: from localhost (unknown [106.120.51.46]) by eusmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20201001101051eusmtip2ae8930176c91a31cf01c9b4d71f06d23~51o7RR7Y92130821308eusmtip2u;
        Thu,  1 Oct 2020 10:10:51 +0000 (GMT)
From:   Lukasz Stelmach <l.stelmach@samsung.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc\@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?utf-8?Q?Bart=C5=82omiej_=C5=BBo=C5=82nierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Add a placeholder for a MAC address
Date:   Thu, 01 Oct 2020 12:10:27 +0200
In-Reply-To: <CAJKOXPfghaFLruCJwkgoG0j_G6+EVZTPKY2MNsQ33CkxD2naxg@mail.gmail.com>
        (Krzysztof Kozlowski's message of "Thu, 1 Oct 2020 11:16:48 +0200")
Message-ID: <dleftja6x6gsto.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
        protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBKsWRmVeSWpSXmKPExsWy7djP87o6q0vjDW61MVpsnLGe1WL+kXOs
        Fv2PXzNbnD+/gd1i0+NrrBaXd81hs5hxfh+Txdojd9ktWvceYXfg9Ni0qpPNY/OSeo++LasY
        PT5vkgtgieKySUnNySxLLdK3S+DK+HThLHvBB6WK3+tfszYwPpDuYuTkkBAwkZg2/RVLFyMX
        h5DACkaJ7R9es0I4XxglDq/fzwJSJSTwmVFi5ckCmI5NP38zQRQtZ5TY+XkhVMdzRoneP9MZ
        uxg5ONgE9CTWro0AaRAR0JS4/vc7WA2zwCxmid6La1hBEsICXhKX7uxjBLFZBFQlZry4AnYH
        p8B0RokD/76BJXgFzCXOrLkAZosKWEpseXGfHSIuKHFy5hOw85gFciVmnn/DCNIsIXCOXeJ7
        Vyc7xK0uEvtmdDJB2MISr45vgYrLSJye3MMCcqmEQL3E5ElmEL09jBLb5vxggaixlrhz7hcb
        hO0ocffoMUaIej6JG28FIfbySUzaNp0ZIswr0dEmBFGtIrGufw/UFCmJ3lcrGCFsD4mXk5qg
        IbeEUWLqn2dMExgVZiF5ZxaSd2YBjWUGBt76XfoQYW2JZQtfM0PYthLr1r1nWcDIuopRPLW0
        ODc9tdgoL7Vcrzgxt7g0L10vOT93EyMwTZ3+d/zLDsZdf5IOMQpwMCrx8E7IK4kXYk0sK67M
        PcSoAjTp0YbVFxilWPLy81KVRHidzp6OE+JNSaysSi3Kjy8qzUktPsQozcGiJM5rvOhlrJBA
        emJJanZqakFqEUyWiYNTqoFxtkihsVh7crgX44HHgiEvjLMTlN8kJF44mtgzdY6ywju9r+I/
        TxtotL6OsZUvsGx+ysD+9nOORlflB35riaVzShwFumxymmdtdfg05dyeCOZpkjtqullf+vB2
        6xdvNxCZHfmjdn78R8vzrWxnMyZePtFaMyc/wf9j36PKWr3Qr09VVj7Y+leJpTgj0VCLuag4
        EQAGI80BWwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRmVeSWpSXmKPExsVy+t/xe7raq0vjDc6dlbfYOGM9q8X8I+dY
        Lfofv2a2OH9+A7vFpsfXWC0u75rDZjHj/D4mi7VH7rJbtO49wu7A6bFpVSebx+Yl9R59W1Yx
        enzeJBfAEqVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRv
        l6CX8enCWfaCD0oVv9e/Zm1gfCDdxcjJISFgIrHp52+mLkYuDiGBpYwSz+Z2ADkcQAkpiZVz
        0yFqhCX+XOtig6h5yijRveA5I0gNm4CexNq1ESA1IgKaEtf/fmcFsZkF5jFLzGnNALGFBbwk
        Lt3ZxwhiCwkESKy+fYgJxGYRUJWY8eIKC8hMToHpjBIH/n0DK+IVMJc4s+YCmC0qYCmx5cV9
        doi4oMTJmU9YIBZkS3xd/Zx5AqPALCSpWUhSs4DOYwa6af0ufYiwtsSyha+ZIWxbiXXr3rMs
        YGRdxSiSWlqcm55bbKRXnJhbXJqXrpecn7uJERhh24793LKDsetd8CFGAQ5GJR7eCXkl8UKs
        iWXFlbmHGFWAxjzasPoCoxRLXn5eqpIIr9PZ03FCvCmJlVWpRfnxRaU5qcWHGE2BHp3ILCWa
        nA9MCkD9hqaG5haWhubG5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4OKUaGBnmzlx/iv0L
        ++9PscaMlrfEkyz/7uHODuNasr5Ir+HfUcal1hwSHmUBH8wn33614VdF9sHKBwqWVm+v9aht
        dtkWaFolfOne5a1irjXaKXcq193u1nrOp9p0JsKTeWnR2ZU+WxKYLzjtWv2kh+WZRcLFsM0/
        GgVWl26fGPdsiV5ZRpTrnbtJZkosxRmJhlrMRcWJAF8uRSjSAgAA
X-CMS-MailID: 20201001101051eucas1p2d6237daf16a89831e9b7b5bf106c7074
X-Msg-Generator: CA
X-RootMTR: 20201001101051eucas1p2d6237daf16a89831e9b7b5bf106c7074
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201001101051eucas1p2d6237daf16a89831e9b7b5bf106c7074
References: <CAJKOXPfghaFLruCJwkgoG0j_G6+EVZTPKY2MNsQ33CkxD2naxg@mail.gmail.com>
        <CGME20201001101051eucas1p2d6237daf16a89831e9b7b5bf106c7074@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2020-10-01 czw 11:16>, when Krzysztof Kozlowski wrote:
> On Thu, 1 Oct 2020 at 10:36, Lukasz Stelmach <l.stelmach@samsung.com> wro=
te:
>>
>> It was <2020-10-01 czw 09:22>, when Krzysztof Kozlowski wrote:
>> > On Wed, Sep 30, 2020 at 04:31:51PM +0200, =C5=81ukasz Stelmach wrote:
>> >> Add a placeholder for a MAC address. A bootloader may fill it
>> >> to set the MAC address and override EEPROM settings.
>> >>
>> >> Signed-off-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>
>> >> ---
>> >>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 18 ++++++++++++++++++
>> >>  1 file changed, 18 insertions(+)
>> >>
>> >> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/bo=
ot/dts/exynos5422-odroidxu3.dts
>> >> index db0bc17a667b..9f7f3eacb750 100644
>> >> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
>> >> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
>> >> @@ -70,3 +70,21 @@ &pwm {
>> >>  &usbdrd_dwc3_1 {
>> >>      dr_mode =3D "peripheral";
>> >>  };
>> >> +
>> >> +&usbhost2 {
>> >> +    #address-cells =3D <1>;
>> >> +    #size-cells =3D <0>;
>> >> +
>> >> +    hub@1 {
>> >> +            compatible =3D "usb8087,0024";
>> >> +            reg =3D <1>;
>> >> +            #address-cells =3D <1>;
>> >> +            #size-cells =3D <0>;
>> >> +
>> >> +            ethernet: usbether@1 {
>> >> +                    compatible =3D "usb0c45,6310";
>> >> +                    reg =3D <1>;
>> >> +                    mac-address =3D [00 00 00 00 00 00]; /* Filled i=
n by a bootloader */
>> >
>> > Why do you need a placeholder? U-Boot can just append the
>> > address/property.
>>
>> Several other dts files have such placeholder
>>
>> git grep 'mac-addr.*\[00 00 00 00 00 00\]' arch/arm/boot/dts/ | wc -l
>> 26
>
> Yeah, but if this is cargo cult, then it is not a good reason. First of a=
ll,
> git grep '[^-]mac-addr.*\[.*00 00 00 00 00 00.*\]' arch/arm/boot/dts/
> gives just seven boards. Not a big number to make a standard. :)
>
> The meaning of mac-address, I think, is not a placeholder, but:
> "should be used in cases where the MAC address assigned to the device
> by the boot program is different from the local-mac-address property."
>
> I think you actually wanted a local-mac-address and the majority of
> DTSes use it. Not mac-address.

Indeed that makes sense. I am fixing this.

>> I can see two scenarios where this patch may be helpful. Another
>> (simple) boot loading code might be used.
>
> OK, good point. However other bootloader still has to adhere to the DT
> specification and the bindings.
>
>> The value may also be
>> customized during build time and used without any support of a
>> bootloader.
>
> Yes, with an overlay. You do not need a placeholder for this and
> actually having a placeholder instead of using overlays is the wrong
> approach for customization of boots/builds.

Still, not every bootloading scenario allows for using overlays.
Applying an overlay to change the MAC address after boot makes little
sense since you can simply

    ip link set address 00:01:02:03:04:05 dev eth0

>> Finding and filling a placeholder would be easier in u-boot too.
>
> U-Boot already has the code for updating mac-address or
> local-mac-address so how is it easier for him? You mean that it cannot
> find an ethernet node here?

I didn't know that. Point for you.

>> And it serves as a reference how to configure a USB device in a dts
>
> Great places for references are examples in bindings.

Not so much IMHO because they are not strictly related to real
hardware you can examine and see the connection between DT and the
hardware.

=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAl91qxMACgkQsK4enJil
gBBTTwf/amxo1GBpBXsow0ul8NAV0fVrMFUo6TuthxMNCTUNAN6an9FchPPr/j0L
Qn4bQwrypKfEZw+AxP7IrvGUgOaPdtu6C71T5CmsfMDP2+2Gi4lvwDVYQF254Crx
jVS2FC54rMjn9GiLOj5N7JvXg2vY4f6PC6KgWYojwozMp9QEP0CJanxBUlIVXejL
Wi4av4NigcDtIwMtBG8gFss55Lk7AFQaiBS8zgIKqFET5Q9uMtE0cX/OBBOVuxAp
KtXdlB+nZzLDaak1MiNsnu3hT80Idxlbg5150Q4k3ROXHK8+qhWLr/yBj4WLHKds
5oEc1fHCAxKFPCDQpwKXmxi+F2knWQ==
=VLsF
-----END PGP SIGNATURE-----
--=-=-=--
