Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28464C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 11 Jan 2021 14:18:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E760E22473
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 11 Jan 2021 14:18:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbhAKOS5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 11 Jan 2021 09:18:57 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40067 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727302AbhAKOS4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Jan 2021 09:18:56 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210111141815euoutp0251ba82c33b144cbf95f6ccc1b0825eed~ZM0DNmwqm3266132661euoutp02N
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Jan 2021 14:18:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210111141815euoutp0251ba82c33b144cbf95f6ccc1b0825eed~ZM0DNmwqm3266132661euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1610374695;
        bh=ZQDAz6BC3qKM7ZG/PUFs4ihPyhHWnAL2/UEgubN3WFs=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=VNCWSE9Vablquv3+mom8g0Z7et+fWuThUkilxlpeTqbP0W3mVja4a4QH9Jtqcd/Qo
         MEND70YYwIYmqP6uIXZs44u5T4Ea7qgu2asQCjKgF0oMVe2+X0j3tFOq0pkJLEYhCp
         e6dowsCtFhxpPDzORWOu5Kd2XwlkC3uuATK364FM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210111141814eucas1p17c97b6fa6d68cda068046b1f8c2f95e2~ZM0C8HtMO2955429554eucas1p1p;
        Mon, 11 Jan 2021 14:18:14 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 5C.68.45488.62E5CFF5; Mon, 11
        Jan 2021 14:18:14 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210111141814eucas1p1f388df07b789693a999042b27f0d8c2a~ZM0Cd1PuD0148801488eucas1p1T;
        Mon, 11 Jan 2021 14:18:14 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210111141814eusmtrp27c7838094414c3858a92ee5f6eefb1da~ZM0CdCOUL0526205262eusmtrp2D;
        Mon, 11 Jan 2021 14:18:14 +0000 (GMT)
X-AuditID: cbfec7f5-c5fff7000000b1b0-63-5ffc5e266600
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 53.91.16282.62E5CFF5; Mon, 11
        Jan 2021 14:18:14 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210111141813eusmtip24ce6cb5a7e05b7a2ff62cf0d3df93374~ZM0BsEOtO0173401734eusmtip2l;
        Mon, 11 Jan 2021 14:18:13 +0000 (GMT)
Subject: Re: [PATCH v1 5/5] driver core: Set fw_devlink=on by default
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     Saravana Kannan <saravanak@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     kernel-team@android.com, linux-kernel@vger.kernel.org,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kevin Hilman <khilman@baylibre.com>,
        John Stultz <john.stultz@linaro.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Marc Zyngier <maz@kernel.org>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <2556a69b-5da5-bf80-e051-df2d02fbc40f@samsung.com>
Date:   Mon, 11 Jan 2021 15:18:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <5484316b-0f27-6c36-9259-5c765bb6b96c@samsung.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAKsWRmVeSWpSXmKPExsWy7djP87pqcX/iDSbPMLTYOGM9q0Xz4vVs
        FtNuLmexOPNb12LHdhGLn+1bmCzOn9/AbnF51xw2ixnn9zFZ7JxzktVi26zlbBZzv0xltug6
        9JfNgddj2+5trB7vb7SyeyzYVOqxaVUnm8eda3vYPPbPXcPu0bdlFaPH5tPVHpOunGP2+LxJ
        LoArissmJTUnsyy1SN8ugSuj6VofS8E/wYrTO24xNzA+4uti5OSQEDCRaF+3kK2LkYtDSGAF
        o8T7hTeYIJwvjBK/3rSwQjifGSXm7Z7JCNNyfvFRFojEckaJw02L2SGcj4wSHz6cBnI4OIQF
        XCW+HPcBaWATMJToetsFtkNEoI1R4uG+nywgCWaBhcwSE65kgdi8AnYSM1dsZQWxWQRUJdoO
        PWcCsUUFkiSO7+tmhqgRlDg58wlYL6eAvcTa4yeZIebISzRvnQ1li0vcejKfCeLS5ZwS02dL
        Q9guEuvbzzJD2MISr45vYYewZST+75wP9rOEQDPQcefWskM4PYwSl5tmQP1sLXHn3C82kM+Y
        BTQl1u/SBzElBBwlDr+qgDD5JG68FYQ4gU9i0rbpzBBhXomONiGIGWoSs46vg9t68MIl5gmM
        SrOQPDYLyTOzkDwzC2HtAkaWVYziqaXFuempxcZ5qeV6xYm5xaV56XrJ+bmbGIGJ7vS/4193
        MK549VHvECMTB+MhRgkOZiUR3oW7fsQL8aYkVlalFuXHF5XmpBYfYpTmYFES5921dU28kEB6
        YklqdmpqQWoRTJaJg1OqgSnR3qL0XMoS2UqT95HzEzw6FFYXnOvectX2oPzxP2Iic+T71dpq
        XzPcKND56nSgNXXKhwAWSfnIORMZe7NuXDgVxaf5onTWCzV/lgafBp4jJyTvLnRhWMTUkrey
        L/57717dYEOXk9mXw5pvekx+cvm2cXquSuze58ZP30v5utmuL1zDeFpk97lVB9Mlii8p7bET
        k+Ri8xaS4G4JEDkvc3qC/vuSt0eyPdj9J5y5pnN6hUYx/yLX5TkBJtPV6pe9mr2o5Grq4tTm
        6Xu5Pa8/2Hthpdfy64kKd9bOnpBpd//KhO53fwXLt3M1aLCemp3hqH7p7aqfGX3iucq8Odv3
        1EmIbczz0jgfceRU8beSdUosxRmJhlrMRcWJAMdT6tzjAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRmVeSWpSXmKPExsVy+t/xe7pqcX/iDRq28FhsnLGe1aJ58Xo2
        i2k3l7NYnPmta7Fju4jFz/YtTBbnz29gt7i8aw6bxYzz+5gsds45yWqxbdZyNou5X6YyW3Qd
        +svmwOuxbfc2Vo/3N1rZPRZsKvXYtKqTzePOtT1sHvvnrmH36NuyitFj8+lqj0lXzjF7fN4k
        F8AVpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJfR
        dK2PpeCfYMXpHbeYGxgf8XUxcnJICJhInF98lKWLkYtDSGApo8TVf7eYIRIyEienNbBC2MIS
        f651sUEUvWeUuH/7HlMXIweHsICrxJfjPiA1bAKGEl1vIWpEBDoYJb5dvQ7mMAssZZZYeOga
        M0T3IkaJh8vOs4C08ArYScxcsRVsBYuAqkTboedgU0UFkiQWv3WCKBGUODnzCVg5p4C9xNrj
        J8GuYxYwk5i3+SGULS/RvHU2lC0ucevJfKYJjEKzkLTPQtIyC0nLLCQtCxhZVjGKpJYW56bn
        FhvpFSfmFpfmpesl5+duYgRG97ZjP7fsYFz56qPeIUYmDsZDjBIczEoivAt3/YgX4k1JrKxK
        LcqPLyrNSS0+xGgK9M5EZinR5HxgeskriTc0MzA1NDGzNDC1NDNWEuc1ObImXkggPbEkNTs1
        tSC1CKaPiYNTqoHJV9P44ZZ3PjzG86fLhF3uqI7laJOPntDHZGT+uVIopPRQv7SwZImgTdyr
        edO3zi1Vdt556znbMXeHlgUs2eJbblvItHnZX2aNi4p0DRNz+rMhbe6KMJflZ+wOK5de6bC4
        vrKfj8s6vE7vk6rPZOXnp21XGMUr3bnEN+vBsw05/WpK34S2r2a+uLFrjtKPPRnnj/A/kHx3
        q+nC5mvvWBasTLlopb87ZPdZPaNPh3sYlnzcsXFKd/jC/dZZl5pmr7Mr3jn9pkh/j+CxhphX
        Nzce3ZUg9qfF4OBP7+SmE2aW0mw+kxZP/qFdK5e9i8EhWnnmw+j4vTnl965sXx6QkXXkrIbQ
        RfOjoWpH9/38/rNfiaU4I9FQi7moOBEAIPhc7XcDAAA=
X-CMS-MailID: 20210111141814eucas1p1f388df07b789693a999042b27f0d8c2a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210111141814eucas1p1f388df07b789693a999042b27f0d8c2a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210111141814eucas1p1f388df07b789693a999042b27f0d8c2a
References: <20201218031703.3053753-1-saravanak@google.com>
        <20201218031703.3053753-6-saravanak@google.com>
        <5484316b-0f27-6c36-9259-5c765bb6b96c@samsung.com>
        <CGME20210111141814eucas1p1f388df07b789693a999042b27f0d8c2a@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11.01.2021 12:12, Marek Szyprowski wrote:
> On 18.12.2020 04:17, Saravana Kannan wrote:
>> Cyclic dependencies in some firmware was one of the last remaining
>> reasons fw_devlink=on couldn't be set by default. Now that cyclic
>> dependencies don't block probing, set fw_devlink=on by default.
>>
>> Setting fw_devlink=on by default brings a bunch of benefits (currently,
>> only for systems with device tree firmware):
>> * Significantly cuts down deferred probes.
>> * Device probe is effectively attempted in graph order.
>> * Makes it much easier to load drivers as modules without having to
>>    worry about functional dependencies between modules (depmod is still
>>    needed for symbol dependencies).
>>
>> If this patch prevents some devices from probing, it's very likely due
>> to the system having one or more device drivers that "probe"/set up a
>> device (DT node with compatible property) without creating a struct
>> device for it.  If we hit such cases, the device drivers need to be
>> fixed so that they populate struct devices and probe them like normal
>> device drivers so that the driver core is aware of the devices and their
>> status. See [1] for an example of such a case.
>>
>> [1] - 
>> https://lore.kernel.org/lkml/CAGETcx9PiX==mLxB9PO8Myyk6u2vhPVwTMsA5NkD-ywH5xhusw@mail.gmail.com/
>> Signed-off-by: Saravana Kannan <saravanak@google.com>
>
> This patch landed recently in linux next-20210111 as commit 
> e590474768f1 ("driver core: Set fw_devlink=on by default"). Sadly it 
> breaks Exynos IOMMU operation, what causes lots of devices being 
> deferred and not probed at all. I've briefly checked and noticed that 
> exynos_sysmmu_probe() is never called after this patch. This is really 
> strange for me, as the SYSMMU controllers on Exynos platform are 
> regular platform devices registered by the OF code. The driver code is 
> here: drivers/iommu/exynos-iommu.c, example dts: 
> arch/arm/boot/dts/exynos3250.dtsi (compatible = "samsung,exynos-sysmmu").

Okay, I found the source of this problem. It is caused by Exynos power 
domain driver, which is not platform driver yet. I will post a patch, 
which converts it to the platform driver.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

