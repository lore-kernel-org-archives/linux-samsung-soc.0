Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD77CCA481
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 06:49:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231173AbiFGGtD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 02:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237290AbiFGGtB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 02:49:01 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 473D15F8DD
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jun 2022 23:48:56 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220607064854epoutp01767f951f1fe343d23f08c41423a3d459~2Q94mjU9o0885808858epoutp01A
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 06:48:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220607064854epoutp01767f951f1fe343d23f08c41423a3d459~2Q94mjU9o0885808858epoutp01A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654584534;
        bh=epgGBSZEzRa1cyyYp5tq47GPvwjgPjVT1Q2XRWqWbWo=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=EDfXrL8AP4jRIfowpko3c5n2imSWuXR/EApnhzECDkiV5ySuG2QRBlhTAOMvjkzvp
         SuAQY9onPOHk67wMqMA07vGb20lA1XsKbrgZo19SFhcrlLwD/44lHRhXpJVODYLi+I
         BIfKXC/fe27/pIBTpJkKXG7A43UtqAsbhjhpB+ic=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220607064853epcas2p46982884fb0c80c80cf3ccd17919a4a77~2Q93U6e6G0671806718epcas2p4T;
        Tue,  7 Jun 2022 06:48:53 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.88]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4LHLYH6nXvz4x9QC; Tue,  7 Jun
        2022 06:48:51 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        FE.5F.09764.3D4FE926; Tue,  7 Jun 2022 15:48:51 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220607064851epcas2p2ede54f5bb25ab53eed6d96fab375cca3~2Q91f7bEC2054420544epcas2p2f;
        Tue,  7 Jun 2022 06:48:51 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220607064851epsmtrp23e961a040d8e4aa7934dadcb57522718~2Q91fEAHo3073930739epsmtrp2B;
        Tue,  7 Jun 2022 06:48:51 +0000 (GMT)
X-AuditID: b6c32a46-f8bff70000002624-a0-629ef4d31fd2
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        B1.92.11276.2D4FE926; Tue,  7 Jun 2022 15:48:50 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20220607064850epsmtip121ae99a8ba1a08b1a66dd656f0ea36e8~2Q91NjkX_1664016640epsmtip17;
        Tue,  7 Jun 2022 06:48:50 +0000 (GMT)
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
In-Reply-To: <2fad1706-563d-72c3-eab2-5f464bf92681@linaro.org>
Subject: RE: [PATCH v2 4/6] arm64: dts: exynosautov9: adjust DT style of ufs
 nodes
Date:   Tue, 7 Jun 2022 15:48:50 +0900
Message-ID: <011101d87a3a$a56b3cb0$f041b610$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLWkTnA63V9WykH3rm22/0hqLdk6gDwbtfQAjlpnFUCvbOT2wIRVVTpAbRdZlSq+eiMoA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNJsWRmVeSWpSXmKPExsWy7bCmue7lL/OSDPoXGVg8mLeNzWL+kXOs
        Fhee9rBZ9L14yGyx9/VWdotNj6+xWkxY9Y3FYsb5fUwWrXuPsFvsvHOC2YHLY9OqTjaPO9f2
        sHlsXlLv0bdlFaPH8RvbmTw+b5ILYIvKtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0
        tDBXUshLzE21VXLxCdB1y8wBukxJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2Be
        oFecmFtcmpeul5daYmVoYGBkClSYkJ0xZ/401oLtzBU39u9hbWB8xdTFyMkhIWAi0ThxBnMX
        IxeHkMAORomdu/czQTifGCXaNsxjhXC+MUqceL2LFabl+JPtUIm9jBL/lp5nhHBeMEq83PSa
        GaSKTUBf4mXHNrAqEYH5TBJPO6+CbWQWmMAosfKTN4jNKWAn8WvCREYQW1ggROLT7SVANRwc
        LAIqEvfni4OEeQUsJXafvs0CYQtKnJz5hAVijLbEsoUQuyQEFCR+Pl0Gdp2IQJjE5VPrWSFq
        RCRmd7aBPSchsIVD4smmB1ANLhJzm65AQ0BY4tXxLewQtpTE53d72SDsYomlsz4xQTQ3MEpc
        3vYLKmEsMetZOyPIocwCmhLrd+mDmBICyhJHbkHdxifRcfgvO0SYV6KjTQiiUV3iwPbpLBC2
        rET3nM+sExiVZiH5bBaSz2Yh+WAWwq4FjCyrGMVSC4pz01OLjQqM4LGdnJ+7iRGcarXcdjBO
        eftB7xAjEwfjIUYJDmYlEV7/yXOThHhTEiurUovy44tKc1KLDzGaAoN6IrOUaHI+MNnnlcQb
        mlgamJiZGZobmRqYK4nzeqVsSBQSSE8sSc1OTS1ILYLpY+LglGpgap2dK7qp7N3RJv/Z5R5b
        Fsqe7X656SyXH0fZxnVp8189n8feV5x6pM37kLzw5ttu7i0mye/CHyq4/Fy/qDBE7kbbhZhJ
        y7SCw6JlDpp9C20NfjLx1/6f9p2/Upcuzl590cdOSujz77Xfe/19pOXWatra/kliYjxxrT/q
        dNsyXneXIzs+7XrrWnLvI7uo6mURyWl2a6vl9jdN3Xk3252pi+FwZpWVTERButolS98zRu6N
        cgl6Bk8VLq1kqa+ZcHr2i9ppN5bP2ZNx5+kbx/REr4MiOvvvm8y7Ud6143LUwnK55TdrNLnj
        yx7Pbv7ZWpltFKEjuGnC416+9jkuP29N2p15SrDCK3+T4ebqS0yuSizFGYmGWsxFxYkAUUXd
        Bj4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRmVeSWpSXmKPExsWy7bCSnO6lL/OSDNZNtrF4MG8bm8X8I+dY
        LS487WGz6HvxkNli7+ut7BabHl9jtZiw6huLxYzz+5gsWvceYbfYeecEswOXx6ZVnWwed67t
        YfPYvKTeo2/LKkaP4ze2M3l83iQXwBbFZZOSmpNZllqkb5fAlbHo4GTmgm3MFVtf3mNtYHzO
        1MXIySEhYCJx/Ml21i5GLg4hgd2MEu2d21ggErISz97tYIewhSXutxyBKnrGKNG64xIzSIJN
        QF/iZcc2sISIwGImif4TZ9lAHGaBKYwSl6++ZIFoucok8e38azaQFk4BO4lfEyYygtjCAkES
        Py8dArI5OFgEVCTuzxcHCfMKWErsPn2bBcIWlDg58wmYzSygLfH05lM4e9nC18wQ5ylI/Hy6
        jBXEFhEIk7h8aj0rRI2IxOzONuYJjMKzkIyahWTULCSjZiFpWcDIsopRMrWgODc9t9iwwDAv
        tVyvODG3uDQvXS85P3cTIzjytDR3MG5f9UHvECMTB+MhRgkOZiURXv/Jc5OEeFMSK6tSi/Lj
        i0pzUosPMUpzsCiJ817oOhkvJJCeWJKanZpakFoEk2Xi4JRqYDKadimmT/rO2ttvTRy2mO/d
        YyKb8iX6yZ0W2ftb5P5utfk6765hmdxW4ct5Spxxc7X+/JrIm1lsLi8qsq3jxpzMI08bOo4/
        c138wKRK/ltDOFOnrTvr1Elx8XxPObc4z9iU7trwSyjwbvHBdHGt87xJvQdczbtWy+090fRS
        WV5FI99G/v6HoMJbcpdyk7uXKNXOuL9Gri9vz9cHD9e01/Rub1aQC/RzOZ+/xoc7aeHsirLE
        J9Mv7apu2nIrcsoTvkqD97lOHQzXS3euu9R6veV3rOYdy5epzZsFo46bzXGYq5rEEpOnWXbu
        StG+Sf8CN696EDPLXTbwtumFwKMVsZfOvtJfklL3dqfM57eeBUosxRmJhlrMRcWJAG+O8oEr
        AwAA
X-CMS-MailID: 20220607064851epcas2p2ede54f5bb25ab53eed6d96fab375cca3
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
        <000001d87a2e$6ed35ea0$4c7a1be0$@samsung.com>
        <2fad1706-563d-72c3-eab2-5f464bf92681@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> Oh, thanks=21 Unfortunately it helped for the patch =234 (first of DTS) b=
ut
> not for the next one. Maybe some other patch caused the hunks to differ.
> Please rebase remaining two DTS patches.

Looks like they're conflicted with watchdog patches.
I'll rebase rest two patches on top of your next/dt64 branch.
https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/log/?h=3Dnex=
t/dt64

Best Regards,
Chanho Park

