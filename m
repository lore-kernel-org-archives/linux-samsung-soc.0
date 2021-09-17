Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 048CEC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 17 Sep 2021 00:33:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6BDB61130
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 17 Sep 2021 00:33:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241707AbhIQAfS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 16 Sep 2021 20:35:18 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:16486 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241596AbhIQAfS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Sep 2021 20:35:18 -0400
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20210917003355epoutp04934967fe6afd3e0b40db5438f08a6e04~ldMZTZvqf2026420264epoutp04s
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Sep 2021 00:33:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20210917003355epoutp04934967fe6afd3e0b40db5438f08a6e04~ldMZTZvqf2026420264epoutp04s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1631838835;
        bh=ezRX2eO/DzzCCPiZ8REIobY3IaFhCJexUNSlqzsqieg=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=BHEfnET0g4r0V+Nn/+jUshLwPeBMxrACUBJZaFAtkkbGGoz5Q0cClumf0xT5dI4eC
         a0+Ud2bXKBvi4mTzk1Ud73sezhIK9doM52p+u+nV95rvLWr0scvBYoWJCFtf1AU3uR
         V8Z9ab2+4K55B3v5dw/JNrw3MPY+ppMLRWp38tdA=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20210917003354epcas2p3b6d2c94b7ac5685a7594b780e252b690~ldMYjEnNq1672416724epcas2p3T;
        Fri, 17 Sep 2021 00:33:54 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.186]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4H9Zh06VmQz4x9QG; Fri, 17 Sep
        2021 00:33:52 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        50.87.09816.072E3416; Fri, 17 Sep 2021 09:33:52 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20210917003351epcas2p22d539ff6e5cfbab4a77944afbef0cf76~ldMWFI18s1348013480epcas2p2V;
        Fri, 17 Sep 2021 00:33:51 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210917003351epsmtrp1f5d4f71bbab9c96a01fdb3bc3e1f77c7~ldMWEQzTT3271132711epsmtrp1Y;
        Fri, 17 Sep 2021 00:33:51 +0000 (GMT)
X-AuditID: b6c32a46-63bff70000002658-fc-6143e270ee3f
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        54.57.09091.F62E3416; Fri, 17 Sep 2021 09:33:51 +0900 (KST)
Received: from KORCO039056 (unknown [10.229.8.156]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20210917003351epsmtip2c020abce850cabe1a85ddf3257c74231~ldMV3B0d60416604166epsmtip2P;
        Fri, 17 Sep 2021 00:33:51 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Rob Herring'" <robh@kernel.org>
Cc:     "'Rob Herring'" <robh+dt@kernel.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski@canonical.com>,
        "'Martin K . Petersen'" <martin.petersen@oracle.com>,
        "'Mark Brown'" <broonie@kernel.org>,
        "'James E . J . Bottomley'" <jejb@linux.ibm.com>,
        "'Alim Akhtar'" <alim.akhtar@samsung.com>,
        <devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>
In-Reply-To: <YUNdqnZ2kYefxFUC@robh.at.kernel.org>
Subject: RE: [PATCH v12] dt-bindings: ufs: Add bindings for Samsung ufs host
Date:   Fri, 17 Sep 2021 09:33:51 +0900
Message-ID: <000a01d7ab5b$b00e9bc0$102bd340$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGJ/Jp92TpvhAoxglG1ohsbE35VEwH94E56AkiHA1isIIkFUA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOJsWRmVeSWpSXmKPExsWy7bCmqW7BI+dEg/tzJCwezNvGZjH14RM2
        i/lHzrFaLLqxjcli49sfTBYzzu9jslh+/B+TReveI+wW//fsYHfg9JjV0MvmsWlVJ5vHhEUH
        GD0+Pr3F4tG3ZRWjx+dNcgFsUTk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6hpYW5koK
        eYm5qbZKLj4Bum6ZOUBXKSmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIKDA0L9IoT
        c4tL89L1kvNzrQwNDIxMgSoTcjIuP1vFUjCZqeLG3pmsDYynGLsYOTkkBEwknrf3sXcxcnEI
        CexglHj7cQoLhPOJUeLx3VZWCOcbo8SNNR+YYVre718CldjLKPF831VmCOcFo8T9hWfYQKrY
        BPQlXnZsYwWxRQRUJZpmPWABsZkFXjFJzP6TBWJzChhJHFl2FWyqsICPxPPt84HqOThYgOov
        vbcCCfMKWErc6NjGCGELSpyc+QRqjLzE9rdzoA5SkPj5dBnUKieJ6w/aWSFqRCRmd7aB3SYh
        sJJDYu70v1BPu0i8nfwIyhaWeHV8CzuELSXxsr+NHaKhm1Gi9dF/qMRqRonORh8I217i1/Qt
        YIcyC2hKrN+lD2JKCChLHLkFdRufRMfhv+wQYV6JjjYhiEZ1iQPbp7NA2LIS3XM+s05gVJqF
        5LNZSD6bheSDWQi7FjCyrGIUSy0ozk1PLTYqMEKO7E2M4BSr5baDccrbD3qHGJk4GA8xSnAw
        K4nwXqhxTBTiTUmsrEotyo8vKs1JLT7EaAoM6onMUqLJ+cAkn1cSb2hqZGZmYGlqYWpmZKEk
        zjv3n1OikEB6YklqdmpqQWoRTB8TB6dUA1P5RK9PV0/U3oq07i+dtWN3+bveq3scLLTry1k2
        fTJMF2V/eqIpQH6hU6jWzPQ0yTB/q3WHrrUmPP6UEN/7f4nuLvsFU757O+TU1k23yt7sEOnD
        9S/lmQeny8v+j53nPJ+YRxepMb17JfqMR3GF3yc9mf2TbjwusBKZzeJ7SDtXastrw9//co5K
        9fxRn2hzg8VPrnU3ywauHPPUzYsmtxbPsr2270PuW73SFavcVerSFCSsp2vMTNiwaseEpIo3
        fhtvTe9fGz89cs5J11NTuVKYqtyCtiscFDFsk7rHMLF72bVP0tefrT1fErLf5r4w1/QQ9j/z
        lU/s33nk5ub27ZYmFwOXakb+MmC4surutKdKLMUZiYZazEXFiQB1s1Z7OgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnkeLIzCtJLcpLzFFi42LZdlhJXjf/kXOiwduDShYP5m1js5j68Amb
        xfwj51gtFt3YxmSx8e0PJosZ5/cxWSw//o/JonXvEXaL/3t2sDtwesxq6GXz2LSqk81jwqID
        jB4fn95i8ejbsorR4/MmuQC2KC6blNSczLLUIn27BK6My89WsRRMZqq4sXcmawPjKcYuRk4O
        CQETiff7l7B2MXJxCAnsZpT49fssG0RCVuLZux3sELawxP2WI6wgtpDAM0aJ2b8DQGw2AX2J
        lx3bwOIiAqoSTbMesIDYzALvmCTmzjWDGLqNUeJn+3GwBKeAkcSRZVeZQWxhAR+J59vnAzVz
        cLAANV96bwUS5hWwlLjRsY0RwhaUODnzCQtICbOAnkTbRkaI8fIS29/OYYY4TUHi59NlUCc4
        SVx/0M4KUSMiMbuzjXkCo/AsJJNmIUyahWTSLCQdCxhZVjFKphYU56bnFhsWGOallusVJ+YW
        l+al6yXn525iBMeZluYOxu2rPugdYmTiYDzEKMHBrCTCe6HGMVGINyWxsiq1KD++qDQntfgQ
        ozQHi5I474Wuk/FCAumJJanZqakFqUUwWSYOTqkGJvcChZVTI97eXCywrL6FL0pRNETuvtHV
        st8dim9WL6pOL9v+b1bAnI+aV8SuiE1W5X6S3rRr9t4dE9O7k9LOtAh+vMaiOUdcav8HFp9D
        2tsb7wcwrg9WlZpelGGxw/6h/w6zIxt+5UdMlt/rVsbSkpTPry2/kim6ZML8rrXnSpJ/zDgl
        cDMmfLEKx/EDwlqZ15Z1e7l2/U0T9ZsY6OTnp33DUmDP7ugjTrYBWedW/Ll/voR7YUmmwPQz
        B/x1qqPLPjXUlMXcyf+ZUxma8H+z+kPj3h9nYn+kH452+bda2eP1l+NTVD4dOsH5p3teUO2d
        PH8N7m8P/P5dkTjS9imkM2kdm3yd32rZclPWRbvllViKMxINtZiLihMBONFDZyIDAAA=
X-CMS-MailID: 20210917003351epcas2p22d539ff6e5cfbab4a77944afbef0cf76
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210915111909epcas2p345ed0a47b12d82d67ab28da1d9fd2eb8
References: <CGME20210915111909epcas2p345ed0a47b12d82d67ab28da1d9fd2eb8@epcas2p3.samsung.com>
        <20210915111844.42752-1-chanho61.park@samsung.com>
        <YUNdqnZ2kYefxFUC@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> Applied, thanks!
> 
> 
> Sorry it fell thru the cracks, but it taking a year to notice is not
great.
> If no one cares enough to notice, why are we applying any of it.
> 

Thanks. Take care of the patches next time not to delay :).

Best Regards,
Chanho Park

