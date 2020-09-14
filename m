Return-Path: <SRS0=fOmg=CX=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5733C43461
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 14:25:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F5CB208DB
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 14:25:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="iXscQB9X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbgINOZb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Sep 2020 10:25:31 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:33042 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726658AbgINNGE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 09:06:04 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200914130602euoutp013e4c315607748873edb64f0cfc94492c~0qEBfP8Ya2780127801euoutp01V
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2020 13:06:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200914130602euoutp013e4c315607748873edb64f0cfc94492c~0qEBfP8Ya2780127801euoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600088762;
        bh=Jji5sZwwjG0m2sT1+OrKz5E0RZlO03vIrdnfilowYso=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=iXscQB9XMdu1gg3VoWGyvYQAqcmn3ppV+4l1ef4WFXJw9YMfnKMjy5eYInoNZ0Vpk
         yrWe0yqrszV9i3XysMKX00si4hH1reui7lr6TG6UW2gux7ZLcRRGaEOW1VxDEuDQ2j
         W5yCACOXC/rVHvZQj07dNVVbx8WryiBZfeu2wfuA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200914130601eucas1p19a008db149998a8bc73d0f47260f7482~0qEBEP_0X2766727667eucas1p16;
        Mon, 14 Sep 2020 13:06:01 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id AA.1A.06456.9BA6F5F5; Mon, 14
        Sep 2020 14:06:01 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200914130601eucas1p23ce276d168dee37909b22c75499e68da~0qEArF1sO2837128371eucas1p2D;
        Mon, 14 Sep 2020 13:06:01 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200914130601eusmtrp275f86fbcdbed1bb7e4ccb079e515d7fe~0qEAqR5yR2903029030eusmtrp2b;
        Mon, 14 Sep 2020 13:06:01 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-8c-5f5f6ab91fe7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 53.2D.06017.9BA6F5F5; Mon, 14
        Sep 2020 14:06:01 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200914130600eusmtip1edf0adac8c32ca3868a3f5a25f1e4126~0qD-up_EH2003720037eusmtip1K;
        Mon, 14 Sep 2020 13:06:00 +0000 (GMT)
Subject: Re: [PATCH v3 08/16] irqchip/gic: Configure SGIs as standard
 interrupts
To:     Marc Zyngier <maz@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Russell King <linux@arm.linux.org.uk>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Sumit Garg <sumit.garg@linaro.org>,
        Valentin Schneider <Valentin.Schneider@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Saravana Kannan <saravanak@google.com>,
        kernel-team@android.com,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <a917082d-4bfd-a6fd-db88-36e75f5f5921@samsung.com>
Date:   Mon, 14 Sep 2020 15:06:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200901144324.1071694-9-maz@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRTHeXZfdmdtXJfmwUJpUKDQi5XxkCW9SZc+RWBCkGvVxSw3ZWua
        GWRaUdPUwsqmbFJmU3TWzJeprFrlMm0TxbLSwvJDWqmoGRN6cV4tv/3OOf//c/4HHoaQX6aD
        mUTNSV6rUSUpaD+yvtXrXm0/rlSuczWEYE+/k8APimooPFqei/D0yDMxLrGk43Nl3SRubAjA
        Hs99MbZ9fk3h7qYSGhd5HCL8vluK7SVtFDY4f9HY6sijca3tOoEbzF4Cn++L3Cbn6pvrKa7K
        VIW489m5NGeqyuDsxn4xV2rTc7bKyzSX+dhDcn2vW2huxO0Wc7VlZzl744SIy3tYibgJW8he
        2QG/LUf5pMRUXrs2+pDfsZ7xK3TK80WnPk54iUzUKjEgCQPsRsgx5RMG5MfIWQuC+wVusVBM
        Ivj5wjQ3mUDwrfk3MW8ZezlFCYN7CFpGCucsowjefO2YVS1h90F/zlXk4wA2ATpLHoh9TLBj
        JJSbT/mYZiPA8N1A+1jKRoO1vJnyMcmuhG+erllvIBsPrS8/kYLGH9puDc6yhN0EPY6BuTdD
        IbuumBA4CN4NmkW+QMA2MjDtyqeE2LvA0vFDLPASGHY9nOPl8Mc+b8hGMOCuFgtFLoLurCIk
        qKKgzz09E5WZWREGNU1rhfZ2GL50l/K1gZVB73d/IYQMrtXfJIS2FC5dlAvqVWB0Wf+tfdLZ
        RRQghXHBacYF5xgXnGP8v7cUkZUoiNfr1Am8LkLDp63RqdQ6vSZhzZFktQ3NfND2367xRvSj
        67ATsQxSLJbu3RqvlFOqVF262omAIRQB0h2v2uPl0qOq9NO8Nlmp1SfxOidaxpCKIOmG20MH
        5WyC6iR/gudTeO38VMRIgjNR3tOPnGdUZnbsjIncb9kmku0OW16bozRs1kylaTvKAscUFz7o
        77x6UfsoOPH60gpHpWVFtdnadnaqrvht3c9Jddn68FBvr8254xkuTW4JaIq2ZckNFwbinlZk
        9Ga0X1kfW525h+7xWuOyvoxLOoYqYlXewhsx9ruLWqNMQYE5ZxSk7pgqIpzQ6lR/AXxPugmc
        AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRiA+3a2s2lOTnPmx+jGrD/CZvO2z/ASYXH6pSVEmDmHnqblnO5s
        oka10B9rmmlQzCkmZVayrOZt05AaaZnmyMvAcpR4DzVRECaZOWfgvwfe93nghZeD8apZAk52
        roZS58pzhLgvs//vR5fIdlUmOz7jZiOHy46hN8ZXLPS7sRyg9aUPbFT7vAjdbhhmImsHHzkc
        r9nIMulkoeHOWhwZHd0M9H2Yi2y1fSxksG/gqLm7AkctlgcY6njkxlDpeORJHtne1c4izXVm
        QJaWlONknfk6aTO52GS9RUtamu7gpO6dg0mOO9/i5NLgIJtsabhF2qyrDLKitQmQq5ZDSf4p
        4hi1SquhjmSpaE2s8JIEhYkl0UgcFhEtloRLL58IixSGxsVkUjnZBZQ6NC5dnDW6chfP69lb
        +GPVjelAr48B+HAgEQGXP6+xDMCXwyOeAji7+JLhHRyAfQ91LC8HwD9OA+5hHrEI4FCtysMB
        xHnoKqsCHuYTCjjpHGB6GCNWmNAyRnr35bD7XgXbwzghgYZFb4dLxMHmxq7tPpM4BhccQ9ud
        QCINDpTP7ezsg33VU9tNHyIKjnZPsL39KFjXMoF5+TAsaavZ4SD4beoRoxLwTLt00y7FtEsx
        7VLqAbMJ8CktrVQo6TAxLVfS2lyFOEOltICtt2jvdbdagWEp2Q4IDhD6cZNi02Q8lryALlLa
        AeRgQj731Jf+NB43U15UTKlVMrU2h6LtIHLruCpMEJih2nqyXI1MEimRomiJNFwaHoWEQVw9
        8T6VRyjkGuoaReVR6v8eg+Mj0IH2xw1X4kcqrbaf2ObgTHzCVMuYos28XL/B1k3/enFUFBzw
        qbFHdDDfnFhjNPbqiyYu9K3f7+14MpcqOn0x5Ozq/s5iwUhwbEpicmDXQMJXab5/8EKq9dnN
        znnZufCy2eLpwuzN7J4N0Z75oEQ/45mkmkStwj+2f31Nn76hv7EgFTLpLLkkBFPT8n9a0wvf
        LAMAAA==
X-CMS-MailID: 20200914130601eucas1p23ce276d168dee37909b22c75499e68da
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200914130601eucas1p23ce276d168dee37909b22c75499e68da
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200914130601eucas1p23ce276d168dee37909b22c75499e68da
References: <20200901144324.1071694-1-maz@kernel.org>
        <20200901144324.1071694-9-maz@kernel.org>
        <CGME20200914130601eucas1p23ce276d168dee37909b22c75499e68da@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marc,

On 01.09.2020 16:43, Marc Zyngier wrote:
> Change the way we deal with GIC SGIs by turning them into proper
> IRQs, and calling into the arch code to register the interrupt range
> instead of a callback.
>
> Reviewed-by: Valentin Schneider <valentin.schneider@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
This patch landed in linux next-20200914 as commit ac063232d4b0 
("irqchip/gic: Configure SGIs as standard interrupts"). Sadly it breaks 
booting of all Samsung Exynos 4210/4412 based boards (dual/quad ARM 
Cortex A9 based). Here are the last lines from the bootlog:

[    0.106322] CPU: Testing write buffer coherency: ok
[    0.109895] CPU0: Spectre v2: using BPIALL workaround
[    0.116057] CPU0: thread -1, cpu 0, socket 9, mpidr 80000900
[    0.123885] Setting up static identity map for 0x40100000 - 0x40100060
[    0.130191] rcu: Hierarchical SRCU implementation.
[    0.137195] soc soc0: Exynos: CPU[EXYNOS4210] PRO_ID[0x43210211] 
REV[0x11] Detected
[    0.145129] smp: Bringing up secondary CPUs ...
[    0.156279] CPU1: thread -1, cpu 1, socket 9, mpidr 80000901
[    0.156291] CPU1: Spectre v2: using BPIALL workaround
[    2.716379] random: fast init done

> ---
>   drivers/irqchip/irq-gic.c | 103 +++++++++++++++++++++++---------------
>   1 file changed, 63 insertions(+), 40 deletions(-)
>
> ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

