Return-Path: <SRS0=ELwQ=DM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B83CC4363A
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Oct 2020 14:27:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FEBB2078A
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Oct 2020 14:27:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="PCuPzk3y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725960AbgJEO1W (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 5 Oct 2020 10:27:22 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:57153 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgJEO1W (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Oct 2020 10:27:22 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201005142720euoutp02973fb993c66b11b68380bf44e85a3ff5~7HuAm738n0080200802euoutp02X
        for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Oct 2020 14:27:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201005142720euoutp02973fb993c66b11b68380bf44e85a3ff5~7HuAm738n0080200802euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1601908040;
        bh=N4ccLP6GJqWrJK+K0XUH9NxiqLa5g4pUYelDJIKu0Ds=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=PCuPzk3yxvc7GdK7rkPbTVL8CfybyXiSkRWFdxhv8L1BO+RE6Q8Wl9aIV+KilY4rs
         wTeOwgv9xI4FSfyds8IcGtrtkLO+WyIpaSjfmIgW3roudRwnXaMlLKK7kT3WrF2aX7
         f2S9aX28wIpWjuWM+eWOylCpCQNi60B+6yH//bmQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201005142720eucas1p2400e1a61c33f54ff984ffc0d82b4cac3~7HuARb89g1454314543eucas1p2H;
        Mon,  5 Oct 2020 14:27:20 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 84.21.05997.84D2B7F5; Mon,  5
        Oct 2020 15:27:20 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201005142719eucas1p1d1b841671fdde5ff7da35197a64380af~7Ht-3LkQd1395613956eucas1p1N;
        Mon,  5 Oct 2020 14:27:19 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201005142719eusmtrp20337b69b9a76bb06f5d0df754b9c7409~7Ht-2gG6l1451214512eusmtrp2A;
        Mon,  5 Oct 2020 14:27:19 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-30-5f7b2d482cba
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id A6.7A.06017.74D2B7F5; Mon,  5
        Oct 2020 15:27:19 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201005142719eusmtip20ee4c686d8a5120b29d5263639457330~7Ht-Uz0LJ2898728987eusmtip2X;
        Mon,  5 Oct 2020 14:27:19 +0000 (GMT)
Subject: Re: [PATCH RESEND] drm/bridge: tc358764: restore connector support
To:     Sam Ravnborg <sam@ravnborg.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-samsung-soc@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <fd29eebc-d9dc-374a-db98-b08613f505f8@samsung.com>
Date:   Mon, 5 Oct 2020 16:27:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0)
        Gecko/20100101 Thunderbird/82.0
MIME-Version: 1.0
In-Reply-To: <20201004191441.GA551257@ravnborg.org>
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMKsWRmVeSWpSXmKPExsWy7djPc7oeutXxBg0L2S2ufH3PZnH1+0tm
        i5NvrrJYdE5cwm5xedccNosZ5/cxWaw9cpfd4lBftMWKn1sZHTg93t9oZfeY3TGT1ePEhEtM
        Hve7jzN5LJl2lc2jb8sqRo8DvZNZPD5vkgvgiOKySUnNySxLLdK3S+DKOLfwKVtBE2fF118T
        2BsYl7N3MXJySAiYSDSt3MLUxcjFISSwglFia9cyFgjnC6NE5/JfUJnPjBJTj39ghGmZ+nYn
        G0RiOVDLhmvMEM57RomLO6cyg1QJC3hLbJrwlRXEFhEIkujufQAWZxaYziRxpkUHxGYT0JT4
        u/kmG4jNK2AncXn3U7AaFgEViaaZt8F6RQUSJPY8OscKUSMocXLmExYQm1PAWOLN41nsEDPl
        JZq3zoaaLy7R9GUlK8hBEgLX2CXWPeiAOttF4tSqZ8wQtrDEq+NboCEgI/F/53wmCLte4v6K
        FmaI5g6Q13ZCNVhL3Dn3C+hSDqANmhLrd+lDhB0lvq9dxgQSlhDgk7jxVhDiBj6JSdumM0OE
        eSU62oQgqhUl7p/dCjVQXGLpha9sExiVZiH5bBaSb2Yh+WYWwt4FjCyrGMVTS4tz01OLjfJS
        y/WKE3OLS/PS9ZLzczcxApPW6X/Hv+xg3PUn6RCjAAejEg+vgkh1vBBrYllxZe4hRgkOZiUR
        Xqezp+OEeFMSK6tSi/Lji0pzUosPMUpzsCiJ8xovehkrJJCeWJKanZpakFoEk2Xi4JRqYNRM
        sVH78nOL9xxl6Ze/Xfhfr94YEFO9SZVLindv2aMJn179uz+vlzuz+YI5X9bLXrm9jcvKK1b/
        uFuwsDg8oTTJbZPeEkXesBuMHnseNLVudOwtv8/P5iq7cW64+oNXjf5zpEuSu50MHpvfYm1f
        Yv7o+C+Z+qOMbj8ua1p9fvJc6dG7m8l7bJVYijMSDbWYi4oTATTRLcJWAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRmVeSWpSXmKPExsVy+t/xe7ruutXxBtvPaVpc+fqezeLq95fM
        FiffXGWx6Jy4hN3i8q45bBYzzu9jslh75C67xaG+aIsVP7cyOnB6vL/Ryu4xu2Mmq8eJCZeY
        PO53H2fyWDLtKptH35ZVjB4HeiezeHzeJBfAEaVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2Ri
        qWdobB5rZWSqpG9nk5Kak1mWWqRvl6CXcW7hU7aCJs6Kr78msDcwLmfvYuTkkBAwkZj6didb
        FyMXh5DAUkaJq5s62CAS4hK7579lhrCFJf5c64Iqesso8ePUZLAiYQFviU0TvrJ2MXJwiAgE
        SWy9XwASZhaYziQx53c1RP1ORon/P/+BbWMT0JT4u/kmWC+vgJ3E5d1PwRawCKhINM28zQpi
        iwokSDz8cpkZokZQ4uTMJywgNqeAscSbx7PYIRaYSXRt7WKEsOUlmrfOZoawxSWavqxkncAo
        NAtJ+ywkLbOQtMxC0rKAkWUVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZGYJRuO/Zzyw7GrnfB
        hxgFOBiVeHgVRKrjhVgTy4orcw8xSnAwK4nwOp09HSfEm5JYWZValB9fVJqTWnyI0RTouYnM
        UqLJ+cAEklcSb2hqaG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgVE9inGS
        MLd9l77XHdVHXIt2zG0IabJdUZafv/zv1NLXmVw3Tm1y2D1RsehANc/el2cfFfyziz73ak/B
        OY9VjKHctsuzvGzuJ607fWZeCleLofQt0T8Hdhe/Lb2waNH27tKDfut3hivculu6rkzvutDD
        V5met5bMk5v242Lj9O0Bt76c37vjYFWFEktxRqKhFnNRcSIAD0QWUugCAAA=
X-CMS-MailID: 20201005142719eucas1p1d1b841671fdde5ff7da35197a64380af
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200930114050eucas1p2fd39f213b4cf82068b79c97992a9acc7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200930114050eucas1p2fd39f213b4cf82068b79c97992a9acc7
References: <CGME20200930114050eucas1p2fd39f213b4cf82068b79c97992a9acc7@eucas1p2.samsung.com>
        <20200930114042.5806-1-m.szyprowski@samsung.com>
        <20201004191441.GA551257@ravnborg.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


W dniu 04.10.2020 o 21:14, Sam Ravnborg pisze:
> Hi Marek.
>
> On Wed, Sep 30, 2020 at 01:40:42PM +0200, Marek Szyprowski wrote:
>> This patch restores DRM connector registration in the TC358764 bridge
>> driver and restores usage of the old drm_panel_* API, thus allows dynamic
>> panel registration. This fixes panel operation on Exynos5250-based
>> Arndale board.
>>
>> This is equivalent to the revert of the following commits:
>> 1644127f83bc "drm/bridge: tc358764: add drm_panel_bridge support"
>> 385ca38da29c "drm/bridge: tc358764: drop drm_connector_(un)register"
>> and removal of the calls to drm_panel_attach()/drm_panel_detach(), which
>> were no-ops and has been removed in meanwhile.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> Thanks for providing the revert so we can have this fixed in upstream.
> So far I have had no time to dive deeper into what is going wrong but
> and the revert is the right cause of action for now.
>
> I expect Andrzej to pick it up as he has already reviewed it.
>
> 	Sam


Done


Regards

Andrzej


