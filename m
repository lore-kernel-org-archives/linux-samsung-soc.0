Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC541C433ED
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Apr 2021 23:23:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81172610CD
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Apr 2021 23:23:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235095AbhDIXXX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 9 Apr 2021 19:23:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:35384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234880AbhDIXXX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Apr 2021 19:23:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5AB58610A6;
        Fri,  9 Apr 2021 23:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618010589;
        bh=5pCv8rpmihV4qJaXFovzMTtJQIatKaYhvqXP9WzJ9+M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=R1V2n5AHkCrhZAWMbY10LUmM3X5b4s4ywG5ezTLKDD7R4+uOAwSnaAGnIJhU12haP
         fAmtABTQw80sRHI49yhk8NLNwvDp3BDu8G9dIRlo2B7w7o9GrzQBKMkTBHZtkMOtkT
         FU2nTANXJSlM0gMq3HWRxwYDaO7W6q1EjAdnUpkkQq5GwPQ2o6wO2hQ7HX4bASwgDI
         NkHgVwscBqVf5Izj+zd5u91Xg8V2PfKv+F180wlQrEbGb2orxKMc+u3QaQk2gmWbEt
         BlwXh1DTzW/lG/9QvCEL4rxuefK5jYd9DQAa+kHD2w+VMQnOKfV3zo9WjxqTHHWfkT
         lIXdnmEeabxtw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <915aada1-34ff-4419-2352-c99b3de5f368@samsung.com>
References: <CGME20210409182228eucas1p108c01fc7b0feba23d53b812aa8d15202@eucas1p1.samsung.com> <915aada1-34ff-4419-2352-c99b3de5f368@samsung.com>
Subject: Re: [GIT PULL] clk: samsung: Updates for v5.13
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Date:   Fri, 09 Apr 2021 16:23:07 -0700
Message-ID: <161801058791.2941957.12744478930707990888@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Sylwester Nawrocki (2021-04-09 11:22:27)
> Hi Stephen, Mike,
>=20
>=20
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab=
15:
>=20
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/=
clk-v5.13-samsung
>=20
> for you to fetch changes up to 7f32917642c7ea486c1bae5dfdebeeb56c35b29b:
>=20
>   clk: samsung: Remove redundant dev_err calls (2021-04-08 19:35:26 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
