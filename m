Return-Path: <SRS0=1mvF=YQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD153C47E49
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 23 Oct 2019 13:03:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D46121906
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 23 Oct 2019 13:03:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="EQ7nsO2T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732149AbfJWNDt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 23 Oct 2019 09:03:49 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:52132 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404834AbfJWNDs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 09:03:48 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20191023130347euoutp02bb74d7bd0b5f8d805d5af55154cb0698~QSFtev-is0801508015euoutp02_
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Oct 2019 13:03:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20191023130347euoutp02bb74d7bd0b5f8d805d5af55154cb0698~QSFtev-is0801508015euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1571835827;
        bh=fRjiFNXyj3lzO1rthRyAyQwOOTCSPOoDxPzWTlYWFPk=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=EQ7nsO2TVx1MvKZJcbIbWyX6QWCDa2gOJzUcAj+Lz6UnqJrdP3vHv4uy7fAxSZDMT
         qkj+Xh9H5Hf7x9BU75mYh32PZajA34+3iss9RxKt/HUy+517Ensnjg0VydGq/8f49R
         GyuTydkuGujmu63t5oUHVZmRMaG9lPdEKXgnZw5E=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191023130346eucas1p1fc23b8c4bc066e46ad12f8d1a64b4f75~QSFtQj4bG1202412024eucas1p1N;
        Wed, 23 Oct 2019 13:03:46 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id D2.4B.04374.2BF40BD5; Wed, 23
        Oct 2019 14:03:46 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191023130346eucas1p233334b1b158b52019e9b904f52004f70~QSFs5kavs0090000900eucas1p2i;
        Wed, 23 Oct 2019 13:03:46 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191023130346eusmtrp18f3cccac5a04963b67fb502c8971751e~QSFszqLi30458004580eusmtrp1i;
        Wed, 23 Oct 2019 13:03:46 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-81-5db04fb2538e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 7E.28.04166.2BF40BD5; Wed, 23
        Oct 2019 14:03:46 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191023130346eusmtip11fc1379a1e74a94139eff52e27e4f0cd~QSFsXECKF1772417724eusmtip1t;
        Wed, 23 Oct 2019 13:03:45 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: exynos542x: Move G3D subsystem clocks to
 its sub-CMU
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Cc:     linux-clk@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <9b9d013d-3bbb-e9e9-b161-e885cb6b1c2f@samsung.com>
Date:   Wed, 23 Oct 2019 15:03:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023074118.3012-1-m.szyprowski@samsung.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTcRTG++/eu92NJtfp2MHCYBRlkC8ldHvTLAvFxKIXKpOaelHTTdl8
        j0CzMp2KFKVNQ6kP5tS2lqg5EN1cJmZDgkyXGjqxhBXiBkpauV0lv/3OOc/DOQ8cEhO1En5k
        miKbUSpkGVKuAO94t2zdZ4jTJwTPNNH061odQY865wjaatXz6IWKSYKutfZw6Lb+CR6te7JM
        0KWzP7DjZNRbzQQvyqAt40ZVtWtR1KLB/yx+VXA0mclIy2WUQWE3BKnT2hqUpeblrxpNeBFy
        EuWITwIVCi/qaznlSECKqJcIDIY6jC2cCD46ugi2WETwvnkG27D0tj3G2UETgnHdwrrKgcD2
        uQ53q3yoK9A05uK62Ze6AFOz3z0ijFpFYGn56RFxqRCotFQhNwupMJicc3pW4NQuGHujXjOT
        pJi6DEMuGSvxhsGndo+VTx0D16LTwxglgTvOZoLlHdDpqPdkAKqbB7Y+8/rZkbDQaEYs+8D8
        QDuP5e0w9KgCZw0lCCqMNh5bVCOYGmhcdxwB88AI4b4IowJA1x3EtiNguP8X7m4D5QVfHN7s
        EV7wsKMGY9tCeHBfxKp3wm9tDYdlP1Db/+LVSKrZFE2zKY5mUxzN/72NCNciCZOjkqcwqgMK
        Ji9QJZOrchQpgUmZcgNa+6GhPwOuLtSzkmhCFImkW4X5Z/QJIkKWqyqQmxCQmNRX+DW4LUEk
        TJYVFDLKzOvKnAxGZULbSFwqEd7a8i1eRKXIspl0hslilBtTDsn3K0J10QefD44aR+7ejFwm
        Uk+0iu2xr9Lnxd2O/oJD91qWqvj+toa4iKxiS0dSaZ4p3lukXQrnWBbsdrm8ofhU1mnupdCT
        4XumUSPRICpX9K30miuNw0HKw87bJcbdsTHcZ3nXei+OS/Q5uWXnP3ziieUBnYn7o4tiCsOX
        1M35oeekuCpVFrIXU6pk/wDDGtnBPwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRmVeSWpSXmKPExsVy+t/xu7qb/DfEGkxaKWmxccZ6VovrX56z
        Wpw/v4Hd4mPPPVaLGef3MVmsPXKX3WL9tJ+sFu1PXzI7cHjsnHWX3WPTqk42j74tqxg9Pm+S
        C2CJ0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0Mt4
        tGo6Y0E3e8Xf3YdYGhi/sHYxcnJICJhIHFg7laWLkYtDSGApo8SDcz8Yuxg5gBJSEvNblCBq
        hCX+XOtig6h5zSix7XY7E0hCWCBSYvnNr2wg9SICIRIL3+uB1DAL/GWUOHb9CliNkMAERonT
        x+xAbDYBQ4neo32MIDavgJ3EvedfmEFsFgFViZubu9lAbFGBCInn229A1QhKnJz5hAXE5hSw
        lfj6+QuYzSygLvFn3iVmCFtcounLSlYIW15i+9s5zBMYhWYhaZ+FpGUWkpZZSFoWMLKsYhRJ
        LS3OTc8tNtQrTswtLs1L10vOz93ECIy5bcd+bt7BeGlj8CFGAQ5GJR5eBa8NsUKsiWXFlbmH
        GCU4mJVEeO8YrI0V4k1JrKxKLcqPLyrNSS0+xGgK9NxEZinR5HxgOsgriTc0NTS3sDQ0NzY3
        NrNQEuftEDgYIySQnliSmp2aWpBaBNPHxMEp1cAo6ce4pdz+Wl3gvUl28+qDK9d7H/Be/O7f
        7qbSudUdTWfPPLb4EXR1VZ/XMyGWpU48Wa8qI64ZxBRcUFwmsvzfQgVVhvDgOnejZV+effHt
        WMWbzsbh+W3qwuzP1eGvVN4wSqye3XRv3TpZzueTrz2LNrpye+ZJ3/ZvqTmhAo6nn2n+f51u
        V71DiaU4I9FQi7moOBEAqs+pcs8CAAA=
X-CMS-MailID: 20191023130346eucas1p233334b1b158b52019e9b904f52004f70
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191023074140eucas1p2c236bde672f33d4fe32ed61545515cc3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191023074140eucas1p2c236bde672f33d4fe32ed61545515cc3
References: <CGME20191023074140eucas1p2c236bde672f33d4fe32ed61545515cc3@eucas1p2.samsung.com>
        <20191023074118.3012-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/23/19 09:41, Marek Szyprowski wrote:
> G3D clocks require special handling of their parent bus clock during power
> domain on/off sequences. Those clocks were not initially added to the
> sub-CMU handler, because that time there was no open-source driver for the
> G3D (MALI Panfrost) hardware module and it was not possible to test it.
> 
> This patch fixes this issue. Parent clock for G3D hardware block is now
> properly preserved during G3D power domain on/off sequence. This restores
> proper MALI Panfrost performance broken by commit 8686764fc071
> ("ARM: dts: exynos: Add G3D power domain to Exynos542x").
> 
> Reported-by: Marian Mihailescu <mihailescu2m@gmail.com>
> Fixes: b06a532bf1fa ("clk: samsung: Add Exynos5 sub-CMU clock driver")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Marian Mihailescu <mihailescu2m@gmail.com>

Applied, thanks.
