Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDC4C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 May 2022 10:08:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233263AbiECKMI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 May 2022 06:12:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233166AbiECKMG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 May 2022 06:12:06 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 650E435DC5
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 03:08:32 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220503100828epoutp01ca0e06d360d70f2075eb72251604e391~rkHJBuOl50591605916epoutp011
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 10:08:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220503100828epoutp01ca0e06d360d70f2075eb72251604e391~rkHJBuOl50591605916epoutp011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651572508;
        bh=HaZTLIS1Pf69eQzQXo2sVnaE5hy+wCSEZ2y+AW1OI98=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=nquQUyL2G6yhi4/nU7mWJzDp40x8PIoIpKoSf4aLXkqvbuptjFfOY4O2J2SjK1HSl
         s/f0Kwl+1xsfJuebvUn/CP9HZ2/SbF7k+kzCddOZ43gASCc1f+53s6nKrk4suX7AA9
         +QjCHkU3rujrsulFur/J6KgvCP/AxXiJ3TjKAhAM=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220503100828epcas2p20491c03be80592a358478440d0409c72~rkHIfLn6T1149511495epcas2p2M;
        Tue,  3 May 2022 10:08:28 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.89]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4Kswdk378vz4x9Px; Tue,  3 May
        2022 10:08:26 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        20.71.10069.A1FF0726; Tue,  3 May 2022 19:08:26 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220503100826epcas2p241c9cf168305836b63c20c22d4b80a59~rkHGfvi2E0423504235epcas2p2y;
        Tue,  3 May 2022 10:08:26 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220503100826epsmtrp2334c628a88e60bcd232b96f7b9f11b31~rkHGe5Gk21338813388epsmtrp2f;
        Tue,  3 May 2022 10:08:26 +0000 (GMT)
X-AuditID: b6c32a45-a79ff70000002755-f6-6270ff1a2e8f
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        4D.40.08853.91FF0726; Tue,  3 May 2022 19:08:25 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20220503100825epsmtip1e0c2e4786cb52779fa5d4f2372928ef4~rkHGSgKCq0202202022epsmtip1K;
        Tue,  3 May 2022 10:08:25 +0000 (GMT)
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
In-Reply-To: <219beabb-9969-6455-573b-a4e59b418ef7@linaro.org>
Subject: RE: [PATCH 02/12] dt-bindings: clock: add clock binding definitions
 for Exynos Auto v9
Date:   Tue, 3 May 2022 19:08:25 +0900
Message-ID: <02bd01d85ed5$ba9d36e0$2fd7a4a0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKWF+Vk7KC4mE3H7cmUi4B2cVMtRQH1G0FbAfvAQ7ABSmXAF6tnnjNA
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNJsWRmVeSWpSXmKPExsWy7bCmma7U/4IkgwePxSwezNvGZnH9y3NW
        i/lHzrFa9L14yGyx9/VWdouPPfdYLWac38dkcfGUq0Xr3iPsFofftLNa/Lu2kcXieR9QfNWu
        P4wOvB7vb7Sye+ycdZfdY9OqTjaPO9f2sHn0bVnF6PF5k1wAW1S2TUZqYkpqkUJqXnJ+SmZe
        uq2Sd3C8c7ypmYGhrqGlhbmSQl5ibqqtkotPgK5bZg7QoUoKZYk5pUChgMTiYiV9O5ui/NKS
        VIWM/OISW6XUgpScAvMCveLE3OLSvHS9vNQSK0MDAyNToMKE7IzOUy8YCx5zVvT9nc/cwPiG
        vYuRk0NCwETi7cU+xi5GLg4hgR2MEgcn7GABSQgJfGKUmHpKFCLxjVGia/4euI5HNxpYIRJ7
        GSWePpvLDOG8YJRoOHiZGaSKTUBf4mXHNrAqEYENzBIbd91kA3GYBaYxSiye/AVsFqeAncTa
        ruVsILawQKLEhk+PwWwWARWJs/cugNm8ApYSE7+dYIGwBSVOznwCZjMLyEtsfzuHGeImBYmf
        T5exgtgiAm4S2+a2s0PUiEjM7mwDO09C4AiHxMVfM1ghGlwklr/ezQhhC0u8Or4F6jkpic/v
        9rJB2MUSS2d9YoJobmCUuLztF1TCWGLWs3agZg6gDZoS63fpg5gSAsoSR25B3cYn0XH4LztE
        mFeio00IolFd4sD26SwQtqxE95zPrBMYlWYh+WwWks9mIflgFsKuBYwsqxjFUguKc9NTi40K
        DOHRnZyfu4kRnIq1XHcwTn77Qe8QIxMH4yFGCQ5mJRFe56UFSUK8KYmVValF+fFFpTmpxYcY
        TYFhPZFZSjQ5H5gN8kriDU0sDUzMzAzNjUwNzJXEeb1SNiQKCaQnlqRmp6YWpBbB9DFxcEo1
        MKVYT9HI71zHuP3ln4V7HC97bJJhmxVfbjntVusl8VqV3hVJ0991O11tquHdqTJTNyBnQS+L
        2mkpuSVrVhitX7Nk1uKPKeGzz/418WG66sy882zXtpsvWS7YrzQ/ziWodf3gnIlCUodnn52T
        Zip64FK+6jlX59/L0pKEJsZEi0+87P7e+o3jDp2k6UufKGVGXzuw8o9o98nD7YUehqvmnKzb
        8fZh2PsJBzRD9X6mu85JshHQXaI98Zfzfa0mjr1751V06RxhvrBwx7a1uz1jzjp/n5HyJLAr
        wdzl7b81eclb7RMsiqe1VHxZyjTj1aa976JrlqcGz3FYIBI1yWA+o01QFlPc2zupmU0PPnxd
        b+KpxFKckWioxVxUnAgA24L1Nk4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsWy7bCSnK7k/4IkgxePLS0ezNvGZnH9y3NW
        i/lHzrFa9L14yGyx9/VWdouPPfdYLWac38dkcfGUq0Xr3iPsFofftLNa/Lu2kcXieR9QfNWu
        P4wOvB7vb7Sye+ycdZfdY9OqTjaPO9f2sHn0bVnF6PF5k1wAWxSXTUpqTmZZapG+XQJXRuep
        F4wFjzkr+v7OZ25gfMPexcjJISFgIvHoRgNrFyMXh5DAbkaJC5N/MkMkZCWevdsBVSQscb/l
        CFTRM0aJue8/sIAk2AT0JV52bANLiAhsYZY4PuErE4jDLDCDUeLAqa1sEC1fGSWeHz7LBtLC
        KWAnsbZrOZgtLBAvcWn5FjCbRUBF4uy9C2A2r4ClxMRvJ1ggbEGJkzOfgNnMAtoST28+hbLl
        Jba/nQN1q4LEz6fLWEFsEQE3iW1z29khakQkZne2MU9gFJ6FZNQsJKNmIRk1C0nLAkaWVYyS
        qQXFuem5xYYFhnmp5XrFibnFpXnpesn5uZsYwZGppbmDcfuqD3qHGJk4GA8xSnAwK4nwOi8t
        SBLiTUmsrEotyo8vKs1JLT7EKM3BoiTOe6HrZLyQQHpiSWp2ampBahFMlomDU6qBSf/3d5ft
        G7ddK1cv3982YU1J0J1vRYGCtz/WTEj1XbFq5uT7Kd/2vixkvSWW/D9l55bfxi2t/JIhltOU
        3hbwL3H58UHwCvPG58ZutQfTZBV0PWayX/feuuhpmcOXE+Gct6Ky9uaXpPE5vee4vjbx0cyl
        Ozbq76v8cPDKvA9qli1qpvXSwRrfP+w2NdndHK/HoXFz8Z2tE9jnbXbuswsUDPzF1ZSkWfuu
        7PknvVX7qo+fnhUjrbz2Ve4jk7SipqB5J747LOXh9Kmul3NvvvVo5X8ltot37t6wql+htezo
        TpFvV72/5Vdkx+x4YSq0sagheqZVlGqG610B44R4xS1W1rxrIw1SFycXMUf0rVw/T4mlOCPR
        UIu5qDgRAG9VDos7AwAA
X-CMS-MailID: 20220503100826epcas2p241c9cf168305836b63c20c22d4b80a59
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220502090100epcas2p128ced14c2463dc64de3571d542614fda
References: <20220502090230.12853-1-chanho61.park@samsung.com>
        <CGME20220502090100epcas2p128ced14c2463dc64de3571d542614fda@epcas2p1.samsung.com>
        <20220502090230.12853-3-chanho61.park@samsung.com>
        <219beabb-9969-6455-573b-a4e59b418ef7@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> On 02/05/2022 11:02, Chanho Park wrote:
> > Add device tree clock binding definitions for below CMU blocks.
> >
> > - CMU_TOP
> > - CMU_BUSMC
> > - CMU_CORE
> > - CMU_FYS2
> > - CMU_PERIC0 / C1
> > - CMU_PERIS
> >
> > Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> > ---
> >  include/dt-bindings/clock/exynosautov9.h | 299 +++++++++++++++++++++++
> >  1 file changed, 299 insertions(+)
> >  create mode 100644 include/dt-bindings/clock/exynosautov9.h
> >
> > diff --git a/include/dt-bindings/clock/exynosautov9.h b/include/dt-
> bindings/clock/exynosautov9.h
> > new file mode 100644
> > index 000000000000..4f14fdda26a6
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/exynosautov9.h
> 
> About file name I commended in previous patch.
> 
> > @@ -0,0 +1,299 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * Copyright (c) 2021 Samsung Electronics Co., Ltd.
> 
> Copyright 2022, unless it appeared somewhere publicly in 2021? (then
> 2021-2022)

It should be 2022. I'll update this with header name change.

> 
> Rest is ok, so:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for your review.

Best Regards,
Chanho Park

