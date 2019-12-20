Return-Path: <SRS0=uLO5=2K=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B61C43603
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Dec 2019 09:05:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8BE772467F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Dec 2019 09:05:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="CIUaRvlD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727197AbfLTJF5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Dec 2019 04:05:57 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:34894 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727129AbfLTJF4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Dec 2019 04:05:56 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20191220090554euoutp01d802692c52369c7f5c32aeae6a59af41~iCQkYLRXZ2753327533euoutp01a
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2019 09:05:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20191220090554euoutp01d802692c52369c7f5c32aeae6a59af41~iCQkYLRXZ2753327533euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1576832754;
        bh=R2bgtkgulgLFXURJ0yIdQR36/mmA0eJITa3gfcBwFBU=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=CIUaRvlDyWsvugmboYhvy/hkMAlBQ6NLvtNl3j0iekKMzDEJTHYr5TLYG/KlHu6Yp
         e5WxBSidxLjRfVZe8C5cEIOaTLkKOPK4Be0QQlV/ew4NKD8Vjlsjwzthb4yBWc2jUf
         e4dQcRTN/lkNyv4AFj6jPoXZywR3DuwDa5zS03xE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191220090553eucas1p23497d5516afb1908daa96969be52f7fc~iCQkCvZcG2796027960eucas1p2E;
        Fri, 20 Dec 2019 09:05:53 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 17.48.60698.1FE8CFD5; Fri, 20
        Dec 2019 09:05:53 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191220090553eucas1p241dffa7822c1560e0f56446f0737719f~iCQjnU-bP2802528025eucas1p23;
        Fri, 20 Dec 2019 09:05:53 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191220090553eusmtrp1e2bedaedba67d92eaa195ba7c8fd8873~iCQjmoh9f1076610766eusmtrp1O;
        Fri, 20 Dec 2019 09:05:53 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-79-5dfc8ef16cae
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 7F.31.08375.1FE8CFD5; Fri, 20
        Dec 2019 09:05:53 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191220090552eusmtip24959773e9f273d073d1b11432cee0737~iCQjJlEC31122811228eusmtip23;
        Fri, 20 Dec 2019 09:05:52 +0000 (GMT)
Subject: Re: [alsa-devel] [PATCH v2] ASoC: max98090: save and restore SHDN
 when changing sensitive registers
From:   Marek Szyprowski <m.szyprowski@samsung.com>
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
Message-ID: <31bde14e-1fef-264a-ba1e-fc3051506bf3@samsung.com>
Date:   Fri, 20 Dec 2019 10:05:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <b0e57646-8a14-e6c0-9daa-28c353dcb77a@samsung.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SXSxbYRjO13PanjZqnyJ9w36S7ifZsjHj4iQWY5atFy5cbDebxjrOEG1J
        j9qMLKbZlIgwkWolyCIIMQ0miHUU81PzNxvZXEzSRQgX/kaRmfbM5u55n+d58z5P8lKE1M4P
        oFK0GYxOq1LLBWKy46Nr/Mpa8b7y6qT5Mj0zZefR5QtOAT3c/4Kg881GRE9MWIX0cn83oism
        bDy6fyWfTy+1rfDonqllYaRYYd3IEyhqWvWK1sYCgeLXWCmpKG5vRIo2R7Zio/V0rPC++Hoi
        o07JZHTBEQ/Fyd3lVbz0XvHTn4NWlItaqEIkogCHweL0iKAQiSkpbkAwYHHwuWETwYe9ur/K
        BoLdAyt5tLJpKOVxQj2CFuMY4oZVBLM7A0K3yxdroa+2SeDGAhwChauFHuyHz8KX7feke4HA
        xQSMrswdChQlwRGwMx/t9pD4PHSZ1oRu2h8rwVif7KYl2AdGzE5PCBG+AaP12x5M4DNgeFdJ
        cFgG35zVnnCAvwrhx6qN4FLfgqp5G4/DvrA81C7k8ElwlBWR3IIBwcJ4s5AbihB8zqtAnCsc
        5sd3PUEJfBFauoM5Ogp6mvs9QQF7w9yqDxfCG153mAiOloDxlZRzXwDL0Nt/Z/smp4kSJLcc
        q2Y5VsdyrI7l/90aRDYiGaNnNUkMG6plngSxKg2r1yYFJaRpWtHhZzl+D211Itv+IzvCFJJ7
        SSIf7ymlfFUmm6WxI6AIuZ/ku9GllEoSVVnPGF1avE6vZlg7CqRIuUwS+mZJKcVJqgwmlWHS
        Gd2RyqNEAbmou3Y5xhXe1TbkFaefuKkz2XpFBju76KywVVbNop6O6uH16dICYrb3zqAmTRx6
        TXZQVRd1Ike3FXZueNtpG7Sp4u4WBFryd0aN1gRTp7XsQcjky4jbz10NlWs5p4r9zesx8ak+
        Bzmx0XI0fk/NzFTL1IbsgaaRHZ+NkhC/T3KSTVaFXCJ0rOoPTqFnEFUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRmVeSWpSXmKPExsVy+t/xe7of+/7EGhw7JGJx5eIhJoupD5+w
        WZw43Mhs0T6zg9Hi/PkN7BavDu9itJhxfh+TxeE37awWLze/YbLYc/EVuwOXx4bPTWweCzaV
        emxa1cnm8e3MRBaPvi2rGD02n672+LxJLoA9Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRS
        z9DYPNbKyFRJ384mJTUnsyy1SN8uQS9j19R5TAUHuCqeHt3A2MC4nqOLkZNDQsBE4kvzRCYQ
        W0hgKaPEldtxEHEZiZPTGlghbGGJP9e62LoYuYBqXjNKXNp+GiwhLJAncXDJajYQm03AUKLr
        bReYLSKgLHH1+14WkAZmgT5miR2X57BCdK9ilTi+bgqQw8HBK2An8eOOM0gDi4CqxM7pH9lB
        bFGBWInvKz8xgti8AoISJ2c+YQGxOQXsJU4t/w5mMwuYSczb/JAZwpaXaN46G8oWl7j1ZD7T
        BEahWUjaZyFpmYWkZRaSlgWMLKsYRVJLi3PTc4sN9YoTc4tL89L1kvNzNzECY3TbsZ+bdzBe
        2hh8iFGAg1GJh/dl8u9YIdbEsuLK3EOMEhzMSiK8tzt+xgrxpiRWVqUW5ccXleakFh9iNAV6
        biKzlGhyPjB95JXEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYHRL
        eHTBe4GxTM4xkTMd6vsO3f/zu5P3/46fbSxu5wPusPH84ItMumI+/c8biWsW7DZfQ/Ka/C8p
        8JhqhmoF+EhbX0j/NP8pZ0hhxcY8JmG/1qXTDD+s36OTEnV90xKvkl9Vp/+3PNMMqTxg88Xg
        ZJH/t5cfbN4Xb5c2uCH3UD37hFVUaf/lD0osxRmJhlrMRcWJAIKE6rLnAgAA
X-CMS-MailID: 20191220090553eucas1p241dffa7822c1560e0f56446f0737719f
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
        <b0e57646-8a14-e6c0-9daa-28c353dcb77a@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi All,

On 20.12.2019 09:28, Marek Szyprowski wrote:
> On 19.12.2019 20:16, Mark Brown wrote:
>> On Thu, Dec 19, 2019 at 02:41:17PM +0100, Marek Szyprowski wrote:
>>> On 19.12.2019 14:05, Mark Brown wrote:
>>>> You can't trigger this via any other mechanism, all the other controls
>>>> are fine?  There's *clearly* no issue with what the commit is doing,
>>>> it's just flagging up that the card is not set.
>>> I've cherrypicked the $subject commit onto vanilla v5.5-rc1 and the
>>> issue is same.
>> Yeah, there were a lot of refactorings in the last merge window so that
>> doesn't entirely surprise me.  The commit should backport futher than
>> that I think?
>
> I've tried initially to cherry-pick it to v5.4, but the the code 
> didn't compile due to lack of some macros, so I've gave up trying. I 
> will check that now and backport needed macros too if you think this 
> would help.

Same issue. I've tried backporting it to each kernel release: 5.4, 5.3, 
5.2, 5.1 and 5.0 (with additional backporting "ASoC: core: add 
SND_SOC_BYTES_E" and "ASoC: Define a set of DAPM pre/post-up events"). 
In all cases the lockdep warning and oops is the same. Backporting to 
v4.9 requires more changes to get it even compiled, so I gave up.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

