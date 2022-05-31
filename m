Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1698BC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 31 May 2022 12:36:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234456AbiEaMgz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 31 May 2022 08:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344327AbiEaMg2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 31 May 2022 08:36:28 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01C8FEE17
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 May 2022 05:36:25 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220531123620epoutp04fa98030ce925a7f23a371b0b57b83605~0MMOzjiJg3229432294epoutp04A
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 May 2022 12:36:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220531123620epoutp04fa98030ce925a7f23a371b0b57b83605~0MMOzjiJg3229432294epoutp04A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654000580;
        bh=OKAF1LeE70OvsS4cMM/YrD1F85u/msO9+/Yq8QDf/dQ=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=aJT9rFm8aV8Y46LG64AZOIgn8ly+O1RaY1kblGmn/b3oQuYQ+ctOFup1X7cBjMH/h
         80wCf10wLT6WYbGrQIDuY541vPhRNfVIX4TB9R1baiu0MtjjTRSA8flLCLEsUkCuWt
         3jvmz16ZugjPR1r9Yfwpf9LMS1AHjVAPW1DDGAAw=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220531123619epcas2p4b865dfc6cfb84f0406677e2d11269195~0MMOIanBF1174611746epcas2p4u;
        Tue, 31 May 2022 12:36:19 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.101]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4LCBbP5d9Nz4x9Pv; Tue, 31 May
        2022 12:36:17 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        92.17.10069.1CB06926; Tue, 31 May 2022 21:36:17 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220531123617epcas2p20ec21b31efe286fe086e7baee6681e51~0MMMNQCd51364413644epcas2p2c;
        Tue, 31 May 2022 12:36:17 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220531123617epsmtrp1ec485847de45bbd37a581975bff6de22~0MMMMhg5x2416024160epsmtrp1D;
        Tue, 31 May 2022 12:36:17 +0000 (GMT)
X-AuditID: b6c32a45-a79ff70000002755-17-62960bc1eb47
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        A4.A2.11276.1CB06926; Tue, 31 May 2022 21:36:17 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20220531123617epsmtip1ecc8469e554087ac605fce69c88b95e3~0MMMCbZdG0086900869epsmtip1J;
        Tue, 31 May 2022 12:36:17 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Rob Herring'" <robh+dt@kernel.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski+dt@linaro.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>
Cc:     "'Alim Akhtar'" <alim.akhtar@samsung.com>,
        "'Chanwoo Choi'" <cw00.choi@samsung.com>,
        "'Sam Protsenko'" <semen.protsenko@linaro.org>,
        <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>
In-Reply-To: <20220523121244.67341-1-chanho61.park@samsung.com>
Subject: RE: [PATCH v3 0/2] syscon reboot/reboot_mode support for
 exynosautov9
Date:   Tue, 31 May 2022 21:36:17 +0900
Message-ID: <013401d874eb$05f55390$11dffab0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJI/1XL/Ftv3dSoSrqqSUbcnMeiJQLcHzXTrED0iRA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGJsWRmVeSWpSXmKPExsWy7bCmhe5B7mlJBrP3aFs8mLeNzeL6l+es
        FvOPnGO16HvxkNli7+ut7BYzzu9jsmjde4Td4nnfPiYHDo9NqzrZPO5c28Pm0bdlFaPH501y
        ASxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QGco
        KZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyMTIEK
        E7IzvjdtYSn4wV2x4IRHA2MDVxcjJ4eEgInErt8tTF2MXBxCAjsYJZbNecYI4XxilDg67w1U
        5hujRMOO+exdjBxgLcunSUPE9zJKtF/7BVX0glHi+qU/rCBz2QT0JV52bAOzRQQWM0qc2qcF
        UsQscI5RYsK39UwgCU4Be4klW1ewgNjCAgESE6bMYQexWQRUJbp3/2IEsXkFLCV2nX3LCmEL
        Spyc+QSsnllAXmL72znMEE8oSPx8ugxqmZXE+f3bGSFqRCRmd7YxgyyWEJjJITGp/RfUCy4S
        858YQfQKS7w6voUdwpaSeNnfBmUXSyyd9YkJoreBUeLytl9sEAljiVnP2hlB5jALaEqs36UP
        MVJZ4sgtqNP4JDoO/4XaxCvR0SYE0agucWD7dBYIW1aie85n1gmMSrOQPDYLyWOzkDwwC2HX
        AkaWVYxiqQXFuempxUYFhvC4Ts7P3cQITqBarjsYJ7/9oHeIkYmD8RCjBAezkghvya6pSUK8
        KYmVValF+fFFpTmpxYcYTYFBPZFZSjQ5H5jC80riDU0sDUzMzAzNjUwNzJXEeb1SNiQKCaQn
        lqRmp6YWpBbB9DFxcEo1MOV7cMzVcA4TDV7++fWDqywBfL7Hrz0O0z4v/m5CF3NGzp4nx7av
        3hKtZnhSukRc5MzEw9FXdN7IuKf3tVoueyW1fp7n6Zu/niXciOSrvpOcb3b85rEPV/W/28sE
        BWz3KXmw6ecv9xfhS84rruSJcLD7wPNj8+1NdxdLHF3pWCHvpe+/99eVNRbZQbd6JZInhids
        sL0knLJ+1/EZD09YBl/R/vQm0SVqt73q+eZbP2favvu8gX/lrJfavydOva66VUZOZIfphJdS
        yp93Vr9hVvzv53Ew/kpXuZqSZEb73CbRI37LHtnOlXj/oTPG8u6yX/qBl3/4PK6IaJrW91kl
        gis90TY026c4tnQaW/2EKQ+UWIozEg21mIuKEwGt+8KOKQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkkeLIzCtJLcpLzFFi42LZdlhJTvcg97Qkg+8HxCwezNvGZnH9y3NW
        i/lHzrFa9L14yGyx9/VWdosZ5/cxWbTuPcJu8bxvH5MDh8emVZ1sHneu7WHz6NuyitHj8ya5
        AJYoLpuU1JzMstQifbsErozvTVtYCn5wVyw44dHA2MDVxcjBISFgIrF8mnQXIxeHkMBuRokH
        z08xdTFyAsVlJZ6928EOYQtL3G85wgpiCwk8Y5RomhsEYrMJ6Eu87NjGCtIsIrCYUWLL/Sdg
        RcwClxglTl7zhJg6gVHi7csXzCAJTgF7iSVbV7CAbBYW8JPon1YKEmYRUJXo3v2LEcTmFbCU
        2HX2LSuELShxcuYTFoiZ2hK9D1sZIWx5ie1v5zBDHKcg8fPpMrB6EQErifP7t0PViEjM7mxj
        nsAoPAvJqFlIRs1CMmoWkpYFjCyrGCVTC4pz03OLDQsM81LL9YoTc4tL89L1kvNzNzGCY0lL
        cwfj9lUf9A4xMnEwHmKU4GBWEuEt2TU1SYg3JbGyKrUoP76oNCe1+BCjNAeLkjjvha6T8UIC
        6YklqdmpqQWpRTBZJg5OqQYm5qU1lv5rTYP4djAuTCzRmC+99ejkwlDW5lXXdHa/OBrTlPuH
        N2aq2Jy7nlUbj2i8UXCQOPNw/ueGqLj7mzJnGkXP6790abMa95YCXj+LyWva2Q+Irq6cyDVp
        Ft8Kqz/zJ0XqPZjlMv2EjvvE7ks3Wu3Pmd45yrmvp/ldWLvuBKGUIo7SooUsqqILzK2v2Ki+
        OByi1cG6J8fg/awS20Xu7z9cZi6d73KDr1F56a5vERo8lUs3/g7tMsparfHO9PkzmYnKRW+n
        6t2fo9Bm5p69iDV46i3N1n0iO4Ue5uxtFdENWxJ820fpn9GUj893qfm3tQiubmw5k/S/vzSo
        7hYz65u2sIdrmNXPvFi2JN5fiaU4I9FQi7moOBEAgRVd9RQDAAA=
X-CMS-MailID: 20220531123617epcas2p20ec21b31efe286fe086e7baee6681e51
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220523121210epcas2p11d0b4f27edd5a403b2fd7d3833d577ff
References: <CGME20220523121210epcas2p11d0b4f27edd5a403b2fd7d3833d577ff@epcas2p1.samsung.com>
        <20220523121244.67341-1-chanho61.park@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

Could you review below v3 patchset in your free time? :)

Best Regards,
Chanho Park

> -----Original Message-----
> From: Chanho Park <chanho61.park@samsung.com>
> Sent: Monday, May 23, 2022 9:13 PM
> To: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>; Chanwoo Choi
> <cw00.choi@samsung.com>; Sam Protsenko <semen.protsenko@linaro.org>;
> linux-samsung-soc@vger.kernel.org; devicetree@vger.kernel.org; Chanho Park
> <chanho61.park@samsung.com>
> Subject: [PATCH v3 0/2] syscon reboot/reboot_mode support for exynosautov9
> 
> This adds to support syscon reboot and reboot_mode for Exynos Auto v9 SoC.
> 
> Changes from v2:
> - Change license of samsung,boot-mode.h to (GPL-2.0-only OR BSD-2-Clause)
> - Add copyright of samsung,boot-mode.h
> - Change ifdef guard __DT_BINDINGS_SAMSUNG_BOOT_MODE_H
> - Remove brackets of the definitions
> 
> Changes from v1:
> - Add samsung,boot-mode.h header which include reboot mode definitions
> - syscon-reboot-mode -> reboot-mode
> 
> Chanho Park (2):
>   dt-bindings: soc: add samsung,boot-mode definitions
>   arm64: dts: exynoautov9: add syscon reboot/reboot_mode support
> 
>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 17 +++++++++++++++++
> include/dt-bindings/soc/samsung,boot-mode.h  | 18 ++++++++++++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 include/dt-bindings/soc/samsung,boot-mode.h
> 
> --
> 2.36.1


