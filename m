Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8554C43334
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Jul 2022 01:20:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbiGVBUd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Jul 2022 21:20:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbiGVBUc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Jul 2022 21:20:32 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA9CC8320B
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Jul 2022 18:20:29 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220722012027epoutp04979af6ef610d5c279a4ba0664e5f83cc~EAg8vrBtB2122821228epoutp04U
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Jul 2022 01:20:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220722012027epoutp04979af6ef610d5c279a4ba0664e5f83cc~EAg8vrBtB2122821228epoutp04U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1658452827;
        bh=72y5ODA7h/3Fu4vJf0C18MgNq1u/aqZxRkPRUc1vXD4=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=G+5rra8UM8FU5Vr1P8qBcdL8tgCsYUNOwnhNeCaYShTYPNuLdqEib7ro9/pNQsXyh
         tAkS4uP2mFTCmJHb9L6JtXgDuiJ9DDNY9oVq5lK7sC0nq8WGyBIFs/ssYq0peVb1Bj
         hjZDVPYoS2OyDsfmFZuad9vKunkHSGrPeO49hlUs=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220722012026epcas2p3bc471cf0ebf5e7dacec52f79c97016b8~EAg8ADNIm1482214822epcas2p3H;
        Fri, 22 Jul 2022 01:20:26 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.101]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4Lps7Y6ZLNz4x9Pv; Fri, 22 Jul
        2022 01:20:25 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        06.2D.09662.85BF9D26; Fri, 22 Jul 2022 10:20:24 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220722012024epcas2p3f6cfdb5aad685ba5c6b47a72f0a532d1~EAg6KVJsO1481214812epcas2p3K;
        Fri, 22 Jul 2022 01:20:24 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220722012024epsmtrp2dc61d2f78508cc517350bb0dc96fd7ef~EAg6JqOEs2039420394epsmtrp2T;
        Fri, 22 Jul 2022 01:20:24 +0000 (GMT)
X-AuditID: b6c32a48-9e1ff700000025be-8e-62d9fb58ac9f
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        DA.FC.08905.85BF9D26; Fri, 22 Jul 2022 10:20:24 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20220722012024epsmtip2d9df199dd9fbb1b71fcda3cc16a88c5f~EAg6CB_9u0628806288epsmtip2z;
        Fri, 22 Jul 2022 01:20:24 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski+dt@linaro.org>,
        "'Rob Herring'" <robh+dt@kernel.org>
Cc:     "'Alim Akhtar'" <alim.akhtar@samsung.com>,
        <devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <4e8a36de-a631-f6c9-44d7-7d873f775db2@linaro.org>
Subject: RE: [PATCH v2] dt-bindings: phy: samsung,ufs-phy: match clock items
Date:   Fri, 22 Jul 2022 10:20:24 +0900
Message-ID: <001b01d89d69$37d80320$a7880960$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHV3QSQuq8xDUpaM4gkOLovBVHrtwKGjBkSAuFvB7ytY9gMoA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJJsWRmVeSWpSXmKPExsWy7bCmmW7E75tJBhdXa1o8mLeNzWL+kXOs
        Fn0vHjJb7H29ld1i0+NrrBYzzu9jsmjde4Tdgd1j06pONo871/aweWxeUu/Rt2UVo8fnTXIB
        rFHZNhmpiSmpRQqpecn5KZl56bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlAVygp
        lCXmlAKFAhKLi5X07WyK8ktLUhUy8otLbJVSC1JyCswL9IoTc4tL89L18lJLrAwNDIxMgQoT
        sjOOHf3NXDCFreJ2wybmBsZu1i5GTg4JAROJPSvfMnYxcnEICexglPi1/y8bhPOJUeL5gjUs
        EM43RokfH1uYYVo2zZ3KDJHYyyjx5GA7E4TzglFi6603jCBVbAL6Ei87trGCJEQEFjNK9F3+
        CDaYWWAWo8StN63sIFWcAnYS69/NB7OFBXwkZn+6xAZiswioSmxo2gu2j1fAUuLZjy+MELag
        xMmZT1hAbGYBeYntb+dA3aQg8fPpMrCXRAScJG5fPs0KUSMiMbuzDexWCYGZHBJv522H+ttF
        YtfZPhYIW1ji1fEt7BC2lMTnd3vZIOxiiaWzPjFBNDcwSlze9gsqYSwx61k70EUcQBs0Jdbv
        0gcxJQSUJY7cgrqNT6Lj8F92iDCvREebEESjusSB7dOhtspKdM/5zDqBUWkWks9mIflsFpIP
        ZiHsWsDIsopRLLWgODc9tdiowAQe38n5uZsYwWlUy2MH4+y3H/QOMTJxMB5ilOBgVhLhfVp4
        PUmINyWxsiq1KD++qDQntfgQoykwrCcyS4km5wMTeV5JvKGJpYGJmZmhuZGpgbmSOK9XyoZE
        IYH0xJLU7NTUgtQimD4mDk6pBqYYnegPT9S4HU0K3hvPzM9eESmSPu3vx00HVwtpS/p1KN9g
        XMsmx/3+RMu2uf6ZgSLVdooHLimmTz1dZdzzap14+OMfjz6m1+U/DswPnBz+94bFiS09TN+L
        vu5+rNy+PvLS/WcTmXiS8rSfP8s97Ldw7b9ijuauXbrXvh9uX/fIU/Vnn21J1tY9OUlVn78f
        m8THK6D8d+Yp5hzvpdPvSfEXfOtv16tKZYzIVJ/YY9tfJtvVanha6vRLhanmrxzWsFkdWrH1
        /8Wahui0W9v/7tjnL8aQs3tLT2zMvYXBbFv0zDat3xP97GdNwd5LrnkM6zpYBNt/7w3eHFgm
        YTIjW2wvt2v4FblHhrE2Ec+vTFRiKc5INNRiLipOBAD0hgTCLAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplkeLIzCtJLcpLzFFi42LZdlhJXjfi980kg8d7eCwezNvGZjH/yDlW
        i74XD5kt9r7eym6x6fE1VosZ5/cxWbTuPcLuwO6xaVUnm8eda3vYPDYvqffo27KK0ePzJrkA
        1igum5TUnMyy1CJ9uwSujGNHfzMXTGGruN2wibmBsZu1i5GTQ0LARGLT3KnMXYxcHEICuxkl
        bnWvYIRIyEo8e7eDHcIWlrjfcoQVougZo8SUxTfAutkE9CVedmwDS4gILGaUOLh9HhOIwyww
        j1HidM9+NoiWw4wSb6ccYgFp4RSwk1j/bj7YXGEBH4nZny6xgdgsAqoSG5r2MoPYvAKWEs9+
        fGGEsAUlTs58AtbLLKAt8fTmUyhbXmL72znMEPcpSPx8ugzsJBEBJ4nbl0+zQtSISMzubGOe
        wCg8C8moWUhGzUIyahaSlgWMLKsYJVMLinPTc4sNCwzzUsv1ihNzi0vz0vWS83M3MYJjSktz
        B+P2VR/0DjEycTAeYpTgYFYS4X1aeD1JiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+FrpPxQgLp
        iSWp2ampBalFMFkmDk6pBqYrhxRTnBsX3pPkqVl6s/OQUdEHmW/rT1Z4JevZiHyb0B5XfzRY
        1Oz477BVbit9W85sk2GQkL33JIn/V9feQxMn6uw4eHLW86m5LiITphU3sums5HTj/bF3Rtm9
        yJw6Ty5rvvi/h+0YC8ouPnotrMlUUvxsH/PeXxddYp0PZLAGVr6Zs1lxf5isOrvohrt/WJe9
        aQ2w+jlnT+N8SZs3GerJ8t8nHu6IvLjliubvOntFroeHrrFu3raPZdnvj081lk0MZ7VnUfyy
        3W1qef7eCO6vamdYYw6H9qZOkmG7cC+xdOOOVJH/MgeLW+fs3cs1W7vxR/m52S80OAJcZvz5
        am+t+Xe5A1NSRH+/YUlneZISS3FGoqEWc1FxIgB9vac6GAMAAA==
X-CMS-MailID: 20220722012024epcas2p3f6cfdb5aad685ba5c6b47a72f0a532d1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220707063058epcas2p19364a05a5b2fc8aad81fa390ac030f21
References: <CGME20220707063058epcas2p19364a05a5b2fc8aad81fa390ac030f21@epcas2p1.samsung.com>
        <20220707062807.135960-1-chanho61.park@samsung.com>
        <4e8a36de-a631-f6c9-44d7-7d873f775db2@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> Subject: Re: [PATCH v2] dt-bindings: phy: samsung,ufs-phy: match clock
> items
> 
> On 07/07/2022 08:28, Chanho Park wrote:
> > Below error is detected from dtbs_check. exynos7-ufs-phy is required
> > symbol clocks otherwise only PLL ref clock is required.
> >
> > clock-names: ['ref_clk'] is too short
> >
> > Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Suggested-by: Alim Akhtar <alim.akhtar@samsung.com>
> > Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

No one takes this patch. Could you please pick this patch in your tree?
Thanks.

Best Regards,
Chanho Park

