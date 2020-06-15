Return-Path: <SRS0=5Eo2=74=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699A2C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Jun 2020 12:45:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DCFF2078A
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Jun 2020 12:45:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="j1EtW+Tm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730060AbgFOMpe (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 15 Jun 2020 08:45:34 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45587 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730006AbgFOMpV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Jun 2020 08:45:21 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200615124518euoutp026a1722274c332193f705648ee6d1cc8b~YuE8tQP881970219702euoutp02B
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2020 12:45:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200615124518euoutp026a1722274c332193f705648ee6d1cc8b~YuE8tQP881970219702euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1592225118;
        bh=8ZW9tIfzut+M7bOoPWA1xqdHezL8cS8dNQt4m1q5vmE=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=j1EtW+TmRkd3sapG4FppqfhqKK64AFZn4lwPwxk6MFC8Ezwa0NpaMF842ZQXqUCkg
         kNrimAIv8RjPJ+y1DGbwPakG40wAPvtFh3q0qGcRu+yQXQFvtR0WfX1MQSwHV+SHv/
         ptB/VK9j2kx9VOcw7wdY4CYifpF2/ePeJ9NwtBfA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200615124517eucas1p11a9d9f9a3557156e75126bd5b8b7206f~YuE8QNL5h0504805048eucas1p1x;
        Mon, 15 Jun 2020 12:45:17 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 93.B6.60698.D5D67EE5; Mon, 15
        Jun 2020 13:45:17 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200615124517eucas1p1593b497ce326693f558c65a879b971fc~YuE7qZkWR1046310463eucas1p12;
        Mon, 15 Jun 2020 12:45:17 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200615124517eusmtrp2298a059b52054afed3e8abdb336f900c~YuE7pzvxv1055610556eusmtrp2P;
        Mon, 15 Jun 2020 12:45:17 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-c0-5ee76d5db832
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id CA.EE.08375.D5D67EE5; Mon, 15
        Jun 2020 13:45:17 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200615124516eusmtip291f699fd5f51246f4be0183e1b2b6d56~YuE7AnV2P1823518235eusmtip2H;
        Mon, 15 Jun 2020 12:45:16 +0000 (GMT)
Subject: Re: Question about Odroid XU4 cpuidle
To:     Lukasz Luba <lukasz.luba@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>, s.nawrocki@samsung.com
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <26daae4c-684a-7319-ae6c-f3319ba0406d@samsung.com>
Date:   Mon, 15 Jun 2020 14:45:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <8c0a8cc6-9cc0-88b5-6614-67edb903d149@arm.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIKsWRmVeSWpSXmKPExsWy7djP87qxuc/jDPq2m1rcWneO1WLjjPWs
        FufPb2C3mHF+H5PFwqYWdovDb9pZHdg81sxbw+ixaVUnm0ffllWMHp83yQWwRHHZpKTmZJal
        FunbJXBl9N5eylSwR6ji4slNbA2Mj/i6GDk5JARMJJ7/PM/axcjFISSwglHi98tTzBDOF0aJ
        5q37oDKfGSUWNLxghGk59/EyG0RiOaPEvT+/WCCc94wSqxZfZQapEhbQk/g5+R9QFQeHiICP
        xJLX6iA1zAKHGCX2v78PVsMmYCjR9bYLrIZXwE7i2mIZkDCLgKrE5LeTwZaJCsRK9C1dwAZi
        8woISpyc+YQFxOYUsJY41/0OzGYWkAe6dDYzhC0ucevJfCaQXRICy9glDm24ywZxtYvE9q43
        ULawxKvjW9ghbBmJ/zthGpoZJR6eW8sO4fQwSlxumgH1s7XEnXO/wC5lFtCUWL9LHyLsKHH2
        /CuwsIQAn8SNt4IQR/BJTNo2nRkizCvR0SYEUa0mMev4Ori1By9cYp7AqDQLyWuzkLwzC8k7
        sxD2LmBkWcUonlpanJueWmycl1quV5yYW1yal66XnJ+7iRGYcE7/O/51B+O+P0mHGAU4GJV4
        eBkCnscJsSaWFVfmAkOfg1lJhNfp7Ok4Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzGi17GCgmk
        J5akZqemFqQWwWSZODilGhirM2e/L2e4Wn/MhveOloyE4LXFVrMN+V8q7KnZvbTt6qSYwwES
        4t/fNJvzS6+5uGCq4eIbF2dVbLFY33qu+DFzwe3seKu4y6oh9bNezY65K2U/d7tgTIOs7Ywf
        y5cZnk/eqbnXQNuhXcIt9dqKPouX244Ve2ybwNVUZfL+77e/T3eyaTItN9yqxFKckWioxVxU
        nAgAW5OVejQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRmVeSWpSXmKPExsVy+t/xe7qxuc/jDKbPELS4te4cq8XGGetZ
        Lc6f38BuMeP8PiaLhU0t7BaH37SzOrB5rJm3htFj06pONo++LasYPT5vkgtgidKzKcovLUlV
        yMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DL6L29lKlgj1DFxZOb
        2BoYH/F1MXJySAiYSJz7eJmti5GLQ0hgKaPE+hMnmSASMhInpzWwQtjCEn+udUEVvWWUmH/u
        EliRsICexM/J/4ASHBwiAj4SS16rg9QwCxxilLi2bBkjRMNMJollM78xgjSwCRhKdL3tAmvg
        FbCTuLZYBiTMIqAqMfntZLASUYFYiW/3trCB2LwCghInZz5hAbE5BawlznW/A7OZBcwk5m1+
        yAxhy0s0b50NZYtL3Hoyn2kCo9AsJO2zkLTMQtIyC0nLAkaWVYwiqaXFuem5xYZ6xYm5xaV5
        6XrJ+bmbGIERtu3Yz807GC9tDD7EKMDBqMTDGxH0PE6INbGsuDIX6FkOZiURXqezp+OEeFMS
        K6tSi/Lji0pzUosPMZoCPTeRWUo0OR8Y/Xkl8YamhuYWlobmxubGZhZK4rwdAgdjhATSE0tS
        s1NTC1KLYPqYODilGhhbjCfaHNh99pBdb/GP16Xhcw90hZ6K/LTwdun5wLhbmydlK81p/3Dc
        c1odv+fj+ydtJXVLJGd82q3EWnPixeagi7+e/HkhsulXYpnsNIttl2bXq+yoUgyy1DhhbtFm
        a+fjcmlVe8qVmsilWVn2u/buPCie0mPUJSTfW2q3YrPNSaky73rHSD8lluKMREMt5qLiRACe
        MEY3xgIAAA==
X-CMS-MailID: 20200615124517eucas1p1593b497ce326693f558c65a879b971fc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200610140246eucas1p2167e2d5f71a762b54d9c4d2db565bece
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200610140246eucas1p2167e2d5f71a762b54d9c4d2db565bece
References: <570c73f2-d9d8-4ae1-3caf-829547232e48@arm.com>
        <CGME20200610140246eucas1p2167e2d5f71a762b54d9c4d2db565bece@eucas1p2.samsung.com>
        <20200610140238.GA31473@kozik-lap>
        <5b6a4345-4df6-51b4-298d-6a4fc6935d89@samsung.com>
        <8c0a8cc6-9cc0-88b5-6614-67edb903d149@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Lukasz

On 10.06.2020 16:30, Lukasz Luba wrote:
> On 6/10/20 3:09 PM, Marek Szyprowski wrote:
>> On 10.06.2020 16:02, Krzysztof Kozlowski wrote:
>>> On Wed, Jun 10, 2020 at 02:18:12PM +0100, Lukasz Luba wrote:
>>>> Hi Krzysztof, Bartek,
>>>>
>>>> I recall that you have been working on some cpuidle code for 
>>>> Exynos(4?).
>>>>
>>>> I have a question regarding CPUIdle driver for Odroid XU4.
>>>> I use the board with LISA tests for EAS, but missing at
>>>> least idle state 0 cause errors (please see the log below).
>>>>
>>>> Currently the system does not report any idle driver and the state 0
>>>> is missing in: /sys/devices/system/cpu/cpu0/cpuidle/state0/
>>> The state 0 long time ago was WFI. It was kind of meaningless so it it
>>> was dropped.
>>>
>>>> I am using driver CONFIG_ARM_BIG_LITTLE_CPUIDLE but the
>>>> boot stops silently while trying to init the cpu idle devices in 
>>>> there.
>>>> I carry on with a workaround that just removes idle state[1] and set
>>>> state_count=1 in the big and little structures.
>>> Try earlyprintk.
>>>
>>> In general, the big-little cpuidle driver should work... or rather: 
>>> long
>>> time ago it was working.  It requires proper support from early stages
>>> (BL1, secure monitor) but this should be already in standard Odroid.
>>>
>>> I just saw there:
>>>     /* Start at index 1, index 0 standard WFI */
>>> so maybe it was not updated properly to removal of WFI?
>>>
>>> I think no one uses this driver so it might be not well tested and not
>>> that useful.
>>
>> I think it never worked on Odroid XU3/XU4. Afair it was developed on
>> PeachPi Chromebook, which use different bootloader (and doesn't use
>> trustzone).
>
> That would explain the compatibility string in that driver. Good to
> know. Thank you for your response.
>
I've just digged a bit in the old kernels and indeed, the big-little 
cpuidle driver worked only on Samsung Exynos 5420/5800 Chromebooks 
(Peach Pit/Pi). The last release which worked fine (although it was 
still not enabled in the exynos_defconfig) is v4.2. Then it got broken 
by the commit 833b5794e330 ("ARM: EXYNOS: reset Little cores when cpu is 
up"). It never worked on the Odroid XU3/XU4.

Do you have any plans to fix it?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

