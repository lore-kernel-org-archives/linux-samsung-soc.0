Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CF0C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 10 Jan 2022 22:16:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345309AbiAJWQA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 10 Jan 2022 17:16:00 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:10041 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345315AbiAJWP7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 10 Jan 2022 17:15:59 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20220110221557euoutp019b3abf92786a98d8da87ed37da4eff0d~JCJDix0Z01986719867euoutp01T
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jan 2022 22:15:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20220110221557euoutp019b3abf92786a98d8da87ed37da4eff0d~JCJDix0Z01986719867euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1641852957;
        bh=Xm1n53q2I86yHeQSgTJjqLUvINVyIq10EG4RDYeoX6k=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=faMIhKYjMgg3/PI/XNVtHcyK2co9rjsX49BiKqe7xUA759kUrHkYoAi/6tEiM0SoS
         ZLWoqYbdPiEfrefgswE30PD0i7KwqVkgA/UVPxFYQOes3CcPOb98oDnutfVeU4Wfuy
         /zzf0oxqIvtTb5nUgW/RqhELVWMa9SRwT4Hw5lLk=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20220110221557eucas1p27b17a32de642b806ba3826bb65b7f8d0~JCJDHsO_N1789617896eucas1p2h;
        Mon, 10 Jan 2022 22:15:57 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 65.66.10260.D10BCD16; Mon, 10
        Jan 2022 22:15:57 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20220110221556eucas1p20335ad5adb0743cb89da6a49105faa47~JCJCO1Ecq1412814128eucas1p2D;
        Mon, 10 Jan 2022 22:15:56 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220110221556eusmtrp2a16a9f35174a5aecad9e1a75a53f344e~JCJCOMP_C0096700967eusmtrp2U;
        Mon, 10 Jan 2022 22:15:56 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-ca-61dcb01d2516
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 00.76.09404.C10BCD16; Mon, 10
        Jan 2022 22:15:56 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220110221555eusmtip2e36f38f001048a9327d9d0fb14216582~JCJBtpJ181752417524eusmtip2t;
        Mon, 10 Jan 2022 22:15:55 +0000 (GMT)
Message-ID: <cab52568-d70e-d062-e526-fa61cab7c9c3@samsung.com>
Date:   Mon, 10 Jan 2022 23:15:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [RFC PATCH 1/1] ARM: exynos: only do SMC_CMD_CPU1BOOT call on
 Exynos4
Content-Language: en-US
To:     Henrik Grimler <henrik@grimler.se>
Cc:     linux@armlinux.org.uk, krzysztof.kozlowski@canonical.com,
        semen.protsenko@linaro.org, martin.juecker@gmail.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <YdyF4cvS2GRxKPVn@localhost>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se1BMURx27r27eyvLbYuOPGdnRFE0FhchhrEYPYbxnMFNd7boZVckY7bR
        jEds6GG5s6OmiV4jVNNLL9djRUoyyVaIbKSNtWHLFHv3Dvrv+33n+873+84cHJXkCNzx8KhD
        tDKKipAKHbHSh4NN3lNvdVDzG1KdSFN2JSBvm6wIWfS+VUBebqpBSDa9GpANI+kY2ZNcg/iL
        5C2tzaicSdAI5RVMp0j+4MVrgbyjtUooL85Wyy1F04JEOx39QumI8MO0ct6KvY5hmudZWMwn
        LM5aHJ8AfqBJwAGHhAw2pV0XJAFHXELkAtj06JuIHwYA7OpsRjiVhLAA+HU48K+j/X6dkBfl
        2Pi+a4AfzAB+HmTsDjGxAlb2lIk4jBEzYZ2lUcTzzrD+SjfG4QlECOx6O2THLsQWaCyxCjiM
        Em7Q0J1hv8eV8ICNj1MxLgAlagEs7yqwi4SEL0wyJQk57EB4wi+aAYQ3T4dlJh3KGSDRh8PC
        TycE/N5rIHvGjPDYBfbqS0Q8ngJ/V3BpnCHRVrrxhogfzgHYcuIy4FXLYEfjkC0Ot0V4wpuV
        83h6FdS+zLHTkBgH20zO/BLjYEqpFuVpMTx9UsKrPSCjL/wXe/fZc/QCkDKj3oUZ1Z8ZVYf5
        n5sJsHzgRseqIhW0akEUfcRHRUWqYqMUPvuiI4uA7S89GdF/Lwe5vWYfFiA4YAHEUamruPqZ
        gZKIQ6mj8bQyeo8yNoJWsWAyjkndxPvCb1ESQkEdog/QdAyt/HuK4A7uCQj5RlvVpruZXJNn
        mZS5uPBR0M+YXVvTTH5vXI4xV0/VUuvjU2Q1FzfmBa8r6M9KDvCmdgzrhU+fLKwVa7YNrfaY
        UzlBvfhreuoD92iL8V6Y22z/ljm9i/ZrJUvWyuqo8ncK72HjwVrN4Jhca6vYmu/tW5eTEvJ4
        xmf/5f1srnbWVs+MgKlC3ZYFVJo+dnBNp5fu/GYn4k7+cYPixZSel+6mgWl9G5r94saGy8nt
        yXEuTkuHMLMYTBwILN6QmHam7Te40P3qbPfazDExxoAMwxcVW1rQH/ixnfxVH2x+HfQheNOl
        lU59ssTdVzzGu4aMVM1l2Xq1cams/2212qAb264+LcVUYZSvF6pUUX8A8hYkJLoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRmVeSWpSXmKPExsVy+t/xe7oyG+4kGjT18Vi8XbKL0WLj2x9M
        FpseX2O1mHF+H5PFoal7GS3O/JvKYvG8bx+TA7vH5WsXmT1mNfSyeeycdZfd4+iVe6wed67t
        YfPYvKTe4/MmuQD2KD2bovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSc
        zLLUIn27BL2M3kuLWApeslT82FzVwPiNuYuRk0NCwETi9pEDbF2MXBxCAksZJdY+aWGHSMhI
        nJzWwAphC0v8udYFVfSeUeLp0olgCV4BO4ldz7eDNbAIqEoc+HyOHSIuKHFy5hOWLkYODlGB
        JIkPW/xAwsICIRLPtvwAa2UWEJe49WQ+E4gtIqAmce7UZBaQ+cwC+xklti77zgyxrJdJYvnH
        JWBVbAKGEl1vQa7g5OAU0JR43/uFCWKSmUTX1i5GCFteYvvbOcwTGIVmIbljFpKFs5C0zELS
        soCRZRWjSGppcW56brGRXnFibnFpXrpecn7uJkZgHG479nPLDsaVrz7qHWJk4mA8xCjBwawk
        wrv3wq1EId6UxMqq1KL8+KLSnNTiQ4ymwMCYyCwlmpwPTAR5JfGGZgamhiZmlgamlmbGSuK8
        ngUdiUIC6YklqdmpqQWpRTB9TBycUg1Mil8WpLPXbn6pZbDk4o8++cT03d89e/Xf/DseeDxy
        W1yY5WMNsdhnPw1T013migW8sP9Yy5f89dqUTd//20S2+8SIuX2LlGfYm3Tb+gffyaCdxieV
        Vrh9PyvnviqZP8Osb8VL848dr2/573ZKKHQ689Rnu8qllUGOp9ZJzK/49VLrgrDNRZdzPHPL
        XzF8FLQL3y3Gry4os/fgzGPnvglmHg41b/m9f5LY7DvHZR6uf2X7ttU3zmTtdnnWhQtKNuob
        q7W6Zdxc5+O3IUZN09d+RfTNDc07n/9ZWjzzXEGkdtEu1+rpamseKJgoHajqmLnI63Hdu5+/
        JFg2d9rXPZQuyH/r/iVfMDGg3dro2aZWJZbijERDLeai4kQA5gE/AUwDAAA=
X-CMS-MailID: 20220110221556eucas1p20335ad5adb0743cb89da6a49105faa47
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220108215952eucas1p1bb9bc56c7f8ac7117b5e5576635460d5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220108215952eucas1p1bb9bc56c7f8ac7117b5e5576635460d5
References: <20220108215733.705865-1-henrik@grimler.se>
        <CGME20220108215952eucas1p1bb9bc56c7f8ac7117b5e5576635460d5@eucas1p1.samsung.com>
        <20220108215733.705865-2-henrik@grimler.se>
        <2202f06f-e901-44bb-b6dc-7225dd093e1b@samsung.com>
        <YdyF4cvS2GRxKPVn@localhost>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On 10.01.2022 20:16, Henrik Grimler wrote:
> Hi Marek,
>> Works fine on all ARM 32bit Exynos-based boards I have for tests.
>>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Thanks for testing!  Would you mind telling me which Exynos boards you
> have in your test-setup?

Sure:

Exynos3250: Rinato
Exynos4210: Trats
Exynos4412: Trats2, Odroid X2/U3
Exynos5250: Snow Chromebook, Arndale5250
Exynos5410: Odroid XU
Exynos5420: Pit Chromebook
Exynos5422: Odroud Xu3/Xu3-lite/Xu4/HC1
Exynos5800: Pi Chromebook


Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

