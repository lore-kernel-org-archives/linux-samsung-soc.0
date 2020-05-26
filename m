Return-Path: <SRS0=n3/p=7I=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A1A4C433DF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 May 2020 22:00:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1930F20888
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 May 2020 22:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590530405;
	bh=6cCHzCbwHCPpK/GZfnV7kAAQqSjdl+f6abfQwYrX5lg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=FXFLYXZBuH2bp/YQ0RVNefGkW0vIX/rhHdFzcNILlkrHX/TA/GR/M8kImzBNIG259
	 ftmJ+oj3KCaRBiQ1rpJs/oFj6xDE2b7ZGg5pPg66NpzRMyCUh3uJBRpQiMjKzr39fK
	 K3ymuW5mQGWC7cbEXAVxPfNDO/uTXIvLVCfoyYFc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391093AbgEZWAE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 May 2020 18:00:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:47276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391067AbgEZWAE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 May 2020 18:00:04 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CC9C020707;
        Tue, 26 May 2020 22:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590530403;
        bh=6cCHzCbwHCPpK/GZfnV7kAAQqSjdl+f6abfQwYrX5lg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ygvQv6eUsPzv7KC/ucX1BmNr4o/u46EA5P9ZiUJKWqEa7omyNUuSTRjM8B50m+evE
         iHIN2XiKJKsdcNxAZzk0c3QLDzAjKu3d7kpUtf6p958lNJ/Rj+493/UVChLoz1JGJA
         i4FFVU3Ey5yt8EQVXzteWRsaxM9QrgbMmDKQ2pdE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <72d1868f-65c0-5dd7-b497-ebc5f78bc34b@samsung.com>
References: <CGME20200519160043eucas1p11d34223ddaddaf00e136abacc9f351e1@eucas1p1.samsung.com> <72d1868f-65c0-5dd7-b497-ebc5f78bc34b@samsung.com>
Subject: Re: [GIT PULL] clk/samsung updates for 5.8
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Date:   Tue, 26 May 2020 15:00:03 -0700
Message-ID: <159053040320.88029.2196365046324845080@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Sylwester Nawrocki (2020-05-19 09:00:42)
> Hi Stephen, Mike
>=20
> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f31=
36:
>=20
>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/=
clk-v5.8-samsung
>=20
> for you to fetch changes up to 25bdae0f1c6609ceaf55fe6700654f0be2253d8e:
>=20
>   clk: samsung: exynos5433: Add IGNORE_UNUSED flag to sclk_i2s1 (2020-05-=
19 16:58:42 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
