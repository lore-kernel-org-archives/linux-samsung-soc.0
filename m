Return-Path: <SRS0=0bY/=EH=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B9F1C55179
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  1 Nov 2020 14:07:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0D2820706
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  1 Nov 2020 14:07:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vSN179H1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgKAOHM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 1 Nov 2020 09:07:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726458AbgKAOHL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 1 Nov 2020 09:07:11 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3915C0617A6;
        Sun,  1 Nov 2020 06:07:09 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id a15so2662432edy.1;
        Sun, 01 Nov 2020 06:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Xf3D8wv1rqteE4VdQEnZxsLYc9H1mqo+m29RsmKEQs4=;
        b=vSN179H1wTvGdNjfwlyQSo6njiUyGzjBy/UvzXxP+3/eBT8hEKmFEpQmTcVFcQC0B0
         BMDRvMsZ/X7W5a1KgIVdVbnyVZSQz1fFZHIOf7OIe7WemX0J2dDiE9Uut7XvxWnqwu+R
         SGBTVUBXOELJzQvbI5rQ8vCLg/gtCmOX5g+1lsm4qOFMo1wuYnRhskb7rpVS9RPFIdve
         j90oS1UN6QXv0qZKHVfYPJx1IeQRbOvlgW2elZlvg8R0mtLoy7LDIyR2102AI7qe8vEX
         ekFZyjQd56wdf+rEKKrB0vTleViUqsOF+om7QxDPr+c4PP9iTswsiyeNOkOjQA4vj9RJ
         8+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Xf3D8wv1rqteE4VdQEnZxsLYc9H1mqo+m29RsmKEQs4=;
        b=YvBj/BDY6B7yC2A/fJafrKSquKrypmQkys7wd/5sok2lDDBJxkoXOyxK+UPH+tW7gI
         JS36SQtolneQdqgfngvjkqxoDxtBFsPQTlVPTeQafwdWsxcGC9LX0kYNEHUG8yAORIta
         sMp1AzVLLtopbKHHGawAZoBQ71VSJJSJLAFzSB2ZVcv1OS/3Sy89w9UvXOcNt5xygl3+
         Zfx0IcBKeq6iHWc4sBaUBmYBynKF+4+yWOOL3VwrMpj/2tUe2jPO3t5HwlAuykgSxhH9
         FNA6+VaR49uFT4RIn5paW3EeUnhcnC7Di4kXgVtbKuxc67Jb7QjoA6EDrEr7kiLEQqwJ
         ROCg==
X-Gm-Message-State: AOAM5325QZ0QranSpN1xhXVa3LRCpUQpzldTnpfa/wA6P5JDnHMl4+VA
        FaVoJSqaV+raCicV03QZZAm3kWzylorBuJW4JaU=
X-Google-Smtp-Source: ABdhPJxfPte/UcWPSAWV9nUFL+MCnlriAEwjQ2AlUwDnRd4no/D6kw6JwybiH7ZH+HZ10I1FBxl2QF149/8NU4NtYRk=
X-Received: by 2002:aa7:c597:: with SMTP id g23mr3184502edq.184.1604239628710;
 Sun, 01 Nov 2020 06:07:08 -0800 (PST)
MIME-Version: 1.0
References: <CGME20201001135310eucas1p273e3799cec0ebb29891c1b7db38685e0@eucas1p2.samsung.com>
 <20200930143151.23961-1-l.stelmach@samsung.com> <20201001135254.28178-1-l.stelmach@samsung.com>
In-Reply-To: <20201001135254.28178-1-l.stelmach@samsung.com>
From:   Anand Moon <linux.amoon@gmail.com>
Date:   Sun, 1 Nov 2020 19:37:04 +0530
Message-ID: <CANAwSgSvH+q21Tj9NijPa87ju+1LOJ07-is1Sucx1y5ggT6zCA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: exynos: Add a placeholder for a MAC address
To:     =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Lukasz,

On Thu, 1 Oct 2020 at 19:25, =C5=81ukasz Stelmach <l.stelmach@samsung.com> =
wrote:
>
> Add a placeholder for a MAC address. A bootloader may fill it
> to set the MAC address and override EEPROM settings.
>
> Signed-off-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>
> ---
> Changes in v2:
>  - use local-mac-address and leave mac-address to be added by a bootloade=
r
>
>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/d=
ts/exynos5422-odroidxu3.dts
> index db0bc17a667b..d0f6ac5fa79d 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> @@ -70,3 +70,21 @@ &pwm {
>  &usbdrd_dwc3_1 {
>         dr_mode =3D "peripheral";
>  };
> +
> +&usbhost2 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +
> +       hub@1 {
> +               compatible =3D "usb8087,0024";
> +               reg =3D <1>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               ethernet: usbether@1 {
> +                       compatible =3D "usb0c45,6310";
> +                       reg =3D <1>;
> +                       local-mac-address =3D [00 00 00 00 00 00]; /* Fil=
led in by a bootloader */
> +               };
> +       };
> +};
> --
> 2.26.2
>

Thanks for this patch, can you share some example on how to set the
mac address via u-boot bootargs
also can you update this patch for exynos5422-odroidxu3-lite.dts and
exynos4412-odroidu3.dts.

Best Regards
-Anand
