Return-Path: <SRS0=rkI/=Y4=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6394DCA9ED3
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Nov 2019 18:00:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3671C214E0
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Nov 2019 18:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572890417;
	bh=gXrJj408R+3JEAaui6yuBsw4emXJCh8v5eUygTDK8TI=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=Xz/+FrPBGm+htboFqDV0OzH4zURt3geJYFtfRzT9F1rsxgUH2nx1hx89q82H/NPib
	 bYh2O60aKlhaIlGN/oGH0BHt91Fh+TwFTl72oXMdOyrDPYDsDBWc2Qw/nRi2dJvA4s
	 YRh1mBeUzggoyXsLP/5hX/7XYFnFxm9TUva2i5r0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728174AbfKDSAQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 4 Nov 2019 13:00:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:37070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727998AbfKDSAQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Nov 2019 13:00:16 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E89C420B7C;
        Mon,  4 Nov 2019 18:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572890416;
        bh=gXrJj408R+3JEAaui6yuBsw4emXJCh8v5eUygTDK8TI=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=MNvsJMkNlrXLPK4QrUbUIg5cFxSNvwEEm3060UzNGTET1p7ltlN3U5OSTH1FaWAv9
         v/+PkK8y1tORPbkiU/I2bEOSefma/D2by/oj1U3feqy/omfkMohH862GYdElCuhYCc
         UVkz450797IRo806d99nRM9kEEhcvy+BO+fzp4NY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7647a10d-8e37-f086-a014-77f8ddcdd006@samsung.com>
References: <CGME20191025153902eucas1p174c36ab6b80d297290181456bebacca2@eucas1p1.samsung.com> <7647a10d-8e37-f086-a014-77f8ddcdd006@samsung.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] clk/samsung fixes for v5.4
To:     Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
User-Agent: alot/0.8.1
Date:   Mon, 04 Nov 2019 10:00:15 -0800
Message-Id: <20191104180015.E89C420B7C@mail.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Sylwester Nawrocki (2019-10-25 08:39:01)
> Hi Stephen, Mike,
>=20
> The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c=
5c:
>=20
>   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/=
clk-v5.4-samsung-fixes
>=20
> for you to fetch changes up to e9323b664ce29547d996195e8a6129a351c39108:
>=20
>   clk: samsung: exynos5420: Preserve PLL configuration during suspend/res=
ume (2019-10-25 11:20:00 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes.

