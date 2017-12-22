From: Philippe Ombredanne <pombredanne@nexb.com>
Subject: Re: [PATCH v5] hwrng: exynos - add Samsung Exynos True RNG driver
Date: Fri, 22 Dec 2017 19:31:52 +0100
Message-ID: <CAOFm3uHA39C28B3GG1H94eJ_BRCvDY6V4LZEoTREMzhZcWJDrQ@mail.gmail.com>
References: <CGME20171222164840eucas1p17e3d17666ba3d0c5fced2d1c9259bf0b@eucas1p1.samsung.com>
 <20171222132338.30054-1-l.stelmach@samsung.com> <20171222164835.1051-1-l.stelmach@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wr0-f171.google.com ([209.85.128.171]:33871 "EHLO
        mail-wr0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756693AbdLVSce (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 22 Dec 2017 13:32:34 -0500
Received: by mail-wr0-f171.google.com with SMTP id y21so28640375wrc.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Dec 2017 10:32:33 -0800 (PST)
In-Reply-To: <20171222164835.1051-1-l.stelmach@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
Cc: "Andrew F . Davis" <afd@ti.com>, PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>, Rob Herring <robh+dt@kernel.org>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

=C5=81ukasz,

On Fri, Dec 22, 2017 at 5:48 PM, =C5=81ukasz Stelmach <l.stelmach@samsung.c=
om> wrote:
> Add support for True Random Number Generator found in Samsung Exynos
> 5250+ SoCs.
>
> Signed-off-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
> Changes since v4:
>
> - SPDX license header instead of the traditional blurb.
>
> - MODULE_LICENSE("GPL v2") instead of "GPL"
>
> Thank you, Philippe Ombredanne.

You have my cheerful ack for these changes:

Acked-by: Philippe Ombredanne <pombredanne@nexb.com>

--=20
Cordially
Philippe Ombredanne
