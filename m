Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F20C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Oct 2021 03:27:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6B4D60F70
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Oct 2021 03:27:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231671AbhJ2D3s (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 28 Oct 2021 23:29:48 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:31336 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231655AbhJ2D3r (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Oct 2021 23:29:47 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20211029032716epoutp04836258b594a67dcf5a590a9c07908b92~yYpv6IBXg0404404044epoutp04X
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Oct 2021 03:27:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20211029032716epoutp04836258b594a67dcf5a590a9c07908b92~yYpv6IBXg0404404044epoutp04X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1635478036;
        bh=u6kkXJBk1XnEia7BxzyuolQLmLyvrfxmOr7t36gf/XQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=R5Ei2AObtIyax4nRSiibHdWeKrXk99rbnMWgJKNBFhOOXMz41EfAyrcHL08kkZiiO
         OJKnkmODuB6yr8nHfhAIGstaGAJuMy/mBXo2ymYb53eZHbnzqmkuaB8zcvGTwJkLwM
         vsrHcg5/tTMfi7FGNOcVYaM0vpPHjP8FtPjCRBHw=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20211029032716epcas2p21c144d6a44569662084ade4c4335e92a~yYpvTRVPo2654626546epcas2p2k;
        Fri, 29 Oct 2021 03:27:16 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.97]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4HgSXc1SJwz4x9QN; Fri, 29 Oct
        2021 03:27:12 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        A6.53.51767.01A6B716; Fri, 29 Oct 2021 12:27:12 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20211029032711epcas2p1121d9342383760cd6ebd86f725305fac~yYprCxS3Q2010620106epcas2p1S;
        Fri, 29 Oct 2021 03:27:11 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211029032711epsmtrp28029c247a241237a72262e9796f6140b~yYprB6Ukw1709417094epsmtrp2T;
        Fri, 29 Oct 2021 03:27:11 +0000 (GMT)
X-AuditID: b6c32a45-447ff7000000ca37-c3-617b6a10016f
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        51.CF.08738.F0A6B716; Fri, 29 Oct 2021 12:27:11 +0900 (KST)
Received: from perf (unknown [12.36.155.123]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20211029032711epsmtip206c3a07ba43c08cff06ef9b63926eca0~yYpq2jWqt1792317923epsmtip2j;
        Fri, 29 Oct 2021 03:27:11 +0000 (GMT)
Date:   Fri, 29 Oct 2021 12:54:22 +0900
From:   Youngmin Nam <youngmin.nam@samsung.com>
To:     Will Deacon <will@kernel.org>
Cc:     krzysztof.kozlowski@canonical.com, mark.rutland@arm.com,
        daniel.lezcano@linaro.org, tglx@linutronix.de,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com, kgene@kernel.org
Subject: Re: [PATCH v1 1/2] clocksource/drivers/exynos_mct_v2: introduce
 Exynos MCT version 2 driver for next Exynos SoC
Message-ID: <20211029035422.GA30523@perf>
MIME-Version: 1.0
In-Reply-To: <20211027073458.GA22231@willie-the-truck>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0xbVRTHc9+jj1dMzZPBuIMB5anEshVahPKYYCSAPnQanPyxmcXuAU+K
        0B/pa5FtwRXZYCMyIVIDDUIXmLKGBVZIgQ42BpsMCeh+BLVhjFDGjLhltsucGxDbPqb+9znn
        nu/9nnvPvTgaOoZF4qUaA6vXMOUkFhLkmJAopMQnhxlZRx1GtXujqc8vXkepybOrAupL9ypK
        nbv3GKHs7jkBdcPZhlEtP15AqNM/X0OoTnc3Qm00XAJUv92MUkfnU98Q0T3tPYC2mBow2m47
        gdHzcyMYfX92Npju7zpCnxywAdprj8nHPyzLULFMMasXs5oibXGppiSTfOcDZbYyVSGTS+Xp
        VBop1jBqNpPM2Z0vfbO03NcwKa5gyo2+VD7DcWTS6xl6rdHAilVazpBJsrricl2aLpFj1JxR
        U5KoYQ275DJZcqqv8ECZ6pTzIqarlVT+NOIBJnBUXA+EOCRSYEv9KOLnUGIIwA1XVT0I8bEH
        wJumYYQPvADWnDmDPVOMjT7aXHAC6LStCfhgCcD1mmHUXxVEvAz7e5uC/YwRUui4ugH8HEbE
        waHBNdQvQIlpBM7UOAMLW4hDcO6ONWAhIiSwesAZxPMLcKp12cc4LiQUcH5krz8dTrwIxxyT
        gS4gMYLDnq4WhG8vB7at9wXxvAX+PjkQzHMk9N4f3TzCEdjpOI3y4kYAO+wPNotehZaVOuA3
        QwkVXH9U6EfoM7vsCmyJEs/D4xPrwXxaBI/XhvLCePikuQ/wvB2e7+xGeabh4MYwyt+PG4XV
        d1aQRhBr+d/JLP+ZWQIOO6H1vAfj01Hwuw2cRwnsdSZZgcAGtrI6Tl3Ccsk6+b+zLtKq7SDw
        lBNyh8BX9x4kjgMEB+MA4igZJrrR/ikTKipmDh5i9Vql3ljOcuMg1TemJjQyvEjr+wsag1Ke
        ki5LUSjkacmpsjQyQpQeXsaEEiWMgS1jWR2rf6ZDcGGkCWmd1s5sy3cvxx+7NVOxsBpxoq13
        l/lW97eeHSbjk0L1N/sNcfF7LFld6fu6pPTfg46x9xclwt+ao65ecWGCHdnqaO2BqpQsuRlZ
        /KLp2DiSDjRLeR/Z1jIKxIL9MXeXtoaj05auqZ6stzrOLVdFe95bWHbvGb6ZpGp4Kb95/hfb
        3F+GuJiPRZcX/tAeXK8+WzP+UHc4IWw7ua8gIst1u8/x2VLUSqw1Jzsv9xXhheY+R0Xsu6Qh
        F0/MuLRccOXUbeVe19dN5tmHtRbwa0RlK7ZQSQtPLm6zPha8bW1Meu6HutfahUmGvKd1d3ea
        FycKr4fs9v7JfR+NLk5NLVgb468Zn5JBnIqRJ6B6jvkHZglhgVMEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42LZdlhJXpc/qzrR4PUpSYt5n2UtmvZfYrY4
        vvY1q0X/49fMFhvf/mCy2PT4GqvF5V1z2CxmnN/HZLH0+kUmi8WPVzBZ/Os9yGixedNUZouW
        O6YOvB5r5q1h9JjV0MvmsWlVJ5vHnWt72DzenTvH7rF5Sb1H35ZVjB6fN8kFcERx2aSk5mSW
        pRbp2yVwZaw/8Iex4JhaxYd929kaGO/KdjFyckgImEgc2PuNqYuRi0NIYAejRP/TF2wQCRmJ
        2ysvs0LYwhL3W46wQhQ9YJR4/fEPO0iCRUBVYvP6iWA2m4CuxLYT/xhBbBEBRYkd2/8wgzQw
        C5xlkvi3dRdYkbBAlcS1pwvANvAKaEo0btnFAjH1KbNE38IVjBAJQYmTM5+wgNjMAloSN/69
        BLqPA8iWllj+jwPE5BQwk7izJwKkQlRAWeLAtuNMExgFZyFpnoWkeRZC8wJG5lWMkqkFxbnp
        ucWGBUZ5qeV6xYm5xaV56XrJ+bmbGMGRpaW1g3HPqg96hxiZOBgPMUpwMCuJ8F6eV54oxJuS
        WFmVWpQfX1Sak1p8iFGag0VJnPdC18l4IYH0xJLU7NTUgtQimCwTB6dUA1OCJ6fli53p6xbF
        2xoujFrRbhSp8Wm+/nqBBd5b3B9wPS20rK3e67Hl8u1C/bzexXf01muY/q3MsV3kd+2F+frr
        pkHJHfOuvNP3vHJeOE/7WV9x+1K5HZxs/w4WTOTm2LyFyzNovfnlrRdNokKjTYv3T7Q2Dt4U
        wRbw58wlfQFeTk7G+Zuz9m5XOKJwYeN0EYP4M/9bVlk0Fvp3qM6/XSGqrZTTERTZ/O3dPEkz
        O+tdvpyum+oeRx9W+ZLFtOnpnx/Nk+YpRK58s8by62r9zkjB+qcathbP7inLiQXMUxXOETdZ
        d1LsmoLVoeysvTwVwbyPfssL/Pzd8Ca5uu23/65FD/JvJx2V/XdHUc3hkRJLcUaioRZzUXEi
        AO/cqjcbAwAA
X-CMS-MailID: 20211029032711epcas2p1121d9342383760cd6ebd86f725305fac
X-Msg-Generator: CA
Content-Type: multipart/mixed;
        boundary="----TI73IYgzdP03rYJ9SiN0qM3o3mlayfAqXHuFFMbUzbY.6Ea-=_800aa_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211027011125epcas2p2916524051416ede854b750c91a19073b
References: <1b93aaf3-ed64-b105-dec4-07b6f27b385b@canonical.com>
        <20211022042116.GA30645@perf>
        <da83de3a-e7a2-f9b2-80f2-25c39717c3e4@canonical.com>
        <20211026014732.GA45525@perf>
        <91e926c4-9a3a-196d-1451-d3e7d38fc132@canonical.com>
        <20211026104518.GA40630@perf>
        <cb5bd5a3-1c23-0dc5-9f77-112befd7269c@canonical.com>
        <CGME20211027011125epcas2p2916524051416ede854b750c91a19073b@epcas2p2.samsung.com>
        <20211027013709.GA17353@perf> <20211027073458.GA22231@willie-the-truck>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

------TI73IYgzdP03rYJ9SiN0qM3o3mlayfAqXHuFFMbUzbY.6Ea-=_800aa_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 27, 2021 at 08:34:58AM +0100, Will Deacon wrote:
> On Wed, Oct 27, 2021 at 10:38:37AM +0900, Youngmin Nam wrote:
> > On Tue, Oct 26, 2021 at 01:00:51PM +0200, Krzysztof Kozlowski wrote:
> > > On 26/10/2021 12:45, Youngmin Nam wrote:
> > > > On Tue, Oct 26, 2021 at 09:10:28AM +0200, Krzysztof Kozlowski wrote:
> > > >> On 26/10/2021 03:47, Youngmin Nam wrote:
> > > >>>> If everyone added a new driver to avoid integrating with existing code,
> > > >>>> we would have huge kernel with thousands of duplicated solutions. The
> > > >>>> kernel also would be unmaintained.
> > > >>>>
> > > >>>> Such arguments were brought before several times - "I don't want to
> > > >>>> integrating with existing code", "My use case is different", "I would
> > > >>>> need to test the other cases", "It's complicated for me".
> > > >>>>
> > > >>>> Instead of pushing a new vendor driver you should integrate it with
> > > >>>> existing code.
> > > >>>>
> > > >>> Let me ask you one question.
> > > >>> If we maintain as one driver, how can people who don't have the new MCT test the new driver?
> > > >>
> > > >> I assume you talk about a case when someone else later changes something
> > > >> in the driver. Such person doesn't necessarily have to test it. The same
> > > >> as in all other cases (Exynos MCT is not special here): just ask for
> > > >> testing on platform one doesn't have.
> > > >>
> > > >> Even if you submit this as separate driver, there is the exact same
> > > >> problem. People will change the MCTv2 driver without access to hardware.
> > > >>
> > > > Yes, I can test the new MCT driver if someone ask for testing after modifying the new driver.
> > > > But in this case, we don't need to test the previous MCT driver. We have only to test the new MCT driver.
> > > 
> > > Like with everything in Linux kernel. We merge instead of duplicate.
> > > It's not an argument.
> > > 
> > > >> None of these differ for Exynos MCT from other drivers, e.g. mentioned
> > > >> Samsung PMIC drivers, recently modified (by Will and Sam) the SoC clock
> > > >> drivers or the ChipID drivers (changed by Chanho).
> > > > From HW point of view, the previous MCT is almost 10-year-old IP without any major change and
> > > > it will not be used on next new Exynos SoC.
> > > > MCTv2 is the totally newly designed IP and it will replace the Exynos system timer.
> > > > Device driver would be dependent with H/W. We are going to apply a lot of changes for this new MCT.
> > > > For maintenance, I think we should separate the new MCT driver for maintenance.
> > > > 
> > > 
> > > There are several similarities which actually suggest that you
> > > exaggerate the differences.
> > > 
> > > The number of interrupts is the same (4+8 in older one, 12 in new one...).
> > 
> > I didn't "exaggerate" at all.
> > The numer of interrups is the same. But their usage is completely different.
> > The type of each timer is different.
> > And previous MCT can only support upto 8 cores.
> > 
> > * MCTv1 (Let me call previous MCT as MCTv1)
> >  - 4 global timer + 8 local timer
> >  - Global timer and local timer are totally different.
> >  - 4 global timer have only one 64bit FRC that serves as the "up-counter" with 4 "comparators"
> >  - 8 local timer have 8 of 32bit FRC that serves as the "down-counter" without any "comparators".(just expire timer)
> >  - local timer can be used as per-cpu event timer, so it can only support upto 8 cores.
> > 
> > * MCTv2
> >  - There are no global timer and local timer anymore.
> >  - 1 of 64bit FRC that serves as "up-counter" (just counter without "comparators")
> >  - 12 comaprators (These are not "counter") can be used as per-cpu event timer so that it can support upto 12 cores.
> >  - RTC source can be used as backup source.
> > 
> > > You assign the MCT priority also as higher than Architected Timer
> > > (+Cc Will and Mark - is it ok for you?)
> > >     evt->rating = 500;      /* use value higher than ARM arch timer *
> > > 
> > Yes, this is absolutely correct on event timer.
> > We cannot use arm arch timer which is operating based on PPI as per-cpu event timer because of poewr mode.
> 
> You should be able to now that I've added support for per-cpu wakeup timers.
> 
> As long as the Arm arch timer is marked as C3STOP (e.g. by sticking the
> "local-timer-stop" property in the DT notes), then the MCT will be used
> as the wakeup source if you set the CLOCK_EVT_FEAT_PERCPU feature flag.
> 
> Give it a try.
> 
> Will
> 
Hi Will. Thanks for sharing information.

In MCTv2, we need more time to test because this patchset is the start for MCTv2 new driver.
This feature is for better performance not functionality.
How about considering this later after the current patchset is merged first ?
After doing our regression test, we will be able to consider applying this.

Thanks.


------TI73IYgzdP03rYJ9SiN0qM3o3mlayfAqXHuFFMbUzbY.6Ea-=_800aa_
Content-Type: text/plain; charset="utf-8"


------TI73IYgzdP03rYJ9SiN0qM3o3mlayfAqXHuFFMbUzbY.6Ea-=_800aa_--
