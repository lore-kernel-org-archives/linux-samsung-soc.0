Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7640CC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 May 2022 10:06:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbiECKKT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 May 2022 06:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbiECKKT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 May 2022 06:10:19 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF13C2FFF4
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 03:06:46 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220503100644epoutp0368d0ae40adc76a77aaf992ed172ada4c~rkFoB4l7l0056800568epoutp034
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 10:06:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220503100644epoutp0368d0ae40adc76a77aaf992ed172ada4c~rkFoB4l7l0056800568epoutp034
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651572404;
        bh=M+zwfhTYeuwlhd0wDYPaTw5weZrivTqQa5BSzu3oKrk=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=RNGtWwOCu47mq6XxoSr8DR8/hEgjTuiQbPWCRphrYSjHHqQopxx26VBlFw3wMR8sX
         rTSZ9B8K7Mz8nc1hC3AE9tGQQH9N4o5K8NxPvVUg/I6HshCnq/PGmLef/1QSoy+Ryc
         2xYaxAVhSXbko1HTQ/tNoTkghT2YTq6RUru6Mm+g=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220503100643epcas2p23445f5609d05b7413062dab4f240e499~rkFnZR1Zc0540305403epcas2p23;
        Tue,  3 May 2022 10:06:43 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.99]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4Kswbj2cyjz4x9Q2; Tue,  3 May
        2022 10:06:41 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        3C.FA.10028.1BEF0726; Tue,  3 May 2022 19:06:41 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220503100640epcas2p30b29e9da070a0314506c0667ce5588d6~rkFkiAfqb0828508285epcas2p3D;
        Tue,  3 May 2022 10:06:40 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220503100640epsmtrp2eba12910e4dfb222b8702f34a99ec98f~rkFkhFsTg1338813388epsmtrp2e;
        Tue,  3 May 2022 10:06:40 +0000 (GMT)
X-AuditID: b6c32a47-589ff7000000272c-cf-6270feb16ada
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        8A.91.08924.0BEF0726; Tue,  3 May 2022 19:06:40 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20220503100640epsmtip1ec73fee0c8bd90ee95fac4f8a3a0d819~rkFkRhnwM0202302023epsmtip15;
        Tue,  3 May 2022 10:06:40 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
        "'Tomasz Figa'" <tomasz.figa@gmail.com>,
        "'Chanwoo Choi'" <cw00.choi@samsung.com>,
        "'Alim Akhtar'" <alim.akhtar@samsung.com>,
        "'Michael Turquette'" <mturquette@baylibre.com>,
        "'Stephen Boyd'" <sboyd@kernel.org>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski+dt@linaro.org>
Cc:     "'Sam Protsenko'" <semen.protsenko@linaro.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>
In-Reply-To: <5bad039d-be2f-b967-4a64-0414b4880b45@linaro.org>
Subject: RE: [PATCH 01/12] dt-bindings: clock: add Exynos Auto v9 SoC CMU
 bindings
Date:   Tue, 3 May 2022 19:06:40 +0900
Message-ID: <02bc01d85ed5$7be156c0$73a40440$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKWF+Vk7KC4mE3H7cmUi4B2cVMtRQINDJS1AbFzEhMCW3GUQqtgqk/A
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFJsWRmVeSWpSXmKPExsWy7bCmhe7GfwVJBte/CVk8mLeNzeL6l+es
        FvOPnGO16HvxkNli7+ut7BYfe+6xWsw4v4/J4uIpV4vWvUfYLQ6/aWe1+HdtI4vF8z6g+Kpd
        fxgdeD3e32hl99g56y67x6ZVnWwed67tYfPo27KK0ePzJrkAtqhsm4zUxJTUIoXUvOT8lMy8
        dFsl7+B453hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygQ5UUyhJzSoFCAYnFxUr6djZF+aUl
        qQoZ+cUltkqpBSk5BeYFesWJucWleel6eaklVoYGBkamQIUJ2RnTzu5kKbglUzF1fxNLA2O3
        eBcjB4eEgInEwa3sXYxcHEICOxglNu3ZzgThfGKUmLtjFiOE85lR4uqNd2xdjJxgHQ1T70FV
        7WKUOLBpOhuE84JRYv3sTiaQKjYBfYmXHdtYQRIiAhuYJTbuuglWxSwwjVFi8eQv7CDbOQXs
        JI526YI0CAuESKzcewNsBYuAisTJA6vAbF4BS4nPR5ezQNiCEidnPgGzmQXkJba/ncMMcZKC
        xM+ny1hBbBEBN4kF0y6wQ9SISMzubGMG2SshcIFDYvq0BnaIBheJfVNXQNnCEq+Ob4GypSQ+
        v9sL9WexxNJZn5ggmhsYJS5v+wWVMJaY9aydEeQBZgFNifW79CEhqSxx5BbUbXwSHYf/skOE
        eSU62oQgGtUlDmyfzgJhy0p0z/nMOoFRaRaSz2Yh+WwWkg9mIexawMiyilEstaA4Nz212KjA
        GB7byfm5mxjBiVjLfQfjjLcf9A4xMnEwHmKU4GBWEuF1XlqQJMSbklhZlVqUH19UmpNafIjR
        FBjWE5mlRJPzgbkgryTe0MTSwMTMzNDcyNTAXEmc1ytlQ6KQQHpiSWp2ampBahFMHxMHp1QD
        076GA3x89xQ5FppZJDgxnHTduOLW3Q9Jk45uK9s4/YnH64+Ovzr7rs19smerRdBlVj7TevMH
        qWnOLzOllvC9vaxe8cWdZ56fteKJtKnusSVGTAZJPoF/Xi+81t7poB7Zpb7D8tQ39vfBx9l3
        WTbISjdOWrmSsUg39ubRVxzMrV+4f3ctCODZN3dCboOzx477nxfvDS4vW3IyK+D1G6UJB7Ns
        Xz301f6fd8+v51d2omK358JPUx++Lvols1/TITD/3EWNl3+miBxIjxATfeGzbsGULfeNH0iu
        jTI9eee79sFTl7f/+cA4Z166WurM2t+nZ57adSnm1Yt7XY1pkkILlb0s3mzUfVriufcF64fC
        E9xKLMUZiYZazEXFiQChW1kGTQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsWy7bCSnO6GfwVJBh1ntCwezNvGZnH9y3NW
        i/lHzrFa9L14yGyx9/VWdouPPfdYLWac38dkcfGUq0Xr3iPsFofftLNa/Lu2kcXieR9QfNWu
        P4wOvB7vb7Sye+ycdZfdY9OqTjaPO9f2sHn0bVnF6PF5k1wAWxSXTUpqTmZZapG+XQJXxrSz
        O1kKbslUTN3fxNLA2C3excjJISFgItEw9R5TFyMXh5DADkaJ4y92MEEkZCWevdvBDmELS9xv
        OcIKUfSMUWLN7MOsIAk2AX2Jlx3bwBIiAluYJY5P+Ao2illgBqPEgVNb2SBavjJK9Cy4xtjF
        yMHBKWAncbRLF6RbWCBI4sSk48wgNouAisTJA6vYQGxeAUuJz0eXs0DYghInZz4Bs5kFtCWe
        3nwKZctLbH87hxniPAWJn0+XgV0kIuAmsWDaBXaIGhGJ2Z1tzBMYhWchGTULyahZSEbNQtKy
        gJFlFaNkakFxbnpusWGBUV5quV5xYm5xaV66XnJ+7iZGcFxqae1g3LPqg94hRiYOxkOMEhzM
        SiK8zksLkoR4UxIrq1KL8uOLSnNSiw8xSnOwKInzXug6GS8kkJ5YkpqdmlqQWgSTZeLglGpg
        2rYyduPJ54nrZMxXFX3ZujfW6NCPv6oHly3gEgyrzPW07Dnrw75jh86c6uIFcSyZ/fWxs1Zk
        7ve5PnvPnEt6ketvVB0tkROREjitNEXUZVPfGx73Fd+mSp54PqGk7rGdyAt3a7OFbrcXvX1h
        89tx6zyuzJt5zBxTBJ/O7J+WLN7wtV2t9+Wfza5HRAyuWF0KMNhwg61h+o56zy2SU9jKEmOy
        6j+s33ZVKGnRhDVS/fpaaxbLLdW4O/vP6kl11/aH3t1nWbIyW8A21+PkU+/NLRF7k32650/y
        mD2dy4zH7q/+fxPFyDuFdvlKQfvuvbcvjD8xmcfowfzYbfui+dTyav3m6fMufyu94t2MBSsX
        nFdiKc5INNRiLipOBACL6b47OgMAAA==
X-CMS-MailID: 20220503100640epcas2p30b29e9da070a0314506c0667ce5588d6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220502090100epcas2p4d4c26a79374a6affd1564c2e7287c234
References: <20220502090230.12853-1-chanho61.park@samsung.com>
        <CGME20220502090100epcas2p4d4c26a79374a6affd1564c2e7287c234@epcas2p4.samsung.com>
        <20220502090230.12853-2-chanho61.park@samsung.com>
        <5bad039d-be2f-b967-4a64-0414b4880b45@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> On 02/05/2022 11:02, Chanho Park wrote:
> > Add dt-schema for Exynos Auto v9 SoC clock controller.
> >
> > Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> > ---
> >  .../clock/samsung,exynosautov9-clock.yaml     | 217 ++++++++++++++++++
> >  1 file changed, 217 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yam
> > l
> >
> > diff --git
> > a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.y
> > aml
> > b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.y
> > aml
> > new file mode 100644
> > index 000000000000..e2a01f50db6c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clo
> > +++ ck.yaml
> > @@ -0,0 +1,217 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +https://protect2.fireeye.com/v1/url?k=fb45247c-9a3e8ef5-fb44af33-74fe
> > +48600034-4889ba24b7242494&q=1&e=4fe6f8ce-5796-4b99-a99b-dde22be0ea01&
> > +u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fclock%2Fsamsung%2Cexynosaut
> > +ov9-clock.yaml%23
> > +$schema:
> > +https://protect2.fireeye.com/v1/url?k=5feda469-3e960ee0-5fec2f26-74fe
> > +48600034-d4fa399d62c830d8&q=1&e=4fe6f8ce-5796-4b99-a99b-dde22be0ea01&
> > +u=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23
> > +
> > +title: Samsung Exynos Auto v9 SoC clock controller
> > +
> > +maintainers:
> > +  - Chanho Park <chanho61.park@samsung.com>
> > +  - Chanwoo Choi <cw00.choi@samsung.com>
> > +  - Krzysztof Kozlowski <krzk@kernel.org>
> > +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> > +  - Tomasz Figa <tomasz.figa@gmail.com>
> > +
> > +description: |
> > +  Exynos Auto v9 clock controller is comprised of several CMU units,
> > +generating
> > +  clocks for different domains. Those CMU units are modeled as
> > +separate device
> > +  tree nodes, and might depend on each other. Root clocks in that
> > +clock tree are
> > +  two external clocks:: OSCCLK/XTCXO (26 MHz) and RTCCLK/XrtcXTI (32768
> Hz).
> > +  Those external clocks must be defined as fixed-rate clocks in dts.
> > +
> > +  CMU_TOP is a top-level CMU, where all base clocks are prepared
> > + using PLLs and  dividers; all other clocks of function blocks (other
> > + CMUs) are usually  derived from CMU_TOP.
> > +
> > +  Each clock is assigned an identifier and client nodes can use this
> > + identifier  to specify the clock which they consume. All clocks
> > + available for usage  in clock consumer nodes are defined as
> > + preprocessor macros in  'dt-bindings/clock/exynosautov9.h' header.
> 
> I know this follows Exynos850 pattern, but I would prefer to move towards:
> 1. vendor,device: samsung,exynosautov9.h 2. put here full path, so
> include/dt-bindings ....

Okay. I'll change the file name to "samsung,exynosautov9.h".

<snip>

> > +additionalProperties: false
> > +
> > +examples:
> > +  # Clock controller node for CMU_FSYS2
> > +  - |
> > +    #include <dt-bindings/clock/exynosautov9.h>
> > +
> > +    cmu_fsys2: clock-controller@17c00000 {
> > +        compatible = "samsung,exynosautov9-cmu-fsys2";
> > +        reg = <0x17c00000 0x8000>;
> > +        #clock-cells = <1>;
> > +
> > +        clocks = <&xtcxo>, <&cmu_top DOUT_CLKCMU_FSYS2_BUS>,
> > +                 <&cmu_top DOUT_CLKCMU_FSYS2_UFS_EMBD>,
> > +                 <&cmu_top DOUT_CLKCMU_FSYS2_ETHERNET>;
> 
> Let's put each item in its own line, so line break after every clock here
> and in the clock-names.

Make sense. I'll put each item in its own line.

Best Regards,
Chanho Park

