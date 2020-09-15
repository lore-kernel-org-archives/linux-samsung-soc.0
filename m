Return-Path: <SRS0=Wlns=CZ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30AACC2D0E3
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 16 Sep 2020 00:48:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2BB12076B
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 16 Sep 2020 00:48:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="RSa7DGjp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgIPAsR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 15 Sep 2020 20:48:17 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:46393 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726304AbgIOMgk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 08:36:40 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200915123632euoutp02f96cbbdd9e7ebcad1d46c8c217214f0f~09TjUaL7G0559605596euoutp02g
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2020 12:36:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200915123632euoutp02f96cbbdd9e7ebcad1d46c8c217214f0f~09TjUaL7G0559605596euoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600173392;
        bh=YXeEBDH26ndbGoz26DqDlDd0+j2jY+Bxwgwcd8YvyrQ=;
        h=From:To:Cc:Subject:Date:References:From;
        b=RSa7DGjpp2IKp2YEyG/dDsAeWMOHLiYST8uB4hPn78+6n68SbVW7n4fEKCu/560yk
         9/CrEFp87Pd45kbHQ4pmhWNxArosFNwobUP24kJ2jiy2BdoDz2v/X+Iu0+wPMNorsN
         JZYDmWDSf6Wg6dVC/1oCEnisHyzu814aONORfFA8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200915123631eucas1p2628ee2a6f9f51c63b10e646897b8f241~09TjF-94T1311313113eucas1p2c;
        Tue, 15 Sep 2020 12:36:31 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 61.EB.06456.F45B06F5; Tue, 15
        Sep 2020 13:36:31 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200915123631eucas1p1d9652c48aa3f22e0e7d88c361c2280ab~09Titxi_c0941809418eucas1p1E;
        Tue, 15 Sep 2020 12:36:31 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200915123631eusmtrp23b9b4cc3c316b6775438c55536f44ea4~09TitK84H1730817308eusmtrp2Z;
        Tue, 15 Sep 2020 12:36:31 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-dd-5f60b54f6611
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id B1.46.06017.F45B06F5; Tue, 15
        Sep 2020 13:36:31 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200915123630eusmtip2625a35ffc6edc295535fe7a989e88a60~09TiP0F7L3261832618eusmtip2O;
        Tue, 15 Sep 2020 12:36:30 +0000 (GMT)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Subject: [GIT PULL] clk/samsung fixes for v5.9
Message-ID: <858cd4a0-af7c-2004-cce6-0763557bf45f@samsung.com>
Date:   Tue, 15 Sep 2020 14:36:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.12.0
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAKsWRmVeSWpSXmKPExsWy7djP87r+WxPiDX7c1rbYOGM9q8X1L89Z
        LT723GO1mHF+H5PFxVOuFv+ubWRxYPN4f6OV3WPTqk42j74tqxg9Pm+SC2CJ4rJJSc3JLEst
        0rdL4MpYs1u3YA17Rdf+fvYGxslsXYycHBICJhJtF5eydzFycQgJrGCUeHDtBQuE84VRYuea
        84wQzmdGid6J+1hhWrZ/OgvVspxRYvLmw0wQzkdGiaPtx9lBqtgEDCV6j/YxgtgiAkESd/rX
        soEUMQscYpRYsus2M0hCWEBPounGW7AiXgE7iRUvL4JdxSKgKnHi2TUwW1QgTuLYqUcsEDWC
        EidnPgGzmQXEJW49mc8EYctLbH87hxlkgYRAO7vEs3kvGCFudZE4fvg7E4QtLPHq+BZ2CFtG
        4v/O+UwQDc2MEj27b7NDOBMYJe4fXwDVbS1x59wvoDM4gFZoSqzfpQ9iSgg4SrRMDocw+SRu
        vBWEuIFPYtK26cwQYV6JjjYhiBkqEr9XTYe6QEqi+8l/FgjbQ+L15lbmCYyKs5B8NgvJZ7OQ
        fDYL4YQFjCyrGMVTS4tz01OLDfNSy/WKE3OLS/PS9ZLzczcxAtPN6X/HP+1g/Hop6RCjAAej
        Eg9vQnl8vBBrYllxZS4w9DmYlUR4nc6ejhPiTUmsrEotyo8vKs1JLT7EKM3BoiTOa7zoZayQ
        QHpiSWp2ampBahFMlomDU6qB0Ubx9iZGj43R9kFVTDvexYskvJiwpXT9/IUV2++fvPL8vYub
        TEzEpWo1u/4vuX8a19oLmXR+nzM7s/y/qpXzx0cCIonXODe+9pyeKrDXqjOC09hB/EGvGufD
        h6vm/QzyzXWZOmXVWVM1bkUGwccZt6M2iAq4aZkkPHBZHrRn93WJmV9POLSvVmIpzkg01GIu
        Kk4EAMTiQx8zAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsVy+t/xe7r+WxPiDU5PE7PYOGM9q8X1L89Z
        LT723GO1mHF+H5PFxVOuFv+ubWRxYPN4f6OV3WPTqk42j74tqxg9Pm+SC2CJ0rMpyi8tSVXI
        yC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0MtYs1u3YA17Rdf+fvYG
        xslsXYycHBICJhLbP51l72Lk4hASWMoo8aPhGZDDAZSQkpjfogRRIyzx51oXG0TNe0aJexc6
        WEESbAKGEr1H+xhBbBGBIIlfe+6xghQxCxxilLjSso0ZJCEsoCfRdOMtWBGvgJ3EipcXwTaz
        CKhKnHh2DcwWFYiTONPzgg2iRlDi5MwnLCA2s4C6xJ95l5ghbHGJW0/mM0HY8hLb385hnsAo
        MAtJyywkLbOQtMxC0rKAkWUVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZGYLRsO/Zzyw7GrnfB
        hxgFOBiVeHgTyuPjhVgTy4orc4Ge4mBWEuF1Ons6Tog3JbGyKrUoP76oNCe1+BCjKdBDE5ml
        RJPzgZGcVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mDU6qBcfXkNbFW
        mp8X7klkuCc+M3mflq/Fi6zQiYW8bDsuLFZR6zJcr7yv+ocld/yXiVGn11z8v6za8/6Z+XYi
        G5bn1DG+q71XfUtLft2exZW5TNq+H17XLv+3cJuLNNuXezvKMszFo3jjIvacSvgz88edKJk1
        q8UNeZgkUkVyrB9Pmz/hdZjCnv55ekosxRmJhlrMRcWJAH1uW7ysAgAA
X-CMS-MailID: 20200915123631eucas1p1d9652c48aa3f22e0e7d88c361c2280ab
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200915123631eucas1p1d9652c48aa3f22e0e7d88c361c2280ab
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200915123631eucas1p1d9652c48aa3f22e0e7d88c361c2280ab
References: <CGME20200915123631eucas1p1d9652c48aa3f22e0e7d88c361c2280ab@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Stephen, Mike,

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/v5.9-clk-samsung-fixes

for you to fetch changes up to 0212a0483b0a36cc94cfab882b3edbb41fcfe1cd:

  clk: samsung: Keep top BPLL mux on Exynos542x enabled (2020-09-15 13:56:51 +0200)

----------------------------------------------------------------
clk/samsung fixes:

 - fix for a regression in v5.9-rc1 on Odroid XU3/XU4, i.e. booting
   failure due to the DRAM controller root clock being disabled

----------------------------------------------------------------
Marek Szyprowski (1):
      clk: samsung: Keep top BPLL mux on Exynos542x enabled

 drivers/clk/samsung/clk-exynos5420.c | 5 +++++
 1 file changed, 5 insertions(+)

-- 
Regards,
Sylwester
