Return-Path: <SRS0=d/6x=YY=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E5ACA9ECB
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 31 Oct 2019 15:03:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A7CD12083E
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 31 Oct 2019 15:03:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="q5QzfrWK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728109AbfJaPDi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 31 Oct 2019 11:03:38 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:58228 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728032AbfJaPDi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 31 Oct 2019 11:03:38 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20191031150335euoutp02cb8a2a5ca8d681f032302eefdc9efb78~Sw4mIPCYG2899228992euoutp02E
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Oct 2019 15:03:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20191031150335euoutp02cb8a2a5ca8d681f032302eefdc9efb78~Sw4mIPCYG2899228992euoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1572534215;
        bh=N/rr1ATWj6Fr8BjjF7ON7fKYP92kHGFezwLqpPsY0TM=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=q5QzfrWK9ojPk1KhL4OSfugqNiYR7Wmf6snRdKHLuDMMWy7oxePiW7CwD+/N0b9Nu
         5ZLNHz+CxKSpU6X0+55bdUQLWMBxaAkfT4vtEOq+ofRsVVhiEhRXty8rzb4eFbFp/m
         zdUWABGHMEDvGYuS5bcOZC1ciznikX95Lpca0jnI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191031150335eucas1p268dfe1ecfa718ab5f3462830ea1a8b75~Sw4l6qreF2541525415eucas1p2T;
        Thu, 31 Oct 2019 15:03:35 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 67.DA.04309.7C7FABD5; Thu, 31
        Oct 2019 15:03:35 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191031150334eucas1p1c72857d23468cd693fee18ff1175b897~Sw4lp6VuB0775507755eucas1p15;
        Thu, 31 Oct 2019 15:03:34 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191031150334eusmtrp2cac717f4f3849501c9f439ee7325036e~Sw4lpT8WH1622416224eusmtrp26;
        Thu, 31 Oct 2019 15:03:34 +0000 (GMT)
X-AuditID: cbfec7f4-afbff700000010d5-8e-5dbaf7c70256
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 64.64.04166.6C7FABD5; Thu, 31
        Oct 2019 15:03:34 +0000 (GMT)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191031150334eusmtip146c9b932987b6821624b2d85a961dbe0~Sw4lQQsNp2920029200eusmtip1w;
        Thu, 31 Oct 2019 15:03:34 +0000 (GMT)
Subject: [GIT PULL] clk/samsung updates for v5.5
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <af9676da-d448-50e8-d181-680aba7078db@samsung.com>
Date:   Thu, 31 Oct 2019 16:03:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7647a10d-8e37-f086-a014-77f8ddcdd006@samsung.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLKsWRmVeSWpSXmKPExsWy7djP87rHv++KNZh1mM1i44z1rBbXvzxn
        tfjYc4/VYsb5fUwWF0+5Wvy7tpHFgc3j/Y1Wdo9NqzrZPPq2rGL0+LxJLoAlissmJTUnsyy1
        SN8ugSvj0OrjbAVfuCt2nYhpYPzE2cXIySEhYCLxdPJG1i5GLg4hgRWMEmuePWCHcL4wSvx7
        OZkZwvnMKLHk1VumLkYOsJarE/Qh4ssZJZrf/YEqesso8WzOcxaQImEBA4nZ561AVogIBEnc
        6V/LBlLDLHAIaMWip2wgCTYBQ4neo32MIDavgJ3E6e87wXpZBFQlph7OADFFBSIkTn9NhKgQ
        lDg58wkLiM0pYC9xte8qmM0sIC7R9GUlK4QtL7H97RywcyQEFrFLfH12jA3iTReJE6veM0PY
        whKvjm9hh7BlJP7vnM8E0dDMKNGz+zY7hDOBUeL+8QWMEFXWEoePX2QFuYhZQFNi/S59iLCj
        xL6Fb1khgcInceOtIMQRfBKTtk1nhgjzSnS0CUFUq0j8XjWdCcKWkuh+8p9lAqPSLCSvzULy
        ziwk78xC2LuAkWUVo3hqaXFuemqxUV5quV5xYm5xaV66XnJ+7iZGYKI5/e/4lx2Mu/4kHWIU
        4GBU4uGdULYzVog1say4MhcY+BzMSiK832yAQrwpiZVVqUX58UWlOanFhxilOViUxHmrGR5E
        CwmkJ5akZqemFqQWwWSZODilGhgzzxXxTmq5+ybUiK1vwqmnrl+7F2s9XrXGLZLjv5T3yeR7
        PoePf6y8vTn76I/9/iuELQvtXrRf/nKfV1KxVts1tzeV+VvQiY9vVtSs3t51zOtZX92FPfyt
        7dMien4eOXDDcP2yVInPj7eXxz7cV9olO89py4vIjx7NHeb/bsaEprkURR3JWn1PiaU4I9FQ
        i7moOBEA03JfgjADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRmVeSWpSXmKPExsVy+t/xu7rHvu+KNbh229Bi44z1rBbXvzxn
        tfjYc4/VYsb5fUwWF0+5Wvy7tpHFgc3j/Y1Wdo9NqzrZPPq2rGL0+LxJLoAlSs+mKL+0JFUh
        I7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/j0OrjbAVfuCt2nYhp
        YPzE2cXIwSEhYCJxdYJ+FyMXh5DAUkaJ3+9PMUHEpSTmtyh1MXICmcISf651sUHUvGaU6O95
        xA5SIyxgIDH7vBVIjYhAkMSvPfdYQWqYBQ4xSvzf8YIZJCEkYCexfed7RhCbTcBQovdoH5jN
        CxQ//X0nC8gcFgFViamHM0DCogIREs+334AqEZQ4OfMJC4jNKWAvcbXvKpjNLKAu8WfeJWYI
        W1yi6ctKVghbXmL72znMExiFZiFpn4WkZRaSlllIWhYwsqxiFEktLc5Nzy021CtOzC0uzUvX
        S87P3cQIjKttx35u3sF4aWPwIUYBDkYlHt4JZTtjhVgTy4orc4F+5WBWEuH9ZgMU4k1JrKxK
        LcqPLyrNSS0+xGgK9NtEZinR5HxgzOeVxBuaGppbWBqaG5sbm1koifN2CByMERJITyxJzU5N
        LUgtgulj4uCUamDMeTffX9fITPO2b17qjdTIPq3iCXFef29LLnXLvizr1cC0ovYNt7B2utll
        V++HmnbbEu+HnfhtfSQwYe2OqNC7f63Cc8J2vTAq9vzPOHnjofJg3fex9zb1Tt3Rv7ijLriC
        31FV9Mj0yl2/9f5czTnJNGNrSsoCi2vnitkf7P80aVHU58sCqQ+UWIozEg21mIuKEwFYW+kK
        wQIAAA==
X-CMS-MailID: 20191031150334eucas1p1c72857d23468cd693fee18ff1175b897
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191031150334eucas1p1c72857d23468cd693fee18ff1175b897
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191031150334eucas1p1c72857d23468cd693fee18ff1175b897
References: <7647a10d-8e37-f086-a014-77f8ddcdd006@samsung.com>
        <CGME20191031150334eucas1p1c72857d23468cd693fee18ff1175b897@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Stephen, Mike,
This PR is on top of my previous one (tags/clk-v5.4-samsung-fixes).


The following changes since commit e9323b664ce29547d996195e8a6129a351c39108:

  clk: samsung: exynos5420: Preserve PLL configuration during suspend/resume (2019-10-25 11:20:00 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git clk-v5.5-samsung

for you to fetch changes up to 45f10dabb56bc5dee52df47dccd3bfab1e58eea1:

  clk: samsung: exynos5420: Add SET_RATE_PARENT flag to clocks on G3D path (2019-10-29 14:57:22 +0100)

----------------------------------------------------------------
clk/samsung updates for 5.5

 - Addition of rate table for the VPLL and GPU related clock
   tree definition update to allow the GPU driver for setting
   the GPU's clock without requiring detailed knowledge of
   clock topology on each exynos542x SoC;
 - Fix for potential CPU performance degradation after system
   suspend/resume cycle on exynos542x SoCs.

----------------------------------------------------------------
Marek Szyprowski (1):
      clk: samsung: exynos5420: Add SET_RATE_PARENT flag to clocks on G3D path

Marian Mihailescu (2):
      clk: samsung: exynos5420: Add VPLL rate table
      clk: samsung: exynos5420: Preserve CPU clocks configuration during suspend/resume

 drivers/clk/samsung/clk-exynos5420.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

-- 
Thanks,
Sylwester
