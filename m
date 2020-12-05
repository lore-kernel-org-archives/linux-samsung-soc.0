Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E824DC4361A
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  5 Dec 2020 06:28:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B232C22D58
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  5 Dec 2020 06:28:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727977AbgLEG2s (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 5 Dec 2020 01:28:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:36566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726841AbgLEG2s (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 5 Dec 2020 01:28:48 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607149687;
        bh=3OcwGSCxKYQ7iV6p0/9pR+2UzXBUllSG93v3bx1yuxI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dhGYzCrRBeO/XEWWr71T+4wCMNjV0qlnN0lJYbLCdevEv4ivdtW+Pi8fyRs8tvrqZ
         2iyIaNkAi0wEl8RDEi37PMS3SVfDTqKSH/bTicW/gKTJaVqqAYTNSlJaaxcnPeymCL
         7r7wdFtEPOxuRLizIEuTUo7HcFu62iGDYTqRedvfPt7wn0XfVhj3VK/w4bK7PFcAoh
         T1Uoq6plCWU1i11jZYeuFdAXiOEAeh6rTUSIHhKmVS7xsEX+3c4WCJzqmUmhfFfiHB
         1kXFxoGctr6ul/NZU/j98T8q8wXOeBCuKTzxsWXVmYneO6RXkbdhCac68/eZ8aDGyl
         BJVbF62luR5mw==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1b5b6cdb-d471-b572-546a-552d6a86297a@samsung.com>
References: <CGME20201130164405eucas1p2a202512b7e1e8072019f70f90b972af2@eucas1p2.samsung.com> <1b5b6cdb-d471-b572-546a-552d6a86297a@samsung.com>
Subject: Re: [GIT PULL] clk: samsung: Updates for v5.11
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Date:   Fri, 04 Dec 2020 22:28:06 -0800
Message-ID: <160714968631.1580929.5488423704316217749@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Sylwester Nawrocki (2020-11-30 08:44:04)
> Hi Stephen, Mike,
>=20
> Below is my tiny pull request for v5.11. My apologies for being late, I f=
orgot
> to send it out last week.
>=20
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9=
ec:
>=20
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
>=20
> are available in the git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/=
clk-v5.11-samsung
>=20
> for you to fetch changes up to 44a9e78f9242872c889f176782777fa2ed535650:
>=20
>   clk: samsung: Prevent potential endless loop in the PLL ops (2020-11-23=
 11:14:04 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
