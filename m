Return-Path: <SRS0=SgCN=7X=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E345BC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 10 Jun 2020 14:09:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC3FA206F7
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 10 Jun 2020 14:09:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TjtypTXT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729733AbgFJOJp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 10 Jun 2020 10:09:45 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:39016 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727022AbgFJOJo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 10 Jun 2020 10:09:44 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200610140943euoutp01781a9a5ca071e6bdaf62b7549ec59711~XNAOsuNct0089300893euoutp01D
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jun 2020 14:09:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200610140943euoutp01781a9a5ca071e6bdaf62b7549ec59711~XNAOsuNct0089300893euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1591798183;
        bh=B9WIUWqn9mxmnegV21wyJgQfBnzoWApTexDmImnDaw0=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=TjtypTXTz7+rnZ4I5QZq2U5MDBvh0XYsAiCZwjNYNpgLETeOPg0QOEiO4/yrbBqkQ
         pCw7NFYUeZnbb0GvDEag5HINYvQEkLDFKj85Eg5KoF1utDcBg64gMgB8X4srMliX5p
         fSqgh4iISCamIm3iMF/t6BETvYj6CxFJORh+x6Ag=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200610140943eucas1p1da6f37c86e160ad90e5f80ebd0dbfcce~XNAOi3eJD1276612766eucas1p1o;
        Wed, 10 Jun 2020 14:09:43 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id DB.AB.60679.7A9E0EE5; Wed, 10
        Jun 2020 15:09:43 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200610140943eucas1p20913b29f9fb46391988bbef7d9159c43~XNAOPEp1i2184821848eucas1p29;
        Wed, 10 Jun 2020 14:09:43 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200610140943eusmtrp163348a75058d40ccd7ab1f68403d5322~XNAOIs8n61133711337eusmtrp10;
        Wed, 10 Jun 2020 14:09:43 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-d8-5ee0e9a7be51
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 80.3D.08375.7A9E0EE5; Wed, 10
        Jun 2020 15:09:43 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200610140942eusmtip285d150b627e8747e17ad7ca23015f01e~XNANxcqs80267002670eusmtip28;
        Wed, 10 Jun 2020 14:09:42 +0000 (GMT)
Subject: Re: Question about Odroid XU4 cpuidle
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>, s.nawrocki@samsung.com
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <5b6a4345-4df6-51b4-298d-6a4fc6935d89@samsung.com>
Date:   Wed, 10 Jun 2020 16:09:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200610140238.GA31473@kozik-lap>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIKsWRmVeSWpSXmKPExsWy7djP87rLXz6IM2hplbW4te4cq8XGGetZ
        Lc6f38BuMeP8PiaLhU0t7BaH37SzOrB5rJm3htFj06pONo++LasYPT5vkgtgieKySUnNySxL
        LdK3S+DK6Om7y15wjqfiSpdPA+M/zi5GTg4JAROJrUduMXYxcnEICaxglHixHMb5wijxacJq
        NgjnM6PEgZuvWWBa1l29xgKRWM4ocWnzC6iq94wSH188ZwKpEhbQk/g5+R9QgoNDRMBHoq0l
        C6SGWeAQo8T+9/eZQWrYBAwlut52sYHYvAJ2Eq/aD4P1sgioSmzrOglmiwrESvQtXQBVIyhx
        cuYTsCs4BfQlHs37xQ5iMwvIS2x/O4cZwhaXuPVkPhPIMgmBRewScy42sUOc7SIxb+cBNghb
        WOLV8S1QcRmJ05N7WCAamhklHp5byw7h9DBKXG6awQhRZS1x59wvsHeYBTQl1u/Shwg7Spw9
        /wosLCHAJ3HjrSDEEXwSk7ZNZ4YI80p0tAlBVKtJzDq+Dm7twQuXmCcwKs1C8tosJO/MQvLO
        LIS9CxhZVjGKp5YW56anFhvlpZbrFSfmFpfmpesl5+duYgQmnNP/jn/ZwbjrT9IhRgEORiUe
        XoO9D+KEWBPLiitzgcHPwawkwut09nScEG9KYmVValF+fFFpTmrxIUZpDhYlcV7jRS9jhQTS
        E0tSs1NTC1KLYLJMHJxSDYyZaw9VNvqw5jJE5nncbkhcf01eZvGGnkPrbgqYan6cdGBBJnvs
        VoGkmeK2dVuP8TyT2LyldtW9s1GRExbc+tCys3n/hwWLdC14T1uKTzjxy0rtU5h14K+EXCeW
        ycV67LuzNANN8w7lynxf2+/2Vule1OZLMWpPd3Pxh7X+YLO9/u+a5efoo2lKLMUZiYZazEXF
        iQBOIJ25NAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRmVeSWpSXmKPExsVy+t/xe7rLXz6IM3h1hNni1rpzrBYbZ6xn
        tTh/fgO7xYzz+5gsFja1sFscftPO6sDmsWbeGkaPTas62Tz6tqxi9Pi8SS6AJUrPpii/tCRV
        ISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEvo6fvLnvBOZ6KK10+
        DYz/OLsYOTkkBEwk1l29xgJiCwksZZTY9SkBIi4jcXJaAyuELSzx51oXWxcjF1DNW0aJlY3H
        GEESwgJ6Ej8n/wNKcHCICPhItLVkgdQwCxxilLi2bBkjRMNmRonJ51aBbWATMJToegsyiZOD
        V8BO4lX7YSYQm0VAVWJb10kwW1QgVuLbvS1QNYISJ2c+AevlFNCXeDTvFzuIzSxgJjFv80Nm
        CFteYvvbOVC2uMStJ/OZJjAKzULSPgtJyywkLbOQtCxgZFnFKJJaWpybnltsqFecmFtcmpeu
        l5yfu4kRGF/bjv3cvIPx0sbgQ4wCHIxKPLwGex/ECbEmlhVX5gJ9y8GsJMLrdPZ0nBBvSmJl
        VWpRfnxRaU5q8SFGU6DnJjJLiSbnA2M/ryTe0NTQ3MLS0NzY3NjMQkmct0PgYIyQQHpiSWp2
        ampBahFMHxMHp1QDoxZny8mYFWpta1nuvTRhd9M/U86ZZriPW1LId1XFjQ1XPAufBbkx/VVn
        1feNvaKu2zulNMh6T9W0ahv/iaK1ljcO5i8oqrd33rXC4k64yJVJsxNPbEv42H7zvLmGvXcE
        46TM1oNBf4uC/1/aH/yFaeuaY3W/7jWKlUX+WVd6/1f1rd1Ge6YdV2Ipzkg01GIuKk4EAAKS
        fGfFAgAA
X-CMS-MailID: 20200610140943eucas1p20913b29f9fb46391988bbef7d9159c43
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200610140246eucas1p2167e2d5f71a762b54d9c4d2db565bece
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200610140246eucas1p2167e2d5f71a762b54d9c4d2db565bece
References: <570c73f2-d9d8-4ae1-3caf-829547232e48@arm.com>
        <CGME20200610140246eucas1p2167e2d5f71a762b54d9c4d2db565bece@eucas1p2.samsung.com>
        <20200610140238.GA31473@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi

On 10.06.2020 16:02, Krzysztof Kozlowski wrote:
> On Wed, Jun 10, 2020 at 02:18:12PM +0100, Lukasz Luba wrote:
>> Hi Krzysztof, Bartek,
>>
>> I recall that you have been working on some cpuidle code for Exynos(4?).
>>
>> I have a question regarding CPUIdle driver for Odroid XU4.
>> I use the board with LISA tests for EAS, but missing at
>> least idle state 0 cause errors (please see the log below).
>>
>> Currently the system does not report any idle driver and the state 0
>> is missing in: /sys/devices/system/cpu/cpu0/cpuidle/state0/
> The state 0 long time ago was WFI. It was kind of meaningless so it it
> was dropped.
>
>> I am using driver CONFIG_ARM_BIG_LITTLE_CPUIDLE but the
>> boot stops silently while trying to init the cpu idle devices in there.
>> I carry on with a workaround that just removes idle state[1] and set
>> state_count=1 in the big and little structures.
> Try earlyprintk.
>
> In general, the big-little cpuidle driver should work... or rather: long
> time ago it was working.  It requires proper support from early stages
> (BL1, secure monitor) but this should be already in standard Odroid.
>
> I just saw there:
> 	/* Start at index 1, index 0 standard WFI */
> so maybe it was not updated properly to removal of WFI?
>
> I think no one uses this driver so it might be not well tested and not
> that useful.

I think it never worked on Odroid XU3/XU4. Afair it was developed on 
PeachPi Chromebook, which use different bootloader (and doesn't use 
trustzone).

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

