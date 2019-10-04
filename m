Return-Path: <SRS0=VUgU=X5=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE4EC4360C
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Oct 2019 21:45:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E5842222C2
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Oct 2019 21:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570225512;
	bh=y1e+tgSp7e0tgbR/cUxYS8CTGmt1MsrrM3rPNUmbNm8=;
	h=In-Reply-To:References:From:To:Cc:Subject:Date:List-ID:From;
	b=a9x3MFalHa4R+JRm3z3ofsCXwoiN6Q1vqlZRVZcsESewVNk/DVrZ6Hg73AW/GOQ83
	 kexNHmNYtWq594MwJ0TZ7uk2TK8SvNjyA8CrouymwHcNhoAamrOIWWE5BTsJkhI70a
	 pFRRAOMJFo4akvOJ1fANE9YSQwVWeQ+/JYHAVCIk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728841AbfJDVpL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Oct 2019 17:45:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:36368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727548AbfJDVpL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Oct 2019 17:45:11 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AFDCB2133F;
        Fri,  4 Oct 2019 21:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570225510;
        bh=y1e+tgSp7e0tgbR/cUxYS8CTGmt1MsrrM3rPNUmbNm8=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=fvXMaHqwDe3inbL8LyDHoURJ/iLsvAZOaQgbKORH23nqBTlQutm9X8iavArIDK8o0
         OuXAShRE2AiGAyWCCgIQ2Lvv1eU6CHck4qWRbjNZofku9nZx4SW25vhEZs0rmE52sf
         1KBgPw2cO0RX0udKVfdHSgys5Dm0dNQR+7ybt1gw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191002085309.9473-1-m.szyprowski@samsung.com>
References: <CGME20191002085320eucas1p2e4c35fe7783deb38fbd2e9f87f4f1234@eucas1p2.samsung.com> <20191002085309.9473-1-m.szyprowski@samsung.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos5433: Fix error paths
User-Agent: alot/0.8.1
Date:   Fri, 04 Oct 2019 14:45:09 -0700
Message-Id: <20191004214510.AFDCB2133F@mail.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Marek Szyprowski (2019-10-02 01:53:09)
> Add checking the value returned by samsung_clk_alloc_reg_dump() and
> devm_kcalloc(). While fixing this, also release all gathered clocks.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Any fixes tag?

