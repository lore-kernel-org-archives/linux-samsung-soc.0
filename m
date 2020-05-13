Return-Path: <SRS0=Clw5=63=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD4CC2D0FC
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 13 May 2020 10:53:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E226206D6
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 13 May 2020 10:53:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="s5KZYr6p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730458AbgEMKxB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 13 May 2020 06:53:01 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55760 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728113AbgEMKxB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 13 May 2020 06:53:01 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200513105259euoutp0110f8dab8fc84b376f677a69ea7a08019~OkQduTqOL1632616326euoutp01F
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 May 2020 10:52:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200513105259euoutp0110f8dab8fc84b376f677a69ea7a08019~OkQduTqOL1632616326euoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1589367179;
        bh=IrAcu52JTWBET1ZgQMKrBdaLt9poAzvoQL30ezPmDXY=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=s5KZYr6pDJhYnZQzIghvPrnQCLr3k8qlgqRNz1K9ob/EZMtK3Ir1/fRyBbDVsDKxo
         pr6+ym5vuqpQVrSvOIN9klphfoakVUz31GRy1edaO8pfPoE5ANQkbpLnC5wUmHMP/Z
         c1ptfb2jRo+trRfdQA/fEEaC/7fMnBE6uLmrZAeY=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200513105259eucas1p2bb6ed0ca860caa7190dd3707cbdfba91~OkQddO2zc1636116361eucas1p2h;
        Wed, 13 May 2020 10:52:59 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 3B.96.60679.B81DBBE5; Wed, 13
        May 2020 11:52:59 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200513105258eucas1p27f2a938befe4c315b8bae67ad039f791~OkQcyvrij2011920119eucas1p2M;
        Wed, 13 May 2020 10:52:58 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200513105258eusmtrp248f644c66b3744cabe4319d3e8755bec~OkQcyCwCa0960009600eusmtrp2x;
        Wed, 13 May 2020 10:52:58 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-f2-5ebbd18b929f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 6E.01.08375.A81DBBE5; Wed, 13
        May 2020 11:52:58 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200513105257eusmtip2954aae3010d656aae4155a8058b8a20b~OkQcGqGiF0977709777eusmtip25;
        Wed, 13 May 2020 10:52:57 +0000 (GMT)
Subject: Re: [PATCH 2/2] clk: samsung: Fix CLK_SMMU_FIMCL3 clock name on
 Exynos542x
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <1eb89fc5-7118-d098-913b-206288e4dd6a@samsung.com>
Date:   Wed, 13 May 2020 12:52:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200506132659.17162-2-m.szyprowski@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUhTURz17r1tb9Lkblr+MKkYZST4VRavD6SoYGFEkAVFLqc+5kinbGoZ
        FAOhqZsyklKHpBlhSDadMufEPlZrlF8FmSPTRGayxGL4hVoz51Pyv/M7v3PuPedyKULcwo2g
        lKp8Rq2SZ0t4waT13WJ/jP5TlyzeVy6iW6vNXHpodpJLDwy08GmfYZRLVw+84NDNb0f4tPnB
        Ipf2f2klad2ElzgukHaaRvhSS1MpT1rR3oSkM5Yd58krwccymWxlIaOOS0oLznIPmnl5g+jm
        zPMhUossqAwJKMCJMPWmgyxDwZQYP0Vw360j2GEWwdSCbX0zg8CpneduWIYamvnsohHBSq93
        3eJDUFcxxQuoQvFFmLPbOWWIosJwLpimUwI0gYs50DcaFcA8nADlzoq1HEKcBMaxV0QAk3gP
        LNj8a8dsxanQ87htXSOC9zUeMoAFq/pK6xJizwyHr546Dot3Qsd07VoewA4+zFdU89jUp+Bl
        30OSxaHw09XOZ3EkrHQGzAFDMQJD1zCfHYwIvrvq15/pKHzrX+IF2hB4H5jtcSx9AqyPfWs0
        4BBwT4vYECFwz1pFsLQQSu6KWfVuWG6q4rA4AvSeFdKIJKZN1Uyb6pg21TH9v7cekU0onCnQ
        5CgYzX4VcyNWI8/RFKgUsRm5ORa0+o96/K5ZG7L/SXcgTCHJFmHQbbtMzJUXaopyHAgoQhIm
        PGfukomFmfKiW4w695q6IJvRONB2ipSECw80eFPFWCHPZ64zTB6j3thyKEGEFjV+eF0aa7Mf
        xOmWSOPH8ZTLy0+UipiJMefoLnej32658KNsrPJ0uyVt8PNwyWSqLhrmfm9TnqwJOqzP01Zh
        n/Xv2V5vx95DR2o5IvLO+JwuY/RZd5s+uRDH9ac8ij9TumyQdmZ7DMkdUeZul1qVeCnKqZW1
        zv5qM9YMSa/KJKQmS54QTag18n95z25PQwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsVy+t/xe7pdF3fHGTx+r2ixccZ6VovrX56z
        Wpw/v4Hd4mPPPVaLGef3MVmsPXKX3WL9tJ+sFv+ubWSxaH/6ktmB02PnrLvsHptWdbJ59G1Z
        xejxeZNcAEuUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqR
        vl2CXsaNq+vZCq4yVnxed52lgXETYxcjJ4eEgInE9UVr2bsYuTiEBJYyShz694+5i5EDKCEl
        Mb9FCaJGWOLPtS42iJr3jBIz115iB0kIC4RKfN21iwnEFhHIl5hxp5cRpIhZoJlJ4uiDdWAb
        hASOMkpc7+MDsdkEDCV6j/aBxXkF7CQmPDjADGKzCKhKfN/xjw3EFhWIlVh9rRWqRlDi5Mwn
        LCA2J1D95G2/wOLMAuoSf+ZdYoawxSVuPZnPBGHLS2x/O4d5AqPQLCTts5C0zELSMgtJywJG
        llWMIqmlxbnpucWGesWJucWleel6yfm5mxiB8bft2M/NOxgvbQw+xCjAwajEw8tQuytOiDWx
        rLgy9xCjBAezkgiv3/rdcUK8KYmVValF+fFFpTmpxYcYTYGem8gsJZqcD0wNeSXxhqaG5haW
        hubG5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4OKUaGKeZLJbxNZve93lf4wOHo2UtT5ye
        ia5y6162dubR5Tc4rK/YiM2K9xQO3XFh77YoufIre8QTn06qqo054zpXIsz/4spbn1hrHAyc
        02WLvk6b+D3iyqpg1UbJA1d07TRuHJVdcjTZ0/J+VPeuiGnP9Jb+MPt4s0V7TZOHWm9Jk8eN
        Vf9Dyx7+D1NiKc5INNRiLipOBABOSLcM1QIAAA==
X-CMS-MailID: 20200513105258eucas1p27f2a938befe4c315b8bae67ad039f791
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200506132719eucas1p258d3a6979ab111a7db4baf95c85c2591
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200506132719eucas1p258d3a6979ab111a7db4baf95c85c2591
References: <20200506132659.17162-1-m.szyprowski@samsung.com>
        <CGME20200506132719eucas1p258d3a6979ab111a7db4baf95c85c2591@eucas1p2.samsung.com>
        <20200506132659.17162-2-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06.05.2020 15:26, Marek Szyprowski wrote:
> The proper name for CLK_SMMU_FIMCL3 is "smmu_fimcl3". Remove obvious
> typo.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Applied, thanks.
