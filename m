Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE83CC43334
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 24 Jul 2022 23:58:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbiGXX66 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 24 Jul 2022 19:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiGXX65 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 24 Jul 2022 19:58:57 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DA01D10B
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Jul 2022 16:58:53 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220724235846epoutp02f4bcced667a1ac3f82a30d7a45ec47fa~E6VfcGEkh2813928139epoutp02D
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Jul 2022 23:58:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220724235846epoutp02f4bcced667a1ac3f82a30d7a45ec47fa~E6VfcGEkh2813928139epoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1658707126;
        bh=YTD7vE7C4XDrlp7slEr/keN8HZzLwV7B3/QdVgFYey0=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=BVEGxZqz7DP8lMGqEip+G2lUYdhI6JdccMlFgr2BQfQkIzMettw9eYUmBAhFKQAWR
         vVL0mNj6lfrZwW/G7+NVJrWew/KJPRTs54J0Bchnr6eqt7Rq8wCVxgd/plb5pvH3yg
         QPY9xIfhOSyyiX2pqTS8N9FJ+yWpU9y6wO3o0lNQ=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220724235845epcas2p41e8b26cd56d069fac1dd4d6c60753b00~E6Ve-nQEo0549205492epcas2p4K;
        Sun, 24 Jul 2022 23:58:45 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.88]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4Lrg9x3QpSz4x9QC; Sun, 24 Jul
        2022 23:58:45 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        18.02.09662.5BCDDD26; Mon, 25 Jul 2022 08:58:45 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220724235845epcas2p3b2c42309e23b97f22e8a1627a2dfa380~E6VeNGUOB0613406134epcas2p3f;
        Sun, 24 Jul 2022 23:58:45 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220724235845epsmtrp2f58059782d0962a4f1414cd8acd5bfcd~E6VeMG-Rw2016020160epsmtrp2J;
        Sun, 24 Jul 2022 23:58:45 +0000 (GMT)
X-AuditID: b6c32a48-9e1ff700000025be-20-62dddcb5cc2f
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        EC.35.08802.4BCDDD26; Mon, 25 Jul 2022 08:58:44 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20220724235844epsmtip2e43d65646d5825f8a65d7031ff72ccfd~E6VeA99nW3171131711epsmtip2n;
        Sun, 24 Jul 2022 23:58:44 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski+dt@linaro.org>,
        "'Rob Herring'" <robh+dt@kernel.org>
Cc:     "'Alim Akhtar'" <alim.akhtar@samsung.com>,
        <devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vkoul@kernel.org>
In-Reply-To: <454232b3-2f98-c3ca-4661-5e9eb51998b6@linaro.org>
Subject: RE: [PATCH v2] dt-bindings: phy: samsung,ufs-phy: match clock items
Date:   Mon, 25 Jul 2022 08:58:44 +0900
Message-ID: <000001d89fb9$4ee00520$eca00f60$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHV3QSQuq8xDUpaM4gkOLovBVHrtwKGjBkSAuFvB7wBFMno9wGyaUY4rVI+SMA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLJsWRmVeSWpSXmKPExsWy7bCmhe7WO3eTDK4+kLR4MG8bm8X8I+dY
        LfpePGS22Pt6K7vFpsfXWC1mnN/HZNG69wi7xc47J5gdODw2repk87hzbQ+bx+Yl9R59W1Yx
        enzeJBfAGpVtk5GamJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuW
        mQN0ipJCWWJOKVAoILG4WEnfzqYov7QkVSEjv7jEVim1ICWnwLxArzgxt7g0L10vL7XEytDA
        wMgUqDAhO2PdqQ8sBT0sFS9vnWZrYJzM3MXIySEhYCJxuvkAWxcjF4eQwA5GiW2f30E5nxgl
        7l3+yAzhfGaUWL91CiNMy7ydcxkhErsYJf48a2GCcF4wStz+tYIJpIpNQF/iZcc2VpCEiMBi
        Rom+yx/BBjMLbGCUWPW0GayKU8BO4t2vb2C2sICPxOxPl9hAbBYBVYmr3/aAncgrYCkxrX0r
        I4QtKHFy5hMWEJtZQF5i+9s5UG8oSPx8uowVxBYR8JNY3LWdEaJGRGJ2ZxtUzVwOifOHUiFs
        F4mbjxug/hGWeHV8CzuELSXx+d1eNgi7WGLprE9gr0kINDBKXN72CyphLDHrWTtQMwfQAk2J
        9bv0QUwJAWWJI7egTuOT6Dj8lx0izCvR0SYE0agucWD7dBYIW1aie85n1gmMSrOQPDYLyWOz
        kDwwC2HXAkaWVYxiqQXFuempxUYFJvDoTs7P3cQITqdaHjsYZ7/9oHeIkYmD8RCjBAezkghv
        V9rtJCHelMTKqtSi/Pii0pzU4kOMpsCgnsgsJZqcD0zoeSXxhiaWBiZmZobmRqYG5krivF4p
        GxKFBNITS1KzU1MLUotg+pg4OKUamJazfeDeuvt/ydGcZbvSXi16sjTOY9V5Tte9lyvvcm2z
        Zln/bvesnWoGZx6+WLTQSqJ9653Ne879u1N/V+Nw3SU28YO7JrxvypJnmvRJ4sOSJSlbDp9U
        2qgd8NNn8+2D9qJ8kfGL1G8olL5//DpB7qLFZMPZYjf2LQpl+W+Vljhr1fJDfA9mzk+JDS9v
        81mbstW9+oHRBn53VY07bDN8tjPoV/mvXtfh9PzIsdKbJ1grMq+XhuSvKMyovmGwV8P/sKT+
        zGL9L6myzL/tND9/NLv5YPqbZd0vP+cXH7/W6epaf8Tgxr8k1RM8ca+2fc5nYbmvvLrVpCmx
        l0nXvmuCm//0G2m8iyQrZWfOC1jyXG2dEktxRqKhFnNRcSIAGaXm5jAEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42LZdlhJXnfLnbtJBq9aLCwezNvGZjH/yDlW
        i74XD5kt9r7eym6x6fE1VosZ5/cxWbTuPcJusfPOCWYHDo9NqzrZPO5c28PmsXlJvUffllWM
        Hp83yQWwRnHZpKTmZJalFunbJXBlrDv1gaWgh6Xi5a3TbA2Mk5m7GDk5JARMJObtnMsIYgsJ
        7GCUWH4hHSIuK/Hs3Q52CFtY4n7LEdYuRi6gmmeMEl3TP4M1sAnoS7zs2AaWEBFYzChxcPs8
        JhCHWWALo8Saq+uZIVoWM0lcnn+fFaSFU8BO4t2vb0wgtrCAj8TsT5fYQGwWAVWJq9/2gN3E
        K2ApMa19KyOELShxcuYTFhCbWUBb4unNp1C2vMT2t3OgflCQ+Pl0Gdh8EQE/icVd2xkhakQk
        Zne2MU9gFJ6FZNQsJKNmIRk1C0nLAkaWVYySqQXFuem5xYYFRnmp5XrFibnFpXnpesn5uZsY
        wbGlpbWDcc+qD3qHGJk4GA8xSnAwK4nwdqXdThLiTUmsrEotyo8vKs1JLT7EKM3BoiTOe6Hr
        ZLyQQHpiSWp2ampBahFMlomDU6qB6dSztDPhiwymXhQR9T53vMJWZeIitq2Zz3b/YPHS1/vk
        /PPMhi6Vv1mbfv5WztepPBS+5J3N9pvssSy2PucKK3KP7EtbPuuNzBWTtxoa3BPybf6dncd1
        u+Xyqhf9AlenvEkub5R8sZ8l2Vn+8cd7Jyurd7VclzBYLndvRe3Thr82oU8Koh6rV1m3KBcY
        T96dVFTCFRu/cecDv2mFso6BVvUnAvwf/xZXfF83WWYl2y09d2kdlWpeprV/ixPuXlt1UX6d
        fGjIlScVOS4/27f15t+ZavRQvHtl984nXs/fbdT8yNT3PPFEwpStzocaZ4m9910lypVUOONo
        kZrwRYfTq8vkTpqt4Nnipazbbr3yjRJLcUaioRZzUXEiANFUU68cAwAA
X-CMS-MailID: 20220724235845epcas2p3b2c42309e23b97f22e8a1627a2dfa380
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
        <001b01d89d69$37d80320$a7880960$@samsung.com>
        <454232b3-2f98-c3ca-4661-5e9eb51998b6@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >
> > Hi Krzysztof,
> >
> > No one takes this patch. Could you please pick this patch in your tree?
> > Thanks.
> 
> You did not send it to PHY maintainers... The bindings go via subsystem
> maintainers.
> 
> If Vinod doesn't want it, I could take it, but he never had a chance to
> say :)
> 
> Please resend.

Oh, maybe I missed him due to not showing from get_maintainer.pl script.
I'll resend this.

Best Regards,
Chanho Park

