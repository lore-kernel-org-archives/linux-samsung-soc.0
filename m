Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F52C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 10:18:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3714B60E75
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 10:18:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232736AbhJZKUn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Oct 2021 06:20:43 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:22109 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbhJZKUn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Oct 2021 06:20:43 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20211026101817epoutp032fed8d5c5d69e6e69b0fab5a16bf0188~xjUwj41iu0502605026epoutp037
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 10:18:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20211026101817epoutp032fed8d5c5d69e6e69b0fab5a16bf0188~xjUwj41iu0502605026epoutp037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1635243497;
        bh=fBOAYEV5ZWXRogB+3xddWft+s9ZcUj3JwNNwrpChUuI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mQpcOTYusGs0Xzx112JM3e2NF4n1ceN6G9rIvy4KxFp5a+IGnYmVcWhRvq6EHagaa
         2x/Z0HeCf29OiZgW1pAqIkyqmb3lvOYT91lAA0bsJrLNk1lebdVGW7yG39saU3mrM+
         S8uQoh2iHaEhHIbbPgQWdqhlUUZ7un3qawZkUL7s=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20211026101817epcas2p19b92431b145b5303c9c8b99a5be2002b~xjUwD_Ipf2948429484epcas2p1h;
        Tue, 26 Oct 2021 10:18:17 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.98]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4HdnpD6FhBz4x9Q7; Tue, 26 Oct
        2021 10:18:12 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        A6.58.10018.1E5D7716; Tue, 26 Oct 2021 19:18:09 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20211026101809epcas2p413e93be31926b8d356feccf2b5e76b22~xjUoyCCoB0158901589epcas2p46;
        Tue, 26 Oct 2021 10:18:09 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211026101809epsmtrp115ad242621087a6a64e9c5bf6329ff95~xjUoxBF9Y1793517935epsmtrp1f;
        Tue, 26 Oct 2021 10:18:09 +0000 (GMT)
X-AuditID: b6c32a46-a0fff70000002722-22-6177d5e1d87a
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        48.C4.08902.1E5D7716; Tue, 26 Oct 2021 19:18:09 +0900 (KST)
Received: from perf (unknown [12.36.155.123]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20211026101809epsmtip2824a3a8a010d4dec495270a5a33a8944~xjUomgclr1364413644epsmtip2R;
        Tue, 26 Oct 2021 10:18:09 +0000 (GMT)
Date:   Tue, 26 Oct 2021 19:45:18 +0900
From:   Youngmin Nam <youngmin.nam@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     daniel.lezcano@linaro.org, tglx@linutronix.de,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com, kgene@kernel.org
Subject: Re: [PATCH v1 1/2] clocksource/drivers/exynos_mct_v2: introduce
 Exynos MCT version 2 driver for next Exynos SoC
Message-ID: <20211026104518.GA40630@perf>
MIME-Version: 1.0
In-Reply-To: <91e926c4-9a3a-196d-1451-d3e7d38fc132@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEJsWRmVeSWpSXmKPExsWy7bCmhe7Dq+WJBm+mmlvM+yxr0bT/ErPF
        8bWvWS36H79mttj49geTxabH11gtLu+aw2Yx4/w+JovFj1cwWfzrPchosXnTVGYHbo9ZDb1s
        HptWdbJ53Lm2h83j3blz7B6bl9R79G1ZxejxeZNcAHtUtk1GamJKapFCal5yfkpmXrqtkndw
        vHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0IlKCmWJOaVAoYDE4mIlfTubovzSklSFjPzi
        Elul1IKUnALzAr3ixNzi0rx0vbzUEitDAwMjU6DChOyMf2cWsxUcEaqY/+IzawPjH74uRk4O
        CQETiQ8fTjN1MXJxCAnsYJTov7YWyvnEKDHv0DVmCOcbo8SHloPMMC3bNy2GqtrLKLF/0wdG
        kISQwCMgZ7M+iM0ioCqx7+FpsAY2AV2JbSf+gdWICFhLHN06HyzOLDCJSeL61EwQW1igSuLa
        0wVsIDavgKZET+dqFghbUOLkzCdgNqeAo0T/xKvsILaogLLEgW3HwY6QEFjJIXH3/g+o61wk
        7p3sY4OwhSVeHd/CDmFLSbzsb4Oy6yUWb1vKDNE8gVFi/qYPUAljiVnP2oEu5QC6LkNixpYY
        EFMCaNmRWywQN/NJdBz+yw4R5pXoaBOCaFST+DVlAyOELSOxe/EKqGs8JHZtOcgICatGFom2
        G8uZJzDKz0Ly2iyEZbPANuhILNj9iQ0iLC2x/B8HhKkpsX6X/gJG1lWMYqkFxbnpqcVGBUbw
        uE7Oz93ECE68Wm47GKe8/aB3iJGJg/EQowQHs5II7+V55YlCvCmJlVWpRfnxRaU5qcWHGE2B
        0TSRWUo0OR+Y+vNK4g1NLA1MzMwMzY1MDcyVxHktRbMThQTSE0tSs1NTC1KLYPqYODilGphy
        Q5w8+i/Y5guJzt9y60BR6zHzO6fOWzm9SvexnXj93A9+630mrCWvyg0i79wvua0+U/Cp3qd/
        97kFDV/vNOn4dzRW5O3/Hvk3N7bP3G9bHx7a+VxVMoA349+FEG5Jk/bHbwSfZt1pP+OW8W+5
        0EHWFyZfjD4d+9HA/KjJVEP3UdviHCbX5eu37b6Yuf2VRmn4vfMB8zftUF3jd4Avs7IiuFPM
        /HvkmTPvbfbvN+zKZPPvncVf0ydx6aQtz3Mjnn3sIZFytaaiKlqNxanq7gESV90vni5gZGhf
        K11asHT6Jlte6XKVvUJ1dzZO0DNKUhXpkD/5knflo/cPxGc0PVj33yX+6T7fiKshmxuP9Cqx
        FGckGmoxFxUnAgAs7qtrRQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNLMWRmVeSWpSXmKPExsWy7bCSvO7Dq+WJBu9+SVrM+yxr0bT/ErPF
        8bWvWS36H79mttj49geTxabH11gtLu+aw2Yx4/w+JovFj1cwWfzrPchosXnTVGYHbo9ZDb1s
        HptWdbJ53Lm2h83j3blz7B6bl9R79G1ZxejxeZNcAHsUl01Kak5mWWqRvl0CV0bjysfMBS0C
        Fd2XVzM1MF7l6WLk5JAQMJHYvmkxUxcjF4eQwG5GiSkTD7JAJGQkbq+8zAphC0vcbznCClH0
        gFFi1skzzCAJFgFViX0PT4PZbAK6EttO/GMEsUUErCWObp3PDNLALDCJSeJ59wF2kISwQJXE
        tacL2EBsXgFNiZ7O1SwQUxtZJL403WCCSAhKnJz5BOwMZgEtiRv/XgLFOYBsaYnl/zhAwpwC
        jhL9E6+CzRQVUJY4sO040wRGwVlIumch6Z6F0L2AkXkVo2RqQXFuem6xYYFhXmq5XnFibnFp
        Xrpecn7uJkZw/Ghp7mDcvuqD3iFGJg7GQ4wSHMxKIryX55UnCvGmJFZWpRblxxeV5qQWH2KU
        5mBREue90HUyXkggPbEkNTs1tSC1CCbLxMEp1cAkqBezqkh9xYlrtp7FXVEb1T4bda2r0fFX
        +9N7K3hT++cT/k2l4Qxn73qtnH308/ELHcHx7sEtl72PTdtQ+u3P01lK853aT34Lb+p+wZ24
        hzNV5KrJOk2PDRvOxjKICSSEzJp63DZmt4qMb92prd+YGxZt2edQ822B1YstZQ3b5AXNJ9xY
        rm3U/n+akjeb8EtBzZ+/GpSL29xdBX41vzP4/cyU3e+7kuWXl8+NROqUPu2eFxwhr3zz3Y23
        N1LmfnU9//nA97JVy+4e/teQr1u5LGxFx/b58689Puw/b6rBBM+PL7nvtgRs+J5yzeH25ysi
        yrKr10SXz1RxWpPK8MNl6umg3UsKl1Xx8s7k8X+spsRSnJFoqMVcVJwIADH37LMOAwAA
X-CMS-MailID: 20211026101809epcas2p413e93be31926b8d356feccf2b5e76b22
X-Msg-Generator: CA
Content-Type: multipart/mixed;
        boundary="----Rk3zsqjqUKweF24zVwdvtl2y71nmD2FrmK.R7ke11MfHQlfJ=_60efd_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211021055112epcas2p278145beb21cd6cc4217813a41c1e1407
References: <20211021061804.39118-1-youngmin.nam@samsung.com>
        <CGME20211021055112epcas2p278145beb21cd6cc4217813a41c1e1407@epcas2p2.samsung.com>
        <20211021061804.39118-2-youngmin.nam@samsung.com>
        <0c5dcdab-7aa3-a98f-e615-acbe98489935@canonical.com>
        <20211021082650.GA30741@perf>
        <1b93aaf3-ed64-b105-dec4-07b6f27b385b@canonical.com>
        <20211022042116.GA30645@perf>
        <da83de3a-e7a2-f9b2-80f2-25c39717c3e4@canonical.com>
        <20211026014732.GA45525@perf>
        <91e926c4-9a3a-196d-1451-d3e7d38fc132@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

------Rk3zsqjqUKweF24zVwdvtl2y71nmD2FrmK.R7ke11MfHQlfJ=_60efd_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 26, 2021 at 09:10:28AM +0200, Krzysztof Kozlowski wrote:
> On 26/10/2021 03:47, Youngmin Nam wrote:
> >> If everyone added a new driver to avoid integrating with existing code,
> >> we would have huge kernel with thousands of duplicated solutions. The
> >> kernel also would be unmaintained.
> >>
> >> Such arguments were brought before several times - "I don't want to
> >> integrating with existing code", "My use case is different", "I would
> >> need to test the other cases", "It's complicated for me".
> >>
> >> Instead of pushing a new vendor driver you should integrate it with
> >> existing code.
> >>
> > Let me ask you one question.
> > If we maintain as one driver, how can people who don't have the new MCT test the new driver?
> 
> I assume you talk about a case when someone else later changes something
> in the driver. Such person doesn't necessarily have to test it. The same
> as in all other cases (Exynos MCT is not special here): just ask for
> testing on platform one doesn't have.
> 
> Even if you submit this as separate driver, there is the exact same
> problem. People will change the MCTv2 driver without access to hardware.
> 
Yes, I can test the new MCT driver if someone ask for testing after modifying the new driver.
But in this case, we don't need to test the previous MCT driver. We have only to test the new MCT driver.
> None of these differ for Exynos MCT from other drivers, e.g. mentioned
> Samsung PMIC drivers, recently modified (by Will and Sam) the SoC clock
> drivers or the ChipID drivers (changed by Chanho).
From HW point of view, the previous MCT is almost 10-year-old IP without any major change and
it will not be used on next new Exynos SoC.
MCTv2 is the totally newly designed IP and it will replace the Exynos system timer.
Device driver would be dependent with H/W. We are going to apply a lot of changes for this new MCT.
For maintenance, I think we should separate the new MCT driver for maintenance.

> 
> 
> 
> Best regards,
> Krzysztof
> 

------Rk3zsqjqUKweF24zVwdvtl2y71nmD2FrmK.R7ke11MfHQlfJ=_60efd_
Content-Type: text/plain; charset="utf-8"


------Rk3zsqjqUKweF24zVwdvtl2y71nmD2FrmK.R7ke11MfHQlfJ=_60efd_--
