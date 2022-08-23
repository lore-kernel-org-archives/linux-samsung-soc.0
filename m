Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F13A4C3F6B0
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 23 Aug 2022 02:20:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239260AbiHWCUr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 22 Aug 2022 22:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239556AbiHWCUi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 22:20:38 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B85E5AC7F;
        Mon, 22 Aug 2022 19:20:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B8A61B81A7F;
        Tue, 23 Aug 2022 02:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FBEFC433C1;
        Tue, 23 Aug 2022 02:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661221231;
        bh=9+q9kiKL50YG4CdosiWGTc8Tk1I5wulTBdKIfEXqaIs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LSZhy/w14YQKxIYE/XipCJZr5OZEIdF8LkW1e4U53/pp2AleUS9QtUEDg9Dko23LJ
         wvK4wTR5ie0fEK2pb8Wr4hQaZe0uQUnoZrEVYUwGHZg7SDeRVdxtyTm9QcEdmA6WgH
         qBTUXYBbYQvuvG4tr5Y4qcIL71DCHiYAEvycciv8C8Ht8hXUIB/jRDCtMe+1ODEXWs
         tZGNaAmtdB38A4c0Xt1Cwa/zojqdy4VizSSNLKVWNGb+vhTtBz47zP/omyPVydlN7l
         oZMAX0i9/uZKK9Qbku6BA+SuCVnLcj1wzVhKklPqIjAPfp+dz0TUeHdmXUb9Jj6SRY
         UJB8NEDhxoaGw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1659054220.git.chanho61.park@samsung.com>
References: <CGME20220729003611epcas2p1fe80f3eb06160c48c41f10b35d7c03eb@epcas2p1.samsung.com> <cover.1659054220.git.chanho61.park@samsung.com>
Subject: Re: [PATCH v2 0/6] fsys0/1 clock support for Exynos Auto v9 SoC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
To:     Chanho Park <chanho61.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>
Date:   Mon, 22 Aug 2022 19:20:28 -0700
User-Agent: alot/0.10
Message-Id: <20220823022031.6FBEFC433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Chanho Park (2022-07-28 17:30:18)
> CMU_FSYS0 block provides clocks for PCIe Gen3 1 x 4Lanes and 2 x 2
> Lanes. Similarly, CMU_FSYS1 provides clocks for USB(2 x USB3.1 Gen-1,
> 2 x USB 2.0) and mmc. For MMC clocks, PLL_MMC(PLL0831X type) is also
> supported as a PLL source clock provider.

Is someone at Samsung going to pick up the Samsung clk driver patches
and send them as a PR? I didn't see anything last cycle.
