Return-Path: <SRS0=idU0=EL=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90236C55178
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 08:07:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32AB120729
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 08:07:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t1cy+4Pw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728741AbgKEIHE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Nov 2020 03:07:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbgKEIHE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 03:07:04 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE536C0613CF;
        Thu,  5 Nov 2020 00:07:03 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id i19so1271430ejx.9;
        Thu, 05 Nov 2020 00:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ejbix6obkvCfSt+UMVFN1Q6vNzvWmPHr/OGkrFfoLFs=;
        b=t1cy+4PwHGXn+yInQGTOcNHpRHZwsTgyldtVz1e6t3/dfyejQaexsQKzx9zUK8oTl2
         +1A4K52qrignAy+RjVb3mBmJ31K04QCu44VWPNikzu55lfEClaBKYm9NCs9VlxYkfm1r
         ydKEIs4EU73mF/MumaK/E4Hqr51W1KWotAT/N3dcG369HNRcrE5Mw358wInGkXF3lHTO
         FQ/koqKnw/xDdVcyZV6ibxgGWIqlTqUNbr6xzS2HbHfPnRAYSLZtt9d+zdhKPIu3304T
         wbFzQKSIq2lfhwTN3SFt1nYAeVks61wtEN82F9rJitYUOUxs3q8PSeZKnGampPJDh3VL
         b4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ejbix6obkvCfSt+UMVFN1Q6vNzvWmPHr/OGkrFfoLFs=;
        b=fN+FtgWF1KImMUzi+Qsg5DhPpTngJ81p/EaNL+DDoMyOK3xPngY4ffaXlYFQyfxAOr
         JrGShW2baQz9VGvVNgyH9cEawe/aO7SaQYrwsmG7GWdlmIqbWW9DevlrXmImoGsy7R+t
         ccVcONLIe+P3f2NSSP7f0X8UQFNjyPet1RfWVuR0TKG0AZ1Jda8G8SKk8TFfzXZeDbbS
         ZDRN1voUseMHTXja+CaLXwuNDMXAbRZA6/WWP5rvmt0A/HmgM+y8n3IkGM8mDTd4tD26
         d37vSKDfJwlocWR5w8VA0EYvF+TH6dk6NTMjpgFS2IhbdcRuoNysugN/+zzkbOAla3KG
         USiA==
X-Gm-Message-State: AOAM533oQxDHSFuXsK9WAKC5lg0dd1NSBwKfgJYBPxgqzhI+CoFDyRo/
        AAECFAn/sWItuBFCiIpV/LszKh4JrVQGVbMX2enUT30sDYb3MA==
X-Google-Smtp-Source: ABdhPJz3m2HtnIqDIg/WTO25pDMT0i+QQbqtvao1NdWSwCYoRUQX3lNPLxxIsLy8gXGTJ9Joiv/esRlckHgma7CscM8=
X-Received: by 2002:a17:906:a098:: with SMTP id q24mr1098195ejy.191.1604563622509;
 Thu, 05 Nov 2020 00:07:02 -0800 (PST)
MIME-Version: 1.0
References: <CGME20201001135310eucas1p273e3799cec0ebb29891c1b7db38685e0@eucas1p2.samsung.com>
 <20200930143151.23961-1-l.stelmach@samsung.com> <20201001135254.28178-1-l.stelmach@samsung.com>
 <CANAwSgSvH+q21Tj9NijPa87ju+1LOJ07-is1Sucx1y5ggT6zCA@mail.gmail.com> <5ecd2e6d-6aaf-bff5-c000-2c56086ed95b@samsung.com>
In-Reply-To: <5ecd2e6d-6aaf-bff5-c000-2c56086ed95b@samsung.com>
From:   Anand Moon <linux.amoon@gmail.com>
Date:   Thu, 5 Nov 2020 13:36:53 +0530
Message-ID: <CANAwSgR=20AOVxi=5L_ep=uK98dzL6Ent52Mux1_iviiK-XGPA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: exynos: Add a placeholder for a MAC address
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

On Mon, 2 Nov 2020 at 21:53, Marek Szyprowski <m.szyprowski@samsung.com> wr=
ote:
>
> Hi Anand,
>
> On 01.11.2020 15:07, Anand Moon wrote:
> > Hi Lukasz,
> >
> > On Thu, 1 Oct 2020 at 19:25, =C5=81ukasz Stelmach <l.stelmach@samsung.c=
om> wrote:
> >> Add a placeholder for a MAC address. A bootloader may fill it
> >> to set the MAC address and override EEPROM settings.
> >>
> >> Signed-off-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>
> >> ---
> >> Changes in v2:
> >>   - use local-mac-address and leave mac-address to be added by a bootl=
oader
> >>
> >>   arch/arm/boot/dts/exynos5422-odroidxu3.dts | 18 ++++++++++++++++++
> >>   1 file changed, 18 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boo=
t/dts/exynos5422-odroidxu3.dts
> >> index db0bc17a667b..d0f6ac5fa79d 100644
> >> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> >> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> >> @@ -70,3 +70,21 @@ &pwm {
> >>   &usbdrd_dwc3_1 {
> >>          dr_mode =3D "peripheral";
> >>   };
> >> +
> >> +&usbhost2 {
> >> +       #address-cells =3D <1>;
> >> +       #size-cells =3D <0>;
> >> +
> >> +       hub@1 {
> >> +               compatible =3D "usb8087,0024";
> >> +               reg =3D <1>;
> >> +               #address-cells =3D <1>;
> >> +               #size-cells =3D <0>;
> >> +
> >> +               ethernet: usbether@1 {
> >> +                       compatible =3D "usb0c45,6310";
> >> +                       reg =3D <1>;
> >> +                       local-mac-address =3D [00 00 00 00 00 00]; /* =
Filled in by a bootloader */
> >> +               };
> >> +       };
> >> +};
> >> --
> >> 2.26.2
> >>
> > Thanks for this patch, can you share some example on how to set the
> > mac address via u-boot bootargs
>
> A little bit hacky script to set permanent board unique MAC address:
>
> # setexp.b u0 *0x10000014; setexp.b u1 *0x10000015; setexp.b u2
> *0x10000016; setexp.b u3 *0x10000017; setenv ethaddr
> 0:0:${u0}:${u1}:${u2}:${u3}; setenv usbethaddr ${ethaddr};
>
OK this command worked for me.

> Then if there is proper ethernet0 alias set, u-boot will then
> automatically save the configured MAC address to the device tree. I've
> just check this on recent u-boot v2020.10 and Odroid U3 board.
>
> Lukasz will send updated patch soon (with proper alias entry).
>
> If you want to hack setting MAC address manually, this will work with
> the current patch:
>
> # setexp.b u0 *0x10000014; setexp.b u1 *0x10000015; setexp.b u2
> *0x10000016; setexp.b u3 *0x10000017; fdt addr ${fdtaddr}; fdt set
> /soc/usb@12110000/hub@1/usbether@1 local-mac-address [ 0 0 ${u0} ${u1}
> ${u2} ${u3} ]
>

So do we need a similar patch for u-boot ?
I am getting following error on Odroid U3+ and U-Boot 2020.10

Odroid #  setexp.b u0 *0x10000014; setexp.b u1 *0x10000015; setexp.b
u2 *0x10000016; setexp.b u3 *0x10000017; fdt addr ${fdtaddr}; fdt set
/soc/usb@12110000/hub@1/usbether@1 local-mac-address [ 0 0 ${u0} ${u1}
${u2} ${u3} ]
No FDT memory address configured. Please configure
the FDT address via "fdt addr <address>" command.
Aborting!

Also added these command to boot.scr but still observing the failure

mmc0(part 0) is current device
Scanning mmc 0:1...
Found U-Boot script /boot/boot.scr
969 bytes read in 5 ms (188.5 KiB/s)
## Executing script at 42000000
7341440 bytes read in 265 ms (26.4 MiB/s)
53875 bytes read in 56 ms (939.5 KiB/s)
7964187 bytes read in 285 ms (26.6 MiB/s)
libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND
Kernel image @ 0x41000000 [ 0x000000 - 0x700580 ]
## Flattened Device Tree blob at 40800000
   Booting using the fdt blob at 0x40800000
   Loading Ramdisk to 4f867000, end 4ffff61b ... OK
   Loading Device Tree to 4f856000, end 4f866272 ... OK
,
Best Regards
-Anand

> > also can you update this patch for exynos5422-odroidxu3-lite.dts and
> > exynos4412-odroidu3.dts.
>
> Also odroid-x2 and odroid-xu. Lukasz will take care of them.
>
> Best regards
>
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
