Return-Path: <SRS0=b06D=C2=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED658C43461
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 17 Sep 2020 10:21:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE8662083B
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 17 Sep 2020 10:21:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Vs4C2WUF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbgIQKVZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:21:25 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44915 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbgIQKVJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 06:21:09 -0400
X-Greylist: delayed 392 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 06:21:08 EDT
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200917102053euoutp023a077fd95515ce46db1fa9a1cf22615c~1ivsK27tZ1910919109euoutp02b
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Sep 2020 10:20:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200917102053euoutp023a077fd95515ce46db1fa9a1cf22615c~1ivsK27tZ1910919109euoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600338053;
        bh=+soWB7T32AfnQiLAfNmy+TnWJJXergXGZL/ibpvdNLc=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=Vs4C2WUFR76REJL2l+B2qQuzWUzK/SZjuI5gpKCf2u2MUFVCfKe6uXlPU0IJZBKux
         zPFdVJ1Qz+wT9SxlIBR55lImZHDpU7nVSO2/IS2i/NUMXxcsyqSqSiK780yDdYVnLq
         Ls4pNwEbMznzoz2z7H3zPP6AXR1ajKkMNhmcqyWs=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200917102053eucas1p16c5a1bcd7329aecd78b56d57a79a2983~1ivr0zz2t0234902349eucas1p17;
        Thu, 17 Sep 2020 10:20:53 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 17.F8.06318.488336F5; Thu, 17
        Sep 2020 11:20:52 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200917102052eucas1p1baf4933226fe43fadd82ec5ccb51036a~1ivrbhp-N0243702437eucas1p18;
        Thu, 17 Sep 2020 10:20:52 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200917102052eusmtrp206a2711693fabd35d17badf571cc0daf~1ivra3BZA1192211922eusmtrp27;
        Thu, 17 Sep 2020 10:20:52 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-44-5f6338848cca
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id CF.AE.06314.488336F5; Thu, 17
        Sep 2020 11:20:52 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200917102051eusmtip28df2ee4b1ba88206b4bab3e23003e2b4~1ivqphxjD2885528855eusmtip2C;
        Thu, 17 Sep 2020 10:20:51 +0000 (GMT)
Subject: Re: [PATCH v3] clk: samsung: Prevent potential endless loop in the
 PLL set_rate ops
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>, tomasz.figa@gmail.com
Cc:     linux-clk@vger.kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
Message-ID: <70db322d-4b8d-be69-0434-b1d1b3764340@samsung.com>
Date:   Thu, 17 Sep 2020 12:20:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <c3c40d62-f5bb-6b13-0af9-ce774718eaa6@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCKsWRmVeSWpSXmKPExsWy7djP87otFsnxBnuvW1psnLGe1eL6l+es
        Fh977rFaXN41h81ixvl9TBZrj9xlt7h4ytXi37WNLBardv1hdOD0eH+jld1j56y77B6bVnWy
        efRtWcXo8XmTXABrFJdNSmpOZllqkb5dAldG09GTbAXruStu3tzD0sC4jLOLkZNDQsBEYubH
        y0xdjFwcQgIrGCW+n1jKCuF8YZRYtOQmO4TzmVFi7s07bDAtfw8fYYFILGeUOLKsjw3C+cgo
        cW/tDXaQKmGBOInlM9YygdhsAoYSvUf7GEFsEQF7iQ3H/oPtYBY4yCgxraUXrIhXwE5i7p5T
        YEUsAqoSN05PBYuLAg06duoRC0SNoMTJmU/AbE6gQQ8OzwSrYRYQl7j1ZD6ULS+x/e0cZohT
        D7FL7J3qBWG7SKz6NJkJwhaWeHV8CzuELSPxf+d8cAhICDQzSvTsvs0O4UxglLh/fAEjRJW1
        xJ1zv4D+5ADaoCmxfpc+iCkh4Cjx9SkjhMknceOtIMQJfBKTtk1nhgjzSnS0CUHMUJH4vWo6
        1AVSEt1P/rNMYFSaheSxWUiemYXkmVkIaxcwsqxiFE8tLc5NTy02zkst1ytOzC0uzUvXS87P
        3cQITEun/x3/uoNx35+kQ4wCHIxKPLwcEknxQqyJZcWVuYcYJTiYlUR4nc6ejhPiTUmsrEot
        yo8vKs1JLT7EKM3BoiTOa7zoZayQQHpiSWp2ampBahFMlomDU6qBcYrTQx6JjgSzVMsIud/n
        lpzU21dovrnVaHnhEuE9e448aZW5qfky+9FbkwPClldv61/ZHLdjn8LOb09qdS7O1fn+Mf7I
        Hu4UttVS5ueNZ1uumD6vi//b+dt7er/m6fyt+S0+R+q1a78ly93/zeExbhVL044xLXN8ekPE
        K7JQQ8Phi5Pj8tqiFCWW4oxEQy3mouJEABJXzDZHAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsVy+t/xe7otFsnxBptOq1hsnLGe1eL6l+es
        Fh977rFaXN41h81ixvl9TBZrj9xlt7h4ytXi37WNLBardv1hdOD0eH+jld1j56y77B6bVnWy
        efRtWcXo8XmTXABrlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpO
        Zllqkb5dgl5G09GTbAXruStu3tzD0sC4jLOLkZNDQsBE4u/hIyxdjFwcQgJLGSVOfF/K1sXI
        AZSQkpjfogRRIyzx51oXG0TNe0aJ2w09LCAJYYE4ieUz1jKB2GwChhK9R/sYQWwRAXuJDcf+
        s4I0MAscZJRYdvosM0T3D0aJGRM72UGqeAXsJObuOQXWwSKgKnHj9FSwSaJAU8/0vGCDqBGU
        ODnzCdg2TqCpDw7PBKthFlCX+DPvEjOELS5x68l8qLi8xPa3c5gnMArNQtI+C0nLLCQts5C0
        LGBkWcUoklpanJueW2yoV5yYW1yal66XnJ+7iREYiduO/dy8g/HSxuBDjAIcjEo8vBtEk+KF
        WBPLiitzDzFKcDArifA6nT0dJ8SbklhZlVqUH19UmpNafIjRFOi5icxSosn5wCSRVxJvaGpo
        bmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mDU6qB0ZU5fm3Nw949t1ZyTLvjZtNz
        s2HBWR6ehqD4+z83slq8sJN3Zl3ec+9orcoH9SveAsb78/Tjfq8Iay6qO2A38Ufs7dS7yzdF
        pkrYLX4xgY9p6qZ139Z7PU7ryuXZUPo9Lv7PqsutM6W+yn+/J/l3+xnrx3qKcj1X4xQPVEjc
        mi17banQ6wL3a0osxRmJhlrMRcWJAD0p34LaAgAA
X-CMS-MailID: 20200917102052eucas1p1baf4933226fe43fadd82ec5ccb51036a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200813095520eucas1p209432599420d62e0e54a5545334c329c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200813095520eucas1p209432599420d62e0e54a5545334c329c
References: <CGME20200813095520eucas1p209432599420d62e0e54a5545334c329c@eucas1p2.samsung.com>
        <20200813095508.7563-1-s.nawrocki@samsung.com>
        <28cd3eeb-816d-b369-11a9-16cd2c1af87c@samsung.com>
        <c3c40d62-f5bb-6b13-0af9-ce774718eaa6@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 15.09.2020 13:34, Sylwester Nawrocki wrote:
> On 14.08.2020 02:46, Chanwoo Choi wrote:
>> On 8/13/20 6:55 PM, Sylwester Nawrocki wrote:
>>> In the .set_rate callback for some PLLs there is a loop polling state
>>> of the PLL lock bit and it may become an endless loop when something
>>> goes wrong with the PLL. For some PLLs there is already code for polling
>>> with a timeout but it uses the ktime API, which doesn't work in some
>>> conditions when the set_rate op is called, in particular during
>>> initialization of the clk provider before the clocksource initialization
>>> has completed. Hence the ktime API cannot be used to reliably detect
>>> the PLL locking timeout.
>>>
>>> This patch adds a common helper function for busy waiting on the PLL lock
>>> bit with timeout detection.
>>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>>> ---
>>> Changes for v3:
>>>  - use busy-loop with udelay() instead of ktime API
>>> Changes for v2:
>>>  - use common readl_relaxed_poll_timeout_atomic() macro
>>> ---
>>>  drivers/clk/samsung/clk-pll.c | 94 ++++++++++++++++---------------------------
>>>  1 file changed, 34 insertions(+), 60 deletions(-)
>> Thanks.
>>
>> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
>  
> Patch applied, thank you for your comments.

And dropped now as it causes issues on arm64. As reported by Marek
it seems udelay() doesn't work before the system timer is initialized.
