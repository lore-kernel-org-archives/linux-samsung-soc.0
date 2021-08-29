Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04E8C4320A
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 29 Aug 2021 07:06:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9A1960F5B
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 29 Aug 2021 07:06:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234829AbhH2HHV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 29 Aug 2021 03:07:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:51978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234810AbhH2HHU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 29 Aug 2021 03:07:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0388360F4C;
        Sun, 29 Aug 2021 07:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630220789;
        bh=2RqJbChQ0v2jRUROwdxvWUne7fy7FozNZLNeBWnT7m4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kqDi4DXG79+6VoF4ZWgpiTJ6z0O2K6GlO6yy+mjG45ef+hf5M/g0HHK9mpxdcN7Qg
         khtkMHmFddzltrgDNfT4q/5VPeeL3CR/J4vYnY2KMzri3B3KjEgY9vzsPi2A0xZ9Si
         1YnA640mA2c/f9FQ88qiDseAgAsC7Ars5kWbGz47se4pDqTy54iIin0zE2EYmAN3ya
         PD/Ow0zOV95KZxbUIKuV+Gl56U5i23hk3XgCCwzYpB/s46u4pCHtZW2fQSs8xwvYu4
         Oj1hLwBXQH8Ynd4G6GiTVc2FPBoIppmRTDCWkhbWsty6iOHOxqwhXLRHhDiL3dG4zX
         go68gZ2HqEWSg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210825134056.219884-6-krzysztof.kozlowski@canonical.com>
References: <20210825134056.219884-1-krzysztof.kozlowski@canonical.com> <20210825134056.219884-6-krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v3 5/8] dt-bindings: clock: samsung: convert Exynos4 to dtschema
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Date:   Sun, 29 Aug 2021 00:06:27 -0700
Message-ID: <163022078791.2676726.4297885519449467655@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Krzysztof Kozlowski (2021-08-25 06:40:53)
> Merge Exynos4210 and Exynos4412 clock controller bindings to existing DT
> schema.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Applied to clk-next
