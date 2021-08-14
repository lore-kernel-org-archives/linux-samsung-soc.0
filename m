Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEAD0C4338F
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 14 Aug 2021 16:55:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC2F860FF2
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 14 Aug 2021 16:55:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238617AbhHNQ4W (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 14 Aug 2021 12:56:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233116AbhHNQ4W (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 14 Aug 2021 12:56:22 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B795C061764;
        Sat, 14 Aug 2021 09:55:53 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id q16so15148852ioj.0;
        Sat, 14 Aug 2021 09:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TkKxZT4mLxk5mIde0v6z+9Gul4yrYdjCFOtjnU1rDPg=;
        b=sTYMOrGZvwIXsLStVXxA9LYq3pNG88CR7XUkoBJ7bRT09rILeQ7+5PzZOUHkc8ojCf
         pj14BWZ+A/FmZJaKVj08tR3sITuA+U6pMh2BcUdM3XPk0lB5LT/CmEJUCvrmI5Cos/Ot
         vVW/HqC63LuXlaYQUgAcW+u0uReAdw7yA6VF/SpXNzVGrobeNE1DvR0q1KUKiu1xlRJo
         Y+PYS8Swz/UtuapW9ngwl7am9vUrVuUsw5n0MIvm1JLmUY7HWdfSb9hidlumw3fqH4lb
         fFk2OKeooV3gqd4kN+rDGCPlKF53K4jt7msfdlnUx5v/VOoW7Yqa0QvWj8kTLcT64jk9
         BZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TkKxZT4mLxk5mIde0v6z+9Gul4yrYdjCFOtjnU1rDPg=;
        b=J65QqjiXYEOrLKM1BFFsntCp2/SbM3iGCclbMMuD4Ra3Ht+HS5Ic2X9387NqX8YvOg
         Bz1QvIO5CqNa7POYeUmoFkao/1qgd+xssENhYmx/Rtg8r4G2eUu/58mSTdfhBuAsF8Ef
         XoNfBsdPhCaBRaJQwkoUN7pMrGCstV8ul6py2tcoUoWcsq7QzC0UodH31lb4pv9HCrUK
         i5kcWHt/TPCqrv1MR+2p1xdC1RwcrsuzlcoEJxQWopFccf9yBadmenbmySWABACOVTf7
         UJKHGwcHiSWeLWaGkvR+SGTvzODp1UXAgE2OOMa/dNq3KR/zdz22Ttp2n+rRXuAKp/Ih
         EPrQ==
X-Gm-Message-State: AOAM530aqGfOM0F8WDBoyMmiEWmRPLLnHvfEU/fO0xxqzBWTvyuJEhoR
        WFrNJG+rXuAwCyZkGbfnuMNlGHIMKVnuQr9W4pw=
X-Google-Smtp-Source: ABdhPJx0e6ayA20p27N/AVvpeQ/S9ofFLEn5vP5MNt5K39nC/5o0Xumu9QTwWrg9yInJbQywan5g/4UFQ7tnJJowl9Q=
X-Received: by 2002:a5e:8e04:: with SMTP id a4mr4449132ion.56.1628960152421;
 Sat, 14 Aug 2021 09:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20210803032734epcas5p2143008ddb212fe53fcd28b813c85c9d8@epcas5p2.samsung.com>
 <20210803032539.15676-1-alim.akhtar@samsung.com>
In-Reply-To: <20210803032539.15676-1-alim.akhtar@samsung.com>
From:   Alim Akhtar <alim.akhtar@gmail.com>
Date:   Sat, 14 Aug 2021 22:25:17 +0530
Message-ID: <CAGOxZ53emv4H4UqT2L7tDtTXRgDrtrqti=FtfkNWo2M3rTnZMw@mail.gmail.com>
Subject: Re: [PATCH v11] dt-bindings: ufs: Add bindings for Samsung ufs host
To:     Alim Akhtar <alim.akhtar@samsung.com>
Cc:     open list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "robh+dt" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Ping!!

On Wed, Aug 4, 2021 at 9:01 AM Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> This patch adds DT bindings for Samsung ufs hci
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
> Changes since v10
> * Rebased on v5.14-rc2
> * removed Rob Herring earlier Reviewed-by tag
>
> This patch was part of exynos ufs driver series, somehow
> this got missed to applied on the tree, sending again as a new
> patch v11, removing Rob's earlier Reviewed-by tag.
>
>  .../bindings/ufs/samsung,exynos-ufs.yaml      | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
>
> diff --git a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> new file mode 100644
> index 000000000000..38193975c9f1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/ufs/samsung,exynos-ufs.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung SoC series UFS host controller Device Tree Bindings
> +
> +maintainers:
> +  - Alim Akhtar <alim.akhtar@samsung.com>
> +
> +description: |
> +  Each Samsung UFS host controller instance should have its own node.
> +  This binding define Samsung specific binding other then what is used
> +  in the common ufshcd bindings
> +  [1] Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> +
> +properties:
> +
> +  compatible:
> +    enum:
> +      - samsung,exynos7-ufs
> +
> +  reg:
> +    items:
> +     - description: HCI register
> +     - description: vendor specific register
> +     - description: unipro register
> +     - description: UFS protector register
> +
> +  reg-names:
> +    items:
> +      - const: hci
> +      - const: vs_hci
> +      - const: unipro
> +      - const: ufsp
> +
> +  clocks:
> +    items:
> +      - description: ufs link core clock
> +      - description: unipro main clock
> +
> +  clock-names:
> +    items:
> +      - const: core_clk
> +      - const: sclk_unipro_main
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: ufs-phy
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - phys
> +  - phy-names
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/exynos7-clk.h>
> +
> +    ufs: ufs@15570000 {
> +       compatible = "samsung,exynos7-ufs";
> +       reg = <0x15570000 0x100>,
> +             <0x15570100 0x100>,
> +             <0x15571000 0x200>,
> +             <0x15572000 0x300>;
> +       reg-names = "hci", "vs_hci", "unipro", "ufsp";
> +       interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
> +       clocks = <&clock_fsys1 ACLK_UFS20_LINK>,
> +                <&clock_fsys1 SCLK_UFSUNIPRO20_USER>;
> +       clock-names = "core_clk", "sclk_unipro_main";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
> +       phys = <&ufs_phy>;
> +       phy-names = "ufs-phy";
> +    };
> +...
>
> base-commit: 2734d6c1b1a089fb593ef6a23d4b70903526fe0c
> --
> 2.17.1
>


-- 
Regards,
Alim
