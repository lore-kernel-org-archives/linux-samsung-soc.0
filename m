Return-Path: <SRS0=H6Ng=EP=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A424BC4742C
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Nov 2020 02:45:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E224B206F4
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Nov 2020 02:45:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="JR+QkZIg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729072AbgKICpD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 8 Nov 2020 21:45:03 -0500
Received: from mailout2.samsung.com ([203.254.224.25]:14778 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727979AbgKICpD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 8 Nov 2020 21:45:03 -0500
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20201109024500epoutp022ced26c951af2d840f9110027ae5536e~Fttx_XIpI1584515845epoutp023
        for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Nov 2020 02:45:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20201109024500epoutp022ced26c951af2d840f9110027ae5536e~Fttx_XIpI1584515845epoutp023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604889900;
        bh=6UJlkGa7vzbhC6EukK95zM4t99mD0NybVzLLJulFczc=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=JR+QkZIgi2cnm0lTjwhLHYPZbj6IaZDZk+CaDjK+4EW5Ak7mK1cU7uaT4mVOrUsSG
         d8gh7pep/rNSDtE5p1/G8YYlldQ4DIryVCzHoIGMA7Ot5ufF/3I4z4qpFMHyymPBtI
         SZSOJ/2/ihpTckiUxD5/WX7prrEH/1J8kR04j/5s=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201109024459epcas1p223f106ff4dd74f6be6c749fb7cc6aa81~FttwvBvFL0473704737epcas1p2O;
        Mon,  9 Nov 2020 02:44:59 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.156]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4CTwMD5QZSzMqYlt; Mon,  9 Nov
        2020 02:44:56 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        71.5F.09582.82DA8AF5; Mon,  9 Nov 2020 11:44:56 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201109024456epcas1p167ed228ca19931089dbd923eef8aeaa0~FttuI3bp-3242532425epcas1p1B;
        Mon,  9 Nov 2020 02:44:56 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201109024456epsmtrp131a5b815a1f1b2106ccc2e762497340b~FttuIC1dv2564625646epsmtrp1B;
        Mon,  9 Nov 2020 02:44:56 +0000 (GMT)
X-AuditID: b6c32a37-899ff7000000256e-27-5fa8ad2828ac
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        91.DE.13470.72DA8AF5; Mon,  9 Nov 2020 11:44:56 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201109024455epsmtip1587082fc9d6a8bb43761b83133cadd96~Fttt0A1hv3235732357epsmtip11;
        Mon,  9 Nov 2020 02:44:55 +0000 (GMT)
Subject: Re: [PATCH v2 04/16] drm/exynos: extract helper functions for probe
To:     Sam Ravnborg <sam@ravnborg.org>,
        Michael Tretter <m.tretter@pengutronix.de>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        jy0922.shim@samsung.com, b.zolnierkie@samsung.com,
        narmstrong@baylibre.com, sw0312.kim@samsung.com, krzk@kernel.org,
        a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de, sylvester.nawrocki@gmail.com
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <ad146fc8-166a-b126-3e0c-617c2ed97561@samsung.com>
Date:   Mon, 9 Nov 2020 11:52:17 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20201107222749.GD1052534@ravnborg.org>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJJsWRmVeSWpSXmKPExsWy7bCmnq7G2hXxBv2ntSxurTvHarFxxnpW
        iytf37NZvLh3kcVi1dSdLBbnz29gt+icuITdYsb5fUwW21YA1R3qi7ZY8XMro8WMyS/ZLOZ9
        3snkwOvx/kYru8fOWXfZPWZ3zGT12LSqk83jfvdxJo/+vwYeS6ZdZfPo27KK0ePzJrkAzqhs
        m4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygs5UUyhJz
        SoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5BZYFesWJucWleel6yfm5VoYGBkamQIUJ2RkH
        byxkK9jPWvG8vYu9gXEnSxcjJ4eEgInElVfHWLsYuTiEBHYwSqx9uYgdwvnEKNG6rgEq841R
        on/jZkaYliXb9kMl9jJKLJ93mgnCec8oseHoPnaQKmEBH4mPlyeC2SICgRKnHt9iBrGZBTYw
        SWy+ZgFiswmoSkxccZ8NxOYVsJNYeLcT7CgWARWJp33vmEBsUYEIiePdk9khagQlTs58AlbD
        CXTFm4tLWSFmikvcejKfCcKWl2jeOpsZ5CAJgTMcEn+PbGCGONtF4s7TVnYIW1ji1fEtULaU
        xMv+NnaIhmZGiYkzIN6REOhglLj7+Do0nIwl9i+dDJTgAFqhKbF+lz5EWFFi5++5jBCb+STe
        fe1hBSmREOCV6GgTgihRkjh28QY06CQkLiyZyAZR4iGxcGPJBEbFWUhem4XknVlI3pmFsHcB
        I8sqRrHUguLc9NRiwwJj5OjexAhO01rmOxinvf2gd4iRiYPxEKMEB7OSCG+Ly7J4Id6UxMqq
        1KL8+KLSnNTiQ4ymwMCeyCwlmpwPzBR5JfGGpkbGxsYWJoZmpoaGSuK8f7Q74oUE0hNLUrNT
        UwtSi2D6mDg4pRqYztn/OyG46uukwCfuDM6pUw275x6x6eYT/XVlyrdpRmWMUl9rJ676PHv5
        DLZLm37tDnpilz5vXw97ZNjNy257XzEU/d5nbGXs0rF0W5fajKNzPl7/5dHn/O51Z+VmCdvC
        SIUkK7Njn+5U77rymHn5je1iHXW/+7SEH1vvV9VUSn77szlpJ2fx59RnTrccIpct2rB++SRO
        VpXlTmG+d988MHaoreouv5mytK0rPSlTVv/VnA+v+V9bWO8VOXNvS3v+Lm7GAF75hGoFORGm
        r7q3t9gYmjseOGAiPtP2/ZfuE7KGGfWfr5k0bRQN6Ln5wzFqMUdfUsf+ndPkTZ7tOFBwZKnY
        CpV+0Y7neyyPH2TbqsRSnJFoqMVcVJwIAHXrpcBcBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsWy7bCSnK7G2hXxBtsvMVvcWneO1WLjjPWs
        Fle+vmezeHHvIovFqqk7WSzOn9/AbtE5cQm7xYzz+5gstq0AqjvUF22x4udWRosZk1+yWcz7
        vJPJgdfj/Y1Wdo+ds+6ye8zumMnqsWlVJ5vH/e7jTB79fw08lky7yubRt2UVo8fnTXIBnFFc
        NimpOZllqUX6dglcGQdvLGQr2M9a8by9i72BcSdLFyMnh4SAicSSbftZuxi5OIQEdjNKnD63
        mbmLkQMoISGxZSsHhCkscfhwMUTJW0aJ5tnnGUF6hQV8JD5ensgOYosIBEq0NF0Gm8kssIFJ
        Yv+KVIiGz4wSP293gCXYBFQlJq64zwZi8wrYSSy82wkWZxFQkXja944JxBYViJBouf+HHaJG
        UOLkzCdgNZxAh765uJQVYoG6xJ95l5ghbHGJW0/mM0HY8hLNW2czT2AUmoWkfRaSlllIWmYh
        aVnAyLKKUTK1oDg3PbfYsMAwL7Vcrzgxt7g0L10vOT93EyM4KrU0dzBuX/VB7xAjEwfjIUYJ
        DmYlEd4Wl2XxQrwpiZVVqUX58UWlOanFhxilOViUxHlvFC6MExJITyxJzU5NLUgtgskycXBK
        NTApTBXN2S+jq5L8WMrvdj/fGf63P+qvVu0M+cvS3HtiT8o93j3njlzWmtqx4eAZ5UobL981
        M5jDpntPDT32PMBbrfXDqyku/BZvXiUU3czLq+J8+SBe7Kkn7wZe/dbvb5dlpj6afMd3Wqxw
        g2jVt4kri4JWeT1zNV62NUKVt/DIpf3cgY2F3gytHzfE+FW+ya913Zmr62Xo3DbZ9t3Etcek
        FHv8GTq3TshWsXn1ZXbe/lTj5Jk/qnZ+22o+n/uI0pH24Pm5a24Ff1M7E6X058eWDwkPk6K+
        x5/nvfsv+ICFR32ndbVdnsV88ag/v1v8nfQ/G6nPz69S9RTn+MYu9mfWIpO3ki/yUnxYmGzV
        SpRYijMSDbWYi4oTAXjaOHY5AwAA
X-CMS-MailID: 20201109024456epcas1p167ed228ca19931089dbd923eef8aeaa0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201107222757epcas1p4633e7287b326567a8e944a5b4f4a6273
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
        <20200911135413.3654800-5-m.tretter@pengutronix.de>
        <CGME20201107222757epcas1p4633e7287b326567a8e944a5b4f4a6273@epcas1p4.samsung.com>
        <20201107222749.GD1052534@ravnborg.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



20. 11. 8. 오전 7:27에 Sam Ravnborg 이(가) 쓴 글:
> On Fri, Sep 11, 2020 at 03:54:01PM +0200, Michael Tretter wrote:
>> As the driver shall be usable with drivers that use the component
>> framework and drivers that don't, split the common probing code into a
>> separate function that can be called from different locations.
>>
>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

This patch and other are related to what this patch series do. However, this patch makes Exynos board not working yet.
So excepting patches 2 to 3, I will wait for that this patch series will be fixed and reviewed more.

Thanks,
Inki Dae

> 
