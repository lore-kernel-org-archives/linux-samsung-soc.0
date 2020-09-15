Return-Path: <SRS0=0LAj=CY=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE78C43461
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Sep 2020 22:29:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FA5920735
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Sep 2020 22:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600208988;
	bh=VmW8lZD7LvpBfANZxb+zDdbjY9lqQJ3ymVYLD4oTWB0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=LxG3XiOv4T3gwh9cm4X1C8LT3xTA6HM5NNzVfN8BtYwhgGxXfJ0Jt+7PiF+MVBpRl
	 7bDO6rELh92jUlc1jbWuQvlVa9NMPTm9YfYWXFE78H519ELrXfHYNJZ7Mhnx1HYoot
	 jGQLiuUfh9h/1YNXHFUGxTibWUx+olCmqtGNkyU0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbgIOW3r (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 15 Sep 2020 18:29:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:60238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727642AbgIOQTx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 12:19:53 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E8A36206DC;
        Tue, 15 Sep 2020 16:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600186719;
        bh=VmW8lZD7LvpBfANZxb+zDdbjY9lqQJ3ymVYLD4oTWB0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KrWIZ8CUc0gmVlYBF7vDvtu4LvcRHOUOd+EITli70EKCv6B/SsYUm+n+twPwa1AOx
         u67IpT18uB5XUlQVkiProDBqvDYwHuI95t4dTNgnfd/weuKAIWqAQxkYMIhGaRB5rD
         txStvD+sk9YSHpSW0moqe9RbRWaVg1mJQCUYhznM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <858cd4a0-af7c-2004-cce6-0763557bf45f@samsung.com>
References: <CGME20200915123631eucas1p1d9652c48aa3f22e0e7d88c361c2280ab@eucas1p1.samsung.com> <858cd4a0-af7c-2004-cce6-0763557bf45f@samsung.com>
Subject: Re: [GIT PULL] clk/samsung fixes for v5.9
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Date:   Tue, 15 Sep 2020 09:18:37 -0700
Message-ID: <160018671784.4188128.12584752804183109370@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Sylwester Nawrocki (2020-09-15 05:36:29)
> Hi Stephen, Mike,
>=20
> The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bb=
f5:
>=20
>   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/=
v5.9-clk-samsung-fixes
>=20
> for you to fetch changes up to 0212a0483b0a36cc94cfab882b3edbb41fcfe1cd:
>=20
>   clk: samsung: Keep top BPLL mux on Exynos542x enabled (2020-09-15 13:56=
:51 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes.
