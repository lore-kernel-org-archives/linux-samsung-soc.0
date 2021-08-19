Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9130AC4338F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Aug 2021 16:19:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75FF7610A3
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Aug 2021 16:19:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhHSQTp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 19 Aug 2021 12:19:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbhHSQTo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Aug 2021 12:19:44 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45F13C061575;
        Thu, 19 Aug 2021 09:19:08 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id f15so6516574ilk.4;
        Thu, 19 Aug 2021 09:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7sSsnQcwE8jywz/QogD9CtfIDyXBl14A+f2OTMoEAtM=;
        b=UJaHuem6sRW+uPr6ldear1fXlDeMOa1sg5i8hah63XtiMKWKrsl/xZoQm3Ok+qDV6A
         6xWZAdyLheW1n0HIbFVsg7MTjeDpP0ynsl8FJkruex6tby2rf1DeEvYJ35mGBSC9wnFC
         Yc8ABxYqdwL3NgXxNiOMS9aeZeV0oaB4CpeRqsR9jQokAZV5QhqdcR9PJqkFDMmz801+
         mpOKqEC9WRomW3jOzwKd4yL062jAG5HEFRPrlEv3m3grdk4CH9eyBOyg+yq3fv+TpwwH
         6vrzFSoGo0itO/G6RtQfCNF1NUV86iQbtaK5TcRbraCaQ8XDHAECswHjZiJFobU4ED0o
         F/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7sSsnQcwE8jywz/QogD9CtfIDyXBl14A+f2OTMoEAtM=;
        b=o6x4oMwiSRDM1MkQ74E6eMlMooQ3TeyDodY8kGXtiGJ6T4L1/z1rwdunbDizXQEQIi
         0brtD12UFYb/XK03HZzyHShPC+/hjavWgnCfxrN24Y+kg3ljy7lNP/hCLzkVlaIgDJHD
         jT/8Ybul2KWPxzMNccYQm0XI9+x6GtUyWRavdGXGC5nRB000QEjCgkP0pEMXtOd9sZaA
         dJRiyjUKiN3nrg0/9w5bzk1eNxaPi5pAYRiY89ai+mtGu6FSXZNMR3mQfB3SM1KHVSvN
         K2zId5F+c6VA9OAiVBuvemjW1WdqwALbB2P3jY2Ip65dUH8N4UI3x/fTQK9rLrapm4ni
         4pyA==
X-Gm-Message-State: AOAM533mQVCZRLCNGqowPk2PeMTrM1bDajWcId86DZdJws4PecLKkuLI
        +ftFkEf3Oe3YJlTsVfAKnZauTwGEfkFv0ZQyef4=
X-Google-Smtp-Source: ABdhPJzNx+kqJnj8ZO2IlnI5dHnPoW9t1eT/6sqkn6teMO0sd54NgKeH37gOy/eY6XAdCjhY8MRviQEexNOTAtFLE/o=
X-Received: by 2002:a05:6e02:138a:: with SMTP id d10mr9778731ilo.287.1629389947638;
 Thu, 19 Aug 2021 09:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20210803032734epcas5p2143008ddb212fe53fcd28b813c85c9d8@epcas5p2.samsung.com>
 <20210803032539.15676-1-alim.akhtar@samsung.com> <CAGOxZ53emv4H4UqT2L7tDtTXRgDrtrqti=FtfkNWo2M3rTnZMw@mail.gmail.com>
In-Reply-To: <CAGOxZ53emv4H4UqT2L7tDtTXRgDrtrqti=FtfkNWo2M3rTnZMw@mail.gmail.com>
From:   Alim Akhtar <alim.akhtar@gmail.com>
Date:   Thu, 19 Aug 2021 21:48:31 +0530
Message-ID: <CAGOxZ51qW52r=BzAc9K_NO3fQcRT3DXG-wVyO9-GvACyYgvQwA@mail.gmail.com>
Subject: Re: [PATCH v11] dt-bindings: ufs: Add bindings for Samsung ufs host
To:     Alim Akhtar <alim.akhtar@samsung.com>
Cc:     open list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "robh+dt" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Rob
Can you pick up this patch via your tree? or you want Martin to pick it up?

On Sat, Aug 14, 2021 at 10:25 PM Alim Akhtar <alim.akhtar@gmail.com> wrote:
>
> Ping!!
>
> On Wed, Aug 4, 2021 at 9:01 AM Alim Akhtar <alim.akhtar@samsung.com> wrote:
> >
> > This patch adds DT bindings for Samsung ufs hci
> >
> > Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> > ---
> > Changes since v10
> > * Rebased on v5.14-rc2
> > * removed Rob Herring earlier Reviewed-by tag
> >
> > This patch was part of exynos ufs driver series, somehow
> > this got missed to applied on the tree, sending again as a new
> > patch v11, removing Rob's earlier Reviewed-by tag.
> >
> >  .../bindings/ufs/samsung,exynos-ufs.yaml      | 89 +++++++++++++++++++
> >  1 file changed, 89 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> > new file mode 100644
> > index 000000000000..38193975c9f1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> > @@ -0,0 +1,89 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/ufs/samsung,exynos-ufs.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Samsung SoC series UFS host controller Device Tree Bindings
> > +
> > +maintainers:
> > +  - Alim Akhtar <alim.akhtar@samsung.com>
> > +
> > +description: |
> > +  Each Samsung UFS host controller instance should have its own node.
> > +  This binding define Samsung specific binding other then what is used
> > +  in the common ufshcd bindings
> > +  [1] Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> > +
> > +properties:
> > +
> > +  compatible:
> > +    enum:
> > +      - samsung,exynos7-ufs
> > +
> > +  reg:
> > +    items:
> > +     - description: HCI register
> > +     - description: vendor specific register
> > +     - description: unipro register
> > +     - description: UFS protector register
> > +
> > +  reg-names:
> > +    items:
> > +      - const: hci
> > +      - const: vs_hci
> > +      - const: unipro
> > +      - const: ufsp
> > +
> > +  clocks:
> > +    items:
> > +      - description: ufs link core clock
> > +      - description: unipro main clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: core_clk
> > +      - const: sclk_unipro_main
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  phys:
> > +    maxItems: 1
> > +
> > +  phy-names:
> > +    const: ufs-phy
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - phys
> > +  - phy-names
> > +  - clocks
> > +  - clock-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/exynos7-clk.h>
> > +
> > +    ufs: ufs@15570000 {
> > +       compatible = "samsung,exynos7-ufs";
> > +       reg = <0x15570000 0x100>,
> > +             <0x15570100 0x100>,
> > +             <0x15571000 0x200>,
> > +             <0x15572000 0x300>;
> > +       reg-names = "hci", "vs_hci", "unipro", "ufsp";
> > +       interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
> > +       clocks = <&clock_fsys1 ACLK_UFS20_LINK>,
> > +                <&clock_fsys1 SCLK_UFSUNIPRO20_USER>;
> > +       clock-names = "core_clk", "sclk_unipro_main";
> > +       pinctrl-names = "default";
> > +       pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
> > +       phys = <&ufs_phy>;
> > +       phy-names = "ufs-phy";
> > +    };
> > +...
> >
> > base-commit: 2734d6c1b1a089fb593ef6a23d4b70903526fe0c
> > --
> > 2.17.1
> >
>
>
> --
> Regards,
> Alim



-- 
Regards,
Alim
