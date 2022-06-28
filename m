Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE8FCCA47F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Jun 2022 02:10:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242861AbiF1CKd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Jun 2022 22:10:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242978AbiF1CKb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Jun 2022 22:10:31 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0217720F7E
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jun 2022 19:10:28 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220628021021epoutp016dbe7d947cf1174e6290c76cf4da2f17~8ptrPOlPd1890618906epoutp01f
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jun 2022 02:10:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220628021021epoutp016dbe7d947cf1174e6290c76cf4da2f17~8ptrPOlPd1890618906epoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656382221;
        bh=I0kmB2sonNfdvD15TSklhlyUPKoox/h5ZsBwnkvo0hA=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=Opi/133IbopawAeMOAyp2XosS4Shr0Ap45m47SOgidXH9hrahLnHxmpOANAwp7mLI
         yGgPAc4p2hFmhg9sGkNvowNIhUho0YFSDszrS6bkYJ+krkHD0rzFqAHy/sXWZnR6Nb
         tyzA9zGBpWnxdT0CtwkpeixkWC+JKDHEG2B99O0s=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220628021021epcas2p300af1a6dc6097308ef152b26d12c689a~8ptqyXzdx0432204322epcas2p37;
        Tue, 28 Jun 2022 02:10:21 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.89]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4LX7ND5VGlz4x9QP; Tue, 28 Jun
        2022 02:10:20 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        F8.BF.09642.C036AB26; Tue, 28 Jun 2022 11:10:20 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220628021020epcas2p1bd2856d1266089f3458325a8eb368d97~8ptp5pZc01405314053epcas2p1L;
        Tue, 28 Jun 2022 02:10:20 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220628021020epsmtrp1b590a1640860516003145cf53a21ad90~8ptp4stX-2803728037epsmtrp1x;
        Tue, 28 Jun 2022 02:10:20 +0000 (GMT)
X-AuditID: b6c32a47-5e1ff700000025aa-87-62ba630ca65d
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        96.6C.08802.C036AB26; Tue, 28 Jun 2022 11:10:20 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20220628021020epsmtip158279dacd5e0ed805d54c6d722bac6f5~8ptptrmoC0151401514epsmtip1e;
        Tue, 28 Jun 2022 02:10:20 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
        "'Tomasz Figa'" <tomasz.figa@gmail.com>,
        "'Chanwoo Choi'" <cw00.choi@samsung.com>,
        "'Stephen Boyd'" <sboyd@kernel.org>,
        "'Michael Turquette'" <mturquette@baylibre.com>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski+dt@linaro.org>
Cc:     "'Alim Akhtar'" <alim.akhtar@samsung.com>,
        <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <6d7b0ea7-7918-aea4-6f2f-46d4870d92ad@linaro.org>
Subject: RE: [PATCH 2/3] clk: samsung: exynosautov9: add missing gate clks
 for peric0/c1
Date:   Tue, 28 Jun 2022 11:10:20 +0900
Message-ID: <000301d88a94$37aa7320$a6ff5960$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKRjrizqP7u4/W7V2kR1MW1BABg2wFaqCZ/AYeCDSgCssawp6vFYqaQ
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLJsWRmVeSWpSXmKPExsWy7bCmhS5P8q4kg2s/tSwezNvGZnH9y3NW
        i/lHzrFa9L14yGyx9/VWdotNj6+xWnzsucdqMeP8PiaLi6dcLVr3HmG3OPymndXi37WNLBar
        dv1hdOD1eH+jld1j56y77B6bVnWyedy5tofNY/OSeo++LasYPT5vkgtgj8q2yUhNTEktUkjN
        S85PycxLt1XyDo53jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXLzAE6VkmhLDGnFCgUkFhcrKRv
        Z1OUX1qSqpCRX1xiq5RakJJTYF6gV5yYW1yal66Xl1piZWhgYGQKVJiQnXF82l22glMsFT93
        32BvYLzO3MXIySEhYCLx8dxppi5GLg4hgR2MEp+6X7BAOJ8YJe71dLFDOJ8ZJTbcXwhUxgHW
        8mdzEUR8F6NEy48vjBDOC0aJhau2s4HMZRPQl3jZsY0VJCEi0MwssXfHbrAqZoGdjBKXVixh
        B6niFLCTaDz4FuwSYYEoifnPp4LFWQRUJU72dbCBrOMVsJQ4tEwGJMwrIChxcuYTFhCbWUBb
        YtnC11BPKEj8fLqMFcQWEXCTWPh7MxNEjYjE7M42ZpC9EgJXOCRWHepgh3jBRWLjY2GIXmGJ
        V8e3sEPYUhIv+9ug7GKJpbM+MUH0NjBKXN72iw0iYSwx61k7I8gcZgFNifW79CFGKkscuQV1
        Gp9Ex+G/UJt4JTrahCAa1SUObJ/OAmHLSnTP+cw6gVFpFpLHZiF5bBaSB2Yh7FrAyLKKUSy1
        oDg3PbXYqMAYHtnJ+bmbGMHpWMt9B+OMtx/0DjEycTAeYpTgYFYS4V14ZmeSEG9KYmVValF+
        fFFpTmrxIUZTYEhPZJYSTc4HZoS8knhDE0sDEzMzQ3MjUwNzJXFer5QNiUIC6YklqdmpqQWp
        RTB9TBycUg1MGvL23N7X1f/kTtv98OS2CdOFP3zzfVa85ZmKs72NmDa3pe789Yd8/j1fLcsU
        8H2p1+UVCTPMPe5F33BKjP/A4zatVW/jltP7Pk9ad475io/f3bluy5jtJ67m/ObTVvLQPqY5
        +uuVo2yJk7wPJGS5cnze+jNEKF449vnTLadNWZc/veo4c09gELvM5YB7xxOkX2k3CBjdyz5o
        YHAxSUDfYKkY/6c/L+I4Z3Gvesq67efOi9Ptnr6NORf2Vpmh5fNl4xhu99q/Is7cK7aefBFy
        fM3C8nY92fNHDPay1FyY2HGJx/vOJe5Ver92BLlKLuUrDH9p7hzPbOCr3sWp2p/mH2KeP3v7
        hLxA/r8SrwuPKrEUZyQaajEXFScCAG++bDtQBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsWy7bCSnC5P8q4kg90nuCwezNvGZnH9y3NW
        i/lHzrFa9L14yGyx9/VWdotNj6+xWnzsucdqMeP8PiaLi6dcLVr3HmG3OPymndXi37WNLBar
        dv1hdOD1eH+jld1j56y77B6bVnWyedy5tofNY/OSeo++LasYPT5vkgtgj+KySUnNySxLLdK3
        S+DKaO/5zFKwj6Xi7plJTA2Mp5m7GDk4JARMJP5sLupi5OIQEtjBKHHz1GGmLkZOoLisxLN3
        O9ghbGGJ+y1HWCGKnjFKnLzcBZZgE9CXeNmxjRXEFhFoZ5Y4c5MdpIhZYC+jxJQDi6E6PjNK
        TOrYBDaWU8BOovHgW2YQW1ggQuL8kXVg3SwCqhIn+zrYQE7iFbCUOLRMBiTMKyAocXLmExYQ
        m1lAW6L3YSsjjL1s4WtmiOsUJH4+XQZ1hJvEwt+bmSBqRCRmd7YxT2AUnoVk1Cwko2YhGTUL
        ScsCRpZVjJKpBcW56bnFhgVGeanlesWJucWleel6yfm5mxjBsamltYNxz6oPeocYmTgYDzFK
        cDArifAuPLMzSYg3JbGyKrUoP76oNCe1+BCjNAeLkjjvha6T8UIC6YklqdmpqQWpRTBZJg5O
        qQYmhzr11fserH92MDZ94/Ff76Iavv/9+2z5eYuoZ/UnJ0c8mbowXTLwootttVjdBfctK4US
        Uya7VntYnbOe+Wzzk5CQNDvelz8uP3eceUxYdpnv1VV7lkdIbmw4uGbhoU/6Cd5OyUcePz7S
        +Ca0c+OTHZp7U8ViF++S2ud6NV79+ImUjPSqOe/zzpstVeCuf8wotSPCKu24340F/CcrU5yZ
        W/jXH2SomFXZ/mOrgK+Lk0TcnonCJwzuX3QN+GufMvexxw8ZrkuTZbfzcBol9gb9/XNGf9Gl
        MMdATsVNK+L+sJ25sdX0ofkpt8lWagq3H3xo4+7baXKIdcWMjTl8k+9tK+N4H8/mdvjlLvFZ
        U03v+SixFGckGmoxFxUnAgDcUXJXPAMAAA==
X-CMS-MailID: 20220628021020epcas2p1bd2856d1266089f3458325a8eb368d97
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220627005413epcas2p37d6b3cbea055cecade47ad304b40b7e3
References: <20220627005210.6473-1-chanho61.park@samsung.com>
        <CGME20220627005413epcas2p37d6b3cbea055cecade47ad304b40b7e3@epcas2p3.samsung.com>
        <20220627005210.6473-3-chanho61.park@samsung.com>
        <6d7b0ea7-7918-aea4-6f2f-46d4870d92ad@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> Subject: Re: =5BPATCH 2/3=5D clk: samsung: exynosautov9: add missing gate=
 clks
> for peric0/c1
>=20
> On 27/06/2022 02:52, Chanho Park wrote:
> > =22gout_peric0_pclk_1=22 and =22gout_peric1_pclk_1=22 should be added t=
o
> > peric0 and peric1 respectively.
>=20
> Where is exactly the bug? The commit msg suggests that they were added to
> different block, but there is no code removal.

I thought they should be added from previous patch because clock IDs were e=
xisting without implementations.
I can drop fixes tags next patchset.

Best Regards,
Chanho Park

