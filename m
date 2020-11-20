Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFC6C64E69
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Nov 2020 11:08:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6E5F22201
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Nov 2020 11:08:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Kw410mzo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbgKTLIT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Nov 2020 06:08:19 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:51198 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728537AbgKTLID (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Nov 2020 06:08:03 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201120110749euoutp0174587ce2b350bd85441fc577a3226de9~JMq8egSLL0262702627euoutp01t
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Nov 2020 11:07:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201120110749euoutp0174587ce2b350bd85441fc577a3226de9~JMq8egSLL0262702627euoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1605870469;
        bh=gVmiDNTGn/AlJbsRkN8bmpFZyS84cyfK4azdcv2P/fQ=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Kw410mzo98lbLpLcjUzr51FaT6HgV6q2p2Pv1X7ds671NpUQl7VNuQiZ1SbVt/e6p
         d/YZ3ZaHdeM/CxtgEX+Y6itt2ngRLr6mKIQGsv8WuKMj6AZqYSWVy+0mK3caHTon5D
         Xk6U78kW8K6SgVW1KYF3KBz8kXS+eV1ZsNj/cGxw=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201120110745eucas1p16bdf3309d920f07ed75071637d18aabe~JMq4Vb35m0496804968eucas1p1K;
        Fri, 20 Nov 2020 11:07:45 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 22.D1.44805.183A7BF5; Fri, 20
        Nov 2020 11:07:45 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201120110744eucas1p2e2853588f94a695e96a124945135077b~JMq3rzb0-2773827738eucas1p2H;
        Fri, 20 Nov 2020 11:07:44 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201120110744eusmtrp2ca8a8c7c1c14946af2538c3e50346a30~JMq3rHax40405804058eusmtrp2k;
        Fri, 20 Nov 2020 11:07:44 +0000 (GMT)
X-AuditID: cbfec7f4-b4fff7000000af05-bb-5fb7a3815d75
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 2D.04.16282.083A7BF5; Fri, 20
        Nov 2020 11:07:44 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201120110744eusmtip1a85392f59249a67946e2f304f5abfe49~JMq3IGuHW2019820198eusmtip1C;
        Fri, 20 Nov 2020 11:07:44 +0000 (GMT)
Subject: Re: [PATCH 2/2] ARM: dts: exynos: use Exynos5420 dedicated USB2 PHY
 compatible
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Willy Wolff <willy.mh.wolff.ml@gmail.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <14102bab-33a1-45e0-0faf-883c7b1133a5@samsung.com>
Date:   Fri, 20 Nov 2020 12:07:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201120110503.GB26836@kozik-lap>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsWy7djPc7qNi7fHG1z+zW+xccZ6VosLT3vY
        LM6f38BucXnXHDaLGef3MVmsn/aT1eLwm3ZWi513TjBbfDvxiNGB02PnrLvsHptWdbJ59G1Z
        xehx/MZ2Jo/Pm+QCWKO4bFJSczLLUov07RK4Mh5+XMNSMJuvYubh+YwNjAu5uxg5OSQETCSa
        989hArGFBFYwSnx45tDFyAVkf2GU6H2+hBnC+cwocePLGnaYjjP7F7JCJJYzSuz51MQO4bxn
        lGh/vpQVpEpYIFLiyuqzYB0iApoS1/9+B4szC5xhkthwRRnEZhMwlOh628UGYvMK2Emc+XYO
        7A4WAVWJecs+gtmiAkkS27dsZ4WoEZQ4OfMJC4jNKaAv0XTrNzPETHmJ7W/nQNniEreezGcC
        OUhC4A2HxOIbDSwQZ7tI7Hk/HeoFYYlXx7dA2TIS/3fCNDQzSjw8t5YdwulhlLjcNIMRospa
        4s65X0CncgCt0JRYv0sfIuwo8fL9KhaQsIQAn8SNt4IQR/BJTNo2nRkizCvR0SYEUa0mMev4
        Ori1By9cYp7AqDQLyWuzkLwzC8k7sxD2LmBkWcUonlpanJueWmyUl1quV5yYW1yal66XnJ+7
        iRGYmE7/O/5lB+PyVx/1DjEycTAeYpTgYFYS4V2ruTVeiDclsbIqtSg/vqg0J7X4EKM0B4uS
        OG/SljXxQgLpiSWp2ampBalFMFkmDk6pBib94/eTlaXbk5kSzVO3f9m4V0jlyH6b7wK1RV8O
        Scm1Xa+aMterwMfpsmNaT5XvHMaMAr5JFg2luycVVjcsYBKvfpC7fF51+tUNFauSNGqZLG7Y
        /p/F4PONdQuTQeTvT95/5JvrxPhigib5BQa/31XF9lBSb9KjKTcXPv1W+aDlUVLZ3nmrmK3l
        dGf0rJON7L7OsP/BixXTJ2omLBA6cWrPmoOtHVszz7pd/DCdZz+vwaFrss0L2JdenbXPZlNV
        coP8kpLT71fef3n/RfXLcC+W5Y96lv3gD+J/8/XY3IyExJwC/fctlY5PmgtZl39NsHKQKjrR
        wnJWQjFvufKvEq+nQVeb3vXd/ZGiUVunka7EUpyRaKjFXFScCACraWbwuwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRmVeSWpSXmKPExsVy+t/xu7oNi7fHG7TuVrXYOGM9q8WFpz1s
        FufPb2C3uLxrDpvFjPP7mCzWT/vJanH4TTurxc47J5gtvp14xOjA6bFz1l12j02rOtk8+ras
        YvQ4fmM7k8fnTXIBrFF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2Nimp
        OZllqUX6dgl6GQ8/rmEpmM1XMfPwfMYGxoXcXYycHBICJhJn9i9k7WLk4hASWMoo8WTjcmaI
        hIzEyWkNrBC2sMSfa11sILaQwFtGieYjkSC2sECkxJXVZ9lBbBEBTYnrf7+DDWIWOMckse3B
        HBaIqS8YJeaffsAIUsUmYCjR9RZiEq+AncSZb+eYQGwWAVWJecs+gtmiAkkSM49DTOUVEJQ4
        OfMJC4jNKaAv0XTrN9h1zAJmEvM2P4Sy5SW2v50DZYtL3Hoyn2kCo9AsJO2zkLTMQtIyC0nL
        AkaWVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmbGIGxuO3Yzy07GFe++qh3iJGJg/EQowQHs5II
        71rNrfFCvCmJlVWpRfnxRaU5qcWHGE2B/pnILCWanA9MBnkl8YZmBqaGJmaWBqaWZsZK4rwm
        R9bECwmkJ5akZqemFqQWwfQxcXBKNTDpalvePuJ+8OqhY95vZea/b5sx8/vdjHa9BS5vNB7v
        fvJOsqyz4JCuJk/ji6Wxv4y2+Eec2db/pCPixwNV7jP3KrcIMQdKvWL5vl3apal8O7+6fcz/
        2w4pFV/C5mdJR2tMC35rx6gW4hn5e8NVv0xjXuWvNy3bZV/Kz6rl+czo+0xwaerU1TzHYnfs
        2lK/W1Jx55LP8i1K99QzIv0en/rPGnq+6pdz2xOZMvbeBcebGj0e2c00kE84rLBnl89Jz8zt
        X1/UzI4ymHin8sZGgTn69TNZNyw+of9e5eaOPwqMk44Et2xbdcWoel/93HVK+r0GvpGbg86t
        bahvZTT/7ZlQpvN4SfiD9zvFTV+ueHBOiaU4I9FQi7moOBEA372RqE4DAAA=
X-CMS-MailID: 20201120110744eucas1p2e2853588f94a695e96a124945135077b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201120085652eucas1p1da360ab03f5b5b02a197d0f1ee435737
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201120085652eucas1p1da360ab03f5b5b02a197d0f1ee435737
References: <20201120085637.7299-1-m.szyprowski@samsung.com>
        <CGME20201120085652eucas1p1da360ab03f5b5b02a197d0f1ee435737@eucas1p1.samsung.com>
        <20201120085637.7299-3-m.szyprowski@samsung.com>
        <20201120110503.GB26836@kozik-lap>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 20.11.2020 12:05, Krzysztof Kozlowski wrote:
> On Fri, Nov 20, 2020 at 09:56:37AM +0100, Marek Szyprowski wrote:
>> USB2.0 PHY in Exynos5420 differs from Exynos5250 variant a bit, so use the
>> recently introduced dedicated compatible for Exynos5420.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos54xx.dtsi | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
>> index fe9d34c23374..2ddb7a5f12b3 100644
>> --- a/arch/arm/boot/dts/exynos54xx.dtsi
>> +++ b/arch/arm/boot/dts/exynos54xx.dtsi
>> @@ -188,7 +188,7 @@
>>   			compatible = "samsung,exynos4210-ehci";
>>   			reg = <0x12110000 0x100>;
>>   			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
>> -			phys = <&usb2_phy 1>;
>> +			phys = <&usb2_phy 0>;
>>   			phy-names = "host";
>>   		};
>>   
>> @@ -196,12 +196,12 @@
>>   			compatible = "samsung,exynos4210-ohci";
>>   			reg = <0x12120000 0x100>;
>>   			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
>> -			phys = <&usb2_phy 1>;
>> +			phys = <&usb2_phy 0>;
>>   			phy-names = "host";
>>   		};
>>   
>>   		usb2_phy: phy@12130000 {
>> -			compatible = "samsung,exynos5250-usb2-phy";
>> +			compatible = "samsung,exynos5420-usb2-phy";
> The DTS change will wait till PHY driver adjustements get merged... or
> if the difference is not critical, maybe using both compatibles (5420
> and 5250) would have sense?

It won't work easily with both compatibles, because in the 5420 variant 
I've also changed the PHY indices (5420 has no device and second hsic 
phy). IMHO the dts change can wait for the next release.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

