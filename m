Return-Path: <SRS0=Wlns=CZ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57BFC433E2
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 16 Sep 2020 00:51:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DF5C20936
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 16 Sep 2020 00:51:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="AX0wx8x7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgIPAvw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 15 Sep 2020 20:51:52 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:49357 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgIOLed (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 07:34:33 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200915113427euoutp018de45386c83e6203dcbd6d315401da85~08dWR8YxC3049330493euoutp01c
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2020 11:34:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200915113427euoutp018de45386c83e6203dcbd6d315401da85~08dWR8YxC3049330493euoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600169667;
        bh=4J9mAIGkWCA1iUY60Uc0okRdlJsBdXs932NxjIHX2UM=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=AX0wx8x7qNAa7IH7Ec4T+5d5NsC4REGT4JvlmlvK1IOvfk6gR2sNfgXk7kUpm3zpI
         DqwtU0KlkQ+eHldWi4tZ6n9vVYUWiOP7ZSAjq8TNMxGBcmQ/+b4dME5vdkJNKT80u0
         EsLRyPb5XsEgVc8UVlQ00sJNhZzC1eoKRlFvtfgc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200915113426eucas1p2fa91a99c80c62880366254b0f622ca53~08dV8vQnu1150611506eucas1p2h;
        Tue, 15 Sep 2020 11:34:26 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 34.3C.05997.2C6A06F5; Tue, 15
        Sep 2020 12:34:26 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200915113426eucas1p1761f07b2bd25b5f31a6840b2b5046838~08dVXd_RU0665806658eucas1p1X;
        Tue, 15 Sep 2020 11:34:26 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200915113426eusmtrp209aef5c48bc076dedf5081df36b4b384~08dVQ_iPl1124011240eusmtrp2o;
        Tue, 15 Sep 2020 11:34:26 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-7c-5f60a6c26788
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id D8.4D.06314.2C6A06F5; Tue, 15
        Sep 2020 12:34:26 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200915113425eusmtip2c0eec9c762bf9fd235a50a708adb1bd3~08dUoWe4d2553525535eusmtip2Y;
        Tue, 15 Sep 2020 11:34:25 +0000 (GMT)
Subject: Re: [PATCH v3] clk: samsung: Prevent potential endless loop in the
 PLL set_rate ops
To:     Chanwoo Choi <cw00.choi@samsung.com>, tomasz.figa@gmail.com
Cc:     linux-clk@vger.kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <c3c40d62-f5bb-6b13-0af9-ce774718eaa6@samsung.com>
Date:   Tue, 15 Sep 2020 13:34:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <28cd3eeb-816d-b369-11a9-16cd2c1af87c@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMKsWRmVeSWpSXmKPExsWy7djP87qHliXEG9w+pGOxccZ6VovrX56z
        WnzsucdqcXnXHDaLGef3MVmsPXKX3eLiKVeLf9c2slis2vWH0YHT4/2NVnaPnbPusntsWtXJ
        5tG3ZRWjx+dNcgGsUVw2Kak5mWWpRfp2CVwZh/fMYiq4wVnx+oFLA+MH9i5GTg4JAROJTUcu
        snUxcnEICaxglNhz5gALSEJI4AujxKTpwRCJz4wSb3dNhOvYc+A5E0RiOaPE5a3rmCGcj4wS
        79YeYAWpEhaIk1g+Yy0TiC0iYC+x4dh/VpAiZoGDjBLTWnrBEmwChhK9R/sYQWxeATuJ/p3f
        mUFsFgFViamv/4HdIQo06NipRywQNYISJ2c+AbM5gYY+fj6TDcRmFhCXuPVkPhOELS+x/e0c
        sIskBA6xSzyb1s8KcbeLxIEle5kgbGGJV8e3QP0jI/F/53wmiIZmRome3bfZIZwJjBL3jy9g
        hKiylrhz7hfQOg6gFZoS63fpg5gSAo4SX58yQph8EjfeCkLcwCcxadt0Zogwr0RHmxDEDBWJ
        36umQ10gJdH95D/LBEalWUg+m4Xkm1lIvpmFsHYBI8sqRvHU0uLc9NRio7zUcr3ixNzi0rx0
        veT83E2MwKR0+t/xLzsYd/1JOsQowMGoxMObUB4fL8SaWFZcmXuIUYKDWUmE1+ns6Tgh3pTE
        yqrUovz4otKc1OJDjNIcLErivMaLXsYKCaQnlqRmp6YWpBbBZJk4OKUaGHWf6CgsiTlRxC3b
        utC4zLlOdq7vcmbnnFoXq40zkzOFIsTFWMV7nTmPvpXPvfC5mLFn6Vr22hnPG9ZMELa8b/7I
        bh7HyvuiTn/Obt5Xv/Fj5dkXT+pfLM669tW6Z0lm8j2PlX+YOnpX7Fq+5G/wzvlJxfsOHdjD
        b79rT5VFgmVgWEH4EfEbDEosxRmJhlrMRcWJAO4zWs9GAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRmVeSWpSXmKPExsVy+t/xe7qHliXEGzw/wmKxccZ6VovrX56z
        WnzsucdqcXnXHDaLGef3MVmsPXKX3eLiKVeLf9c2slis2vWH0YHT4/2NVnaPnbPusntsWtXJ
        5tG3ZRWjx+dNcgGsUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5
        mWWpRfp2CXoZh/fMYiq4wVnx+oFLA+MH9i5GTg4JAROJPQeeM3UxcnEICSxllJh66AaQwwGU
        kJKY36IEUSMs8edaFxtEzXtGif/rPzOBJIQF4iSWz1gLZosI2EtsOPafFaSIWeAgo8Sy02eZ
        IToOM0ocf9TIDFLFJmAo0Xu0jxHE5hWwk+jf+R0sziKgKjH19T8WEFsUaOqZnhdsEDWCEidn
        PgGLcwJtePx8JlicWUBd4s+8S8wQtrjErSfzmSBseYntb+cwT2AUmoWkfRaSlllIWmYhaVnA
        yLKKUSS1tDg3PbfYUK84Mbe4NC9dLzk/dxMjMA63Hfu5eQfjpY3BhxgFOBiVeHgTyuPjhVgT
        y4orcw8xSnAwK4nwOp09HSfEm5JYWZValB9fVJqTWnyI0RTouYnMUqLJ+cAUkVcSb2hqaG5h
        aWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgTHIMNKe9cyC+Xf1u+6kly5yUlq0
        vv9C5gmdAF+JhLNfjCbaLLF48+PDsa8eWlMY/tuqL560633GorSuK/ZT5hx+89naOSiytj16
        xxHPXqeNNwvOp74rzNe4sXHX99ApS8LEPq7JVKusFJj8ZjO/gEOvcsrSdYzlMsx9Pyo2PrU3
        WMG+2VO9jk2JpTgj0VCLuag4EQDkFb8e2QIAAA==
X-CMS-MailID: 20200915113426eucas1p1761f07b2bd25b5f31a6840b2b5046838
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200813095520eucas1p209432599420d62e0e54a5545334c329c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200813095520eucas1p209432599420d62e0e54a5545334c329c
References: <CGME20200813095520eucas1p209432599420d62e0e54a5545334c329c@eucas1p2.samsung.com>
        <20200813095508.7563-1-s.nawrocki@samsung.com>
        <28cd3eeb-816d-b369-11a9-16cd2c1af87c@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14.08.2020 02:46, Chanwoo Choi wrote:
> On 8/13/20 6:55 PM, Sylwester Nawrocki wrote:
>> In the .set_rate callback for some PLLs there is a loop polling state
>> of the PLL lock bit and it may become an endless loop when something
>> goes wrong with the PLL. For some PLLs there is already code for polling
>> with a timeout but it uses the ktime API, which doesn't work in some
>> conditions when the set_rate op is called, in particular during
>> initialization of the clk provider before the clocksource initialization
>> has completed. Hence the ktime API cannot be used to reliably detect
>> the PLL locking timeout.
>>
>> This patch adds a common helper function for busy waiting on the PLL lock
>> bit with timeout detection.

>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> ---
>> Changes for v3:
>>  - use busy-loop with udelay() instead of ktime API
>> Changes for v2:
>>  - use common readl_relaxed_poll_timeout_atomic() macro
>> ---
>>  drivers/clk/samsung/clk-pll.c | 94 ++++++++++++++++---------------------------
>>  1 file changed, 34 insertions(+), 60 deletions(-)

> Thanks.
> 
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
 
Patch applied, thank you for your comments.
