Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F65C43217
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 21:00:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BA63611EE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 21:00:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243046AbhJOVCq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 15 Oct 2021 17:02:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:34194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243044AbhJOVCp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 17:02:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 996DF611C8;
        Fri, 15 Oct 2021 21:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634331638;
        bh=jV4KyGbDL34q+UN7wrCccWqes/lBQ9/L7MLZWze912E=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RPABZiw1ZO3SC10WKNSc1k2fTzrGkLy2jJat7ybVxoGHdYmByZ1UUtEizRxEiFWln
         Cv9fCbWs7fxZ8OV2prDCN0/bKBxO6vBTIHSq/d5TmTOcOigFbVSHI0STRysBYIThVh
         IjpmX0w+fKUuWNtUlP5l5Brz6w1wl5JpPOniDLETmwpD6+EpB1H9zG3m3SzvlDTJKj
         skr4W5f/DkPR3/afE/eCMdG+78O6wYmocRjRzVAgJKQ1K8G6WOFw5lcXXtLvQsv8vH
         m+41ZFPokuIBBn4/iSfWGvs3U4WFdL1XBf4dQ9xTx36kVeQRgexTqZHkSurl6Cb5u5
         i1THfEwglPZEA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211015151425.29743-1-s.nawrocki@samsung.com>
References: <CGME20211015151438eucas1p1a784b8fb6bc20b01d4b1ec3634359df5@eucas1p1.samsung.com> <20211015151425.29743-1-s.nawrocki@samsung.com>
Subject: Re: [PATCH] clk: samsung: Remove meaningless __init and extern from header files
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, cw00.choi@samsung.com, krzk@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-clk@vger.kernel.org
Date:   Fri, 15 Oct 2021 14:00:37 -0700
Message-ID: <163433163729.1688384.6878958236847535617@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Sylwester Nawrocki (2021-10-15 08:14:25)
> Remove useless __init atrribute and unneeded extern qualifier in function

I prefer extern even if it is verbose but it doesn't really matter.

> declarations in header files.
>=20
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
