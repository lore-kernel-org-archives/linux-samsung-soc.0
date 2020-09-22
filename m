Return-Path: <SRS0=odV2=C7=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB29EC4727D
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Sep 2020 10:02:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 455B4238A1
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Sep 2020 10:02:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Xn2QaT8U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgIVKCj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 22 Sep 2020 06:02:39 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55652 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbgIVKCi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Sep 2020 06:02:38 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200922100236euoutp0119e359187736032ad528ca4fb0519bc2~3EuJwVZH50746607466euoutp01F
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Sep 2020 10:02:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200922100236euoutp0119e359187736032ad528ca4fb0519bc2~3EuJwVZH50746607466euoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600768956;
        bh=9h+/bNjJQklf4fdz2sAkI4M13yllHVeThUPf7uDwHVk=;
        h=From:Subject:To:Cc:Date:References:From;
        b=Xn2QaT8UfBkd0J41m27GFq1EuGHy0x5yOYZsi7p03XaeJL1T9QDN//gRJ7sRzWTcX
         KrFZMfhhDBYPP41N9dhrgHmvql8F81ubuv3TM3dwGrbTnbzFnQlQ8MtMS/KwM/5WT3
         3vWJdapGKzMIQTRddqvVAKTpXXiBwW1RdSjgFcdw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200922100236eucas1p273b07fe175bb2312a7c2a0ee83b88c55~3EuJeKZGr0641906419eucas1p2L;
        Tue, 22 Sep 2020 10:02:36 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 6A.44.06456.BBBC96F5; Tue, 22
        Sep 2020 11:02:35 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200922100235eucas1p29e2d2b543dee8504a69cd059db78a4df~3EuJJliU-1452214522eucas1p2c;
        Tue, 22 Sep 2020 10:02:35 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200922100235eusmtrp1ad1fe73f99568720c474fc686c8b1f53~3EuJI-69B1481214812eusmtrp1k;
        Tue, 22 Sep 2020 10:02:35 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-98-5f69cbbb5865
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id F8.97.06314.BBBC96F5; Tue, 22
        Sep 2020 11:02:35 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200922100235eusmtip2e517a4c7de3823b6b1a7c81b65a0815e~3EuIp5D9s1803618036eusmtip28;
        Tue, 22 Sep 2020 10:02:35 +0000 (GMT)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk: samsung: Updates for v5.10
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Message-ID: <f086a2ed-3825-bdb7-1ed6-02f2978713c2@samsung.com>
Date:   Tue, 22 Sep 2020 12:02:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.12.0
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsWy7djP87q7T2fGG/x5aGGxccZ6VovrX56z
        WnzsucdqMeP8PiaLi6dcLf5d28jiwObx/kYru8emVZ1sHn1bVjF6fN4kF8ASxWWTkpqTWZZa
        pG+XwJUxtekhS8Fb3oq+3a9ZGxg3cncxcnJICJhILGnbztbFyMUhJLCCUWJu1292COcLo0Tv
        4k9QzmdGiUMb/7LCtEyf/5wVIrGcUWLixE9MEM5HoJbJq5lBqtgEDCV6j/YxgtjCAsYSrya2
        s4HYIgJBEnf614ItZBY4xCixZNdtsAZeATuJHw8PgdksAqoSK253s4DYogJxEsdOPWKBqBGU
        ODnzCZjNLCAucevJfCYIW15i+9s5zCBDJQS62SW2fbjDBHGri8S1L3Oh7haWeHV8CzuELSNx
        enIPC0RDM6NEz+7b7BDOBEaJ+8cXMEJUWUvcOfcL6FYOoBWaEut36UOEHSWantxnAQlLCPBJ
        3HgrCHEEn8SkbdOZIcK8Eh1tQhDVKhK/V02HOkdKovvJfxYI20Pi0uKJTBMYFWcheW0Wktdm
        IXltFsINCxhZVjGKp5YW56anFhvmpZbrFSfmFpfmpesl5+duYgSmnNP/jn/awfj1UtIhRgEO
        RiUe3gNTM+KFWBPLiitzgUHOwawkwut09nScEG9KYmVValF+fFFpTmrxIUZpDhYlcV7jRS9j
        hQTSE0tSs1NTC1KLYLJMHJxSDYzGNzlf375fsJ7n2oK/vwVe1PVsCDvTdtNq0l31O60VFhu6
        D/MEpd1nTWMtTFyVc4P9/Ov7fxfMVFr7adrVHs2Nh9nmKn6unMH55n1GfP/Mi3omnpPMMlUd
        FudPDTTynnJJ4YvGzCo71xnvpx6eLHl4oknE6og4//mFxgIWAqXPHrxw9OTkX3haiaU4I9FQ
        i7moOBEAtx0NJTUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRmVeSWpSXmKPExsVy+t/xe7q7T2fGG9z/oGKxccZ6VovrX56z
        WnzsucdqMeP8PiaLi6dcLf5d28jiwObx/kYru8emVZ1sHn1bVjF6fN4kF8ASpWdTlF9akqqQ
        kV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJcxtekhS8Fb3oq+3a9Z
        Gxg3cncxcnJICJhITJ//nLWLkYtDSGApo8TFK3fYuhg5gBJSEvNblCBqhCX+XOtig6h5zyjR
        /ekjG0iCTcBQovdoHyOILSxgLPFqYjtYXEQgSOLXnntgQ5kFDjFKXGnZxgyS4BWwk/jx8BCY
        zSKgKrHidjcLiC0qECdxpucFG0SNoMTJmU/A4swC6hJ/5l1ihrDFJW49mc8EYctLbH87h3kC
        o8AsJC2zkLTMQtIyC0nLAkaWVYwiqaXFuem5xYZ6xYm5xaV56XrJ+bmbGIHxsu3Yz807GC9t
        DD7EKMDBqMTDe2BqRrwQa2JZcWUu0CMczEoivE5nT8cJ8aYkVlalFuXHF5XmpBYfYjQFemgi
        s5Rocj4wlvNK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqemFqQWwfQxcXBKNTCqs1XJ
        uzBaWFl7bxF7lZ+kwpl26PqbOrePBya5dvW2dGmXasyZe57R9LT0NP3GVUuijl3OmW4pmzFv
        2YP4/d22OX2hc3jdL3Vr7jgmddV717K0/+E8biJfv270b6io8JdkUGVnZXS8VL6ay+qElfTF
        y/NO3a2dMaHtirhC15YV9Uuaknx1tiixFGckGmoxFxUnAgDpEBIJrQIAAA==
X-CMS-MailID: 20200922100235eucas1p29e2d2b543dee8504a69cd059db78a4df
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200922100235eucas1p29e2d2b543dee8504a69cd059db78a4df
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200922100235eucas1p29e2d2b543dee8504a69cd059db78a4df
References: <CGME20200922100235eucas1p29e2d2b543dee8504a69cd059db78a4df@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Stephen, Mike,


The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/clk-v5.10-samsung

for you to fetch changes up to ff8e0ff9b99643a32f7e33a96867e76d0fa10f76:

  clk: samsung: Use cached clk_hws instead of __clk_lookup() calls (2020-09-17 12:05:18 +0200)

----------------------------------------------------------------
clk/samsung updates for 5.10

Minor refactoring removing most of the __clk_lookup() calls.

----------------------------------------------------------------
Marek Szyprowski (1):
      clk: samsung: Keep top BPLL mux on Exynos542x enabled

Sylwester Nawrocki (5):
      clk: samsung: exynos5420: Add definition of clock ID for mout_sw_aclk_g3d
      clk: samsung: exynos5420: Avoid __clk_lookup() calls when enabling clocks
      clk: samsung: Add clk ID definitions for the CPU parent clocks
      clk: samsung: exynos5420/5250: Add IDs to the CPU parent clk definitions
      clk: samsung: Use cached clk_hws instead of __clk_lookup() calls

 drivers/clk/samsung/clk-cpu.c          | 37 +++++++++++---------------
 drivers/clk/samsung/clk-cpu.h          |  6 ++---
 drivers/clk/samsung/clk-exynos3250.c   |  6 +++--
 drivers/clk/samsung/clk-exynos4.c      |  7 +++--
 drivers/clk/samsung/clk-exynos5250.c   |  8 +++---
 drivers/clk/samsung/clk-exynos5420.c   | 30 +++++++++++++--------
 drivers/clk/samsung/clk-exynos5433.c   | 10 +++++--
 include/dt-bindings/clock/exynos5250.h |  4 ++-
 include/dt-bindings/clock/exynos5420.h |  6 +++++
 9 files changed, 68 insertions(+), 46 deletions(-)

-- 
Regards,
Sylwester
