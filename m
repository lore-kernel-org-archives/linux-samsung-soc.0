Return-Path: <SRS0=jzbt=YA=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA489C47404
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Oct 2019 08:54:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B084821872
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Oct 2019 08:54:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="DvLE/Oa5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbfJGIye (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Oct 2019 04:54:34 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50639 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727345AbfJGIye (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Oct 2019 04:54:34 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20191007085431euoutp02f707cb521b0dfd200d03f4e76a88d835~LUXg1tB0N2428124281euoutp02G
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Oct 2019 08:54:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20191007085431euoutp02f707cb521b0dfd200d03f4e76a88d835~LUXg1tB0N2428124281euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1570438471;
        bh=064HXfS3AFjBnI0MX93YdyVJAf6y/HoVJIYC+iEeTK0=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=DvLE/Oa5x7w4aHQYsZjmLqcjaRPWJWLHhJqq+UWD+7dhiUIYegU1g88z7M4gaaW/F
         usx+ksByjBn3xVw7a1AS3Whv2EK1DCs//eMSkeetlr9HZSxas4Fp1K4W/NmbZNOTYq
         OOl5l4dpH6l9S2Ouj5ANrpsRF/5GiR1uMe47K21g=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191007085431eucas1p1c60f3b52762e125d580ad23e8df80d54~LUXgh57aB1827918279eucas1p1Y;
        Mon,  7 Oct 2019 08:54:31 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id E7.69.04374.74DFA9D5; Mon,  7
        Oct 2019 09:54:31 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191007085431eucas1p2e77a9866f3b4f56b286e8f40bc3195df~LUXgIZZN61353913539eucas1p2y;
        Mon,  7 Oct 2019 08:54:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191007085431eusmtrp1c77da1d44d8edf8ec997f3671f37f792~LUXgHqDjG1783317833eusmtrp1E;
        Mon,  7 Oct 2019 08:54:31 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-fe-5d9afd475de9
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 94.DB.04166.64DFA9D5; Mon,  7
        Oct 2019 09:54:30 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191007085430eusmtip2ee2aacc27441c51339347f35049a1c06~LUXfrVO9c0580805808eusmtip2L;
        Mon,  7 Oct 2019 08:54:30 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: exynos5433: Fix error paths
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <7c7b0760-d45f-e19b-7abf-177d59410a5b@samsung.com>
Date:   Mon, 7 Oct 2019 10:54:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002085309.9473-1-m.szyprowski@samsung.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOKsWRmVeSWpSXmKPExsWy7djPc7ruf2fFGvzokbbYOGM9q8X1L89Z
        Lc6f38Bu8bHnHqvFjPP7mCzWHrnLbvHv2kYWi/anL5kdODw2repk8+jbsorR4/MmuQDmKC6b
        lNSczLLUIn27BK6MfS8uMRdsZ6o4deE2cwNjJ1MXIyeHhICJxI9dy5i7GLk4hARWMEq0T9rP
        AuF8YZR4cuoJO4TzmVHi8JmDzDAtn95fhGpZziix4/IjKOcto8Tvt4dYQaqEBewknvy9wAhi
        iwgEScy5cx1sFDPI3OkTTrCAJNgEDCV6j/YBFXFw8AI1LNllBBJmEVCR2LRnF1iJqECExKcH
        h8Fm8goISpyc+QQszilgK/Gs8zjYE8wC4hJNX1ayQtjyEtvfzgE7SEJgE7tE/7FrrBBnu0ic
        fd/CCGELS7w6voUdwpaROD25hwWioZlRomf3bXYIZwKjxP3jC6A6rCUOH7/ICnIps4CmxPpd
        +hBhR4ntLz6xgIQlBPgkbrwVhDiCT2LStunMEGFeiY42IYhqFYnfq6ZDA15KovvJf5YJjEqz
        kLw2C8k7s5C8Mwth7wJGllWM4qmlxbnpqcXGeanlesWJucWleel6yfm5mxiByef0v+NfdzDu
        +5N0iFGAg1GJh9dDc1asEGtiWXFl7iFGCQ5mJRFeuaUzYoV4UxIrq1KL8uOLSnNSiw8xSnOw
        KInzVjM8iBYSSE8sSc1OTS1ILYLJMnFwSjUwXtToeMzeppC08dsXUZVtzD/KPrvvSqjqP9+w
        fMGcKeHvbC4KRNoVzfk2fWnMfK3EMK+nivvL3z5aGF97euKLhafX3HT9MOnDppzL1ppO9kt3
        +0i3XnRt9W6+ttOZrc1EVTYgnMco2M3wf8i1jyGXZx5KWXw3JrwhdRPzzCWLd64KaD7Ody7b
        VomlOCPRUIu5qDgRAH6vVdE6AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRmVeSWpSXmKPExsVy+t/xe7puf2fFGtxZY22xccZ6VovrX56z
        Wpw/v4Hd4mPPPVaLGef3MVmsPXKX3eLftY0sFu1PXzI7cHhsWtXJ5tG3ZRWjx+dNcgHMUXo2
        RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZ+15cYi7Y
        zlRx6sJt5gbGTqYuRk4OCQETiU/vLzJ3MXJxCAksZZS4PesIexcjB1BCSmJ+ixJEjbDEn2td
        bBA1rxkl+ta8ZQVJCAvYSTz5e4ERxBYRCJI4NPsD2CBmgS+MEj+/PWaE6JjAKHHy6RGwKjYB
        Q4neo32MIBt4gbqX7DICCbMIqEhs2rOLBcQWFYiQOLxjFlg5r4CgxMmZT8DinAK2Es86j4Nd
        zSygLvFn3iVmCFtcounLSlYIW15i+9s5zBMYhWYhaZ+FpGUWkpZZSFoWMLKsYhRJLS3OTc8t
        NtQrTswtLs1L10vOz93ECIy1bcd+bt7BeGlj8CFGAQ5GJR5eD81ZsUKsiWXFlbmHGCU4mJVE
        eOWWzogV4k1JrKxKLcqPLyrNSS0+xGgK9NxEZinR5HxgGsgriTc0NTS3sDQ0NzY3NrNQEuft
        EDgYIySQnliSmp2aWpBaBNPHxMEp1cDYVVG/XVotx+5UnLTIlrXa39w3zYp7lb2xUEjCLXvS
        4ehTJ9Squ6MjHbovWiq6pz8u3M5Y/KHPISu4xPmoW/61Fu55/9vCc4NFX9c8/p5rfWye7F+v
        4yGqvtMZ5CY/OLxc63are+3fE8dDPt/ex9DzpcbferfQ0/Yl/VqZOQe79suuTHvL8UKJpTgj
        0VCLuag4EQDrTLXaywIAAA==
X-CMS-MailID: 20191007085431eucas1p2e77a9866f3b4f56b286e8f40bc3195df
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191002085320eucas1p2e4c35fe7783deb38fbd2e9f87f4f1234
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191002085320eucas1p2e4c35fe7783deb38fbd2e9f87f4f1234
References: <CGME20191002085320eucas1p2e4c35fe7783deb38fbd2e9f87f4f1234@eucas1p2.samsung.com>
        <20191002085309.9473-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/2/19 10:53, Marek Szyprowski wrote:
> Add checking the value returned by samsung_clk_alloc_reg_dump() and
> devm_kcalloc(). While fixing this, also release all gathered clocks.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

