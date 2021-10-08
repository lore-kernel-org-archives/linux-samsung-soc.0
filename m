Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D635C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 01:00:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F28456109F
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 01:00:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbhJHBCf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Oct 2021 21:02:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:38176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229487AbhJHBCe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 21:02:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 582F76105A;
        Fri,  8 Oct 2021 01:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633654840;
        bh=D+XA5fuEc0s9newVeuhTo1y7PECcDXZC5n/B6YKr7ro=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=eYuXRcqsCMSwer/fIppi90eCe9539s9nqhMEjG4QF08jJQeM951v54+xsFoSUXWf5
         09GPKKK5l0ECqQHs3wcK4WOv4Bl40YxIy/kX7pgE1BL/aV1cRqGK6WSotcbHCIqNqx
         wYXxG5H7zPPJ8SH4Uq0wal3CV3fvKv++btyuTXjRQmqZ5HOQU9qTW/Ux6qwiOTSbUM
         S0hWqdBmenAAy8w+wtM9hx0z32WOMAs1pBRA46S7Ba6REG+9u7reB6kNiJ9OcHldkd
         SGu57cAQgcLM8wGeBJ2UguZzd5NM0B7DCezpBBmp8BAly8VteG3b52UjuGtlihgYNy
         vAhKYooKFnByg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211001094106.52412-4-krzysztof.kozlowski@canonical.com>
References: <20211001094106.52412-1-krzysztof.kozlowski@canonical.com> <20211001094106.52412-4-krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v2 03/10] dt-bindings: clock: samsung,s2mps11: convert to dtschema
From:   Stephen Boyd <sboyd@kernel.org>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Date:   Thu, 07 Oct 2021 18:00:39 -0700
Message-ID: <163365483901.2041162.15481041802463999867@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Krzysztof Kozlowski (2021-10-01 02:40:59)
> Convert the clock provider of Samsung S2MPS11 family of PMICs to DT
> schema format.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
