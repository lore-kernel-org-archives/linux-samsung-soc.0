Return-Path: <SRS0=QYj3=C6=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3015CC43464
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Sep 2020 09:42:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADE882193E
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Sep 2020 09:42:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="fOpti2kF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgIUJmn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 21 Sep 2020 05:42:43 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45280 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgIUJmn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Sep 2020 05:42:43 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200921094241euoutp01712326fe03e3108eaf2de82161cf8b38~2wzeyqIUV0341803418euoutp01T
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Sep 2020 09:42:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200921094241euoutp01712326fe03e3108eaf2de82161cf8b38~2wzeyqIUV0341803418euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600681361;
        bh=P7hV3rizkkW11m3+4j1sNlaGq+/5zEUIOPVUREPUhCo=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=fOpti2kFffFh8HR19ieBNHeTiJp67Mcj6RaWpLEqaoD4k1AwCcxhRjxMHK0NR4NuN
         yNY0lkBdi5V/44ZbPRBNsAJ+I0IE+gaUmMBJY2YuusUf8NrB1mu5Eq5jmIeAghCiMz
         4rnvkWT/fZmCa2eBtJIvka+WZtEj1CpUenIPhU80=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200921094240eucas1p1d13cee11e0eb009b70449ac1d5ea2d5a~2wzeJYofd2799327993eucas1p16;
        Mon, 21 Sep 2020 09:42:40 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id CD.C4.06318.095786F5; Mon, 21
        Sep 2020 10:42:40 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200921094240eucas1p20e6c9bc2b6eea56a28550a020e6c29da~2wzdwpc2I2744327443eucas1p2t;
        Mon, 21 Sep 2020 09:42:40 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200921094240eusmtrp15a50ae632ede260cba22dd9888abdf30~2wzdvwFwl0875108751eusmtrp1y;
        Mon, 21 Sep 2020 09:42:40 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-91-5f687590ecbb
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id BE.CF.06017.095786F5; Mon, 21
        Sep 2020 10:42:40 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200921094239eusmtip1e3c4e8efadf1706f41fef57690666543~2wzdLog8y0239002390eusmtip1F;
        Mon, 21 Sep 2020 09:42:39 +0000 (GMT)
Subject: Re: [PATCH v3 2/3] ARM: dts: exynos: Add assigned clock parent to
 CMU in Exynos4412 Odroid
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <d53d0b67-2368-1434-ab00-fb37b1e824a6@samsung.com>
Date:   Mon, 21 Sep 2020 11:42:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200911145403.GC15290@kozik-lap>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAKsWRmVeSWpSXmKPExsWy7djPc7oTSjPiDW72G1lsnLGe1WL+kXOs
        Fv2PXzNbnD+/gd1i0+NrrBaXd81hs5hxfh+TReveI+wW7U9fMjtwemxa1cnmsXlJvUffllWM
        Hp83yQWwRHHZpKTmZJalFunbJXBlbJv2ibHgLXfFkW9trA2Mnzi7GDk5JARMJP5tOMzSxcjF
        ISSwglHi//M1rBDOF0aJg5eOsIBUCQl8ZpS4f04SpqN5xkl2iKLljBKTDk1jhnDeM0rMnvyP
        CaRKWCBVYsa734wgCRGQ7suTrzGDJJiBErvfHmMFsdkEDCW63naxgdi8AnYS/y7sAFvHIqAq
        0fejD2yQqECcxLFTj1ggagQlTs58AmZzCuhL/HrwnR1iprxE89bZUPPFJW49mc8EslhCYBu7
        xP7n59gh7naRuPPnDjOELSzx6vgWqLiMxOnJPSwQDc2MEg/PrWWHcHqAzm6awQhRZS1x59wv
        oFM5gFZoSqzfpQ8RdpS4dPohC0hYQoBP4sZbQYgj+CQmbZvODBHmlehoE4KoVpOYdXwd3NqD
        Fy4xT2BUmoXktVlI3pmF5J1ZCHsXMLKsYhRPLS3OTU8tNs5LLdcrTswtLs1L10vOz93ECExH
        p/8d/7qDcd+fpEOMAhyMSjy8F8rT44VYE8uKK3MPMUpwMCuJ8DqdPR0nxJuSWFmVWpQfX1Sa
        k1p8iFGag0VJnNd40ctYIYH0xJLU7NTUgtQimCwTB6dUA2P+050JfQafLyUn26opBjDls86W
        1uE79nf+y2D19/E+vsejKuo+Lf7ubXP5ma9c28TkmZr9XW2BDl81l1Xmi5XGnF8wj+lO3OJ1
        HlLsx/0XLfO7dsCx5DVrV02FtlQpJ0+awlqhuvDZXzOf1C/5f/mfoMeVXe8T1efuvsYuK8M8
        5XLG0l1ZR5RYijMSDbWYi4oTAYVeuL1DAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRmVeSWpSXmKPExsVy+t/xu7oTSjPiDVY+FLHYOGM9q8X8I+dY
        Lfofv2a2OH9+A7vFpsfXWC0u75rDZjHj/D4mi9a9R9gt2p++ZHbg9Ni0qpPNY/OSeo++LasY
        PT5vkgtgidKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3
        S9DL2DbtE2PBW+6KI9/aWBsYP3F2MXJySAiYSDTPOMnexcjFISSwlFHiz7QN7BAJGYmT0xpY
        IWxhiT/Xutggit4ySjz58pgZJCEskCrx4+8ZsG4Rgc+MEs8aN4ElmIESE5umMkF03GCUeLtz
        D9hYNgFDia63IKM4OXgF7CT+XdjBAmKzCKhK9P3oYwKxRQXiJM70vICqEZQ4OfMJWA2ngL7E
        rwff2SEWmEnM2/wQapm8RPPW2VC2uMStJ/OZJjAKzULSPgtJyywkLbOQtCxgZFnFKJJaWpyb
        nltspFecmFtcmpeul5yfu4kRGIHbjv3csoOx613wIUYBDkYlHt4L5enxQqyJZcWVuYcYJTiY
        lUR4nc6ejhPiTUmsrEotyo8vKs1JLT7EaAr03ERmKdHkfGByyCuJNzQ1NLewNDQ3Njc2s1AS
        5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwCg6x/jFYXUBnc7oWRNmpn+yWvVu9b++1TFr9ESn
        3p0YcDdurcnn1AXPbmmv3s1xMdSA8Ypn+Y48j8pL2u2a287tuvTBxzE9tm5fbvov7fKQSZdS
        onlbGtXYbooEqTR11TYtf/Tk3YXpv58KPktfs0GHf7ls3el1iqo3w/nMHFu4982zfBgl3qDE
        UpyRaKjFXFScCADHVhZO1gIAAA==
X-CMS-MailID: 20200921094240eucas1p20e6c9bc2b6eea56a28550a020e6c29da
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200911150351eucas1p1c678e3ae20e49209dbf19c000ea033f4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200911150351eucas1p1c678e3ae20e49209dbf19c000ea033f4
References: <20200906142146.21266-1-krzk@kernel.org>
        <20200906142146.21266-2-krzk@kernel.org>
        <CGME20200911150351eucas1p1c678e3ae20e49209dbf19c000ea033f4@eucas1p1.samsung.com>
        <20200911145403.GC15290@kozik-lap>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 11.09.2020 16:54, Krzysztof Kozlowski wrote:
> On Sun, Sep 06, 2020 at 04:21:45PM +0200, Krzysztof Kozlowski wrote:
>> Commit 68605101460e ("ARM: dts: exynos: Add support for audio over HDMI
>> for Odroid X/X2/U3") added assigned clocks under Clock Management Unit.
>>
>> However the dtschema expects "clocks" property if "assigned-clocks" are
>> used.  Add reference to input clock, the parent used in
>> "assigned-clock-parents" to silence the dtschema warnings:
>>
>>    arch/arm/boot/dts/exynos4412-odroidu3.dt.yaml: clock-controller@10030000: 'clocks' is a dependency of 'assigned-clocks'
>>
> Applied.

This patch breaks operation of clocks on Odroid X2/U3:

# dmesg | grep clk
[    0.000000] exynos_clkout_init: failed to register clkout clock
[    0.000000] Exynos4x12 clocks: sclk_apll = 1000000000, sclk_mpll = 
800000000
                 sclk_epll = 45158401, sclk_vpll = 350000000, arm_clk = 
1000000000
[    2.569484] usb3503 0-0008: unable to request refclk (-517)
[    2.848718] s3c-sdhci 12530000.sdhci: clock source 2: mmc_busclk.2 
(50000000 Hz)
[    3.373850] usb3503 0-0008: unable to request refclk (-517)
[    3.542777] usb3503 0-0008: unable to request refclk (-517)
[    3.544005] usb3503 0-0008: unable to request refclk (-517)
[    3.559223] usb3503 0-0008: unable to request refclk (-517)

Please revert or drop if possible.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

