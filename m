Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49CE5C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Jul 2022 11:06:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiGFLGg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Jul 2022 07:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232320AbiGFLGf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Jul 2022 07:06:35 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BC3525E8B
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 04:06:34 -0700 (PDT)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220706110631epoutp040c553fe1aebc012d6b16918dce06cd1b~-OMFn_27k0350503505epoutp043
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 11:06:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220706110631epoutp040c553fe1aebc012d6b16918dce06cd1b~-OMFn_27k0350503505epoutp043
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1657105591;
        bh=2Hor2fDRK4TIkKOX5EILav2xhBi4xZfk+8pnGvcUA8Q=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=IVVvdJrnevEW+okyomUHTT95fsTMqnfjjY/PXSSPpa/8UnCBR6JYzSl7KN53Fr9u8
         zXbqxCObrv6HeCmVvokS+tScA+aFASmfYVJliFiKi3WF8PnJAIl98RUxQP+5Bw11rJ
         aE9pKF1KGzwhVdZK4ZNL7alc2+mJf3R6dp4QkPog=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas5p4.samsung.com (KnoxPortal) with ESMTP id
        20220706110630epcas5p483fea5658b51004fcb82fe34ed301fb4~-OMFNfJs12931429314epcas5p4T;
        Wed,  6 Jul 2022 11:06:30 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.179]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4LdGv75CH8z4x9Q0; Wed,  6 Jul
        2022 11:06:27 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
        epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        7F.CE.09662.3BC65C26; Wed,  6 Jul 2022 20:06:27 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
        20220706110626epcas5p2bd75d5be89ee6f2c125a72033c898116~-OMBYN_b02982729827epcas5p2M;
        Wed,  6 Jul 2022 11:06:26 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220706110626epsmtrp1849ce70f75319c9b1b7f1930993cb238~-OMBXkmUN1117211172epsmtrp1q;
        Wed,  6 Jul 2022 11:06:26 +0000 (GMT)
X-AuditID: b6c32a49-86fff700000025be-d7-62c56cb3116f
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        F2.1A.08905.2BC65C26; Wed,  6 Jul 2022 20:06:26 +0900 (KST)
Received: from alimakhtar03 (unknown [107.122.12.5]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20220706110625epsmtip27b85e098f66ede39ba548752d6ce2492~-OMAuJoLA2548025480epsmtip2A;
        Wed,  6 Jul 2022 11:06:25 +0000 (GMT)
From:   "Alim Akhtar" <alim.akhtar@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Chanho Park'" <chanho61.park@samsung.com>
Cc:     <linux-samsung-soc@vger.kernel.org>
In-Reply-To: <f1e03b78-f844-6eec-2ace-d177af59f0c9@linaro.org>
Subject: RE: ExynosAutov9 SDAK UFS phy dtbs check error
Date:   Wed, 6 Jul 2022 16:36:24 +0530
Message-ID: <02d101d89128$6f90ce70$4eb26b50$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJm4VubqEIWt0Qo4Lng+N+g3AcGPQGquJ4cAj3WOLWsNUgvMA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBKsWRmVeSWpSXmKPExsWy7bCmpu7mnKNJBmeXs1tc3q9tsff1VnaL
        Gef3MTkwe9y5tofNo2/LKkaPz5vkApijsm0yUhNTUosUUvOS81My89JtlbyD453jTc0MDHUN
        LS3MlRTyEnNTbZVcfAJ03TJzgPYoKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgpM
        CvSKE3OLS/PS9fJSS6wMDQyMTIEKE7IzDvQdYis4zVXx+HY/UwPjT44uRk4OCQETie7/j1i7
        GLk4hAR2M0q8n/aJBcL5xCjRcHMFM4TzjVHi/IF+ti5GDrCWTQeyIOJ7GSU2rr/DCOG8ZJR4
        93U7K8hcNgFdiR2L29hAbBGBbInOPb0sIDazgLrE0yMPwWo4BewkXtyfxg4yVFjAXGJDgzyI
        ySKgIvHogilIBa+ApcTyTR/ZIGxBiZMzn0BN0ZZYtvA1M8QHChI/ny5jhdjkJDH36mNGiBpx
        iZdHj7CDnCYh8IhdYn37O1aIBheJZ9NeQ9nCEq+Ob2GHsKUkXva3sUP86CGx6I8URDhD4u3y
        9YwQtr3EgStzWEBKmAU0Jdbv0odYxSfR+/sJE0Qnr0RHmxBEtapE87urLBC2tMTE7m6opR4S
        R//fYJ7AqDgLyWOzkDw2C8kDsxCWLWBkWcUomVpQnJueWmxaYJiXWg6P7OT83E2M4CSo5bmD
        8e6DD3qHGJk4GA8xSnAwK4nwrpp0MEmINyWxsiq1KD++qDQntfgQoykwsCcyS4km5wPTcF5J
        vKGJpYGJmZmZiaWxmaGSOK/X1U1JQgLpiSWp2ampBalFMH1MHJxSDUxMetWt5j1CpctMHMqX
        ZYVIBatN3i7nP2Vf6CKBy4eT5xzlTbVmt3n2RSIojWX61UMysgrfXih9+r0if+mT/hulmnue
        3nxUEdo02y1Odu8rMwNR8X/BHE8XFb2NmXBT5PgV6UlpJvM5Uz4Y6EYVhwa84GH6X3c+YQZn
        rbjmev70+hPzomoeOQnUbLKOndbCeCdv/s55H5mr4g2tp5fJFBTEr14gvrjwQWPWrXvNXne2
        G3flnb2+oPi60iHBQ69UWTv+TnG8cmz9d9eGDOVdquLGbKIftzKKBbkzWM6yTenvfKv/xvXs
        4s4FGfFHLdsWJjGYuRUtLlkqe0Fu71cjI8+D7lIq8yOfvpxykvVjjBJLcUaioRZzUXEiAOeN
        /FQLBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrILMWRmVeSWpSXmKPExsWy7bCSvO6mnKNJBnPWKVhc3q9tsff1VnaL
        Gef3MTkwe9y5tofNo2/LKkaPz5vkApijuGxSUnMyy1KL9O0SuDI2TT3NVDCPq6L5TkoD4zmO
        LkYODgkBE4lNB7K6GLk4hAR2M0rsu/SMrYuREyguLXF94wR2CFtYYuW/5+wQRc8ZJX5vWAKW
        YBPQldixuA2sQUQgW+LtjWXMIDazgLrE0yMPWSEaDjJKLGj6xAKS4BSwk3hxfxo7yGZhAXOJ
        DQ3yICaLgIrEowumIBW8ApYSyzd9ZIOwBSVOznzCAjFSW6L3YSsjjL1s4WtmiNsUJH4+XcYK
        cYKTxNyrj6FqxCVeHj3CPoFReBaSUbOQjJqFZNQsJC0LGFlWMUqmFhTnpucWGxYY5qWW6xUn
        5haX5qXrJefnbmIEx4KW5g7G7as+6B1iZOJgPMQowcGsJMK7atLBJCHelMTKqtSi/Pii0pzU
        4kOM0hwsSuK8F7pOxgsJpCeWpGanphakFsFkmTg4pRqYYtS/C3qnqs01Da10VVnanL1A592/
        1W+twzf07Nm1/jLvM5ZKpxc312ZyrBGOrfKccv3YpswPS+/rWnDreu4Uu/itJ+6g/KlDgm/C
        w1/LPdviLl2puNTTvFMyvzeJJ2/n1vD5FxRWiIl0nn15Xv/myxYJrbs6m9rWyDj9n/7kxofH
        v4z2xq747HzpzO3kLjHRf5UX5LgcGXg/u66adWL2NfGwSd0SvadePvCfZrFGcNW3WVNfxlh9
        qdXTyr5gmZxhteu3aA+z5cGj9quUszdH2hzY2v9/0pNTIdwxh14rtPvE91xQ2pIdmqLVNEMm
        +U/prAUBETvOMj+qy0y9IZ7Ad3UiN2PDBhuVggV7nrEvUmIpzkg01GIuKk4EAK48uk30AgAA
X-CMS-MailID: 20220706110626epcas5p2bd75d5be89ee6f2c125a72033c898116
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220706095504epcas5p3554fa13f3c4feb1a40e700dd2cb3e9ee
References: <140c1c89-49a7-45bd-7f01-8a3ed1343437@linaro.org>
        <CGME20220706095504epcas5p3554fa13f3c4feb1a40e700dd2cb3e9ee@epcas5p3.samsung.com>
        <f1e03b78-f844-6eec-2ace-d177af59f0c9@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



>-----Original Message-----
>From: Krzysztof Kozlowski =5Bmailto:krzysztof.kozlowski=40linaro.org=5D
>Sent: Wednesday, July 6, 2022 3:25 PM
>To: Chanho Park <chanho61.park=40samsung.com>; Alim Akhtar
><alim.akhtar=40samsung.com>
>Cc: linux-samsung-soc=40vger.kernel.org
>Subject: Re: ExynosAutov9 SDAK UFS phy dtbs check error
>
>On 06/07/2022 11:53, Krzysztof Kozlowski wrote:
>> Hi Chanho,
>>
>> When running dtbs_check I found:
>> arch/arm64/boot/dts/exynos/exynosautov9-sadk.dtb: phy=4017e04000: clocks=
:
>> =5B=5B10=5D=5D is too short
>>
>> 	From schema: Documentation/devicetree/bindings/phy/samsung,ufs-
>phy.yaml
>>
>> arch/arm64/boot/dts/exynos/exynosautov9-sadk.dtb: phy=4017e04000:
>> clock-names: =5B'ref_clk'=5D is too short
>>
>> 	From schema: Documentation/devicetree/bindings/phy/samsung,ufs-
>phy.yaml
>>
>>
>> and so on. It seems you miss there clocks.
>
>+Cc Alim.
>
Thanks Krzysztof adding me and for reporting.

>Tesla FSD has the same problem:
>tesla/fsd-evb.dtb: ufs-phy=4015124000: clocks: =5B=5B35, 2=5D=5D is too sh=
ort
>
We need to update the binding for the newer SoCs which does not have PHY-(r=
x,tx)-symbol-clocks.
Phy-ref clock is only required for all the SoC and based on the SoC compati=
ble phy-=7Brx,tx=7D-symoble clocks can be selected.=20

>
>Best regards,
>Krzysztof

