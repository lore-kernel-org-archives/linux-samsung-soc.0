Return-Path: <SRS0=ZafQ=2O=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C91C2D0D2
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 24 Dec 2019 07:53:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 76D182073B
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 24 Dec 2019 07:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577173996;
	bh=ss6SNZY7yxQMuzFaKEyRWPfihgPgQFpbgyayg0eP2jk=;
	h=In-Reply-To:References:Cc:From:To:Subject:Date:List-ID:From;
	b=im+QVEJwniO9UlqxLVF4I14McO+1krI9iZl1RmYcw+zfHUIJB9c642LmK/qLjrfLN
	 XD/YIOj38ZPkvUJfSJcBj8kLsKhtGNjJrYwGCC9Min3LWIP47wBClhtLyg1JHPTP1g
	 wHe8egRiyEVssoOnZqZ5p4U4BfQ3vYEvxHkhNnJk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbfLXHxQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 24 Dec 2019 02:53:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:44532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725993AbfLXHxQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Dec 2019 02:53:16 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 06B94206CB;
        Tue, 24 Dec 2019 07:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577173995;
        bh=ss6SNZY7yxQMuzFaKEyRWPfihgPgQFpbgyayg0eP2jk=;
        h=In-Reply-To:References:Cc:From:To:Subject:Date:From;
        b=dru+BUA9QuMc2DEHX8dfIfn4aU2IpNgBALSQE7pZP+/8ZX+6ZIV5l9XweeD6ZdYbe
         Y8W1R9X3hsJsanIvkEU0oc4hC54x4K6d0BzPT8rqTDXcRv4PbYDsLuUo7cuQCLbqpL
         nzUQEhSz2uq1In8apV6bKmWZbuSToA4MLyacDon4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191216131407.17225-1-m.szyprowski@samsung.com>
References: <CGME20191216131423eucas1p2162d6bf0a870357be9f0ab308641015b@eucas1p2.samsung.com> <20191216131407.17225-1-m.szyprowski@samsung.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2] clk: samsung: exynos5420: Keep top G3D clocks enabled
User-Agent: alot/0.8.1
Date:   Mon, 23 Dec 2019 23:53:14 -0800
Message-Id: <20191224075315.06B94206CB@mail.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Marek Szyprowski (2019-12-16 05:14:07)
> In Exynos542x/5800 SoCs, the G3D leaf clocks are located in the G3D power
> domain. This is similar to the other hardware modules and their power
> domains. However there is one thing specific to G3D clocks hierarchy.
> Unlike other hardware modules, the G3D clocks hierarchy doesn't have any
> gate clock between the TOP part of the hierarchy and the part located in
> the power domain and some SoC internal busses are sourced directly from
> the TOP muxes. The consequence of this design if the fact that the TOP
> part of the hierarchy has to be enabled permanently to ensure proper
> operation of the SoC power related components (G3D power domain and
> Exynos Power Management Unit for system suspend/resume).
>=20
> This patch adds an explicit call to clk_prepare_enable() on the last MUX
> in the TOP part of G3D clock hierarchy to keep it enabled permanently to
> ensure that the internal busses get their clock regardless of the main
> G3D clock enablement status.
>=20
> This fixes following imprecise abort issue observed on Odroid XU3/XU4
> after enabling Panfrost driver by commit 1a5a85c56402 "ARM: dts: exynos:
> Add Mali/GPU node on Exynos5420 and enable it on Odroid XU3/4"):
>=20
> panfrost 11800000.gpu: clock rate =3D 400000000
> panfrost 11800000.gpu: failed to get regulator: -517
> panfrost 11800000.gpu: regulator init failed -517
> Power domain G3D disable failed
> ...
> panfrost 11800000.gpu: clock rate =3D 400000000
> 8<--- cut here ---

Applied to clk-fixes

