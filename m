Return-Path: <SRS0=0LAj=CY=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8805C43461
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Sep 2020 06:48:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63E3820897
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Sep 2020 06:48:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tNcF2zik"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgIOGsL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 15 Sep 2020 02:48:11 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38237 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbgIOGsH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 02:48:07 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200915064802euoutp01e855dd9c7d176f2705fef4e5aee8af75~04jSHfbxm0591805918euoutp01j
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2020 06:48:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200915064802euoutp01e855dd9c7d176f2705fef4e5aee8af75~04jSHfbxm0591805918euoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600152482;
        bh=ldNThNHU1aIcNBv7WFXBp5WXZzNOLca70KwulNoR3Y8=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=tNcF2zik2F/J9G+x1ksTIncE/zULNeiQ5ddRDDCd1VuRe7kCPS4voK5gNRPCWg8uB
         ilCD2FT5cliADhkcaD4QOeHAm0l1XrxUUBUwd+CLjfGkTW139z/dpqqTLGqiCwxmKW
         hkbcVDazycsjh779TONWwwYEcuZZvwiVc6WtSMlw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200915064802eucas1p1a628567da13171e504a09bec724aa579~04jRevy6Z0581705817eucas1p1A;
        Tue, 15 Sep 2020 06:48:02 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 97.92.06318.2A3606F5; Tue, 15
        Sep 2020 07:48:02 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200915064801eucas1p27e91f102110979fa3430097e2de85a6f~04jQ5ISI21868818688eucas1p2m;
        Tue, 15 Sep 2020 06:48:01 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200915064801eusmtrp2e7e4e14437180de7aa696e901273ca41~04jQ4WmyZ2912929129eusmtrp2j;
        Tue, 15 Sep 2020 06:48:01 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-b1-5f6063a2b3f8
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id CA.5C.06017.1A3606F5; Tue, 15
        Sep 2020 07:48:01 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200915064800eusmtip167f08b3e1b9b825d3831d5cc69fc9ce2~04jP7Wmuj1582115821eusmtip17;
        Tue, 15 Sep 2020 06:48:00 +0000 (GMT)
Subject: Re: [PATCH v3 08/16] irqchip/gic: Configure SGIs as standard
 interrupts
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Will Deacon <will@kernel.org>,
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
Message-ID: <33e3ef7c-44e9-a509-74ad-c2e39779fd9d@samsung.com>
Date:   Tue, 15 Sep 2020 08:48:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <14e2c690bf99280588538989014c7356@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf0yMcRzH+97z3HNPx7WnK/oslrkwTNFi+wpRw56NlgwzGzn1rKJf7lwp
        mai1um5JY3I1Z6kkCRenX6uc1om5i5uWlIlqaf2w0lL51fUU/fd6fz7vz/fzY1+akKopVzoi
        +gyniJZHyigxaWiaMHsUhBwP3tDZSGFLp5HAj3IfCPFwsQbhyaFGEc4vScAXC60krnzqjC2W
        hyKs/9IqxNbqfArnWuoE+INVgqvym4VYbfxF4fK6LApX6K8R+KlugsCpHZt2SFlDjUHIlt0s
        Q2xqioZib5adY6u0nSL2ll7F6kszKDa5wUKyHa21FDtkNovYisILbFXlqIDNelyK2FG92z6H
        I+KtoVxkRBynWO97XBzekGamYt+sPps5chclI627GtnTwGyEytzbhBqJaSlTgiCzvn1WfEdw
        qame4sUogndj5cK5Euv7DAGfuIPgRXHFrBhGMHUvW2BzOTH7oTPzCrKxM7McRlqakc1EMAYh
        GI3GmQTFeIF6UE3ZWML4wsDHLpGNSWYlZDWYCBsvYo5B08vPJO9xhOYb3TNsz/hATd6PGT/B
        LIOUJ3kEzy7Q3q2bmQiYWhrMOVcpfu6d0DdVL+LZCfpNj2d5KfypmitIQdBlvi/ihQaB9VIu
        4l1boMM8Of0SPd1iDTyoXs+H/aA/vUhoCwPjAG2DjvwQDpBjuE7wYQmkp0l59yrQmsr/tX3W
        8pbIRjLtvNW089bRzltH+7/vLUSWIhdOpYwK45Te0Vy8p1IepVRFh3mGxETp0fQPffXbNFaJ
        6n6eMCKGRrKFEloVHCwVyuOUCVFGBDQhc5b4v351TCoJlSckcoqYYIUqklMa0RKalLlIvAu+
        HpUyYfIz3CmOi+UUc1kBbe+aPH2f4thHm6e6UtU/03xloX4HIwLOi/1f2mUe7RovXbHUFOTj
        cflbhVtvgEqXuNhQuLYoeSCobcGeIfC2O0n1lA8n7hr9tPH6anNT/JSm73CZY6DrHzIjSe05
        WRNrt/tQr9eaJI7YlbDOXaPyHg8sanV67nPg9LNtjTvCdYHbezR75TJSGS73WksolPK/aiY+
        V50DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDKsWRmVeSWpSXmKPExsVy+t/xu7oLkxPiDVackrQ4f/cQs8XGGetZ
        Ld4v62G0+PXuCLvFnBWVFo1LLrNY7NguYnH+/AZ2i02Pr7FaXN41h81ixvl9TBa3L/Na7Jxz
        ktWi69BfNot1+/rYLDZvmspssX3+T2aLljumDkIe23ZvY/VYM28No0dLcw+bx7w11R47Z91l
        91iwqdRj06pONo+GA+dZPO5c28Pm8e7cOXaPzUvqPXbu+Mzk0bdlFaPH501yAXxRejZF+aUl
        qQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehkH2s6xFVzUqOj+
        tJKxgXGWchcjJ4eEgInE5ZudTF2MXBxCAksZJa4c3sICkZCRODmtgRXCFpb4c62LDaLoLaNE
        f2sLI0hCWCBI4m73RDBbREBR4tOFk4wgRcwCO1glZm44xALR8Z9Jov3WXjaQKjYBQ4mut11g
        Nq+AncSbew/ZQWwWAVWJvgPHmUFsUYE4iTM9L6BqBCVOznwCdhKngJXE7tk/wOqZBcwk5m1+
        yAxhy0s0b50NZYtL3Hoyn2kCo9AsJO2zkLTMQtIyC0nLAkaWVYwiqaXFuem5xUZ6xYm5xaV5
        6XrJ+bmbGIEpY9uxn1t2MHa9Cz7EKMDBqMTDm1AeHy/EmlhWXJl7iFGCg1lJhNfp7Ok4Id6U
        xMqq1KL8+KLSnNTiQ4ymQM9NZJYSTc4HprO8knhDU0NzC0tDc2NzYzMLJXHeDoGDMUIC6Ykl
        qdmpqQWpRTB9TBycUg2M/YXlQklrpuyY9cQ4RaMw/5lggoPz/S8qP4+tE/zI0cU66ZDyTNHW
        fC3OJRMPbTA5nLjnC/v/qElWfxUm7Xvl5Gfq3JIXKnv3c+zeFu6PBlJrFXfauBireHx+Fep/
        Zo3NOuE7WzN2syo7Be3TiO19Wacqo3n/0M50jcCWjLJmpa4rO/N6Q7KVWIozEg21mIuKEwE0
        zO25LwMAAA==
X-CMS-MailID: 20200915064801eucas1p27e91f102110979fa3430097e2de85a6f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200914130601eucas1p23ce276d168dee37909b22c75499e68da
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200914130601eucas1p23ce276d168dee37909b22c75499e68da
References: <20200901144324.1071694-1-maz@kernel.org>
        <20200901144324.1071694-9-maz@kernel.org>
        <CGME20200914130601eucas1p23ce276d168dee37909b22c75499e68da@eucas1p2.samsung.com>
        <a917082d-4bfd-a6fd-db88-36e75f5f5921@samsung.com>
        <8642847d83ef5bb15663d0246d6af668@kernel.org>
        <65565f85-d932-37f3-a8cd-dbd13d7dbfad@samsung.com>
        <14e2c690bf99280588538989014c7356@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marc,

On 14.09.2020 17:09, Marc Zyngier wrote:
> On 2020-09-14 14:26, Marek Szyprowski wrote:
>> On 14.09.2020 15:13, Marc Zyngier wrote:
>>> On 2020-09-14 14:06, Marek Szyprowski wrote:
>>>> On 01.09.2020 16:43, Marc Zyngier wrote:
>>>>> Change the way we deal with GIC SGIs by turning them into proper
>>>>> IRQs, and calling into the arch code to register the interrupt range
>>>>> instead of a callback.
>>>>>
>>>>> Reviewed-by: Valentin Schneider <valentin.schneider@arm.com>
>>>>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>>>> This patch landed in linux next-20200914 as commit ac063232d4b0
>>>> ("irqchip/gic: Configure SGIs as standard interrupts"). Sadly it 
>>>> breaks
>>>> booting of all Samsung Exynos 4210/4412 based boards (dual/quad ARM
>>>> Cortex A9 based). Here are the last lines from the bootlog:
>>>>
>>>> [    0.106322] CPU: Testing write buffer coherency: ok
>>>> [    0.109895] CPU0: Spectre v2: using BPIALL workaround
>>>> [    0.116057] CPU0: thread -1, cpu 0, socket 9, mpidr 80000900
>>>> [    0.123885] Setting up static identity map for 0x40100000 -
>>>> 0x40100060
>>>> [    0.130191] rcu: Hierarchical SRCU implementation.
>>>> [    0.137195] soc soc0: Exynos: CPU[EXYNOS4210] PRO_ID[0x43210211]
>>>> REV[0x11] Detected
>>>> [    0.145129] smp: Bringing up secondary CPUs ...
>>>> [    0.156279] CPU1: thread -1, cpu 1, socket 9, mpidr 80000901
>>>> [    0.156291] CPU1: Spectre v2: using BPIALL workaround
>>>> [    2.716379] random: fast init done
>>>
>>> Thanks for the report. Is this the funky non-banked GIC?
>>
>> Both Exynos 4210 and 4412 use non-zero cpu-offset in GIC node in
>> device-tree: arch/arm/boot/dts/exynos{4210,4412}.dtsi, so I assume that
>> the GIC registers are not banked.
>
> Annoyingly, it seems to work correctly in QEMU:
>
> root@unassigned-hostname:~# cat /proc/interrupts
>            CPU0       CPU1
>  40:          0          0     GIC-0  89 Level     mct_comp_irq
>  41:      16144          0     GIC-0  74 Level     mct_tick0
>  42:          0      15205     GIC-0  80 Level     mct_tick1
>  43:          0          0  COMBINER  18 Edge      arm-pmu
>  44:          0          0  COMBINER  26 Edge      arm-pmu
>  46:       2270          0     GIC-0 107 Level     mmc0
>  48:        878          0     GIC-0  84 Level     13800000.serial
>  52:          0          0     GIC-0  90 Level     13860000.i2c
>  54:          0          0     GIC-0  67 Level     12680000.pdma
>  55:          0          0     GIC-0  68 Level     12690000.pdma
>  56:          0          0     GIC-0  66 Level     12850000.mdma
>  59:          0          0  COMBINER  45 Edge      13620000.sysmmu
>  60:          0          0  COMBINER  46 Edge      13630000.sysmmu
>  61:          0          0  COMBINER  44 Edge      12e20000.sysmmu
>  62:          0          0  COMBINER  34 Edge      11a20000.sysmmu
>  63:          0          0  COMBINER  35 Edge      11a30000.sysmmu
>  64:          0          0  COMBINER  36 Edge      11a40000.sysmmu
>  65:          0          0  COMBINER  37 Edge      11a50000.sysmmu
>  66:          0          0  COMBINER  38 Edge      11a60000.sysmmu
>  67:          0          0  COMBINER  40 Edge      12a30000.sysmmu
>  68:          0          0  COMBINER  42 Edge      11e20000.sysmmu
>  74:          0          0     GIC-0  79 Level 11400000.pinctrl
>  75:          0          0     GIC-0  78 Level 11000000.pinctrl
>  77:          0          0  COMBINER  39 Edge      12a20000.sysmmu
>  78:          0          0  COMBINER  43 Edge      12220000.sysmmu
> IPI0:          0          1  CPU wakeup interrupts
> IPI1:          0          0  Timer broadcast interrupts
> IPI2:         32         63  Rescheduling interrupts
> IPI3:       3925       5381  Function call interrupts
> IPI4:          0          0  CPU stop interrupts
> IPI5:       4375       3778  IRQ work interrupts
> IPI6:          0          0  completion interrupts
> Err:          0
>
> Do you happen to know whether the QEMU emulation is trustworthy?

I didn't play much with Exynos emulation on QEMU. All I know is that 
this patch simply doesn't work on the real hw.

If there is anything to check or test, let me know. I will try to help 
as much as possible.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

