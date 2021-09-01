Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A6EC432BE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  1 Sep 2021 02:07:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AF616108E
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  1 Sep 2021 02:07:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241493AbhIACIV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 31 Aug 2021 22:08:21 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:49593 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241417AbhIACIR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 31 Aug 2021 22:08:17 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20210901020716epoutp03a0f63cb9d3f5cfa430b8d7486e1aeb45~gkJV7-t1q1417414174epoutp03b
        for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Sep 2021 02:07:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20210901020716epoutp03a0f63cb9d3f5cfa430b8d7486e1aeb45~gkJV7-t1q1417414174epoutp03b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1630462036;
        bh=RkXSwVqH3GKz8YaOb+ID9ethe5OjeIM5AoQsoHSKq0g=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=oKkhgc71q6gep4oaIMt1SF6vNxJ8hmjfxmmHPDi/AxqMvJYh1UImbXTV1FE75tG4C
         veVQAxnf0P2hwonXBkpSFg67ASXO7xo6gog7Ta5RZPgczLLDqEp7TWoJufj6DP3+u8
         tgNzpbDkf0aCcM57Icct/PBSxzP2FJy13XSRaOJ0=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20210901020716epcas2p34270d22d106ec764a25bc961aa4007ea~gkJVheOdP2851228512epcas2p3v;
        Wed,  1 Sep 2021 02:07:16 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.186]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4GznW52txPz4x9Pw; Wed,  1 Sep
        2021 02:07:13 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        5E.13.09749.F40EE216; Wed,  1 Sep 2021 11:07:11 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20210901020711epcas2p33509a122c5dc08fe810ce9e9fc43733f~gkJQjPHna3154431544epcas2p3c;
        Wed,  1 Sep 2021 02:07:11 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210901020711epsmtrp1282c13084cac054b5895ccd3dec9a074~gkJQiKKw20121301213epsmtrp1a;
        Wed,  1 Sep 2021 02:07:11 +0000 (GMT)
X-AuditID: b6c32a47-29aa8a8000002615-9d-612ee04f8fc4
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        89.4E.09091.E40EE216; Wed,  1 Sep 2021 11:07:10 +0900 (KST)
Received: from KORCO039056 (unknown [10.229.8.156]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20210901020710epsmtip15279befe911cb2f40d8e488a7087e7c8~gkJQR0KLz0237802378epsmtip1L;
        Wed,  1 Sep 2021 02:07:10 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Alim Akhtar'" <alim.akhtar@gmail.com>,
        "'Alim Akhtar'" <alim.akhtar@samsung.com>, <robh@kernel.org>
Cc:     "'open list'" <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        "'robh+dt'" <robh+dt@kernel.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski@canonical.com>,
        <linux-samsung-soc@vger.kernel.org>,
        "'Martin K. Petersen'" <martin.petersen@oracle.com>,
        <devicetree@vger.kernel.org>
In-Reply-To: <CAGOxZ51qW52r=BzAc9K_NO3fQcRT3DXG-wVyO9-GvACyYgvQwA@mail.gmail.com>
Subject: RE: [PATCH v11] dt-bindings: ufs: Add bindings for Samsung ufs host
Date:   Wed, 1 Sep 2021 11:07:10 +0900
Message-ID: <001201d79ed6$12e5a9b0$38b0fd10$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGTCpFSI9u31zW1dQzJt1zw/evFCQDkMABVAcaL7goByHyjiqvz/Iqw
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHJsWRmVeSWpSXmKPExsWy7bCmua7/A71Egy1dChZLb1VbPJi3jc1i
        /pFzrBYb3/5gstj0+BqrxeVdc9gsZpzfx2Sx/Pg/JovWvUfYLf7v2cHuwOUxq6GXzWPnrLvs
        HptWdbJ5bF5S7/Hx6S0Wj74tqxg9Pm+SC2CPyrHJSE1MSS1SSM1Lzk/JzEu3VfIOjneONzUz
        MNQ1tLQwV1LIS8xNtVVy8QnQdcvMAbpOSaEsMacUKBSQWFyspG9nU5RfWpKqkJFfXGKrlFqQ
        klNgaFigV5yYW1yal66XnJ9rZWhgYGQKVJmQk/H34Qn2gusaFVc/3mJtYNwk18XIySEhYCIx
        o6edtYuRi0NIYAejxPGlzUwQzidGidmHW9hAqoQEvjFKXL2p0sXIAdbR0WwFUbOXUWLXpj/s
        EM4LRon7l58wgjSwCehLvOzYxgpiiwhkS+x4d4wRpIhZYDuTxJer15hBEpwCgRJv9+8C2yAs
        4CPx7NtBMJtFQEXiQ8t2FpBtvAKWEu+nKICEeQUEJU7OfMICYjMLyEtsfzuHGeIFBYmfT5dB
        7XKTeNp7hhWiRkRidmcbM8heCYEDHBIfn01lhWhwkdh7cj4bhC0s8er4FnYIW0riZX8bO0RD
        N6NE66P/UInVjBKdjT4Qtr3Er+lbWEGOYxbQlFi/Sx8SKsoSR25B3cYn0XH4LztEmFeio00I
        olFd4sD26SwQtqxE95zPrBMYlWYh+WwWks9mIflgFsKuBYwsqxjFUguKc9NTi40KjJHjehMj
        OOFque9gnPH2g94hRiYOxkOMEhzMSiK82W+0EoV4UxIrq1KL8uOLSnNSiw8xmgKDeiKzlGhy
        PjDl55XEG5oamZkZWJpamJoZWSiJ83K+kkkUEkhPLEnNTk0tSC2C6WPi4JRqYFK2bP5futjz
        x4RU+Y8JQUsr/l7N8VPx2/zt6OI5T4MePf8mfqQ582PakmQJy+N/tBe9Edu6P6lq38MjK+NL
        ef6/uD2B9/oLNStGsf7ZcaJvDuyZxbVEgvfimxb31f+rX4R/2rjA+tKco0srVnvcYuv2XS9x
        7oVQIe/q4/LpnxSVtgqff/PR/0RAtVA0u73HAtPfnnXfElX28v5jfS3y9VXasQStOG3Jc4se
        f7g9O/HuupRSwXXscX0zv7/KMj2sVM9o/vltteOv91eLw10Z02PMOoIYw8w2aFrZJtr1xrms
        ttyguKFt4c2ul/vc8nvTJPknJMt+Kr/2uP+j/8oDD5i3Gm1SZo9TuFq3fP2ZnZlKLMUZiYZa
        zEXFiQCdM4cmQQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsWy7bCSnK7fA71Eg/Z+U4ult6otHszbxmYx
        /8g5VouNb38wWWx6fI3V4vKuOWwWM87vY7JYfvwfk0Xr3iPsFv/37GB34PKY1dDL5rFz1l12
        j02rOtk8Ni+p9/j49BaLR9+WVYwenzfJBbBHcdmkpOZklqUW6dslcGX8fXiCveC6RsXVj7dY
        Gxg3yXUxcnBICJhIdDRbdTFycQgJ7GaUOPWjlbGLkRMoLivx7N0OdghbWOJ+yxFWEFtI4Bmj
        xK/pZSA2m4C+xMuObWBxEYFcia3nzzGBDGIW2M0k8bv/HiPE1BlMEqcnLAOr4hQIlHi7fxcb
        iC0s4CPx7NtBMJtFQEXiQ8t2FpCLeAUsJd5PUQAJ8woISpyc+YQFxGYW0JbofQhxHLOAvMT2
        t3OYIY5TkPj5dBnUEW4ST3vPsELUiEjM7mxjnsAoPAvJqFlIRs1CMmoWkpYFjCyrGCVTC4pz
        03OLDQsM81LL9YoTc4tL89L1kvNzNzGCY09Lcwfj9lUf9A4xMnEwHmKU4GBWEuHNfqOVKMSb
        klhZlVqUH19UmpNafIhRmoNFSZz3QtfJeCGB9MSS1OzU1ILUIpgsEwenVAPTbN3+JWdCd9VY
        yS9VbZ8o8r7SqenlpKDi287uK9PfFnlMZLEKVhTqmtzQP4mvzD5jUrPCrSuKDyyEZLeHXU77
        WblT/5DprNk84gstGPs8ebJKp1/gOXWb4cOMiaW1G6KkAm7rr9yg33zD/Ozp4+vubnrS9000
        8UbdcS1lHd+9t6YFSzlW3rqvp3r1uvF0AX5xzicqPcGHXvAu4WkSDvBeBUyrTY27LxvXJkhl
        ranVe7L5OsN01ojMnx1hl7+s2XMgcN2JRQf63slmTvb0dfiqctpxX+wvgcYpoov3b90842X6
        N42jOl9vNvn9tXkWPOfLUtlJ89q63k5sKVLfV3vlTK7Q+pZ41eyTE4I2TfVXYinOSDTUYi4q
        TgQATmrBCiwDAAA=
X-CMS-MailID: 20210901020711epcas2p33509a122c5dc08fe810ce9e9fc43733f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210803032734epcas5p2143008ddb212fe53fcd28b813c85c9d8
References: <CGME20210803032734epcas5p2143008ddb212fe53fcd28b813c85c9d8@epcas5p2.samsung.com>
        <20210803032539.15676-1-alim.akhtar@samsung.com>
        <CAGOxZ53emv4H4UqT2L7tDtTXRgDrtrqti=FtfkNWo2M3rTnZMw@mail.gmail.com>
        <CAGOxZ51qW52r=BzAc9K_NO3fQcRT3DXG-wVyO9-GvACyYgvQwA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Rob,

Could you kindly review this?

Best Regards,
Chanho Park

> -----Original Message-----
> From: Alim Akhtar <alim.akhtar@gmail.com>
> Sent: Friday, August 20, 2021 1:19 AM
> To: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: open list <linux-kernel@vger.kernel.org>; linux-arm-
> kernel@lists.infradead.org; robh+dt <robh+dt@kernel.org>; Krzysztof
> Kozlowski <krzysztof.kozlowski@canonical.com>; linux-samsung-
> soc@vger.kernel.org; Martin K. Petersen <martin.petersen@oracle.com>
> Subject: Re: [PATCH v11] dt-bindings: ufs: Add bindings for Samsung ufs
> host
> 
> Hi Rob
> Can you pick up this patch via your tree? or you want Martin to pick it up?
> 
> On Sat, Aug 14, 2021 at 10:25 PM Alim Akhtar <alim.akhtar@gmail.com> wrote:
> >
> > Ping!!
> >
> > On Wed, Aug 4, 2021 at 9:01 AM Alim Akhtar <alim.akhtar@samsung.com>
> wrote:
> > >
> > > This patch adds DT bindings for Samsung ufs hci
> > >
> > > Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> > > ---
> > > Changes since v10
> > > * Rebased on v5.14-rc2
> > > * removed Rob Herring earlier Reviewed-by tag
> > >
> > > This patch was part of exynos ufs driver series, somehow this got
> > > missed to applied on the tree, sending again as a new patch v11,
> > > removing Rob's earlier Reviewed-by tag.
> > >
> > >  .../bindings/ufs/samsung,exynos-ufs.yaml      | 89 +++++++++++++++++++
> > >  1 file changed, 89 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> > > b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> > > new file mode 100644
> > > index 000000000000..38193975c9f1
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> > > @@ -0,0 +1,89 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause %YAML 1.2
> > > +---
> > > +$id:
> > > +https://protect2.fireeye.com/v1/url?k=87b3fb9f-d828c295-87b270d0-0c
> > > +c47a31384a-2d1da91e6c1569ad&q=1&e=3ebd4447-410b-4abb-b6e0-88b0310be
> > > +d3f&u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fufs%2Fsamsung%2Cexyno
> > > +s-ufs.yaml%23
> > > +$schema:
> > > +https://protect2.fireeye.com/v1/url?k=15695c41-4af2654b-1568d70e-0c
> > > +c47a31384a-797602fbe8e5ab79&q=1&e=3ebd4447-410b-4abb-b6e0-88b0310be
> > > +d3f&u=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23
> > > +
> > > +title: Samsung SoC series UFS host controller Device Tree Bindings
> > > +
> > > +maintainers:
> > > +  - Alim Akhtar <alim.akhtar@samsung.com>
> > > +
> > > +description: |
> > > +  Each Samsung UFS host controller instance should have its own node.
> > > +  This binding define Samsung specific binding other then what is
> > > +used
> > > +  in the common ufshcd bindings
> > > +  [1] Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> > > +
> > > +properties:
> > > +
> > > +  compatible:
> > > +    enum:
> > > +      - samsung,exynos7-ufs
> > > +
> > > +  reg:
> > > +    items:
> > > +     - description: HCI register
> > > +     - description: vendor specific register
> > > +     - description: unipro register
> > > +     - description: UFS protector register
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: hci
> > > +      - const: vs_hci
> > > +      - const: unipro
> > > +      - const: ufsp
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: ufs link core clock
> > > +      - description: unipro main clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: core_clk
> > > +      - const: sclk_unipro_main
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  phys:
> > > +    maxItems: 1
> > > +
> > > +  phy-names:
> > > +    const: ufs-phy
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - phys
> > > +  - phy-names
> > > +  - clocks
> > > +  - clock-names
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/clock/exynos7-clk.h>
> > > +
> > > +    ufs: ufs@15570000 {
> > > +       compatible = "samsung,exynos7-ufs";
> > > +       reg = <0x15570000 0x100>,
> > > +             <0x15570100 0x100>,
> > > +             <0x15571000 0x200>,
> > > +             <0x15572000 0x300>;
> > > +       reg-names = "hci", "vs_hci", "unipro", "ufsp";
> > > +       interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
> > > +       clocks = <&clock_fsys1 ACLK_UFS20_LINK>,
> > > +                <&clock_fsys1 SCLK_UFSUNIPRO20_USER>;
> > > +       clock-names = "core_clk", "sclk_unipro_main";
> > > +       pinctrl-names = "default";
> > > +       pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
> > > +       phys = <&ufs_phy>;
> > > +       phy-names = "ufs-phy";
> > > +    };
> > > +...
> > >
> > > base-commit: 2734d6c1b1a089fb593ef6a23d4b70903526fe0c
> > > --
> > > 2.17.1
> > >
> >
> >
> > --
> > Regards,
> > Alim
> 
> 
> 
> --
> Regards,
> Alim

