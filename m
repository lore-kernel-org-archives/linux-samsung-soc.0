Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB22CCA47C
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 07:12:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbiFGHMZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 03:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237277AbiFGHMX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 03:12:23 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB36F6301
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 00:12:20 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220607071217epoutp04a42cada29a5388172f51fbc99434bd5c~2RSTqJV-V1951619516epoutp04j
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 07:12:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220607071217epoutp04a42cada29a5388172f51fbc99434bd5c~2RSTqJV-V1951619516epoutp04j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654585937;
        bh=V5LNV5a76kT6PYjBibAJh3MOlOCzMfWt93cWVTaCjgg=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=fHGRLU8vjAHa3u2+ryiBSY8Ha3/4dnGwglgWZih1zpdFk7XO8kGf5mUiBjEUWL/Zt
         rh8S5Hz9ph4wWhnBFNaydl85i21amy4yar9jtfOxWOiSEw/isQdwMxawpgaEmOW7hi
         etRZe3VIyEH3mBgYKkAiHDTp1KBgYwycIRXxuNYg=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220607071217epcas2p33799b95550ba43d2bf40297f062c8c39~2RSTEswEb0640406404epcas2p3c;
        Tue,  7 Jun 2022 07:12:17 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.90]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4LHM4J2D4xz4x9QC; Tue,  7 Jun
        2022 07:12:16 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        0B.0F.09764.05AFE926; Tue,  7 Jun 2022 16:12:16 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220607071215epcas2p4f1cab6403bae37f1f19e2aae28e3875a~2RSRo_-5K2315623156epcas2p48;
        Tue,  7 Jun 2022 07:12:15 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220607071215epsmtrp17e261136330c46c4f5ad5e4405d0cdbf~2RSRn973B2834028340epsmtrp1O;
        Tue,  7 Jun 2022 07:12:15 +0000 (GMT)
X-AuditID: b6c32a46-f8bff70000002624-7c-629efa507ea8
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        4C.81.08924.F4AFE926; Tue,  7 Jun 2022 16:12:15 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20220607071215epsmtip1aa7d022a63b292b60df180f7fcda025f~2RSRakIDP3120431204epsmtip1f;
        Tue,  7 Jun 2022 07:12:15 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Kishon Vijay Abraham I'" <kishon@ti.com>,
        "'Vinod Koul'" <vkoul@kernel.org>,
        "'Alim Akhtar'" <alim.akhtar@samsung.com>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski+dt@linaro.org>
Cc:     <devicetree@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <2c0d4c55-ed79-0b6d-3429-a4cefb16d808@linaro.org>
Subject: RE: [PATCH v3 3/5] phy: samsung: ufs: constify samsung_ufs_phy_cfg
Date:   Tue, 7 Jun 2022 16:12:15 +0900
Message-ID: <011601d87a3d$eaad2880$c0077980$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQL8YIa13wrKaA+2+QkenJ62eRCubQKAIuirAM1o1T0BG2uULarYcsgA
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFJsWRmVeSWpSXmKPExsWy7bCmhW7Ar3lJBhsm8Fs8mLeNzWL+kXOs
        Fhee9rBZ9L14yGyx9/VWdotNj6+xWkxY9Y3FYsb5fUwWrXuPsFvsvHOC2YHLY9OqTjaPO9f2
        sHlsXlLv0bdlFaPH8RvbmTw+b5ILYIvKtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0
        tDBXUshLzE21VXLxCdB1y8wBukxJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2Be
        oFecmFtcmpeul5daYmVoYGBkClSYkJ2xe9d+9oKLTBWrO24yNTB2MnUxcnJICJhI/Px/ha2L
        kYtDSGAHo8T8u3uhnE+MEj/bvrGAVAkJfGaUOHFGB6Zj56V/7BBFuxglOo4/ZocoesEo0XTE
        GsRmE9CXeNmxjRWkSERgPpPE086rYPuYBSYwSqz85A1icwrYSUycto4ZxBYW8Jb4OuEIG4jN
        IqAiMfPhWjCbV8BSYtbLbYwQtqDEyZlPWCDmyEtsfzuHGeIiBYmfT5exgtgiAm4SzYenMkLU
        iEjM7mxjBjlCQmAPh8SEyYuhGlwk1s3ZxQ5hC0u8Or4FypaSeNnfBmUXSyyd9YkJormBUeLy
        tl9sEAljiVnP2oE2cABt0JRYv0sfxJQQUJY4cgvqNj6JjsN/2SHCvBIdbUIQjeoSB7ZPZ4Gw
        ZSW653xmncCoNAvJZ7OQfDYLyQezEHYtYGRZxSiWWlCcm55abFRgBI/s5PzcTYzgRKvltoNx
        ytsPeocYmTgYDzFKcDArifD6T56bJMSbklhZlVqUH19UmpNafIjRFBjWE5mlRJPzgak+ryTe
        0MTSwMTMzNDcyNTAXEmc1ytlQ6KQQHpiSWp2ampBahFMHxMHp1QDk/DhpKyfLdGr+/ZG5AlW
        nr4ge9r9Ue7Bh3e0Pswrigl4HK/i+7blZ38nwxQra3uPq7+2T/o22WNZqNGfmNYmaVl5MamP
        jQZtKUtV56wv/NlpV2p9cs+X9SYHjh/h3tW5velXofXNpXHL8o+x3t+p+OV55rqQsnevdCrY
        I056aTxdtS/p5e9Ea8vjty2ndH66oD+j8o7OJLsXMakzZUtFa2N7bfssmhw7nGSjtxmuW2C1
        6qw0V/pLqcrYOIHV13ZNeb8u8oGrPsv6to8LvLimRDsFb59YxKt7eKdGzPe/Oz+bzP9w4Wr4
        /GuBKbnWOayduyfmGEyyenU37uID3hf9RcwxU3LOn23NO1igUbetQImlOCPRUIu5qDgRAM5t
        vC89BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsWy7bCSnK7/r3lJBq0zNCwezNvGZjH/yDlW
        iwtPe9gs+l48ZLbY+3oru8Wmx9dYLSas+sZiMeP8PiaL1r1H2C123jnB7MDlsWlVJ5vHnWt7
        2Dw2L6n36NuyitHj+I3tTB6fN8kFsEVx2aSk5mSWpRbp2yVwZezetZ+94CJTxeqOm0wNjJ1M
        XYycHBICJhI7L/1j72Lk4hAS2MEocW7yJEaIhKzEs3c72CFsYYn7LUdYIYqeMUq8ebGBDSTB
        JqAv8bJjG1hCRGAxk0T/ibNsIA6zwBRGictXX7JAtHxmlHh6eCsLSAungJ3ExGnrmEFsYQFv
        ia8TjoCNYhFQkZj5cC2YzStgKTHr5TZGCFtQ4uTMJ2C9zALaEk9vPoWy5SW2v53DDHGfgsTP
        p8tYQWwRATeJ5sNTGSFqRCRmd7YxT2AUnoVk1Cwko2YhGTULScsCRpZVjJKpBcW56bnFhgVG
        eanlesWJucWleel6yfm5mxjBsaeltYNxz6oPeocYmTgYDzFKcDArifD6T56bJMSbklhZlVqU
        H19UmpNafIhRmoNFSZz3QtfJeCGB9MSS1OzU1ILUIpgsEwenVAPTxb9q/5cuTkzN13Ccu+ux
        886fD689mXJLPmCeyrpc/kBL+TVC+/jDol/6vOl2c57BJdTMw3QpS0E8XXl2ZkvLAePbH8MT
        2yf+XcrJv+hd/jX18MzgWKtzigsmHDj738/5Q3TK0W12To++q16ZXdFZwPV2wROpOSdPH34Q
        8p35762pK40O3jjkveq3yPmjAjvM5L/ODC3w52W0nea/fcf0jLkbIqZv82B6fOD5o50iYnrh
        u2/9ev+3tcz8aimD+dovEj0zH75+Wry76vDZ351BJYeezXQ40Gh2SzEyvvbw2ZVrLs3xDQ44
        zFjtVuSjfY83/O71k37+y+4xqyyYsFJirs/qef5Pc8oV6q9z7/XVTFNiKc5INNRiLipOBACG
        uzIjLAMAAA==
X-CMS-MailID: 20220607071215epcas2p4f1cab6403bae37f1f19e2aae28e3875a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220603020426epcas2p3f6b5174734313e5d06d0177c3ebd777d
References: <20220603020410.2976-1-chanho61.park@samsung.com>
        <CGME20220603020426epcas2p3f6b5174734313e5d06d0177c3ebd777d@epcas2p3.samsung.com>
        <20220603020410.2976-4-chanho61.park@samsung.com>
        <2c0d4c55-ed79-0b6d-3429-a4cefb16d808@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> > -	struct samsung_ufs_phy_cfg **cfgs;
> > +	const struct samsung_ufs_phy_cfg **cfgs;
> 
> I still think this should be array of const pointers to const data, so:
> 	const struct samsung_ufs_phy_cfg * const *cfgs; I proposed this in
> last email.

Make sense. I'll change this as you suggested.

Best Regards,
Chanho Park

