Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48162C43334
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Jun 2022 13:00:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232397AbiFBNAE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Jun 2022 09:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbiFBNAD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jun 2022 09:00:03 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C83F82A80E5
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jun 2022 05:59:59 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220602125954epoutp03895cb61eceb7a289f62dcda9a9036634~0zzYzMLyv1750617506epoutp039
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jun 2022 12:59:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220602125954epoutp03895cb61eceb7a289f62dcda9a9036634~0zzYzMLyv1750617506epoutp039
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654174794;
        bh=S20/HwX9GYZeobEXd5xhvGD8lYXj/+otH2CE8CuoLc0=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=i3u7s6j9PKt2FMDm+SkwD20Ehdtv/CQCMBmOPRe+lr9SpEPYynmqWW/q5b1udFJLf
         R4C3HBAG0rg91F3o+DsMTAdkO2xFCDJFxLRhEwqNXG7hX3L2XiLfcu6qZfSFiTHPgx
         MqdngWD6rCzwbitdC7Qvz3j8+ctmEeT5oRKPZOz8=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220602125953epcas2p20fceca1c060d530134d2925404fa6f1e~0zzXdlF3C1682116821epcas2p2O;
        Thu,  2 Jun 2022 12:59:53 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.90]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4LDR1h3v3Yz4x9Ps; Thu,  2 Jun
        2022 12:59:52 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        3D.23.09764.844B8926; Thu,  2 Jun 2022 21:59:52 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220602125951epcas2p16f49a30d4fdfbdcd03a433fa1c8f1610~0zzWGMFTK0086600866epcas2p1g;
        Thu,  2 Jun 2022 12:59:51 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220602125951epsmtrp29823529eb79b86f2ec2a769324feacbd~0zzWFXrEn2833528335epsmtrp2e;
        Thu,  2 Jun 2022 12:59:51 +0000 (GMT)
X-AuditID: b6c32a46-f75ff70000002624-d7-6298b448fd67
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        A4.EE.08924.744B8926; Thu,  2 Jun 2022 21:59:51 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20220602125951epsmtip2c7ae99be55f55d7e1d00ce6f9852d238~0zzV3sNne0775007750epsmtip2i;
        Thu,  2 Jun 2022 12:59:51 +0000 (GMT)
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
In-Reply-To: <42b8c793-caa7-e14d-0a6c-dec7aa914dff@linaro.org>
Subject: RE: [PATCH v2 3/6] phy: samsung: ufs: support secondary ufs phy
Date:   Thu, 2 Jun 2022 21:59:51 +0900
Message-ID: <050301d87680$a5dac8e0$f1905aa0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLWkTnA63V9WykH3rm22/0hqLdk6gJT4k6aAmvBrIgA/M7PUqsR+cUg
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJJsWRmVeSWpSXmKPExsWy7bCmma7HlhlJBk8Pylg8mLeNzWL+kXOs
        Fhee9rBZ9L14yGyx9/VWdotNj6+xWkxY9Y3FYsb5fUwWrXuPsFvsvHOC2YHLY9OqTjaPO9f2
        sHlsXlLv0bdlFaPH8RvbmTw+b5ILYIvKtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0
        tDBXUshLzE21VXLxCdB1y8wBukxJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2Be
        oFecmFtcmpeul5daYmVoYGBkClSYkJ2xfONR1oJ1bBWn9nUzNTDOZu1i5OSQEDCR2LNlFXsX
        IxeHkMAORonJx7dAOZ8YJTa/fsYM4XxmlDj17RkjTMubPytYIBK7GCXeLtkOVfWCUWLKnS0s
        IFVsAvoSLzu2sYIkRATmM0k87bzKBJJgFpjAKLHyk3cXIwcHp4CdxPsHriCmsICHxN5ViiAV
        LAIqEp+e32MGCfMKWEr82B8GEuYVEJQ4OfMJC8QQbYllC18zQ9yjIPHz6TKwd0QE3CSm7DrN
        DlEjIjG7sw3sNAmBHRwS7z8dgPrZReJuTwc7hC0s8QrsZRBbSuLzu71sEHaxxNJZn5ggmhsY
        JS5v+wWVMJaY9aydEeQ4ZgFNifW79EFMCQFliSO3oG7jk+g4/JcdIswr0dEmBNGoLnFg+3QW
        CFtWonvOZ9YJjEqzkHw2C8lns5B8MAth1wJGllWMYqkFxbnpqcVGBUbwuE7Oz93ECE6zWm47
        GKe8/aB3iJGJg/EQowQHs5IIb8muqUlCvCmJlVWpRfnxRaU5qcWHGE2BQT2RWUo0OR+Y6PNK
        4g1NLA1MzMwMzY1MDcyVxHm9UjYkCgmkJ5akZqemFqQWwfQxcXBKNTDJh7gwyPz0qiz5Lmhj
        YeFzeH6ghRCHgb58lti5BSbnju9iVd68KIgtYGKnYmCkfYmf0WxZ9ZsO5Vw++putg3qMJf5z
        J3Wa/3xutbN2vvTOENP3y35VRZh3rA/qrpM4oN0mHu038XUp39PfzhXn78648+Sh3VP5s/d2
        Su/v3/P2R9wFjqOmPh5du1Lm/bdIm7LdR5prwom5Pb8uSrzY+sGBd89/Vv2Tr5WX8MR+ylnN
        JzSXUTM+43/apBWMUxIuTIhbePCiyVQDh6m5wktW21icWGCrduGA+clTNXHRetIhblX77/7e
        c2mb85XwvwqTLIMYNlyvqbzJM817ry+fh3BA8d+E9Wsc+FdkrFwaO0GJpTgj0VCLuag4EQDA
        j3WXPAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRmVeSWpSXmKPExsWy7bCSvK77lhlJBvPXGVo8mLeNzWL+kXOs
        Fhee9rBZ9L14yGyx9/VWdotNj6+xWkxY9Y3FYsb5fUwWrXuPsFvsvHOC2YHLY9OqTjaPO9f2
        sHlsXlLv0bdlFaPH8RvbmTw+b5ILYIvisklJzcksSy3St0vgynjdsYixYDNbxY9NV5kaGGex
        djFyckgImEi8+bOCpYuRi0NIYAejxNtZc5khErISz97tYIewhSXutxxhhSh6xiixY91rFpAE
        m4C+xMuObWAJEYHFTBL9J86ygTjMAlMYJS5ffQk19yujxPw/M4BmcXBwCthJvH/gCmIKC3hI
        7F2lCDKIRUBF4tPze8wgYV4BS4kf+8NAwrwCghInZz4B28UsoC3x9OZTOHvZwtdQhypI/Hy6
        DOwbEQE3iSm7TrND1IhIzO5sY57AKDwLyahZSEbNQjJqFpKWBYwsqxglUwuKc9Nziw0LjPJS
        y/WKE3OLS/PS9ZLzczcxgqNOS2sH455VH/QOMTJxMB5ilOBgVhLhLdk1NUmINyWxsiq1KD++
        qDQntfgQozQHi5I474Wuk/FCAumJJanZqakFqUUwWSYOTqkGppJ8zSnbg/ofyuyaMPHeFrVS
        uy9fuafkTv9fvOrrLafnE34eMVpgPSVI/uluxlv5H+2EVu2yEjzy6U5iSsUFVf6Z8kLy+zpc
        Dq5a6Jb6ReTgmZnd01ZPKRSQiLk0PeT9yTnnb7zJunqm9mMA3741s9Ql95V8tY9tZzRbd9Hr
        tcQXnxz2S5f2iPjVa7f8l5oT8vN3QmzlupLzJuqHE4wMTnrymfxidXG0iDcJyHE7LrOy962T
        e+Ekvo3tS+tbrSK++h2vVtBaM8s7g9Pr2f2LR1ir9p7snPTxxtu9Fb61W/67+B65/26jXJ6/
        7xudC0KrxUWazkx7uGH50QlXlzA1t53+yrJ2+uWMPatmxYcd9jJTYinOSDTUYi4qTgQAPUfF
        /SkDAAA=
X-CMS-MailID: 20220602125951epcas2p16f49a30d4fdfbdcd03a433fa1c8f1610
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220602053329epcas2p19785735bcbf08ad274ff887797485b8c
References: <20220602053250.62593-1-chanho61.park@samsung.com>
        <CGME20220602053329epcas2p19785735bcbf08ad274ff887797485b8c@epcas2p1.samsung.com>
        <20220602053250.62593-4-chanho61.park@samsung.com>
        <42b8c793-caa7-e14d-0a6c-dec7aa914dff@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> > +	phy->isol =3D devm_kzalloc(dev, sizeof(struct pmu_isol), GFP_KERNEL);
>=20
> 1. Looks like devm_kmemdup
> 2. sizeof(*variable), not sizeof(struct)
>=20
> 3. and actually you can simplify all that by storing struct pmu_isol
> directly in struct samsung_ufs_phy, not as pointer.
>=20
> After all that storing drvdata in samsung_ufs_phy does not make any sense
> - only one field is left still used (has_symbol_clk), so this should be
> simplified here as well.

It would be better storing struct pmu_isol directly and remove drvdata from=
 samsung_ufs_phy as you suggested.
Furthermore, definition of struct pmu_isol looks odd in the definition of s=
amsung_ufs_phy_drvdata.
So, I'll pop it out and change the naming to =22struct samsung_ufs_phy_pmu_=
isol=22

Best Regards,
Chanho Park

