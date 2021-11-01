Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1046EC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Nov 2021 05:37:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD87860EE9
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Nov 2021 05:37:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbhKAFje (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 1 Nov 2021 01:39:34 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:21218 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbhKAFje (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 1 Nov 2021 01:39:34 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20211101053659epoutp0360f551affcdf89fa92593369f68eeba5~zVW25vFNg2901429014epoutp03b
        for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Nov 2021 05:36:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20211101053659epoutp0360f551affcdf89fa92593369f68eeba5~zVW25vFNg2901429014epoutp03b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1635745019;
        bh=X9d/lT/9v+VR4sE9Nn8EKuYiwEZL7zoNA5Cz/6PY5Qk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=V9b+3KxbtBfaru+O7j4T+i/GNSrcIMt1p34IsITdpM5mfltckJXOuOqyOCTD7zHLf
         3YqABpqzJBNiXrybRFTL6u8TmicyqW1zEtQC1b/y8ncFJnsy31z1A5wvMf12sbfIE/
         YB8anHT6U7Kh0b9130twXQpU7pgO0SjVyB889hQs=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20211101053659epcas2p36d542506fa1a4e03d51567303b773681~zVW2lF_8w1862018620epcas2p3h;
        Mon,  1 Nov 2021 05:36:59 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.102]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4HjMGv25Vfz4x9QM; Mon,  1 Nov
        2021 05:36:55 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        7C.B3.12141.6FC7F716; Mon,  1 Nov 2021 14:36:55 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20211101053654epcas2p262f076e7f81f19ad2314bc1886980cdf~zVWx_rESD0397103971epcas2p20;
        Mon,  1 Nov 2021 05:36:54 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211101053654epsmtrp228597b72e2e40f1643d095c08055b9b7~zVWx92Kw92755327553epsmtrp2j;
        Mon,  1 Nov 2021 05:36:54 +0000 (GMT)
X-AuditID: b6c32a48-d5dff70000002f6d-fd-617f7cf64443
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        D5.E1.29871.5FC7F716; Mon,  1 Nov 2021 14:36:54 +0900 (KST)
Received: from perf (unknown [12.36.155.123]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20211101053653epsmtip13b91983e9c5831134e265983cc7ab819~zVWxzovJy1666416664epsmtip1b;
        Mon,  1 Nov 2021 05:36:53 +0000 (GMT)
Date:   Mon, 1 Nov 2021 15:04:09 +0900
From:   Youngmin Nam <youngmin.nam@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        will@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org
Cc:     tglx@linutronix.de, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com, kgene@kernel.org
Subject: Re: [PATCH v1 1/2] clocksource/drivers/exynos_mct_v2: introduce
 Exynos MCT version 2 driver for next Exynos SoC
Message-ID: <20211101060409.GB35671@perf>
MIME-Version: 1.0
In-Reply-To: <bde68e45-bc8f-8013-9097-e68d123c9019@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02TfUwbZRzHfe7KcbBUzzK2J9UJHhsGXFkLLb0qiA4iF4eTDY2Cf9QLvdDy
        0pZe614glk0ysBPZIh2jc8BE9lJeHAXLVoYyMGHOwWBuDJFoGEqIk41AcEZYse0xs/8+v+/v
        /XnBUVE/JsZ1ejNr0jOFJBYqcA/EKCUPSq2MtOMWQtUvbqIOfncDpQbb7gZR1dN3Uapj7h+E
        ck2PBVE/eb7AqOPXv0Wo5tujCNU0fRahvFWXAdXpsqNU+aTiVSHdWt8KaEdZFUa7nJ9g9OTY
        JYy+NzwcTHd+ZaU/63ICetH1XCaeU5CkZRkNa4pk9bkGjU6fl0zuyFKnqhWJUplEpqKUZKSe
        KWKTybSMTMnrukLfwGTkh0yhxSdlMhxHbnslyWSwmNlIrYEzJ5OsUVNoVBrjOKaIs+jz4vSs
        +SWZVBqv8AV+UKAd8Z4SGK+m7q29WIuWgXKFDYTgkJDDlgOrmA2E4iLiAoD1C84g3lgA8Mph
        dzBv/A3gsUO3BI9S7L+VI7yjF8C52WWUN+4A+HHbddQfJSA2w8HWswHGCAl0X/ECP68nrPDL
        9tPAn4ASSwAu9M0ifkcYsR+O/dGI+VlIxMAfbzYKeH4a/lD3e4BDiNfgzGxzoFA4EQX73IMI
        P1IfDqfGE2wA93EadHeV8nIY/HOwK5hnMVy814vxbIVN7ubA0JA4AmCDa34tKAE6ZioC9VFC
        Cw/bHcF8zSj4/YSAl5+ElQMP12QhrDwk4jOj4b815wHPz8KeJn51SNCw23tx7XzmUVjR70SP
        gAjHY5s5HuvG81bY2LOAOXwtUOIZeMaL8xgDv/ZsawRBTrCBNXJFeSwXb5T/f9u5hiIXCDzm
        WPoCODE3H9cPEBz0A4ij5HrheyOljEioYfbtZ00GtclSyHL9QOG7p6OoODzX4PsNerNaJldJ
        5YmJMmW8QqokNwpV4QWMiMhjzGwByxpZ06M8BA8RlyFnDu5VP7wddbLkWtLliPHVc1E/S0dz
        7ntOZife1LybPtJJeTZHoxNHa3a/lWJfVwxeRsN++ejOnnMpWMjbS5nmlFrD+W5db9rnK/as
        KU92j7s6On/2qXdavA9KOuSG4Z37wPPKdZIXshqObdz1K5wqqdSGDom8pdauLauTe5YcYu2K
        8lNaF6cTtuKmmfH2dvHKGxXo0AnhxLWWrLq0nRt2H+DsKnl+TUz2fNGW5MmMrTFlDXnmv3bs
        clptx9+cr5e0dZ/anr78hKVDPZBeMG14v3ZZlVo8dCnnxaiZb2JvkKdrq5um+rbnt0QUS+Ns
        VXUjvZbl4e4MVWzC6FVX+qaI+0mkgNMysljUxDH/AasTIjRVBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42LZdlhJTvdbTX2iwZxfTBbzPstaNO2/xGxx
        fO1rVov+x6+ZLTa+/cFksenxNVaLy7vmsFnMOL+PyWLp9YtMFosfr2Cy+Nd7kNFi86apzBYt
        d0wdeD3WzFvD6DGroZfNY9OqTjaPO9f2sHm8O3eO3WPzknqPvi2rGD0+b5IL4IjisklJzcks
        Sy3St0vgypj7dy5LQZdjxeIjx5gaGO8adTFyckgImEhMvd/C1MXIxSEksJtRYtXDM2wQCRmJ
        2ysvs0LYwhL3W46wQhQ9YJR4t/wYWIJFQEXi+JoVzCA2m4CuxLYT/xhBbBGBeolF65YxgjQw
        C3xnlGh4sw8sISxQJXHt6QKwDbwCmhKnryxggZj6gVli0cTVzBAJQYmTM5+wgNjMAloSN/69
        BLqPA8iWllj+jwMkzCngKPHsxVKwmaICyhIHth1nmsAoOAtJ9ywk3bMQuhcwMq9ilEwtKM5N
        zy02LDDMSy3XK07MLS7NS9dLzs/dxAiOLS3NHYzbV33QO8TIxMF4iFGCg1lJhDfiQk2iEG9K
        YmVValF+fFFpTmrxIUZpDhYlcd4LXSfjhQTSE0tSs1NTC1KLYLJMHJxSDUxnIw8ckL7h1Ln0
        cdb/hCOXgydMNpJb8DL1NZPds9Dde62Tji8Paag/p3R0VY/GmT8OzWuyZvge5DARMlh7r2HF
        1cy3GZNqHv5c8J99tsDy6GD2eMH05/m1K/5vz3cJZ8lhuvJ4xWmz5vyozfHnAu4u12r+9uHn
        jZpnkTzs0RGsFpfmzlpaNfN98NHMGW03tz0pmSmSGKTjWx0SeHzyso5bJ85z7vT4LWAY7TRr
        16pT80+HfNxz2HT108dynE/L3qlxXDFg+HNF/bbwnmP+C6S0GVnyw259bpZyseeqEPwTt99i
        800Vzf2S4q6vpBZ/uXpsi0xfLd/F8nlHWzc6Ss9byvhGWOvZiobHaTGNfy98VWIpzkg01GIu
        Kk4EAEbMwlccAwAA
X-CMS-MailID: 20211101053654epcas2p262f076e7f81f19ad2314bc1886980cdf
X-Msg-Generator: CA
Content-Type: multipart/mixed;
        boundary="----cdUjzaOTU1RPrvxdiax6HhSlBq1jqBVFQM-mWLfQP3CdA8rT=_9757c_"
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
        <20211027013709.GA17353@perf>
        <bde68e45-bc8f-8013-9097-e68d123c9019@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

------cdUjzaOTU1RPrvxdiax6HhSlBq1jqBVFQM-mWLfQP3CdA8rT=_9757c_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 27, 2021 at 08:39:47AM +0200, Krzysztof Kozlowski wrote:
> On 27/10/2021 03:38, Youngmin Nam wrote:
> > On Tue, Oct 26, 2021 at 01:00:51PM +0200, Krzysztof Kozlowski wrote:
> >> On 26/10/2021 12:45, Youngmin Nam wrote:
> >>> On Tue, Oct 26, 2021 at 09:10:28AM +0200, Krzysztof Kozlowski wrote:
> >>>> On 26/10/2021 03:47, Youngmin Nam wrote:
> >>>>>> If everyone added a new driver to avoid integrating with existing code,
> >>>>>> we would have huge kernel with thousands of duplicated solutions. The
> >>>>>> kernel also would be unmaintained.
> >>>>>>
> >>>>>> Such arguments were brought before several times - "I don't want to
> >>>>>> integrating with existing code", "My use case is different", "I would
> >>>>>> need to test the other cases", "It's complicated for me".
> >>>>>>
> >>>>>> Instead of pushing a new vendor driver you should integrate it with
> >>>>>> existing code.
> >>>>>>
> >>>>> Let me ask you one question.
> >>>>> If we maintain as one driver, how can people who don't have the new MCT test the new driver?
> >>>>
> >>>> I assume you talk about a case when someone else later changes something
> >>>> in the driver. Such person doesn't necessarily have to test it. The same
> >>>> as in all other cases (Exynos MCT is not special here): just ask for
> >>>> testing on platform one doesn't have.
> >>>>
> >>>> Even if you submit this as separate driver, there is the exact same
> >>>> problem. People will change the MCTv2 driver without access to hardware.
> >>>>
> >>> Yes, I can test the new MCT driver if someone ask for testing after modifying the new driver.
> >>> But in this case, we don't need to test the previous MCT driver. We have only to test the new MCT driver.
> >>
> >> Like with everything in Linux kernel. We merge instead of duplicate.
> >> It's not an argument.
> >>
> >>>> None of these differ for Exynos MCT from other drivers, e.g. mentioned
> >>>> Samsung PMIC drivers, recently modified (by Will and Sam) the SoC clock
> >>>> drivers or the ChipID drivers (changed by Chanho).
> >>> From HW point of view, the previous MCT is almost 10-year-old IP without any major change and
> >>> it will not be used on next new Exynos SoC.
> >>> MCTv2 is the totally newly designed IP and it will replace the Exynos system timer.
> >>> Device driver would be dependent with H/W. We are going to apply a lot of changes for this new MCT.
> >>> For maintenance, I think we should separate the new MCT driver for maintenance.
> >>>
> >>
> >> There are several similarities which actually suggest that you
> >> exaggerate the differences.
> >>
> >> The number of interrupts is the same (4+8 in older one, 12 in new one...).
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
> >> You assign the MCT priority also as higher than Architected Timer
> >> (+Cc Will and Mark - is it ok for you?)
> >>     evt->rating = 500;      /* use value higher than ARM arch timer *
> >>
> > Yes, this is absolutely correct on event timer.
> > We cannot use arm arch timer which is operating based on PPI as per-cpu event timer because of poewr mode.
> > We have to use SPI for per-cpu timer interrupt. (This is the same in all Exynos platform)
> 
> No, this is not correct, was explained several times and it is one of
> the reasons why I am holding back to reuse of existing driver. You
> copied few 32-bit ARM (ARMv7) solutions from old MCT driver into a new
> one which is only 64-bit. These 32-bit solutions are some optimizations
> or hacks matching 32-bit ARM Exynos processors. If you copy them to
> entirely new driver for entirely different IP block, it means this is
> not entirely different IP block.
> 
> Therefore I see a point now in having a Exynos MCTv2 driver for new IP
> blocks after removing all that legacy 32-bit ARM stuff.
> 
> Therefore:
> > evt->rating = 350;
> Not 500. Use the same value as old timer driver for ARMv8. See previous
> discussions and commits from Marek and Will.
> 

I've read the whole history from Marek and Will.
As I explained to Will, we need more time to test regarding decreasing the rating of MCTv2.
Decreasing the rating is related only performance not functionality.
So from regression perspective, it's not easy to change the rating on this new driver at this time.

> Other:
> > static u32 exynos_read_count_32(void)
> 
> This is u64, not u32. Get rid of 32-bit optimization/hack or explain it
> similarly as Doug did (40 lines of reasoning).
> 
> >  .mask           = CLOCKSOURCE_MASK(32),
> 
> Mask is 64.
> 
> These are the 32-bit legacies I found now (maybe there are more...).
> Don't copy them if this is a new driver getting rid of legacy.
> 

Thanks for pointing out and sharing "Doug Anderson"'s explanation.
As we use ARM arch timer as a clock source currently, we should get rid of it.

> > 
> >> All these point that block is not different. Again, let me repeat, we
> >> support old Samsung PMICs with new Samsung PMICs in one driver. Even
> >> though the "old one" won't be changed, as you mentioned here. The same
> >> Samsung SoC clock drivers are used for old Exynos and for new ones...
> >> Similarly to pinctrl drivers. The same ChipId.
> >>
> >> Everywhere we follow the same concept of unification instead of
> >> duplication. Maybe Exynos MCT timer is an exception but you did not
> >> provide any arguments supporting this. Why Exynos MCTv2 should be
> >> treated differently than Exynos850 clocks, chipid, pinctrl and other blocks?
> >>
> > 
> > If MCTv2 has only changes in register layout, I can consider merging work.
> > But this is not that case.
> > 
> > You gave a example with PMIC, SoC clock, Pinctrl, ChipId.
> > These H/W IP have only changes in register layout which came from difference of each SoC.
> > 
> > Were these H/W IP version changed?
> > Were these H/W IP control method changed ?
> > No. It only has minor chagnes not major changes.
> > 
> > * PMIC - controls the PMIC reigster with I2C interface regarding their SoC usecase.
> >        - there is no changes on H/W control method itself.
> > 
> > * SoC Clock - changes only in register layout regarding SoC
> >             - Clock control method still the same.
> > 
> > * Pinctrl - changes only in gpio pin register layout (pin number, pin type, pin map..) regarding SoC.
> > 	  - Is there any changes on control method ?
> > 
> > * Chipid - This is very simple H/W IP. It only supports unique chip id value with read-only register.
> >          - It really only have changes in register layout.
> > 
> > MCTv2 is different.
> > Not only register layout but also it's control method has to be changed regarding H/W difference.
> 
> Yes, I see some differences in HW control which we also solve in several
> other cases through structure ops. Indeed here it looks like the number
> of differences in control is bigger than in other cases.
> 
> If Daniel is okay in having two drivers and you get rid of all 32-bit
> legacy (including ordering against architected timers), I am fine with it.
> 

Thanks for understanding.
Let me send patch v2 soon.

> >> Daniel,
> >> Any preferences from you? Integrating MCT into existing driver (thus
> >> growing it) or having a new one?
> 
> 
> 
> Best regards,
> Krzysztof
> 

------cdUjzaOTU1RPrvxdiax6HhSlBq1jqBVFQM-mWLfQP3CdA8rT=_9757c_
Content-Type: text/plain; charset="utf-8"


------cdUjzaOTU1RPrvxdiax6HhSlBq1jqBVFQM-mWLfQP3CdA8rT=_9757c_--
