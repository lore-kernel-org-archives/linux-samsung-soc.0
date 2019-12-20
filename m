Return-Path: <SRS0=uLO5=2K=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA6EC43603
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Dec 2019 08:28:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 66DB024683
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Dec 2019 08:28:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tRUP7rDk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727233AbfLTI2m (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Dec 2019 03:28:42 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:46856 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbfLTI2l (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Dec 2019 03:28:41 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20191220082839euoutp02638d2720e9134f7f29a0dbfec2b6705c~iBwC5GjuN2840528405euoutp02U
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2019 08:28:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20191220082839euoutp02638d2720e9134f7f29a0dbfec2b6705c~iBwC5GjuN2840528405euoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1576830519;
        bh=+fa0VU87LNjewzBV03NeQEIkxBkcNBaM2uAVq3jruXE=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=tRUP7rDk7d5T+jDQq7Bc42Umj31C6vOmlyNtvWOaZpWPs6mwpTHjVA9mWZ3Vepb1j
         cc2pjpya1thQTx/aklyyFC7Ffa7jg1nT6vdSix97YDerJeSqdLsst+X3T+6V6xeocK
         8DC6eTvlF5zjINb7My3P9q/nIWuYeezipfEInMOo=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191220082838eucas1p2c070513a60a859c6c85a4534a6b69aa5~iBwCkcyYQ2497524975eucas1p2u;
        Fri, 20 Dec 2019 08:28:38 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id A7.34.61286.6368CFD5; Fri, 20
        Dec 2019 08:28:38 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191220082838eucas1p13ba949e3210f0fa5c396f0092f48618a~iBwCJ-vQv1087710877eucas1p1V;
        Fri, 20 Dec 2019 08:28:38 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191220082838eusmtrp1abcac6023feae756a829554344ec32ec~iBwCJVD6a1762117621eusmtrp1H;
        Fri, 20 Dec 2019 08:28:38 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-8e-5dfc86366d41
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 1E.DD.07950.6368CFD5; Fri, 20
        Dec 2019 08:28:38 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191220082837eusmtip249439c67bc00a5328281c16a93ddfce8~iBwBnE9qf1898618986eusmtip2b;
        Fri, 20 Dec 2019 08:28:37 +0000 (GMT)
Subject: Re: [alsa-devel] [PATCH v2] ASoC: max98090: save and restore SHDN
 when changing sensitive registers
To:     Mark Brown <broonie@kernel.org>
Cc:     Tzung-Bi Shih <tzungbi@google.com>,
        ALSA development <alsa-devel@alsa-project.org>,
        Dylan Reid <dgreid@google.com>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Takashi Iwai <tiwai@suse.de>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <b0e57646-8a14-e6c0-9daa-28c353dcb77a@samsung.com>
Date:   Fri, 20 Dec 2019 09:28:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191219191646.GH5047@sirena.org.uk>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUhTURjGObvX3etodp2aL2ZfE4MCtZXEhUKUCvZHhBEVBatm3lScU3bV
        0rDMTNcw8QNRp5aVMTH8YK5ZYplfLV05XU0spdBmqcwircQSye1q+d/znvd3nuc8cEhM1OHm
        R8YpkxmVUq4Q8wW48cWCJWhvzqJsV9NHCf12sJNHl4zZ+fTLrmsYnVuuRrTF0kTQ012tiC6z
        POPRXY5cN3qq2cGj2waniXCBtGkuiy+t1qdI9XU3+dJfrwpxab6hDkmbzZelc/rNkcRpwf5o
        RhGXyqhCws4JYtuf96CkcuLSRMF3IhO9c9MgdxKoUGgoNixrASmiahGM3J7HuOEHgppFA+KG
        OQQ9LY3Y6hVTh5HPLXQI7n6tWqFmENgWS3An5UUpoaPmId+pvakAsM0/xZ0QRuVj0OcYdi34
        lAQ0MxqXFlJhMGtwLGuSxKlA0A1FOqUPJQO1LpYjPKG33O6yd6d2w7iFc8GoLdAyU4lx2hfe
        2+/wnFFADREwMVqLOX2AOgjqWwqugBdMmwwEp/3BXJyHc/x1BGP99QQ35CF4k1WGOGofjPb/
        dr0No3ZAY2sIdxwBbfVdBOfvAcMzntwbPKDIWLoSKwR1joijt4PW1PAvtmPAihUgsXZNM+2a
        Nto1bbT/c6sRXod8mRQ2IYZhJUrmYjArT2BTlDHB5xMT9Gj5Y5mXTLOP0U9rVCeiSCReJwy/
        8EcmcpOnsmkJnQhITOwtHFEvyETCaHlaOqNKPKtKUTBsJ9pI4mJf4Z57UzIRFSNPZuIZJolR
        rW55pLtfJoopNB7S6kblI6cqLfjS4XG271FoQN+GkqvdR6u36U/o1nv0BFc0e7UpcjPjonQ+
        kxPxIeqTNfePfeuNDnToz/QWCcMPRB7J0PSma/wzKoKyfL88sX0ucnQnfdiafbxo0t1mHaAl
        EcdnH1QNxQk/NdpN5hul7a/t2UYf65XmTdiIGGdj5ZKdmIqV/wX9ge+NVAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRmVeSWpSXmKPExsVy+t/xe7pmbX9iDS7sELG4cvEQk8XUh0/Y
        LE4cbmS2aJ/ZwWhx/vwGdotXh3cxWsw4v4/J4vCbdlaLl5vfMFnsufiK3YHLY8PnJjaPBZtK
        PTat6mTz+HZmIotH35ZVjB6bT1d7fN4kF8AepWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKp
        Z2hsHmtlZKqkb2eTkpqTWZZapG+XoJex/8BRxoKZ7BVPJ3xkb2C8ydrFyMkhIWAicfzgNrYu
        Ri4OIYGljBKn9+5mh0jISJyc1gBVJCzx51oXVNFrRon5j6cwgySEBfIkDi5ZzQZiiwgoS1z9
        vpcFpIhZoI9ZYsflOawQHV9ZJObO/w02lk3AUKLrbRdYB6+AncSnLW+AbA4OFgFVieXXAkDC
        ogKxEt9XfmKEKBGUODnzCQuIzSlgJPHo/A2wVmYBM4l5mx8yQ9jyEtvfzoGyxSVuPZnPNIFR
        aBaS9llIWmYhaZmFpGUBI8sqRpHU0uLc9NxiI73ixNzi0rx0veT83E2MwCjdduznlh2MXe+C
        DzEKcDAq8fA6pP2OFWJNLCuuzD3EKMHBrCTCe7vjZ6wQb0piZVVqUX58UWlOavEhRlOg3yYy
        S4km5wMTSF5JvKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBkb2G3F1
        6iLnKkOSsqwuOCds2HzowGmL71tu96ZEL5Pvzk7+v2HGz8ZdLAWz/Q3SThx5s8UmvznM6/dF
        3+p9jVtuFlhcFLXpCWp/ekON7an9CqU1n1K/lpxMrZ2olvEk4b2Uxi2ntdxTD5vrsx6pWBp0
        d1cTz6MFoYInE3oeeKiJus9s/q9f80KJpTgj0VCLuag4EQBm5HxR6AIAAA==
X-CMS-MailID: 20191220082838eucas1p13ba949e3210f0fa5c396f0092f48618a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191219191651epcas5p2ab8031875093df401d9182e7c491eb3d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191219191651epcas5p2ab8031875093df401d9182e7c491eb3d
References: <8aceb9ec-aa6e-1fa4-cee9-e22084c141e8@samsung.com>
        <CA+Px+wXPa_cwdZUQfCx4jAhhj4Q9b7bNABUGazLKOJ7U5ae-mA@mail.gmail.com>
        <20191218132620.GE3219@sirena.org.uk>
        <f6453e48-cd95-6471-8945-4cc0ab3d04d9@samsung.com>
        <20191218162422.GG3219@sirena.org.uk>
        <ef908cb8-875e-4339-33bd-5997b594f022@samsung.com>
        <20191219123709.GB5047@sirena.org.uk>
        <aba9f63c-d993-e54e-4daa-9dbc35d0683b@samsung.com>
        <20191219130559.GE5047@sirena.org.uk>
        <a10269be-8caf-6e07-71c6-582a1d2c1458@samsung.com>
        <CGME20191219191651epcas5p2ab8031875093df401d9182e7c491eb3d@epcas5p2.samsung.com>
        <20191219191646.GH5047@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Mark,

On 19.12.2019 20:16, Mark Brown wrote:
> On Thu, Dec 19, 2019 at 02:41:17PM +0100, Marek Szyprowski wrote:
>> On 19.12.2019 14:05, Mark Brown wrote:
>>> You can't trigger this via any other mechanism, all the other controls
>>> are fine?  There's *clearly* no issue with what the commit is doing,
>>> it's just flagging up that the card is not set.
>> I've cherrypicked the $subject commit onto vanilla v5.5-rc1 and the
>> issue is same.
> Yeah, there were a lot of refactorings in the last merge window so that
> doesn't entirely surprise me.  The commit should backport futher than
> that I think?

I've tried initially to cherry-pick it to v5.4, but the the code didn't 
compile due to lack of some macros, so I've gave up trying. I will check 
that now and backport needed macros too if you think this would help.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

