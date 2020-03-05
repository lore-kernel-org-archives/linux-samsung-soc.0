Return-Path: <SRS0=g11O=4W=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C537FC3F2D2
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Mar 2020 19:04:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A5F96208CD
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Mar 2020 19:04:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbgCETEh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Mar 2020 14:04:37 -0500
Received: from cyberdimension.org ([80.67.179.20]:38090 "EHLO
        gnutoo.cyberdimension.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbgCETEh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Mar 2020 14:04:37 -0500
X-Greylist: delayed 398 seconds by postgrey-1.27 at vger.kernel.org; Thu, 05 Mar 2020 14:04:36 EST
Received: from gnutoo.cyberdimension.org (localhost [127.0.0.1])
        by cyberdimension.org (OpenSMTPD) with ESMTP id 817f1809;
        Thu, 5 Mar 2020 18:57:47 +0000 (UTC)
Received: from primarylaptop.localdomain (localhost.localdomain [::1])
        by gnutoo.cyberdimension.org (OpenSMTPD) with ESMTP id f31a4bee;
        Thu, 5 Mar 2020 18:57:47 +0000 (UTC)
Date:   Thu, 5 Mar 2020 19:57:37 +0100
From:   Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Simon Shields <simon@lineageos.org>
Subject: Re: [PATCH] ARM: dts: exynos: Fix regulator node aliasing on
 Midas-based boards
Message-ID: <20200305195737.6e500764@primarylaptop.localdomain>
In-Reply-To: <20200305152108.20688-1-m.szyprowski@samsung.com>
References: <CGME20200305152118eucas1p1fef92cacb91612ee5ddc3e6ffd2378d8@eucas1p1.samsung.com>
        <20200305152108.20688-1-m.szyprowski@samsung.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ORaiflYFhWtRa7hB3l4/Vp.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

--Sig_/ORaiflYFhWtRa7hB3l4/Vp.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu,  5 Mar 2020 16:21:08 +0100
Marek Szyprowski <m.szyprowski@samsung.com> wrote:

> Commit d4ec0cb05064 ("ARM: dts: exynos: Add support for the
> touch-sensitive buttons on Midas family") added a new fixed regulator
> ("voltage-regulator-6") to base "midas" .dtsi, but it didn't update
> the clients of that .dtsi, which define their own fixed regulators
> starting from the "voltage-regulator-6". This results in aliasing of
> the regulator dt nodes and breaks operation of OLED panel due to lack
> of power supply. Fix this by increasing the numbers in the fixed
> regulator names for those boards.
>=20
> Fixes: d4ec0cb05064 ("ARM: dts: exynos: Add support for the
> touch-sensitive buttons on Midas family") Signed-off-by: Marek
> Szyprowski <m.szyprowski@samsung.com> ---
>  arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 4 ++--
>  arch/arm/boot/dts/exynos4412-n710x.dts      | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
[...]

Reviewed-by: Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>

Denis.

--Sig_/ORaiflYFhWtRa7hB3l4/Vp.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeC+d2+Nrp/PU3kkGX138wUF34mMFAl5hS6IACgkQX138wUF3
4mPYzg/+J4+BhHmX3xgU85OrOok2MUCkdbl0Bx1hIZhn3N8xItt/JBP+iBYJDLB1
fkBqonpuispRuXlzdSXW9G+dUBGgyX0RpDoQfob9+nTdif0lj+L4bwdgNgVnsN7D
vBJR3J0N78X2JORO9FeTcjKI9DCbMSuiBaCVhJy2NMLvqeyUkIDj1oPYZICPPaHR
zHe7ckxzftX8PGXk9UhRHGFcZNk9aFAS0JkArznUVE/A4mCtHJ/HnXRL3eaIh8UC
u21FAh4rzlHmBVNQ7wemKNxnDXCocjS45uvmP3Ahh+gVfY+FmlOwmp4vGvGR8vWN
628sYSfdhgDdsMEiOrLDg1Zgx9rygvyheKmDDrF2+/5wcyl8VPSXjXzuHUQzudUz
0vuQZ4Y/yMp2c5rl3NW8V0zK3pq3U6Hsp6W6YY21hEOMKzKVxAbTNMdmIPG6nLN0
kmpTtPYIDg27hfBZHGGVeWwaxQCTQJFU90kfJJ1qRvWQUqZ51LGIdnYRgE7StJgY
y4XSYhtO5LLLZpRmpNpSKicucPJ7BD6xDjPWn0DkLrK1dpbrVdoYcNAsE7KqDIJa
UKsY38YPMUiqaSGYoDqbw0KL2SgPPV03N0D5/IrTtMTtCe3OTaQgEJUz/eOAUCCd
DfbpLjCKZvNziDXXCHP/83wsu3bpsGhpGVqNlbP6/KN6Ov5Nhoc=
=4gKT
-----END PGP SIGNATURE-----

--Sig_/ORaiflYFhWtRa7hB3l4/Vp.--
