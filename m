Return-Path: <SRS0=6Xyg=EJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686A6C388F7
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 17:22:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18A18216C4
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 17:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604424178;
	bh=nuhB/4sintLQzxwxCT17pYI6UZJrHoBwz0+DQysykcU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=qjb+1eGfuNw73LPMTRMVn71Br1mpMbr44Y+4FdwnU0dnbdR0DXpEeF30ZqDO8XCKH
	 3Q6iculNt75rZkrS+gHfEC8iXTROqZQNc3cklmx9FuSqyJ7pBnHv/DxwBTcVVqA5m/
	 TLAGX+9KCzNbx627tbm0ogXuaJH35KMiNEJcgqC8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727530AbgKCRWy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Nov 2020 12:22:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:45358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727323AbgKCRWy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 12:22:54 -0500
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7CC8922264;
        Tue,  3 Nov 2020 17:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604424173;
        bh=nuhB/4sintLQzxwxCT17pYI6UZJrHoBwz0+DQysykcU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=B20/5fh25nwLzmTpD5b9hwR2s1AoKsI4d8mSqOJiae5rj9+zXJhV7hOcTb1W3tHRX
         6aSpQoEHR2qW+Q06enA9bT0sb3ikeKGVoBjvsBSmSL0BA1SdDcdpl74ILitvwBCFJY
         9CxEwCZ0ulKY4Hh9JzjczNrIPMszTZx9kIAb3pJU=
Received: by mail-ej1-f41.google.com with SMTP id w13so11855845eju.13;
        Tue, 03 Nov 2020 09:22:53 -0800 (PST)
X-Gm-Message-State: AOAM533KUgJeTx3Tfrp8zIq4vqRttnDNCFZMM1D/vTmgVQ30P3YiJDWY
        QpBdCa8KHlaf9rBP1tn529vHOJ0SK1LI73I9GtQ=
X-Google-Smtp-Source: ABdhPJzp1lyF41abtZbU7xkRpbqw9yIv88mVCATEX/AZrjpQkucHXAEjzpUgFOFgt3xOMhgVymGjlQjXeXMTCKDx3rM=
X-Received: by 2002:a17:906:c0c1:: with SMTP id bn1mr1239098ejb.454.1604424171757;
 Tue, 03 Nov 2020 09:22:51 -0800 (PST)
MIME-Version: 1.0
References: <CGME20201103171326eucas1p25d2ea836878fb2e4f56f31c166243c40@eucas1p2.samsung.com>
 <20201103164423.GE14739@kozik-lap> <dleftjsg9qs6ss.fsf%l.stelmach@samsung.com>
In-Reply-To: <dleftjsg9qs6ss.fsf%l.stelmach@samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 3 Nov 2020 18:22:39 +0100
X-Gmail-Original-Message-ID: <CAJKOXPdTU74P6PDqPqoW-qF3QkvK_0wXCVSUeuExfQyHZdvcpg@mail.gmail.com>
Message-ID: <CAJKOXPdTU74P6PDqPqoW-qF3QkvK_0wXCVSUeuExfQyHZdvcpg@mail.gmail.com>
Subject: Re: [PATCH 5/5] ARM: dts: exynos: Add Ethernet interface description
 for Odroid X/X2
To:     Lukasz Stelmach <l.stelmach@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Bart=C5=82omiej_=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 3 Nov 2020 at 18:13, Lukasz Stelmach <l.stelmach@samsung.com> wrote=
:
>
> It was <2020-11-03 wto 17:44>, when Krzysztof Kozlowski wrote:
> > On Tue, Nov 03, 2020 at 01:46:18PM +0100, =C5=81ukasz Stelmach wrote:
> >> Add Ethernet interface description for Odroid X/X2.
> >>
> >> Signed-off-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>
> >> ---
> >>  arch/arm/boot/dts/exynos4412-odroidx.dts | 28 +++++++++++++++++++++++=
+
> >>  1 file changed, 28 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/=
dts/exynos4412-odroidx.dts
> >> index 3ea2a0101e80..8f154f431f6c 100644
> >> --- a/arch/arm/boot/dts/exynos4412-odroidx.dts
> >> +++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
> >> @@ -15,6 +15,10 @@ / {
> >>      model =3D "Hardkernel ODROID-X board based on Exynos4412";
> >>      compatible =3D "hardkernel,odroid-x", "samsung,exynos4412", "sams=
ung,exynos4";
> >>
> >> +    aliases {
> >> +            ethernet =3D &ethernet;
> >> +    };
> >> +
> >>      memory@40000000 {
> >>              device_type =3D "memory";
> >>              reg =3D <0x40000000 0x3FF00000>;
> >> @@ -72,8 +76,32 @@ &buck8_reg {
> >>  };
> >>
> >>  &ehci {
> >> +    #address-cells =3D <1>;
> >> +    #size-cells =3D <0>;
> >>      phys =3D <&exynos_usbphy 2>;
> >>      phy-names =3D "hsic0";
> >> +
> >> +    hub@2 {
> >> +            compatible =3D "usb0424,3503";
> >> +            reg =3D <2>;
> >> +            #address-cells =3D <1>;
> >> +            #size-cells =3D <0>;
> >> +
> >> +            hub@1 {
> >> +                    compatible =3D "usb0424:9514";
> >
> > Does not look like correct compatible.
>
> As odd as it may seem (and considering my mistakes) this is correct.

Not the numbers, the format. Comma is needed.

Best regards,
Krzysztof
