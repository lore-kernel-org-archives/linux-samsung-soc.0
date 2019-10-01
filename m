Return-Path: <SRS0=5wrF=X2=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169A8ECE587
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 21:58:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE6122133F
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 21:58:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="g0so+B7C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbfJAV6p (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Oct 2019 17:58:45 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:45475 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726392AbfJAV6p (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 17:58:45 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20191001215842epoutp019126bf333c9d95fcf528672eb3ac726c~JpMeksFKb0096100961epoutp01A
        for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Oct 2019 21:58:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20191001215842epoutp019126bf333c9d95fcf528672eb3ac726c~JpMeksFKb0096100961epoutp01A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1569967122;
        bh=H/0dSSjQJh50vWIB+t6HbKYzbJxNvuzWkwr+dDXz20Y=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=g0so+B7CxHlRpy7IbWWbttU620mM7YKVG+imDiSGIrGd49MDf3mmt737ZeirQbnu8
         7TeRVYffjeDRXAChSlBej5VJBpvuFZzKNEP1uIbwzMJB15LiGp3Nuzk409CwUlsf4t
         wi2PDwib1yir+j+YrBGVNdqnAJvBnmN96KgT9OeY=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191001215842epcas1p113b96a8b43fcfd930b43aa62b1bbc992~JpMeMXho52865128651epcas1p1W;
        Tue,  1 Oct 2019 21:58:42 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.157]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 46jY7N525mzMqYll; Tue,  1 Oct
        2019 21:58:40 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        E9.31.04144.01CC39D5; Wed,  2 Oct 2019 06:58:40 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20191001215839epcas1p3923451e15fe6ca2b4bbf683ae952a447~JpMcEI0Nm2397523975epcas1p3m;
        Tue,  1 Oct 2019 21:58:39 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191001215839epsmtrp10ed6b14c794967dd2a14749a0176afec~JpMcDdPUM1192611926epsmtrp1D;
        Tue,  1 Oct 2019 21:58:39 +0000 (GMT)
X-AuditID: b6c32a35-2c7ff70000001030-f8-5d93cc108e5d
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        53.40.04081.F0CC39D5; Wed,  2 Oct 2019 06:58:39 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191001215839epsmtip162057a0488cfcf942d14f18a844f1c2d~JpMb4utbb0288002880epsmtip1H;
        Tue,  1 Oct 2019 21:58:39 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: exynos5433: Fix potential NULL pointer
 dereference
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <3c3d500a-d2ef-8606-f549-eb82d7f877be@samsung.com>
Date:   Wed, 2 Oct 2019 07:03:27 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001130921.24571-1-m.szyprowski@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+e3uXq/h6tfSPC6oeRXChY/rWk5TCbIQEpGSDHHYxV2nuVe7
        s5om2NNHo5cFNrF3RKJoptHLnI9eFK4HilSWWFEG9rAHRg/adpP873N+53vO4Xt+hybkRykF
        XWy28zYzZ2SoWdLLfVHR0fhBnS7O0xepvVjfSmo9nrYA7WfnC1Jb77kp0bb0jwRoq96MEyuo
        9PamGip9f0cTSv/SvjCLyC1JLuI5PW9T8uYCi77YbEhh1qzLX5mvWRbHRrOJ2gRGaeZMfAqT
        lpEVvbrY6J3LKLdwxlLvUxYnCExsarLNUmrnlUUWwZ7C8Fa90ZpojRE4k1BqNsQUWExJbFxc
        vMYr3FhStGP3J9I6SG9rvFkvrUR7A2pRIA14KQzsu+3lWbQcX0Ew0NBHiMEkgu9dPaQYfEdw
        unUITZc0OsckYqILQc/odUoMPiK4MTHhzdD0PJwDtSO0D4OxBVwT2b5aAjsRtDWn+ZjCKuh+
        N0z5eA4Oh8GpV/7+MpwKl666SB9LcSS0jE35OQRvgMnRPlLUzIV7x15LfRzo1Z/v9EjF/qHw
        9PUJiciLYFdng98N4GcU1Jx9T4gG0uCr+4dU5Hnw/k7Hv10oYPzA9F7K4cK9fkosrkbQ0f2Q
        FBNq6D5X5/dI4ChovRYrPofD1Z+NSBw8Gz58c5I+CWAZVO+Vi5IIeDI6IhE5DM5U1VAHEeOa
        Ycc1w4JrhgXX/2EnkbQJzeetgsnAC6yVnfnZ7ch/kirNFXRkIKMXYRoxQbLh7DqdnOS2CA5T
        LwKaYIJlyb8O6+QyPeco422WfFupkRd6kca77UOEIqTA4j1wsz2f1cSr1WrtUnaZhmWZUFm6
        oVInxwbOzpfwvJW3TddJ6EBFJXKbYrvX4rfjFb2/cbgn6dBxp1DQoFeX3Nn6PGj70OPmxR8+
        7+t56s7M1h81BN89/VGxvjAvXmIqH13c8uhPZGqhmtnUeCtsST+lO3W/835W0k7H5syqPTkn
        Xnocgf1l11qW535LULnzlLctYZO6VRXxqz3UApxRtRWdMkdQhSG7GalQxLEqwiZwfwF0ZPgf
        qAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkkeLIzCtJLcpLzFFi42LZdlhJTpf/zORYg++rtSw2zljPanH+/AZ2
        i48991gtZpzfx2Sx9shddov2py+ZHdg8Nq3qZPPo27KK0ePzJrkA5igum5TUnMyy1CJ9uwSu
        jMaWD6wFVzkq5u6bwdLA2MbexcjJISFgIjG35xFTFyMXh5DAbkaJKdf2sUIkJCWmXTzK3MXI
        AWQLSxw+XAxR85ZR4uDV8ywgcWGBcImuuxwg5SIC+RIz7vQygtQwC/QxShzoWcUO0TCRUeL8
        pMNg29gEtCT2v7jBBmLzCyhKXP3xmBHE5hWwk9i8cxbYYhYBFYm1j36A2aICERKHd8yCqhGU
        ODnzCQuIzQlUv3zreTCbWUBd4s+8S8wQtrjErSfzmSBseYnmrbOZJzAKz0LSPgtJyywkLbOQ
        tCxgZFnFKJlaUJybnltsWGCYl1quV5yYW1yal66XnJ+7iREcMVqaOxgvL4k/xCjAwajEw9sQ
        NDlWiDWxrLgy9xCjBAezkgivzZ9JsUK8KYmVValF+fFFpTmpxYcYpTlYlMR5n+YdixQSSE8s
        Sc1OTS1ILYLJMnFwSjUwckpfvexp7PbxfMJD4YSH2+NTJTX/f+muYkiPeLoiqeX8J98UkV0l
        j74HMZ1P7LlX4bz4sNOxD296yo22dYhkPr2wQjw4Om4hd++V/1s++3M1/l3bHsaT8+xgnp9w
        9KHfyp/KJTuXvp391jNdsevrLoHyrkgHsWSTjybXlmzcU/Ne6NeukMoSJZbijERDLeai4kQA
        tVBd95QCAAA=
X-CMS-MailID: 20191001215839epcas1p3923451e15fe6ca2b4bbf683ae952a447
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20191001130929eucas1p114d229f779680122c629396a4fc040c0
References: <CGME20191001130929eucas1p114d229f779680122c629396a4fc040c0@eucas1p1.samsung.com>
        <20191001130921.24571-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On 19. 10. 1. 오후 10:09, Marek Szyprowski wrote:
> devm_kcalloc might fail, so avoid accessing the allocated object in such
> case.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
> index 7824c2ba3d8e..6afbcd0ae96f 100644
> --- a/drivers/clk/samsung/clk-exynos5433.c
> +++ b/drivers/clk/samsung/clk-exynos5433.c
> @@ -5592,7 +5592,8 @@ static int __init exynos5433_cmu_probe(struct platform_device *pdev)
>  	if (data->nr_pclks > 0) {
>  		data->pclks = devm_kcalloc(dev, sizeof(struct clk *),
>  					   data->nr_pclks, GFP_KERNEL);
> -
> +		if (!data->pclks)
> +			return -ENOMEM;
>  		for (i = 0; i < data->nr_pclks; i++) {
>  			struct clk *clk = of_clk_get(dev->of_node, i);
>  
> 

I think it is needed when 'data->pclks' memory allocation failed.
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
