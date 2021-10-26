Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE195C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 19:53:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8555F60F56
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 19:53:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238996AbhJZT4A (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Oct 2021 15:56:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:56908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237203AbhJZTz7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Oct 2021 15:55:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4990160F39;
        Tue, 26 Oct 2021 19:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635278015;
        bh=paFFSIQClrFRxClXGy0nlF5UrDHG49MwhjhGRsPgAZo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZB+WB0WjqFnD7R5XyODOBr0CsEXJYMr5M5tKqhPV8V03+0itMeqYEFItPu2jznnTV
         7EvYHr2Z8LkMnoE4IOwWR/gHouBw+ntHMA2LjPfyTqp9eyfNB7EK1wHZPib33lP0yF
         jRtSv6bfQAXkblQFF3XgL575OWEAT3Q8Dqmv7VaGhsVnaNyJDHQHStVN18JbkayBff
         dymKtdJ2ISBtf8N2DqOJgSB5yDd5ZmEUf2xISi/MwWmdC7+m1qZm7Zh/BhINMmlnEH
         zKU3HlVQ4koirxWpFTYLf4JacbOinPStUOdUeKi9SjpSzliyWm9WxKbs4RQFB7q/oM
         FXW8kLRTSvSbw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6cd2815a-3dca-4373-8c4f-bae2522a36bd@samsung.com>
References: <CGME20210409182228eucas1p108c01fc7b0feba23d53b812aa8d15202@eucas1p1.samsung.com> <6cd2815a-3dca-4373-8c4f-bae2522a36bd@samsung.com>
Subject: Re: [GIT PULL] clk: samsung: Updates for v5.16
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Date:   Tue, 26 Oct 2021 12:53:34 -0700
Message-ID: <163527801400.15791.5603280776916220936@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Sylwester Nawrocki (2021-10-19 01:05:31)
> Hi Stephen, Mike,
>=20
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd=
8f:
>=20
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/=
clk-v5.16-samsung
>=20
> for you to fetch changes up to 9fe667af61d22fbeec823843962a77cd39993966:
>=20
>   clk: samsung: describe drivers in Kconfig (2021-10-18 10:12:48 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
