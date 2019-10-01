Return-Path: <SRS0=5wrF=X2=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94211ECE587
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 16:09:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 658CD21906
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 16:09:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="OzBe6rYt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730281AbfJAQJQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Oct 2019 12:09:16 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:43728 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbfJAQJP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 12:09:15 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20191001160914euoutp010df0080f67bcb4e3a5f9504619730114~JkbW6KZAB0806408064euoutp01y
        for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Oct 2019 16:09:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20191001160914euoutp010df0080f67bcb4e3a5f9504619730114~JkbW6KZAB0806408064euoutp01y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1569946154;
        bh=0iXMcbO5zbECgDnWNZ06BqtYV9m9VlieFlQ6pOPEbvA=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=OzBe6rYt5XCT0stjr5ugyXUZJPiZlu4PWOWyn3H3KQTrSugx2+lS0A+eEYTIg5VnE
         A7/fVyDJMvGQeWkw/5DDRHEUux+iFx2k9O0o0FBH2tUnosJVSI7E0Tdtl/levzNTT6
         qFjO5OGQ/OVeV+aNvEHe7nNkBKbjwQpfsCeAyBLw=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191001160914eucas1p278f9a0f55b635d74feeb1c0e4117d6e1~JkbWrWueW2183421834eucas1p2Z;
        Tue,  1 Oct 2019 16:09:14 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 9F.B8.04309.A2A739D5; Tue,  1
        Oct 2019 17:09:14 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191001160913eucas1p1ce452b9fe9bfa44843438a67a7822a57~JkbV_BVvv2988729887eucas1p1E;
        Tue,  1 Oct 2019 16:09:13 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191001160913eusmtrp2acb5fb911c2b830ef6a7bb3f1d64291c~JkbV9V3dx1352113521eusmtrp2s;
        Tue,  1 Oct 2019 16:09:13 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-b1-5d937a2a24e6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 27.F6.04166.92A739D5; Tue,  1
        Oct 2019 17:09:13 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191001160913eusmtip28cac83a3c5e49e10aa8353c3e73e9d70~JkbVUfWlO1030610306eusmtip2I;
        Tue,  1 Oct 2019 16:09:13 +0000 (GMT)
Subject: Re: [PATCH v3 RESEND 3/3] ASoC: samsung: Rename Arndale card driver
To:     broonie@kernel.org
Cc:     krzk@kernel.org, lgirdwood@gmail.com,
        ckeepax@opensource.cirrus.com, sbkim73@samsung.com,
        alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <4baf2a0d-f0b3-579c-365c-2948e7c841c9@samsung.com>
Date:   Tue, 1 Oct 2019 18:09:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001123625.19370-3-s.nawrocki@samsung.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjuO5ftuFp8ztvLkoqxP0U3JehAIkWBEwqkfhSF1ClPGrkpO2rO
        ytRu3tJKa+s0yUuwGl10VmoXrU03TdgUTBSzC0mhIIYbQRSutlPkv+d53ud93+95+RhS5abV
        zHFDHm80cNkamYJ66v7hXb+2qC59U+W8mh0ZdhJsm+URzV7/NCVjRy44EOvztcrZ7yPlBOv4
        PEqzFl83wT7onZSz/rkemh2+GyC2LdW1+stkui5xUq5z2CtkuvY7Z3VmaxDpah7bkc7vWJkm
        P6BIyuCzjxfwxo3JhxVZlzpjcr1Eoc0yKCtB9UQlimAAbwbxRhVViRSMCt9F0DgukhIJILhf
        2y2TiB/B4Plzf2xMuKXegyXdhuChd4AOjVLhWQS3XIqQJwrvgjafKSRH41iYsFaEh5K4gYBp
        ew8ZKshwAlzuq0EhrMTJ4D3vpkKYwloY/CKGZ8bg/TD/0UVLnkgYuDkV9kTgJGjxPwz3kjgO
        ygL3aAmvgo5Za3gZ4PdysHZ8kks5d8JM71tawlEw43n8V4+HYNdtQmo4h6D6+YRcIlcQfPA0
        Ism1FVyeYToUjcRr4NGzjZK8HbpezBHSVZbD2Gyk9IjlcO2pmZRkJZRfVEluLfy0m/+eXQ1V
        U0HqCtKIi6KJi+KIi+KI//c2IsqO4vh8QZ/JC4kG/uQGgdML+YbMDUdz9A7053cNLngCnejZ
        ryNOhBmkWaYs2VOXrqK5AsGkdyJgSE20MunXtXSVMoMzFfHGnEPG/GxecKIVDKWJU55a8vGg
        CmdyefwJns/ljf+qBBOhLkHapgTfrr2NhS9fGXaL0/7U6nXeBkXfvoGhuaPN/c0tZadZ5nXQ
        Uv/tw8KTjOoIxVetUjg43dlfbAnM82VgMDe3p8X7V7pNtU2aN6ljy4bp3ZytYW+pb8vNsVWu
        1LSa4I6lD8aHYgtSrua9e5+Y0hSXmLq62HUs1zZdKjtjHa3VUEIWl7CWNArcb1mudhRZAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRmVeSWpSXmKPExsVy+t/xe7qaVZNjDfbd0ba4cvEQk8XGGetZ
        LaY+fMJmcaV1E6PF+fMb2C2+Xelgstj0+BqrxYzz+5gs1h65y27x+f1+VouLK74wOXB7bPjc
        xOaxc9Zddo9NqzrZPDYvqfeYPuc/o0ffllWMHp83yQWwR+nZFOWXlqQqZOQXl9gqRRtaGOkZ
        WlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehltO8QLTjHVLF8xmm2BsYpTF2MHBwSAiYS
        U44LdDFycQgJLGWU2PdpNjNEXEpifotSFyMnkCks8edaFxuILSTwmlHi5Z5QkBJhAR+Jjecr
        QcIiAmISt+d0MoOMYRaYyyTR928zC8TMg4wSWx7vYAWpYhMwlOg92scIYvMK2EmcaznGAmKz
        CKhInH42C6xGVCBC4vCOWVA1ghInZz4Bq+EUsJFY/HkdWJxZQF3iz7xLzBC2uETTl5WsELa8
        xPa3c5gnMArNQtI+C0nLLCQts5C0LGBkWcUoklpanJueW2yoV5yYW1yal66XnJ+7iREYqduO
        /dy8g/HSxuBDjAIcjEo8vA1Bk2OFWBPLiitzDzFKcDArifDa/JkUK8SbklhZlVqUH19UmpNa
        fIjRFOi5icxSosn5wCSSVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mD
        U6qBsW05K8v6qpbKXw7Ps/Nr+Q/pJpv+We0ZYLZWS/3xm8mXFkifyJvZK7/F3nxhnV4Qg/os
        j+oZ13Jvb7FRPaV/8ebZXyuXaX4QWnXwgN9ilzzLNU/0/qodCz60WtrA7Fe9ntjXz6mLuquP
        d8R+Fg7M0T26OTyiJFJm1uF8wfdnXDmiLm9bkmfOpMRSnJFoqMVcVJwIANxqanXqAgAA
X-CMS-MailID: 20191001160913eucas1p1ce452b9fe9bfa44843438a67a7822a57
X-Msg-Generator: CA
Content-Type: text/plain; charset="UTF-8"
X-RootMTR: 20191001123640eucas1p265d38cc9ad2a3103abd63b5d04d18628
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191001123640eucas1p265d38cc9ad2a3103abd63b5d04d18628
References: <20191001123625.19370-1-s.nawrocki@samsung.com>
        <CGME20191001123640eucas1p265d38cc9ad2a3103abd63b5d04d18628@eucas1p2.samsung.com>
        <20191001123625.19370-3-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
Message-ID: <20191001160912.1ZAK22TswIyxoMSLighktIJNsAFYx1PzfAZTEjXnpqI@z>

On 10/1/19 14:36, Sylwester Nawrocki wrote:
> Rename arndale_rt5631.c to just arnddale.c as we support other CODECs
> than RT5631.  While at it replace spaces in Kconfig with tabs.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

I forgot to add carry the tag:
 Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
