Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C373C43334
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Jul 2022 08:58:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbiGEI6T (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 5 Jul 2022 04:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbiGEI5v (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 04:57:51 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA9713E01
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Jul 2022 01:57:35 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220705085732epoutp0214488fa5686383a55e63d4c2f9d60a2c~_4yMdsHmZ2744827448epoutp027
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Jul 2022 08:57:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220705085732epoutp0214488fa5686383a55e63d4c2f9d60a2c~_4yMdsHmZ2744827448epoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1657011452;
        bh=OLWvNh/AEcuzbL7D5fKaNGYOFKcxw4DgyGu5QCAE1CI=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=ruia2DCIT+JDYBDCzwhKXP2dF9FYsb7iq36tFJge5S1Lrok2jMj6LSEU63VWoCpyF
         yKOkOvPm/9ikCrtE7QmbVxDsDKP2dFHaYecvkSXwqrLD6clB8pCIHUQY/qqa3+pZ7g
         liPpuO8sf9K20nqbJnPTnWellaaRbf+ZsXHU28jU=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220705085731epcas2p2263eabbd64f67ff1ff91a7f03f414a01~_4yLo5H0F1273912739epcas2p28;
        Tue,  5 Jul 2022 08:57:31 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.101]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4Lcc4q3bJ9z4x9Q2; Tue,  5 Jul
        2022 08:57:31 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        DA.FA.09642.BFCF3C26; Tue,  5 Jul 2022 17:57:31 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220705085730epcas2p39db48578d86c449fd1233a40f84bbbac~_4yKkRdcx0570205702epcas2p3J;
        Tue,  5 Jul 2022 08:57:30 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220705085730epsmtrp1dee3a0d62882e6f234d4997a2b68d188~_4yKjkUxe0666706667epsmtrp1b;
        Tue,  5 Jul 2022 08:57:30 +0000 (GMT)
X-AuditID: b6c32a47-5f7ff700000025aa-41-62c3fcfb90a3
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        54.A9.08905.AFCF3C26; Tue,  5 Jul 2022 17:57:30 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20220705085730epsmtip20236004d23447ac9afdbbccd75f7c904~_4yKW6BjT2704127041epsmtip2C;
        Tue,  5 Jul 2022 08:57:30 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Rob Herring'" <robh+dt@kernel.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski+dt@linaro.org>
Cc:     "'Alim Akhtar'" <alim.akhtar@samsung.com>,
        <devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <20220627005832.8709-1-chanho61.park@samsung.com>
Subject: RE: [PATCH] arm64: dts: exynosautov9: correct spi11 pin names
Date:   Tue, 5 Jul 2022 17:57:30 +0900
Message-ID: <000001d8904d$424fb0b0$c6ef1210$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQNSsn+Z+MuBNoHV8k59HcmWEV/P0AE2z7NJqnF+gXA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAJsWRmVeSWpSXmKPExsWy7bCmme7vP4eTDOYuFbd4MG8bm8X8I+dY
        LfpePGS22PT4GqvFjPP7mCxa9x5hd2Dz2LSqk83jzrU9bB6bl9R79G1ZxejxeZNcAGtUtk1G
        amJKapFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0AFKCmWJOaVA
        oYDE4mIlfTubovzSklSFjPziElul1IKUnALzAr3ixNzi0rx0vbzUEitDAwMjU6DChOyMjvaD
        zAWnBSoe3tjK1sD4nreLkZNDQsBE4sGCL6xdjFwcQgI7GCWaH3cwQzifGCWWHZzAAuF8Y5S4
        1HuTHabl8hGYxF5Gic1Lj0A5LxgleppesYBUsQnoS7zs2MYKYosIpEvMenuODaSIWWAWo8St
        N61gozgF7CSW9N9iBrGFBdwkJj6czQZiswioSBzb1wkUZ+fgFbCU2B0OEuUVEJQ4OfMJ2Hhm
        AXmJ7W/nMEMcpCDx8+kyqFVWEje2T4aqEZGY3dkGVdPLIbHyrgWE7SLx9UkDI4QtLPHq+Bao
        x6QkXva3QdnFEktnfWICOVlCoIFR4vK2X2wQCWOJWc/agZo5gBZoSqzfpQ9iSggoSxy5BbWW
        T6Lj8F92iDCvREebEESjusSB7dNZIGxZie45n1knMCrNQvLYLCSPzULywCyEXQsYWVYxiqUW
        FOempxYbFRjD4zo5P3cTIzhparnvYJzx9oPeIUYmDsZDjBIczEoivKsmHUwS4k1JrKxKLcqP
        LyrNSS0+xGgKDOiJzFKiyfnAtJ1XEm9oYmlgYmZmaG5kamCuJM7rlbIhUUggPbEkNTs1tSC1
        CKaPiYNTqoFJM+mbzI+/kvF7L0a+niF03HbBo7WtaYJ8Ty/oPfP0kjm7LP/yQvaa54L3DTgD
        3PeesblbETQ5SDfN4ILf8WffW5T3vuudXZ50iMkl+rSkuMcxu9ufJ3v/2CmnHrfuhMeqTl2P
        v5Z3Am9q9b52nf53Pev2NYmBRUGtPJytP6Z3xugUq+yynMtu+WH+jN0OJg+vxgQkdO6M6/50
        5c/UjHazs9lusVEzo/bOlVl8wfWAP6PbL85/H92+8v09k3QowWDNXxaHXB3HpGNpfRxGD+5P
        /SC+O55H0m/GuQnfauTCt/8++yjX7rjriQ3Bz26xnvy1ZcJkjfblLKH1Gq5hjJnxwrdPr7ne
        svTlaavFTTKXlViKMxINtZiLihMBlJ8CSiMEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLLMWRmVeSWpSXmKPExsWy7bCSvO6vP4eTDDbO0rF4MG8bm8X8I+dY
        LfpePGS22PT4GqvFjPP7mCxa9x5hd2Dz2LSqk83jzrU9bB6bl9R79G1ZxejxeZNcAGsUl01K
        ak5mWWqRvl0CV0ZH+0HmgtMCFQ9vbGVrYHzP28XIySEhYCJx+cgEli5GLg4hgd2MEuePbmWG
        SMhKPHu3gx3CFpa433KEFaLoGaPEw81PwYrYBPQlXnZsYwWxRQTSJXY92wk2iVlgHqPE6Z79
        bBAd/YwSu1fuYQOp4hSwk1jSfwusW1jATWLiw9lgcRYBFYlj+zqB4uwcvAKWErvDQaK8AoIS
        J2c+YQGxmQW0JZ7efAply0tsfzsH6lAFiZ9Pl0HdYCVxY/tkqBoRidmdbcwTGIVnIRk1C8mo
        WUhGzULSsoCRZRWjZGpBcW56brFhgWFearlecWJucWleul5yfu4mRnAMaWnuYNy+6oPeIUYm
        DsZDjBIczEoivKsmHUwS4k1JrKxKLcqPLyrNSS0+xCjNwaIkznuh62S8kEB6YklqdmpqQWoR
        TJaJg1OqgckvNWr29hfmX7oCVkubW3wNWnVv5fYXfCVdaxb+tnnHWuvxblv5qzXzGkoVft4V
        3XFYcrOnvVGnrA6rsnHpMRujNWHe3upp+ZaLjTas/s86V/VYodlGhsDmM1mxs7Z/2ChoWTPp
        ZNqEk2H33/gZ3zAoYTqzKTrv6xfZDQXFc6b8ds99o/Xdy2xiwLS6/mCZttMS25raTEvcM1x0
        z30+9Urmcbxn+ecf0xaJnhScp7koxPX/vVvsskcap3Guv6/pGTAxJzW266rx5VmOZztda2oc
        FsbzXf2dn/Og5hr33LrsmDXlVk2aC1dPrK4rW5ISrr3v6b0Pddsn7FnArlBiUhLL9mKm5ie+
        3qapGh/WNyqxFGckGmoxFxUnAgBbboUcEAMAAA==
X-CMS-MailID: 20220705085730epcas2p39db48578d86c449fd1233a40f84bbbac
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220627010103epcas2p174bb652624219cadc106275abf51f83a
References: <CGME20220627010103epcas2p174bb652624219cadc106275abf51f83a@epcas2p1.samsung.com>
        <20220627005832.8709-1-chanho61.park@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

Please review below patch and pick it up in your tree.

Best Regards,
Chanho Park

> -----Original Message-----
> From: Chanho Park <chanho61.park@samsung.com>
> Sent: Monday, June 27, 2022 9:59 AM
> To: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>; devicetree@vger.kernel.org;
> linux-samsung-soc@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> Chanho Park <chanho61.park@samsung.com>
> Subject: [PATCH] arm64: dts: exynosautov9: correct spi11 pin names
> 
> They should be started with "gpp5-".
> 
> Fixes: 31bbac5263aa ("arm64: dts: exynos: add initial support for
> exynosautov9 SoC")
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
> b/arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
> index ef0349d1c3d0..68f4a0fae7cf 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
> @@ -1089,21 +1089,21 @@ spi10_cs_func: spi10-cs-func-pins {
> 
>  	/* PERIC1 USI11_SPI */
>  	spi11_bus: spi11-pins {
> -		samsung,pins = "gpp3-6", "gpp3-5", "gpp3-4";
> +		samsung,pins = "gpp5-6", "gpp5-5", "gpp5-4";
>  		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
>  		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
>  		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
>  	};
> 
>  	spi11_cs: spi11-cs-pins {
> -		samsung,pins = "gpp3-7";
> +		samsung,pins = "gpp5-7";
>  		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
>  		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
>  		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
>  	};
> 
>  	spi11_cs_func: spi11-cs-func-pins {
> -		samsung,pins = "gpp3-7";
> +		samsung,pins = "gpp5-7";
>  		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
>  		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
>  		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> --
> 2.36.1


