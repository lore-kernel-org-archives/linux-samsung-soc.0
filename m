Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84502C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 18:55:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 702B660FE8
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 18:55:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240328AbhJHS4w (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Oct 2021 14:56:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:43122 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239678AbhJHS4t (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 14:56:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 574C860FF2;
        Fri,  8 Oct 2021 18:54:53 +0000 (UTC)
From:   Mark Brown <broonie@sirena.org.uk>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: (subset) [PATCH v4 00/10] regulator/mfd/clock: dt-bindings: Samsung S2M and S5M to dtschema
Date:   Fri,  8 Oct 2021 19:54:51 +0100
Message-Id: <163371908503.2740027.18353767025813556778.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008113723.134648-1-krzysztof.kozlowski@canonical.com>
References: <20211008113723.134648-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Mark Brown <broonie@kernel.org>

On Fri, 8 Oct 2021 13:37:12 +0200, Krzysztof Kozlowski wrote:
> Changes since v2
> ================
> 1. Add Stephen's and Rob's tags.
> 2. Correct inb-supply description in patch 10/10.
> 
> Changes since v2
> ================
> 1. Add Rob's tags.
> 2. Remove "regulator-name" from properties (all regulator dtschema).
> 3. Move "unevaluatedProperties" higher to make code easier to read (all regulator dtschema).
> 4. Add ref-type to op-mode property (patch 6: s5m8767 regulators).
> 
> [...]

Applied, thanks!

[01/10] regulator: s5m8767: do not use reset value as DVS voltage if GPIO DVS is disabled
        commit: b16bef60a9112b1e6daf3afd16484eb06e7ce792
[02/10] regulator: dt-bindings: samsung,s5m8767: correct s5m8767,pmic-buck-default-dvs-idx property
        commit: a7fda04bc9b6ad9da8e19c9e6e3b1dab773d068a
[03/10] dt-bindings: clock: samsung,s2mps11: convert to dtschema
        commit: 1790cd3510cbd1f3f6217e5d9315f6dee369a690
[04/10] regulator: dt-bindings: samsung,s2m: convert to dtschema
        commit: ea98b9eba05ca01f9f6ef6f1ff74ec530884148a
[05/10] regulator: dt-bindings: samsung,s2mpa01: convert to dtschema
        commit: a52afb0f54faae0366575d47cbd85165ce34deda
[06/10] regulator: dt-bindings: samsung,s5m8767: convert to dtschema
        commit: fab58debc137f66cf97f60c8471ff2f1e3e1b44b

Best regards,
-- 
Mark Brown,,, <broonie@kernel.org>
