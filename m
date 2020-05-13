Return-Path: <SRS0=Clw5=63=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D444C2D0FC
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 13 May 2020 10:52:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F19C520675
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 13 May 2020 10:52:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="N4LSWv7C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgEMKwn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 13 May 2020 06:52:43 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55625 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730299AbgEMKwn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 13 May 2020 06:52:43 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200513105240euoutp01b231841befdd0982c398eb6483b4e129~OkQL9U0xK1620216202euoutp01D
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 May 2020 10:52:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200513105240euoutp01b231841befdd0982c398eb6483b4e129~OkQL9U0xK1620216202euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1589367160;
        bh=Tvf4kiVemq3r9+xmj7efrH9zjjebQE9M8zr1Vnglgw0=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=N4LSWv7C5ziBELpdgorMQwfzPFGrXJ7OfDY7XNurz4kREbUEvAipN6haBYDPoV0/q
         J5uvT/pbm2gGg4lBdbUgFXbX9km/5rAMiO+xwMo0WqOQ6treppTViGZUYngZXeQFYl
         CSCTrzBeUREKNQzy08ZZqibzUxzjJU7Hpq+VVnJ4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200513105240eucas1p19278861ad99428e2f445f51bf4e2a6fd~OkQLmvQEU0938709387eucas1p1Q;
        Wed, 13 May 2020 10:52:40 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 9D.9B.61286.871DBBE5; Wed, 13
        May 2020 11:52:40 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200513105239eucas1p16722b08fa553be3672e2d3e7e9227ea8~OkQLRZn1R0936409364eucas1p1p;
        Wed, 13 May 2020 10:52:39 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200513105239eusmtrp1e215b5ce140c7c2fed7086ea6f9ad05a~OkQLQpkO33200732007eusmtrp1c;
        Wed, 13 May 2020 10:52:39 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-fe-5ebbd1784cc7
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 78.0F.07950.771DBBE5; Wed, 13
        May 2020 11:52:39 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200513105239eusmtip20ee84c7b59a356ba31cffff0764fc36c~OkQKm4dJz0893308933eusmtip25;
        Wed, 13 May 2020 10:52:38 +0000 (GMT)
Subject: Re: [PATCH 1/2] clk: samsung: Mark top ISP and CAM clocks on
 Exynos542x as critical
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <f4f8566d-6a49-1bfa-8bea-fc89722b8add@samsung.com>
Date:   Wed, 13 May 2020 12:52:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200506132659.17162-1-m.szyprowski@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHKsWRmVeSWpSXmKPExsWy7djP87oVF3fHGSxZxGqxccZ6VovrX56z
        Wpw/v4Hd4mPPPVaLGef3MVmsPXKX3WL9tJ+sFv+ubWSxaH/6ktmB02PnrLvsHptWdbJ59G1Z
        xejxeZNcAEsUl01Kak5mWWqRvl0CV8bS5vvMBY/YK852KDcwrmbrYuTkkBAwkeg+38bexcjF
        ISSwglHi0MczUM4XRonvu16wQDifGSUuPV7OBNOy5so5ZojEckaJL3+XMEE4HxklJu65yQxS
        JSwQJzHxzTmgWRwcIgL5ErPehoCEmQWamSTO3lMDsdkEDCV6j/Yxgti8AnYSn2c1gbWyCKhK
        rPh+BSwuKhArcXrxZqgaQYmTM5+wgNicQPUve5ezQMwUl7j1ZD4ThC0vsf3tHLDjJAR2sUss
        7dgNdoOEgIvEsWdiEA8IS7w6voUdwpaROD25hwWivplRomf3bXYIZwKjxP3jCxghqqwl7pz7
        xQYyiFlAU2L9Ln2IsKPEzGOz2SDm80nceCsIcQOfxKRt05khwrwSHW1CENUqEr9XTYeGoZRE
        95P/LBMYlWYh+WwWkm9mIflmFsLeBYwsqxjFU0uLc9NTiw3zUsv1ihNzi0vz0vWS83M3MQJT
        0el/xz/tYPx6KekQowAHoxIPL0Ptrjgh1sSy4srcQ4wSHMxKIrx+63fHCfGmJFZWpRblxxeV
        5qQWH2KU5mBREuc1XvQyVkggPbEkNTs1tSC1CCbLxMEp1cC4hpHh4qnvDj33N52/tcJXyFK4
        1q39gNxiucyVNRI5J8q+v5NeHTiBXVfi3vyztjOrlx5w3Fa0vqt21uvphUnZ/8zUE/nefpXL
        21DpEtwv7GknuGlv45y1jEZ/pqe+7bAQf3zw1WkJtsw179SmxPw7v949OUsm++VRnqOXPmVE
        Bocc+r3Q+4GFEktxRqKhFnNRcSIA1QgLtUEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsVy+t/xe7rlF3fHGTTs1bHYOGM9q8X1L89Z
        Lc6f38Bu8bHnHqvFjPP7mCzWHrnLbrF+2k9Wi3/XNrJYtD99yezA6bFz1l12j02rOtk8+ras
        YvT4vEkugCVKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI
        3y5BL2Np833mgkfsFWc7lBsYV7N1MXJySAiYSKy5co65i5GLQ0hgKaNE89EZLF2MHEAJKYn5
        LUoQNcISf651sUHUvGeU+Pr1LitIQlggTmLim3PsILaIQL7EjDu9jCBFzALNTBJHH6xjhOiY
        yCjx7vgMsCo2AUOJ3qN9jCA2r4CdxOdZTcwgNouAqsSK71fA4qICsRKrr7VC1QhKnJz5hAXE
        5gSqf9m7HMxmFlCX+DPvEjOELS5x68l8JghbXmL72znMExiFZiFpn4WkZRaSlllIWhYwsqxi
        FEktLc5Nzy020itOzC0uzUvXS87P3cQIjL9tx35u2cHY9S74EKMAB6MSD29E/a44IdbEsuLK
        3EOMEhzMSiK8fut3xwnxpiRWVqUW5ccXleakFh9iNAV6biKzlGhyPjA15JXEG5oamltYGpob
        mxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYFTgkpPwlepKcpX2snacs1Hg/LoCzVuF
        fHMqYmp9297svBld6HWpSdIy2v/AqVlnmnPWHX4u7h6+7fu+V4am9z+lH/x3//bRWgcBWbs5
        9q6rDc6IBU75LeMm892d6cE6JvW7umH3d37LdD0SsOOWdUHVFF/PuP1rT2yRMBZb5Nrr+/3y
        lHKLxUosxRmJhlrMRcWJAIeOMWrVAgAA
X-CMS-MailID: 20200513105239eucas1p16722b08fa553be3672e2d3e7e9227ea8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200506132718eucas1p27ceb5f9d146beda30723ed99151ef51a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200506132718eucas1p27ceb5f9d146beda30723ed99151ef51a
References: <CGME20200506132718eucas1p27ceb5f9d146beda30723ed99151ef51a@eucas1p2.samsung.com>
        <20200506132659.17162-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06.05.2020 15:26, Marek Szyprowski wrote:
> The TOP 'aclk*_isp', 'aclk550_cam', 'gscl_wa' and 'gscl_wb' clocks must
> be kept enabled all the time to allow proper access to power management
> control for the ISP and CAM power domains. The last two clocks, although
> related to GScaler device and GSCL power domain, provides also the
> I_WRAP_CLK signal to MIPI CSIS0/1 devices, which are a part of CAM power
> domain and are needed for proper power on/off sequence.
> 
> Currently there are no drivers for the devices, which are part of CAM and
> ISP power domains yet. This patch only fixes the race between disabling
> the unused power domains and disabling unused clocks, which randomly
> resulted in the following error during boot:
> 
> Power domain CAM disable failed
> Power domain ISP disable failed
> 
> Fixes: 318fa46cc60d ("clk/samsung: exynos542x: mark some clocks as critical")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Applied, thanks.
