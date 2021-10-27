Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7C5C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Oct 2021 01:11:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36E9B60F92
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Oct 2021 01:11:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236798AbhJ0BOJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Oct 2021 21:14:09 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:44419 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236539AbhJ0BOJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Oct 2021 21:14:09 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20211027011143epoutp0176d4eedabd6566c6322c81b4172d7fd3~xvg0Ssyuk0908209082epoutp01i
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Oct 2021 01:11:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20211027011143epoutp0176d4eedabd6566c6322c81b4172d7fd3~xvg0Ssyuk0908209082epoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1635297103;
        bh=K8HSKkaEEKEWAq55HPkOn3PRY7C2kE+XBGQDXcLE+Uk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=brDvuTMsQzZre63ctnupAcAQmiL+OTaXxnvNNIVUhGEiZSyjzvILXgK12Ot4tA8Co
         hTdKyfP8g46a+Bb05HXHFkqEUVT8essqvIJIRFRG6L0U2y84TrSpvlwh3Q9dWM5yCE
         OQp8q42DtHYqqifm1faEoi6D5OqQjejIGu5/OBb4=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20211027011142epcas2p37b7a2a61dac16d64c3d0dc59d0d46909~xvgzn0BXI2950029500epcas2p3a;
        Wed, 27 Oct 2021 01:11:42 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.92]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4Hf9cx10lWz4x9QK; Wed, 27 Oct
        2021 01:11:29 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        6A.D2.10014.E37A8716; Wed, 27 Oct 2021 10:11:26 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20211027011125epcas2p2916524051416ede854b750c91a19073b~xvgkKRKJC0638106381epcas2p2f;
        Wed, 27 Oct 2021 01:11:25 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211027011125epsmtrp1c01aa68d1626c318efff2a2579271997~xvgkJRUE-2212822128epsmtrp1C;
        Wed, 27 Oct 2021 01:11:25 +0000 (GMT)
X-AuditID: b6c32a47-473ff7000000271e-5b-6178a73e1949
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        99.46.08738.D37A8716; Wed, 27 Oct 2021 10:11:25 +0900 (KST)
Received: from perf (unknown [12.36.155.123]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20211027011125epsmtip2c5151bd26c3328a11812611f08c559ed~xvgjrGK6R2666326663epsmtip2q;
        Wed, 27 Oct 2021 01:11:25 +0000 (GMT)
Date:   Wed, 27 Oct 2021 10:38:37 +0900
From:   Youngmin Nam <youngmin.nam@samsung.com>
To:     krzysztof.kozlowski@canonical.com, will@kernel.org,
        mark.rutland@arm.com, daniel.lezcano@linaro.org
Cc:     tglx@linutronix.de, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com, kgene@kernel.org
Subject: Re: [PATCH v1 1/2] clocksource/drivers/exynos_mct_v2: introduce
 Exynos MCT version 2 driver for next Exynos SoC
Message-ID: <20211027013709.GA17353@perf>
MIME-Version: 1.0
In-Reply-To: <cb5bd5a3-1c23-0dc5-9f77-112befd7269c@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPJsWRmVeSWpSXmKPExsWy7bCmqa7d8opEgyf/+SzmfZa1aNp/idni
        +NrXrBb9j18zW2x8+4PJYtPja6wWl3fNYbOYcX4fk8XS6xeZLBY/XsFk8a/3IKPF5k1TmS1a
        7pg68HqsmbeG0WNWQy+bx6ZVnWwed67tYfN4d+4cu8fmJfUefVtWMXp83iQXwBGVbZORmpiS
        WqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6DrlpkDdLCSQlliTilQKCCx
        uFhJ386mKL+0JFUhI7+4xFYptSAlp8C8QK84Mbe4NC9dLy+1xMrQwMDIFKgwITtj3rziglv6
        FfPn8jUwvlbtYuTkkBAwkZjxbTV7FyMXh5DADkaJ1Svns4MkhAQ+MUq8ayqASHxmlLi/ZSMz
        TEf/1utMEIldjBLXdz5hg3AeAbXfeMICUsUioCqx4ONbVhCbTUBXYtuJf4wgtohApsSHL59Y
        QRqYBb4ySnw68IIJJCEsUCVx7ekCNhCbV0BT4vD8qSwQtqDEyZkQQzkFHCUefL4DNkhUQFni
        wLbjYGdICOzhkNi4bAoTxH0uEh/fToC6VVji1fEt7BC2lMTL/jYou15i8balzBDNExgl5m/6
        AJUwlpj1rB1oAwfQeRkS3RNTQUwJoGVHboHdwCzAJ9Fx+C87RJhXoqNNCKJRTeLXlA2MELaM
        xO7FK6Au8JDY/m8nMySAlrBIPN96mWkCo/wsJK/NQlg2C2yDjsSC3Z/YIMLSEsv/cUCYmhLr
        d+kvYGRdxSiWWlCcm55abFRgDI/q5PzcTYzglKzlvoNxxtsPeocYmTgYDzFKcDArifBenlee
        KMSbklhZlVqUH19UmpNafIjRFBhPE5mlRJPzgVkhryTe0MTSwMTMzNDcyNTAXEmc11I0O1FI
        ID2xJDU7NbUgtQimj4mDU6qBSWvnnLgjNjyrDm6Ycc7piHNO8y1mq1dpc8N0Ps34vKRh0auz
        x7UW1bJ1f61Iaj1wbXOxDufqNQcfFF2daB67QG2b7f+3KYf3HtdddTPyZNEDxjUWIsWPbtWu
        dFxVtnHP5AnX3lpMcTVbUcJ7Tecs26Lnrn/sRLVOeF1/uP/fDHY14W01Gy4e9e89tG3x/FPr
        Nv/U5Ja/bTv37YZ12a9/XwztmNVwJI9nw7f1Tv41jw54WfixSlgvy6m/HFiu4eZ8z/KOidlu
        W2fbacvzJ3b8Tols3P7T5tFT/1NhE5gWR9jP28iy0JLf4LXw2a/9z/5yLchmkzud9k4sebHK
        fIHYK3t21uhcV5/PEDtBVvHPpW2CSizFGYmGWsxFxYkA21XcAlIEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42LZdlhJXtd2eUWiwb0dihbzPstaNO2/xGxx
        fO1rVov+x6+ZLTa+/cFksenxNVaLy7vmsFnMOL+PyWLp9YtMFosfr2Cy+Nd7kNFi86apzBYt
        d0wdeD3WzFvD6DGroZfNY9OqTjaPO9f2sHm8O3eO3WPzknqPvi2rGD0+b5IL4IjisklJzcks
        Sy3St0vgyrjSvIWxYJZuxfTF7ewNjEeUuxg5OSQETCT6t15n6mLk4hAS2MEo0XNiIitEQkbi
        9srLULawxP2WI6wQRQ8YJX4ees4CkmARUJVY8PEtWBGbgK7EthP/GEFsEYFMiQ9fPoE1MAt8
        Z5RoeLMPLCEsUCVx7ekCNhCbV0BT4vD8qSwQUy8wS1x7t4AVIiEocXLmE7ANzAJaEjf+vQS6
        jwPIlpZY/o8DJMwp4Cjx4PMdsJmiAsoSB7YdZ5rAKDgLSfcsJN2zELoXMDKvYpRMLSjOTc8t
        Niwwykst1ytOzC0uzUvXS87P3cQIji0trR2Me1Z90DvEyMTBeIhRgoNZSYT38rzyRCHelMTK
        qtSi/Pii0pzU4kOM0hwsSuK8F7pOxgsJpCeWpGanphakFsFkmTg4pRqY5i9wO5962dI71Xzm
        9L7ultLlrGxn9bcKqixazh9lrvo6ft1iTY5rxoYPXYsK+dZ5HoqPvRz9fVdIodjWTZeWXlHJ
        /LilIqlZ7Zu9A8eWd1UFOv+FTy2bJZnlH91ibjvn3mJuZTYLk/CHRndM1prXM9x4a80+YWYj
        V9TsY7+2MGw+u8rok/g1exlnJR2DqfNX2s69vfUn/1XxXYIxmlfCFZ+rNt5kWZnCqlL7unvy
        qbYLvziMS1rmcTOc3/Jjh7CeX/266e31me/4T51adXUtu4E2X9ZL4Q9imzeqGS8oYDmj8uDH
        JLNty17nBdXa+ov1OHO5KHk8vvP69HHJv3bOcrEBJfYFDl/4Zi15avdGiaU4I9FQi7moOBEA
        gaPYfhwDAAA=
X-CMS-MailID: 20211027011125epcas2p2916524051416ede854b750c91a19073b
X-Msg-Generator: CA
Content-Type: multipart/mixed;
        boundary="----h_AKHUWQRkGBlr73NA4ieLVz9JAXtD_MDAtjrp6hJMT4c-7Z=_66daf_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211027011125epcas2p2916524051416ede854b750c91a19073b
References: <20211021061804.39118-2-youngmin.nam@samsung.com>
        <0c5dcdab-7aa3-a98f-e615-acbe98489935@canonical.com>
        <20211021082650.GA30741@perf>
        <1b93aaf3-ed64-b105-dec4-07b6f27b385b@canonical.com>
        <20211022042116.GA30645@perf>
        <da83de3a-e7a2-f9b2-80f2-25c39717c3e4@canonical.com>
        <20211026014732.GA45525@perf>
        <91e926c4-9a3a-196d-1451-d3e7d38fc132@canonical.com>
        <20211026104518.GA40630@perf>
        <cb5bd5a3-1c23-0dc5-9f77-112befd7269c@canonical.com>
        <CGME20211027011125epcas2p2916524051416ede854b750c91a19073b@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

------h_AKHUWQRkGBlr73NA4ieLVz9JAXtD_MDAtjrp6hJMT4c-7Z=_66daf_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 26, 2021 at 01:00:51PM +0200, Krzysztof Kozlowski wrote:
> On 26/10/2021 12:45, Youngmin Nam wrote:
> > On Tue, Oct 26, 2021 at 09:10:28AM +0200, Krzysztof Kozlowski wrote:
> >> On 26/10/2021 03:47, Youngmin Nam wrote:
> >>>> If everyone added a new driver to avoid integrating with existing code,
> >>>> we would have huge kernel with thousands of duplicated solutions. The
> >>>> kernel also would be unmaintained.
> >>>>
> >>>> Such arguments were brought before several times - "I don't want to
> >>>> integrating with existing code", "My use case is different", "I would
> >>>> need to test the other cases", "It's complicated for me".
> >>>>
> >>>> Instead of pushing a new vendor driver you should integrate it with
> >>>> existing code.
> >>>>
> >>> Let me ask you one question.
> >>> If we maintain as one driver, how can people who don't have the new MCT test the new driver?
> >>
> >> I assume you talk about a case when someone else later changes something
> >> in the driver. Such person doesn't necessarily have to test it. The same
> >> as in all other cases (Exynos MCT is not special here): just ask for
> >> testing on platform one doesn't have.
> >>
> >> Even if you submit this as separate driver, there is the exact same
> >> problem. People will change the MCTv2 driver without access to hardware.
> >>
> > Yes, I can test the new MCT driver if someone ask for testing after modifying the new driver.
> > But in this case, we don't need to test the previous MCT driver. We have only to test the new MCT driver.
> 
> Like with everything in Linux kernel. We merge instead of duplicate.
> It's not an argument.
> 
> >> None of these differ for Exynos MCT from other drivers, e.g. mentioned
> >> Samsung PMIC drivers, recently modified (by Will and Sam) the SoC clock
> >> drivers or the ChipID drivers (changed by Chanho).
> > From HW point of view, the previous MCT is almost 10-year-old IP without any major change and
> > it will not be used on next new Exynos SoC.
> > MCTv2 is the totally newly designed IP and it will replace the Exynos system timer.
> > Device driver would be dependent with H/W. We are going to apply a lot of changes for this new MCT.
> > For maintenance, I think we should separate the new MCT driver for maintenance.
> > 
> 
> There are several similarities which actually suggest that you
> exaggerate the differences.
> 
> The number of interrupts is the same (4+8 in older one, 12 in new one...).

I didn't "exaggerate" at all.
The numer of interrups is the same. But their usage is completely different.
The type of each timer is different.
And previous MCT can only support upto 8 cores.

* MCTv1 (Let me call previous MCT as MCTv1)
 - 4 global timer + 8 local timer
 - Global timer and local timer are totally different.
 - 4 global timer have only one 64bit FRC that serves as the "up-counter" with 4 "comparators"
 - 8 local timer have 8 of 32bit FRC that serves as the "down-counter" without any "comparators".(just expire timer)
 - local timer can be used as per-cpu event timer, so it can only support upto 8 cores.

* MCTv2
 - There are no global timer and local timer anymore.
 - 1 of 64bit FRC that serves as "up-counter" (just counter without "comparators")
 - 12 comaprators (These are not "counter") can be used as per-cpu event timer so that it can support upto 12 cores.
 - RTC source can be used as backup source.

> You assign the MCT priority also as higher than Architected Timer
> (+Cc Will and Mark - is it ok for you?)
>     evt->rating = 500;      /* use value higher than ARM arch timer *
> 
Yes, this is absolutely correct on event timer.
We cannot use arm arch timer which is operating based on PPI as per-cpu event timer because of poewr mode.
We have to use SPI for per-cpu timer interrupt. (This is the same in all Exynos platform)

> All these point that block is not different. Again, let me repeat, we
> support old Samsung PMICs with new Samsung PMICs in one driver. Even
> though the "old one" won't be changed, as you mentioned here. The same
> Samsung SoC clock drivers are used for old Exynos and for new ones...
> Similarly to pinctrl drivers. The same ChipId.
> 
> Everywhere we follow the same concept of unification instead of
> duplication. Maybe Exynos MCT timer is an exception but you did not
> provide any arguments supporting this. Why Exynos MCTv2 should be
> treated differently than Exynos850 clocks, chipid, pinctrl and other blocks?
> 

If MCTv2 has only changes in register layout, I can consider merging work.
But this is not that case.

You gave a example with PMIC, SoC clock, Pinctrl, ChipId.
These H/W IP have only changes in register layout which came from difference of each SoC.

Were these H/W IP version changed?
Were these H/W IP control method changed ?
No. It only has minor chagnes not major changes.

* PMIC - controls the PMIC reigster with I2C interface regarding their SoC usecase.
       - there is no changes on H/W control method itself.

* SoC Clock - changes only in register layout regarding SoC
            - Clock control method still the same.

* Pinctrl - changes only in gpio pin register layout (pin number, pin type, pin map..) regarding SoC.
	  - Is there any changes on control method ?

* Chipid - This is very simple H/W IP. It only supports unique chip id value with read-only register.
         - It really only have changes in register layout.

MCTv2 is different.
Not only register layout but also it's control method has to be changed regarding H/W difference.

> Daniel,
> Any preferences from you? Integrating MCT into existing driver (thus
> growing it) or having a new one?
> 
> Best regards,
> Krzysztof
> 

------h_AKHUWQRkGBlr73NA4ieLVz9JAXtD_MDAtjrp6hJMT4c-7Z=_66daf_
Content-Type: text/plain; charset="utf-8"


------h_AKHUWQRkGBlr73NA4ieLVz9JAXtD_MDAtjrp6hJMT4c-7Z=_66daf_--
