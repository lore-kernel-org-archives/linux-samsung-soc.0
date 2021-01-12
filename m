Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B333AC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 12 Jan 2021 07:12:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7035222AAF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 12 Jan 2021 07:12:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391816AbhALHLq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 12 Jan 2021 02:11:46 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:58222 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388416AbhALHLp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 02:11:45 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210112071103euoutp02427e0c7e7c85dbd5bd840bfe28b99b95~ZaoV1VkqE1204612046euoutp02z
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Jan 2021 07:11:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210112071103euoutp02427e0c7e7c85dbd5bd840bfe28b99b95~ZaoV1VkqE1204612046euoutp02z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1610435463;
        bh=RpPeC+JtnMVYjSTQN95lUmkLp+nUWs92p51GDk88QnY=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=s4iL5+QVZki20Jr7/oLC1DEUfGfLaWaYamchGtKSkPy2+6GBYwpqf+fdU1EXzICe1
         q+vpcPhYe1+KbXIf+9y6jTPH7St2/RZR0sSZO4nFkwhLXxF1idgL/75bsnJzcvolmQ
         YowWlYse4S4g1zgCx1OZMjFa1UofUl4DyQRWMIlk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210112071102eucas1p107599479535e7aa4aa560c843f3a45e2~ZaoVaw1nu0410704107eucas1p1E;
        Tue, 12 Jan 2021 07:11:02 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 04.A7.27958.68B4DFF5; Tue, 12
        Jan 2021 07:11:02 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210112071102eucas1p1fea493cca838d0576396965f46a6cb2d~ZaoUwUO_H0410704107eucas1p1B;
        Tue, 12 Jan 2021 07:11:01 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210112071101eusmtrp1975cd24c219863c4f67546a033969868~ZaoUowHfJ1012410124eusmtrp1f;
        Tue, 12 Jan 2021 07:11:01 +0000 (GMT)
X-AuditID: cbfec7f2-f15ff70000006d36-36-5ffd4b86f793
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 11.9E.16282.58B4DFF5; Tue, 12
        Jan 2021 07:11:01 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210112071101eusmtip1f5bc2f7ffd0a8ea475dd4c08ee327d63~ZaoT7-Iff2520625206eusmtip1i;
        Tue, 12 Jan 2021 07:11:01 +0000 (GMT)
Subject: Re: [PATCH v1 5/5] driver core: Set fw_devlink=on by default
To:     Saravana Kannan <saravanak@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kevin Hilman <khilman@baylibre.com>,
        John Stultz <john.stultz@linaro.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Marc Zyngier <maz@kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <fde65185-fd00-1f79-0f80-245eaa6c95cb@samsung.com>
Date:   Tue, 12 Jan 2021 08:11:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAGETcx8-1YzF2Br0sszJROLAWo3DSm27K071Md9wY5SOwUeLdw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDKsWRmVeSWpSXmKPExsWy7djP87pt3n/jDSZtUbPYOGM9q0Xz4vVs
        FtNuLmexOPNb12LHdhGLn+1bmCzOn9/AbnF51xw2ixnn9zFZ7JxzktVi26zlbBZzv0xltug6
        9JfNgddj2+5trB7vb7SyeyzYVOqxaVUnm8eda3vYPPbPXcPu0bdlFaPH5tPVHpOunGP2+LxJ
        LoArissmJTUnsyy1SN8ugStj97pJrAWzxSr2vDrP3sC4VKiLkZNDQsBE4v6fNqYuRi4OIYEV
        jBI9P15DOV8YJZ5/AclwAjmfGSW6ZiXBdEza/pMNIr6cUaLzSC1Ew0dGiQX33wI1cHAIC7hK
        fDnuA1IjIqAlsenaYxYQm1lgFovEhx4LEJtNwFCi620XG0g5r4CdxNX5jiAmi4CqxOsb5SAV
        ogJJEsf3dTOD2LwCghInZz4Bm8IpECix4tt+RoiJ8hLb385hhrDFJW49mQ92voTAak6Jq+8+
        MEKc7CJxqmMGM4QtLPHq+BZ2CFtG4vTkHhaIhmZGiYfn1rJDOD2MEpebZkB1W0vcOfcL7FBm
        AU2J9bv0QUwJAUeJw68qIEw+iRtvBSFu4JOYtG06M0SYV6KjDRrMahKzjq+D23rwwiXmCYxK
        s5B8NgvJN7OQfDMLYe0CRpZVjOKppcW56anFhnmp5XrFibnFpXnpesn5uZsYgQnu9L/jn3Yw
        zn31Ue8QIxMH4yFGCQ5mJRFerw1/4oV4UxIrq1KL8uOLSnNSiw8xSnOwKInzrpq9Jl5IID2x
        JDU7NbUgtQgmy8TBKdXAtLjlQ5nCrR7d4DWVTSvyrk6ZaJnKOePHlIJNnlK5aj6JmkKHnq1x
        Wp+zwGpbeEy14Xtpe04PvqSm4GcLk4WT97CeTEiYtH3JN/nefWKLmNkqPOXsu+6/O7hO9dT9
        h8YJSWf8n7m+6Q3+4rA28c7DA95ZPq1vfeunyB9a8c/u1P0S88WWWa1Xk7+r8T9j/B1mUqYd
        /Wb1rmv6E++K5VccbpZReyjlfLLFL43v0sp824xPTc9SnlpNfxQ8z/3pk93dzR6XI8PuFR+o
        M3zFuP+4ztxXS6z7Hqn832ZuXRmr8PiIQMr+ljgupcs7HM1W+98u/ZQte+nD9Mk5J8VZ92uF
        fMg6dKC9mM+y9qPB/jvzlFiKMxINtZiLihMB4b05mt8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRmVeSWpSXmKPExsVy+t/xu7qt3n/jDf6cMLbYOGM9q0Xz4vVs
        FtNuLmexOPNb12LHdhGLn+1bmCzOn9/AbnF51xw2ixnn9zFZ7JxzktVi26zlbBZzv0xltug6
        9JfNgddj2+5trB7vb7SyeyzYVOqxaVUnm8eda3vYPPbPXcPu0bdlFaPH5tPVHpOunGP2+LxJ
        LoArSs+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS9j
        97pJrAWzxSr2vDrP3sC4VKiLkZNDQsBEYtL2n2xdjFwcQgJLGSVOLHvGDJGQkTg5rYEVwhaW
        +HOtC6roPaPEniMdLF2MHBzCAq4SX477gNSICGhJbLr2mAWkhllgAYtEx7TDTBANn5gkvt3q
        YQSpYhMwlOh6CzKJg4NXwE7i6nxHEJNFQFXi9Y1yEFNUIEli8VsnkGJeAUGJkzOfsIDYnAKB
        Eiu+7QcbwixgJjFv80NmCFteYvvbOVC2uMStJ/OZJjAKzULSPgtJyywkLbOQtCxgZFnFKJJa
        WpybnltspFecmFtcmpeul5yfu4kRGNfbjv3csoNx5auPeocYmTgYDzFKcDArifB6bfgTL8Sb
        klhZlVqUH19UmpNafIjRFOibicxSosn5wMSSVxJvaGZgamhiZmlgamlmrCTOa3JkTbyQQHpi
        SWp2ampBahFMHxMHp1QD0+Z/pyet8m4/pSR/8ae90nuVybsuCj4VaOyyChI5rcQT4txpZ5iV
        MH9xS9xCp/dbr2hs2Krlz5t+ynZN9k1ldr9CHe2GqvxZBcaHH1Se+ua44B57kZ/L7UVvf8bz
        NHhMPDm98eASDTHpP20VGxj33C7YGC0vve13qiSX28O5UhNFopOiXI7dbQjvbH297fHSZfJJ
        HP85vMvnHa90V2p7Gfvi+46b75bu33zjiF74Ne09z6QPSXz4kVHa887w8u7cnyU3T5/cfGPO
        nffHa4t6NqqFbFiUviNPmGtnX9KE8tC6Y3ZP+YKS1gQEXmbf0OkU56ypqRcWVRD6osZze1+n
        ZvKN5xPmhsl8naxwN/FNjRJLcUaioRZzUXEiAF80E6x0AwAA
X-CMS-MailID: 20210112071102eucas1p1fea493cca838d0576396965f46a6cb2d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210111141814eucas1p1f388df07b789693a999042b27f0d8c2a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210111141814eucas1p1f388df07b789693a999042b27f0d8c2a
References: <20201218031703.3053753-1-saravanak@google.com>
        <20201218031703.3053753-6-saravanak@google.com>
        <CGME20210111141814eucas1p1f388df07b789693a999042b27f0d8c2a@eucas1p1.samsung.com>
        <5484316b-0f27-6c36-9259-5c765bb6b96c@samsung.com>
        <2556a69b-5da5-bf80-e051-df2d02fbc40f@samsung.com>
        <CAGETcx8-1YzF2Br0sszJROLAWo3DSm27K071Md9wY5SOwUeLdw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11.01.2021 22:47, Saravana Kannan wrote:
> On Mon, Jan 11, 2021 at 6:18 AM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 11.01.2021 12:12, Marek Szyprowski wrote:
>>> On 18.12.2020 04:17, Saravana Kannan wrote:
>>>> Cyclic dependencies in some firmware was one of the last remaining
>>>> reasons fw_devlink=on couldn't be set by default. Now that cyclic
>>>> dependencies don't block probing, set fw_devlink=on by default.
>>>>
>>>> Setting fw_devlink=on by default brings a bunch of benefits (currently,
>>>> only for systems with device tree firmware):
>>>> * Significantly cuts down deferred probes.
>>>> * Device probe is effectively attempted in graph order.
>>>> * Makes it much easier to load drivers as modules without having to
>>>>     worry about functional dependencies between modules (depmod is still
>>>>     needed for symbol dependencies).
>>>>
>>>> If this patch prevents some devices from probing, it's very likely due
>>>> to the system having one or more device drivers that "probe"/set up a
>>>> device (DT node with compatible property) without creating a struct
>>>> device for it.  If we hit such cases, the device drivers need to be
>>>> fixed so that they populate struct devices and probe them like normal
>>>> device drivers so that the driver core is aware of the devices and their
>>>> status. See [1] for an example of such a case.
>>>>
>>>> [1] -
>>>> https://lore.kernel.org/lkml/CAGETcx9PiX==mLxB9PO8Myyk6u2vhPVwTMsA5NkD-ywH5xhusw@mail.gmail.com/
>>>> Signed-off-by: Saravana Kannan <saravanak@google.com>
>>> This patch landed recently in linux next-20210111 as commit
>>> e590474768f1 ("driver core: Set fw_devlink=on by default"). Sadly it
>>> breaks Exynos IOMMU operation, what causes lots of devices being
>>> deferred and not probed at all. I've briefly checked and noticed that
>>> exynos_sysmmu_probe() is never called after this patch. This is really
>>> strange for me, as the SYSMMU controllers on Exynos platform are
>>> regular platform devices registered by the OF code. The driver code is
>>> here: drivers/iommu/exynos-iommu.c, example dts:
>>> arch/arm/boot/dts/exynos3250.dtsi (compatible = "samsung,exynos-sysmmu").
>> Okay, I found the source of this problem. It is caused by Exynos power
>> domain driver, which is not platform driver yet. I will post a patch,
>> which converts it to the platform driver.
> Thanks Marek! Hopefully the debug logs I added were sufficient to
> figure out the reason.

Frankly, it took me a while to figure out that device core waits for the 
power domain devices. Maybe it would be possible to add some more debug 
messages or hints? Like the reason of the deferred probe in 
/sys/kernel/debug/devices_deferred ?

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

