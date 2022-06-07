Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B77C43334
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 05:21:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbiFGFVf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 01:21:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbiFGFVd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 01:21:33 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F9ED02A8
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jun 2022 22:21:30 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220607052127epoutp0188c010fffd90311333be86f71eff0549~2PxiOCFgo2312123121epoutp01f
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 05:21:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220607052127epoutp0188c010fffd90311333be86f71eff0549~2PxiOCFgo2312123121epoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654579287;
        bh=LB2auJmBtTLVYXCh5D6qfKi+uNKo6zHdvkJJveYK4Tg=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=PXEOykjj2+QUmDn4nen7zHMVF5m9vEdubSTu3Aj8QRl9HO7XGjwcIRsTbJj1HmDis
         /uTDAGL4RiXre2/Cvuqo0vFSVhDhVMhGUK0tLOo7f8ZW5F21/noMGLf2CWE6XtQBTN
         ZfyvFFhyfgspU8um1XM8hZD43sBVc6TLW3qYM6nY=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220607052127epcas2p1b337d1af63ad3dcfa8476a07807cfe5d~2PxhfocPY0944209442epcas2p1y;
        Tue,  7 Jun 2022 05:21:27 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.100]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4LHJcQ0dq3z4x9Q5; Tue,  7 Jun
        2022 05:21:26 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        79.89.10069.550EE926; Tue,  7 Jun 2022 14:21:25 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220607052125epcas2p174d43bb4ba28a6773dc8c69770ed7f0e~2PxgI_ssd0944209442epcas2p1w;
        Tue,  7 Jun 2022 05:21:25 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220607052125epsmtrp1c20594051b572073db39c908d134a590~2PxgIPl-Y2655426554epsmtrp1e;
        Tue,  7 Jun 2022 05:21:25 +0000 (GMT)
X-AuditID: b6c32a45-a8fff70000002755-ae-629ee0555898
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        E6.19.11276.550EE926; Tue,  7 Jun 2022 14:21:25 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20220607052125epsmtip2ded366bfdba23dc963e745e704ea0acf~2Pxf58onT1711717117epsmtip2w;
        Tue,  7 Jun 2022 05:21:25 +0000 (GMT)
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
In-Reply-To: <c86cb9c3-5fac-a990-f4cf-5aa8e4fe8a75@linaro.org>
Subject: RE: [PATCH v2 4/6] arm64: dts: exynosautov9: adjust DT style of ufs
 nodes
Date:   Tue, 7 Jun 2022 14:21:25 +0900
Message-ID: <000001d87a2e$6ed35ea0$4c7a1be0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLWkTnA63V9WykH3rm22/0hqLdk6gDwbtfQAjlpnFUCvbOT26sX/Wew
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDJsWRmVeSWpSXmKPExsWy7bCmuW7og3lJBnO3W1k8mLeNzWL+kXOs
        Fhee9rBZ9L14yGyx9/VWdotNj6+xWkxY9Y3FYsb5fUwWrXuPsFvsvHOC2YHLY9OqTjaPO9f2
        sHlsXlLv0bdlFaPH8RvbmTw+b5ILYIvKtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0
        tDBXUshLzE21VXLxCdB1y8wBukxJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2Be
        oFecmFtcmpeul5daYmVoYGBkClSYkJ3R/nEfS8Fa9oozdzczNzA2sXUxcnJICJhI7P3VyN7F
        yMUhJLCDUeLWtxmMEM4nRolf03czQTjfGCWmXe9hh2mZO/03K0RiL6PE6fUzmSGcF4wSk45M
        AxvMJqAv8bJjG1iViMB8JomnnVeZQBLMAhMYJVZ+8gaxOQXsJM6tvMsCYgsLhEh8ur0ErIZF
        QEViy9ZDYDavgKVE6/19jBC2oMTJmU9YIOZoSyxb+JoZ4iQFiZ9Pl7GC2CICbhLb+hqYIWpE
        JGZ3toFdJyGwkkNiYucfRogGF4mOGXNYIGxhiVfHt0D9JiXxsr8Nyi6WWDrrExNEcwOjxOVt
        v6BhZiwx61k70CAOoA2aEut36YOYEgLKEkduQd3GJ9Fx+C87RJhXoqNNCKJRXeLA9ulQW2Ul
        uud8Zp3AqDQLyWezkHw2C8kHsxB2LWBkWcUollpQnJueWmxUYAiP7uT83E2M4GSr5bqDcfLb
        D3qHGJk4GA8xSnAwK4nw+k+emyTEm5JYWZValB9fVJqTWnyI0RQY1hOZpUST84HpPq8k3tDE
        0sDEzMzQ3MjUwFxJnNcrZUOikEB6YklqdmpqQWoRTB8TB6dUA1OZREfnqYsskrrpx6z7Khqe
        SU1xLDxfImDExuvWvLI2g52ZvX3lvjtX/A5siD+5zPrNwdqfMnXRLwRCFba9cpswLXO/mq/d
        cv6V/1awc9kLH9a9OXdHo7T36816Xy8Wvb91fvnteaumTbOepn573ZnPbyfcyORVsOvRfNbw
        S2rXEha2+Sr9XrtX/sq56jpNoKpjtoJJddyzAwHZE6/H1zPVGvGy5/nMKS94LRjL8qs4+sit
        o+/nv/0o1dJacf3hM6Otdns/fH6gMbX72/vN4UftlQ8vuez3sjZEagV7s7fWF9n1Vcarsred
        qJZjfpaVrt5t+mhDOnfB5ZbXew+wlmzcoNZkuq7x+J/zrIevXTqgxFKckWioxVxUnAgAACaQ
        bT8EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsWy7bCSvG7og3lJBjO/SVo8mLeNzWL+kXOs
        Fhee9rBZ9L14yGyx9/VWdotNj6+xWkxY9Y3FYsb5fUwWrXuPsFvsvHOC2YHLY9OqTjaPO9f2
        sHlsXlLv0bdlFaPH8RvbmTw+b5ILYIvisklJzcksSy3St0vgyrh38QtrwVL2ive/mlkaGL+x
        djFyckgImEjMnf4byObiEBLYzSgx5eBvqISsxLN3O9ghbGGJ+y1HoIqeMUosvnUCLMEmoC/x
        smMbWEJEYDGTRP+Js2wgDrPAFEaJy1dfskC0fGWUOHv2HFgLp4CdxLmVd1lAbGGBIImflw4x
        gtgsAioSW7YeYgKxeQUsJVrv72OEsAUlTs58AlbPLKAt8fTmUzh72cLXzBD3KUj8fLoM7G4R
        ATeJbX0NzBA1IhKzO9uYJzAKz0IyahaSUbOQjJqFpGUBI8sqRsnUguLc9NxiwwLDvNRyveLE
        3OLSvHS95PzcTYzg2NPS3MG4fdUHvUOMTByMhxglOJiVRHj9J89NEuJNSaysSi3Kjy8qzUkt
        PsQozcGiJM57oetkvJBAemJJanZqakFqEUyWiYNTqoGpLkkvseDvnSAJlcTXvdcbM7KYbzvG
        Ht7bt/Xo9FM1pcYz1Bnv/N7Y2LS6a+NGKZMazvsNL4SVFIXkzl6JEVTSbd8cZVvqUVP/msFL
        2CJJ4emOgMvLq+W0/f2ag61fGN85ebnaQSKztspk5jQt7TDxFW0bPhjzz2xy1WQ+ER3vcGlZ
        gVNP40YDMz23BfuS3u8vtj7utsan5+fqpLYcDY1c9xnaGjKFL1mun+6+soh7+fxunrTXeUWL
        Hjif3zgj/6Zs98u/Act99bUk1molufD9XS+X9Iz7z+0E0608snO6dy7ZGd2zmUdakXNZp9Sk
        q5MdJ/f8Veh0YJCdze7mX9u/vOb/J5H8m2vr5tzSUmIpzkg01GIuKk4EAI7fq6UsAwAA
X-CMS-MailID: 20220607052125epcas2p174d43bb4ba28a6773dc8c69770ed7f0e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220602053329epcas2p407039a6087b6c460d6687b1cc1f3872a
References: <20220602053250.62593-1-chanho61.park@samsung.com>
        <CGME20220602053329epcas2p407039a6087b6c460d6687b1cc1f3872a@epcas2p4.samsung.com>
        <20220602053250.62593-5-chanho61.park@samsung.com>
        <c86cb9c3-5fac-a990-f4cf-5aa8e4fe8a75@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> Subject: Re: =5BPATCH v2 4/6=5D arm64: dts: exynosautov9: adjust DT style=
 of
> ufs nodes
>=20
> On 02/06/2022 07:32, Chanho Park wrote:
> > Drop =22ufs0-=22 label name usage of ufs phy and hci nodes.
> > Regarding the comments of reg properties, we don't need to illustrate
> > here because we can find the description from the dt-binding doc.
> >
> > Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> > Signed-off-by: Chanho Park <chanho61.park=40samsung.com>
>=20
> This does not apply. Can you rebase and send the DTS patches as separate
> patchset?

I forgot to point the baseline of this patchset. I stacked this patch on to=
p of below patch.
If you do not apply below patch or put this separate branch, I'll rebase th=
is patchset without below patch.

https://lore.kernel.org/linux-samsung-soc/20220526204323.832243-1-krzysztof=
.kozlowski=40linaro.org/

Best Regards,
Chanho Park

