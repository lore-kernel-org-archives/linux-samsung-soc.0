Return-Path: <SRS0=uz1o=D6=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3F7C4363A
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 23 Oct 2020 16:27:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 711B4221F9
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 23 Oct 2020 16:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603470454;
	bh=iCHkIQPJ9n5EWAybizUiQrLv56EkwfuRfXJFQDdLbf8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=GtjIzG3IpsxCQ5V67bTQs20AAnjM2Ee0PT3Ca0PPKaCg7y5GVpH92iGlhvxMwmqYT
	 68Iw6Z91PevNo3OTWs6xyHlJhTM1b9FGNsUG9+UsY3YOQqee6dO74bW3gCMMUPD+uK
	 LsFv7gZ82st1f0wA3H6brhIJ4IENB1GiivmerrY0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750570AbgJWQ1e (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 23 Oct 2020 12:27:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:57522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750560AbgJWQ1d (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 23 Oct 2020 12:27:33 -0400
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F5852245A;
        Fri, 23 Oct 2020 16:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603470452;
        bh=iCHkIQPJ9n5EWAybizUiQrLv56EkwfuRfXJFQDdLbf8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sOAdbMxX7Z0ofhR6ZaWxCxigrQTz6XBbi5Vsh7C1TRB0ZJ2LwtU7q7gAqE7FUpuww
         PPe3kRve/CHZ9vb0YrIczrro2tsTPsF090jYWiAQeAWlntO9NmsGbMFSUrbSV5BV2f
         y0TBC39FCF6vO+/4XdTzjKfgvXiw3OtRb7oy8rjo=
Received: by mail-ej1-f43.google.com with SMTP id z5so3191989ejw.7;
        Fri, 23 Oct 2020 09:27:32 -0700 (PDT)
X-Gm-Message-State: AOAM5310syJ5Bg+sA/vTjptaWt3DzLeD2W1es+7/WXxffdSI8oxaw0nF
        v3dRJb2xJlQ5i/DzUeJzFfOVp7YnXMnrWAepnaM=
X-Google-Smtp-Source: ABdhPJzu+YDikCuMcAnUApzZlJV6sL/IS32lCeHPts0kyQkHSfjRrliCpF8fPOOJK4vCW1eILVUdMAK34rIBeJ7ZUOA=
X-Received: by 2002:a17:906:6a07:: with SMTP id o7mr2717056ejr.454.1603470451015;
 Fri, 23 Oct 2020 09:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <20201021214910.20001-1-l.stelmach@samsung.com>
 <CGME20201021214933eucas1p152c8fc594793aca56a1cbf008f8415a4@eucas1p1.samsung.com>
 <20201021214910.20001-3-l.stelmach@samsung.com> <20201023160521.GA2787938@bogus>
In-Reply-To: <20201023160521.GA2787938@bogus>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 23 Oct 2020 18:27:18 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeNhXrBa0ZK-k37uhs5izukrhHN-rkxgsjiQBHCMmZs7g@mail.gmail.com>
Message-ID: <CAJKOXPeNhXrBa0ZK-k37uhs5izukrhHN-rkxgsjiQBHCMmZs7g@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: net: Add bindings for AX88796C SPI
 Ethernet Adapter
To:     Rob Herring <robh@kernel.org>
Cc:     =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
        devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        =?UTF-8?Q?Bart=C5=82omiej_=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, jim.cromie@gmail.com,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 23 Oct 2020 at 18:05, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, 21 Oct 2020 23:49:07 +0200, =C5=81ukasz Stelmach wrote:
> > Add bindings for AX88796C SPI Ethernet Adapter.
> >
> > Signed-off-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>
> > ---
> >  .../bindings/net/asix,ax88796c.yaml           | 69 +++++++++++++++++++
> >  1 file changed, 69 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/asix,ax88796c=
.yaml
> >
>
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> ./Documentation/devicetree/bindings/net/asix,ax88796c.yaml: $id: relative=
 path/filename doesn't match actual path or filename
>         expected: http://devicetree.org/schemas/net/asix,ax88796c.yaml#
> Documentation/devicetree/bindings/net/asix,ax88796c.example.dts:20:18: fa=
tal error: dt-bindings/interrupt-controller/gpio.h: No such file or directo=
ry

=C5=81ukasz,

So you really did not compile/test these patches... It's the second
build failure in the patchset. All sent patches should at least be
compiled on the latest kernel, if you cannot test them. However this
patchset should be testable - Artik5 should boot on mainline kernel

Best regards,
Krzysztof
