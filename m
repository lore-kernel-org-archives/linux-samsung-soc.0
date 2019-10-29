Return-Path: <SRS0=sb5j=YW=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49117CA9EC4
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 29 Oct 2019 14:12:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1F12821734
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 29 Oct 2019 14:12:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="N0XRci7n"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388692AbfJ2OMM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 29 Oct 2019 10:12:12 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:41486 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389088AbfJ2OMM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 29 Oct 2019 10:12:12 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20191029141210euoutp025e7fa220281f93056a6c932e4c3969e9~SI5I2OiE90400904009euoutp02s
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Oct 2019 14:12:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20191029141210euoutp025e7fa220281f93056a6c932e4c3969e9~SI5I2OiE90400904009euoutp02s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1572358330;
        bh=ChEoizYgV/w6uZd4qptYsaEigNMegtu97pepCSLODYU=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=N0XRci7nn2XLteGlXbB0sxatV1hiVg24wQ5ifiCBJ3oKy2tsoz65rTcXUgJa6Wh8M
         KcUWukYLNI4c4PMvwez0PB1Ej0qKoz9fWVDBGjfB8O+ZTAIpwKP8LoWUIsMK8QoNkm
         izrkb7DXdpn15Wo47V6l2rIM3bGSwNYOVnCVo4eI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191029141210eucas1p2957b53860e0b6ede471244dced15cb01~SI5IjEZ4S1948019480eucas1p2v;
        Tue, 29 Oct 2019 14:12:10 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id AB.E8.04469.AB848BD5; Tue, 29
        Oct 2019 14:12:10 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191029141210eucas1p22dad2a084cdc6caf623d30c32101b941~SI5IP0fGq1475114751eucas1p29;
        Tue, 29 Oct 2019 14:12:10 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191029141210eusmtrp2343a630ad730c6a4f5748754a77746c0~SI5IPKAvp2228922289eusmtrp2d;
        Tue, 29 Oct 2019 14:12:10 +0000 (GMT)
X-AuditID: cbfec7f2-569ff70000001175-d4-5db848ba8e54
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id FA.8B.04117.AB848BD5; Tue, 29
        Oct 2019 14:12:10 +0000 (GMT)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191029141209eusmtip21f8ff57f1db70c30583e82f7ef7536ee~SI5HyMccQ1852318523eusmtip2c;
        Tue, 29 Oct 2019 14:12:09 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: exynos5420: Add SET_RATE_PARENT flag to
 clocks on G3D path
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <452b0ffb-e6b6-a8da-9167-cc9f03eb3c8f@samsung.com>
Date:   Tue, 29 Oct 2019 15:12:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025093435.12143-1-m.szyprowski@samsung.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsWy7djP87q7PHbEGuyfKW6xccZ6VovrX56z
        Wpw/v4Hd4mPPPVaLGef3MVmsPXKX3WL9tJ+sFu1PXzI7cHjsnHWX3WPTqk42j74tqxg9Pm+S
        C2CJ4rJJSc3JLEst0rdL4MpY3PiMreAEc8XsDv8Gxu9MXYycHBICJhLvPuxl62Lk4hASWMEo
        MXPXPUYI5wujRMPUb+wQzmdGiV/vzgKVcYC1TNhkARFfzijx+/4SRpBRQgJvGSUON7qA2MIC
        8RInW58zg9giAvoS3W1XwGqYBRYwSWxa7wtiswkYSvQe7QOL8wrYSRyeNxWsnkVAVeL8+R/M
        ILtEBSIkTn9NhCgRlDg58wkLiM0JVL6tZx8zxEhxiaYvK1khbHmJ7W/nMIPcJiGwjl1iaetz
        Fog3XSQOfuxghLCFJV4d38IOYctI/N85nwmioZlRomf3bXYIZwKjxP3jC6A6rCUOH7/ICnIR
        s4CmxPpd+l2M7EBhR4lv3JAg4ZO48VYQ4gQ+iUnbpjNDhHklOtqEIEaoSPxeNR0a5lIS3U/+
        s0xgVJqF5LFZSJ6ZheSZWQhbFzCyrGIUTy0tzk1PLTbMSy3XK07MLS7NS9dLzs/dxAhMPaf/
        Hf+0g/HrpaRDjAIcjEo8vBnqO2KFWBPLiitzDzFKcDArifBePLMtVog3JbGyKrUoP76oNCe1
        +BCjNAeLkjhvNcODaCGB9MSS1OzU1ILUIpgsEwenVAOj/t/LmmeXK/9dp/80INJr4Uqh6Rv+
        6bX0G39Z5ijr5Wiz4yR/1ORjBXeK3xy+wpUvnXHpgDD/3Cq+Y4bCe4XvPvL7+E3+3Hb3F4fU
        Lf55zppl52oUYCUkH9/S6GpQX3nyBos818v6m2aFs/2E/dbK7qzJVl+UpTYjXdAuwmP21/M/
        Q1kt+P8qsRRnJBpqMRcVJwIAs5iN0DkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRmVeSWpSXmKPExsVy+t/xe7q7PHbEGqz+x2yxccZ6VovrX56z
        Wpw/v4Hd4mPPPVaLGef3MVmsPXKX3WL9tJ+sFu1PXzI7cHjsnHWX3WPTqk42j74tqxg9Pm+S
        C2CJ0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0MtY
        3PiMreAEc8XsDv8Gxu9MXYwcHBICJhITNll0MXJxCAksZZQ4tfslO0RcSmJ+i1IXIyeQKSzx
        51oXG0TNa0aJGw96WEASwgLxEidbnzOD2CIC+hLdbVcYQWxmgUVMEkfOZEE0TGSU+Nw6DyzB
        JmAo0Xu0D8zmFbCTODxvKlgzi4CqxPnzP8BsUYEIiefbb0DVCEqcnPkEbBknUP22nn3MEAvU
        Jf7MuwRli0s0fVnJCmHLS2x/O4d5AqPQLCTts5C0zELSMgtJywJGllWMIqmlxbnpucVGesWJ
        ucWleel6yfm5mxiBEbft2M8tOxi73gUfYhTgYFTi4T2guSNWiDWxrLgy9xCjBAezkgjvxTPb
        YoV4UxIrq1KL8uOLSnNSiw8xmgI9N5FZSjQ5H5gM8kriDU0NzS0sDc2NzY3NLJTEeTsEDsYI
        CaQnlqRmp6YWpBbB9DFxcEo1MHoHmB1lbald8c6Qs3R6/JM/Nas3S/AamvR/SL72Y8nGx/5x
        vev2Btqxcni+X+SepqJmm2nw0m+r3mIX5djbZ5dee8jm3nY+ZNPh4HtfFUsvTrd6Y/Wv6XH7
        uUitV96z81Uka18/4qi7rxgiOb1RTWG1be/upQ8/fbA8svCRgckGQdaUn4s22iixFGckGmox
        FxUnAgDjEihZzgIAAA==
X-CMS-MailID: 20191029141210eucas1p22dad2a084cdc6caf623d30c32101b941
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191025093445eucas1p16ce610f491a9bd9b9ce894debcaec9be
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191025093445eucas1p16ce610f491a9bd9b9ce894debcaec9be
References: <CGME20191025093445eucas1p16ce610f491a9bd9b9ce894debcaec9be@eucas1p1.samsung.com>
        <20191025093435.12143-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/25/19 11:34, Marek Szyprowski wrote:
> Add CLK_SET_RATE_PARENT flag to all clocks on the path from VPLL to G3D,
> so the G3D MALI driver can simply adjust the rate of its clock by doing
> a single clk_set_rate() call, without the need to know the whole clock
> topology in Exynos542x SoCs.
> 
> Suggested-by: Marian Mihailescu <mihailescu2m@gmail.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Patch applied, thank you.
