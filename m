Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E97C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 May 2022 09:55:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233360AbiECJ7V (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 May 2022 05:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231489AbiECJ7T (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 May 2022 05:59:19 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 017AB35DC5
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 02:55:46 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220503095542epoutp02da7bee9b0fe4484d4304961919b64d26~rj7-Qpotn2702027020epoutp02V
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 09:55:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220503095542epoutp02da7bee9b0fe4484d4304961919b64d26~rj7-Qpotn2702027020epoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651571742;
        bh=r4GqslQDG0tCLLJ7cf6EhBbRbm5rhUHhCVrJNrb/m4c=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=HGGznEP+hSF8OMOj2VBs/QbwAye/O53lNGvpTBgBt51iuyhBQOUGI99UQa9Ni49iA
         iIpakjqmMghRw4I/GC10bFucGumUC2H82LMeeYXIWEWCUjyry8L8CZR1KFSUHmYzsH
         eha2KOmprXRWp0F7TXWv8HUx4IVOIbp7L7O0XbFc=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220503095541epcas2p1029727c12ede7bde402375d41e1d1975~rj7_2QAtB3246732467epcas2p1x;
        Tue,  3 May 2022 09:55:41 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.102]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4KswLy0STHz4x9Q0; Tue,  3 May
        2022 09:55:38 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        0B.37.10028.91CF0726; Tue,  3 May 2022 18:55:37 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220503095537epcas2p48ac02b341952fd4d67488bd61449125b~rj7629jQp0323403234epcas2p4Q;
        Tue,  3 May 2022 09:55:37 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220503095537epsmtrp2bd05bcd54c5b8c35d7acd7696915e99d~rj76176s50564005640epsmtrp2P;
        Tue,  3 May 2022 09:55:37 +0000 (GMT)
X-AuditID: b6c32a47-573ff7000000272c-ef-6270fc198b39
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        21.CF.08853.91CF0726; Tue,  3 May 2022 18:55:37 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20220503095537epsmtip15779bc4f734fa788a6ccbc621e439548~rj76ra7YR3273532735epsmtip1C;
        Tue,  3 May 2022 09:55:37 +0000 (GMT)
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
In-Reply-To: <08e9a67e-42dd-019d-ade8-1d8a53ead4f0@linaro.org>
Subject: RE: [PATCH 10/12] arm64: dts: exynosautov9: add initial cmu clock
 nodes
Date:   Tue, 3 May 2022 18:55:37 +0900
Message-ID: <02b201d85ed3$f09e3480$d1da9d80$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKWF+Vk7KC4mE3H7cmUi4B2cVMtRQHp0WQoAjq+1EEC9GB5R6tYq+lQ
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNJsWRmVeSWpSXmKPExsWy7bCmma7kn4Ikg0ObrS0ezNvGZnH9y3NW
        i/lHzrFa9L14yGyx9/VWdouPPfdYLWac38dkcfGUq0Xr3iPsFofftLNa/Lu2kcXieR9QfNWu
        P4wOvB7vb7Sye+ycdZfdY9OqTjaPO9f2sHn0bVnF6PF5k1wAW1S2TUZqYkpqkUJqXnJ+SmZe
        uq2Sd3C8c7ypmYGhrqGlhbmSQl5ibqqtkotPgK5bZg7QoUoKZYk5pUChgMTiYiV9O5ui/NKS
        VIWM/OISW6XUgpScAvMCveLE3OLSvHS9vNQSK0MDAyNToMKE7Ix5F1ewFczhrmiZ0c3ewNjD
        2cXIySEhYCIxaf5x1i5GLg4hgR2MEr1/5jJCOJ8YJRbtOcEM4XxjlHh6dz07TMvBaZ/YIRJ7
        GSXeT7oH1f+CUWLHqgVsIFVsAvoSLzu2gSVEBDYwS2zcdZMNxGEWmMYosXjyF7BZnAJ2Ei2r
        PjGD2MICQRJNG56DdbMIqEhc23UarIZXwFLi4cFrULagxMmZT1hAbGYBeYntb+cwQ9ykIPHz
        6TJWEFtEwE3i9OlpTBA1IhKzO9vAnpAQOMMhsWHCe6D3OIAcF4n+G74QvcISr45vgfpNSuLz
        u71sEHaxxNJZn5ggehsYJS5v+wWVMJaY9awdbA6zgKbE+l36ECOVJY7cgjqNT6Lj8F92iDCv
        REebEESjusSB7dNZIGxZie45n1knMCrNQvLYLCSPzULywCyEXQsYWVYxiqUWFOempxYbFRjD
        ozs5P3cTIzgVa7nvYJzx9oPeIUYmDsZDjBIczEoivM5LC5KEeFMSK6tSi/Lji0pzUosPMZoC
        g3ois5Rocj4wG+SVxBuaWBqYmJkZmhuZGpgrifN6pWxIFBJITyxJzU5NLUgtgulj4uCUamBq
        uqG6N6rlvMnSpTKrna1KKmdOnnNi4lztnZ9e6sjeO74iqu94w4EKCeG8//G9a5n2z71kcSVl
        gtO6q7IlvGrnDe54/ZlvkSe+d+0PHfZTaxnzq+dLOPAEOF02XrpYQH1irmzAbyXFDx6v9jKr
        6+pUNbxbvcJfPDL9g9PmkBzVVd3Bsn6rVqw70fht5ZE/zrIab2YJvHt+4/Gf4qXyQUuepp3X
        Y1n+r/db/+Ea5eTHqTLByYc8rzz71NlXImMa/nWVV/1m3u171VJ/Pbzmx7TU9rsBv/1GXftn
        fW+3lITKakxW33KnTLC+34HT8vMi9Tuncsw/dbbefC8i+uH9nQML6x4/XFRyxHm9weyQsyYS
        SizFGYmGWsxFxYkAv2w1rk4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsWy7bCSnK7kn4Ikg2M9ShYP5m1js7j+5Tmr
        xfwj51gt+l48ZLbY+3oru8XHnnusFjPO72OyuHjK1aJ17xF2i8Nv2lkt/l3byGLxvA8ovmrX
        H0YHXo/3N1rZPXbOusvusWlVJ5vHnWt72Dz6tqxi9Pi8SS6ALYrLJiU1J7MstUjfLoErY97F
        FWwFc7grWmZ0szcw9nB2MXJySAiYSByc9om9i5GLQ0hgN6PE+dtPGCESshLP3u1gh7CFJe63
        HGGFKHrGKDH/9DlWkASbgL7Ey45tYAkRgS3MEscnfGUCcZgFZjBKHDi1lQ2i5RujxNOld5lA
        WjgF7CRaVn1iBrGFBQIk+ua+YAOxWQRUJK7tOg22j1fAUuLhwWtQtqDEyZlPWEBsZgFtiac3
        n0LZ8hLb385hhrhPQeLn02VgJ4kIuEmcPj2NCaJGRGJ2ZxvzBEbhWUhGzUIyahaSUbOQtCxg
        ZFnFKJlaUJybnltsWGCYl1quV5yYW1yal66XnJ+7iREcmVqaOxi3r/qgd4iRiYPxEKMEB7OS
        CK/z0oIkId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rwXuk7GCwmkJ5akZqemFqQWwWSZODilGpj0
        4neVFr5ianXuWHXjmN0E/bO6W/ivnC4+oKeTuWuLUzbzbJez+2e3Z8benfzpkdtU1k+Cy9xT
        cto/31bNNnm4W9qXW3VWmt/L1Tk6Gt87Tl+acmj/80nTz3HsUxP73T3hJ6NTHaeFkuGLkEVs
        29cyev3Qf7fUfF52+vqfd05UvWXzc7i13lGrSPvRi9JF0tmXLwgnNP7rY03KPeRX3nFWmdPi
        a9JTsfT+5F9LL0oEl782+92g8uvxxwKDnRpmjIuyns5O7I0/3v7gm5cY27XAPs9Y0dIjc94l
        Hudiqs2Y/NvsSlnzfIfE9icSYhEy3seeuv6Wa6+4HVEZJLVX08Ayp3L19Nmzj1XUzncuXKHE
        UpyRaKjFXFScCABCE7efOwMAAA==
X-CMS-MailID: 20220503095537epcas2p48ac02b341952fd4d67488bd61449125b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220502090101epcas2p205ec302ec371c6bc4d6fd3e0aff38043
References: <20220502090230.12853-1-chanho61.park@samsung.com>
        <CGME20220502090101epcas2p205ec302ec371c6bc4d6fd3e0aff38043@epcas2p2.samsung.com>
        <20220502090230.12853-11-chanho61.park@samsung.com>
        <08e9a67e-42dd-019d-ade8-1d8a53ead4f0@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> On 02/05/2022 11:02, Chanho Park wrote:
> > Add cmu_top, cmu_busmc, cmu_core, cmu_fsys and peric0/c1/s clock nodes.
> >
> > Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> > ---
> >  arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 72 ++++++++++++++++++++
> >  1 file changed, 72 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> > index 807d500d6022..6f181632267b 100644
> > --- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> > +++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> > @@ -6,6 +6,7 @@
> >   *
> >   */
> >
> > +#include <dt-bindings/clock/exynosautov9.h>
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >  #include <dt-bindings/soc/samsung,exynos-usi.h>
> >
> > @@ -190,6 +191,77 @@ chipid@10000000 {
> >  			reg = <0x10000000 0x24>;
> >  		};
> >
> > +		cmu_busmc: clock-controller@1b200000 {
> > +			compatible = "samsung,exynosautov9-cmu-busmc";
> > +			reg = <0x1b200000 0x8000>;
> > +			#clock-cells = <1>;
> > +
> > +			clocks = <&xtcxo>, <&cmu_top DOUT_CLKCMU_BUSMC_BUS>;
> > +			clock-names = "oscclk", "dout_clkcmu_busmc_bus";
> > +		};
> > +
> > +		cmu_core: clock-controller@1b030000 {
> 
> Let's order all these nodes by unit address.

I assumed they should be lexicographically ordered by label.
I'll reorder them by unit address.

Best Regards,
Chanho Park

