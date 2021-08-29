Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76775C432BE
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 29 Aug 2021 07:08:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B24260F5C
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 29 Aug 2021 07:08:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234790AbhH2HJc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 29 Aug 2021 03:09:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:52906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234777AbhH2HJb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 29 Aug 2021 03:09:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC9C2601FD;
        Sun, 29 Aug 2021 07:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630220919;
        bh=0/EAkFZjZJHLqx7U69lZrBnoNuaxpFrT10kfScOdsUk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KiekGfE2FZ0EnVLZgMAMpqQn3Wn7qaVz7f/Uuyt+Gc4VZa2TRff8Ff5YaHI4d9Rlm
         uXWhBYU2PiiL0r+I1CAykhOAbrDvT5uOrMQhS9p/vl3MQVykewrryoYz91CPIYY793
         Km/Yx8btrVliH2mgQcC4iIen0tTwX8lKZoBv1jR/kM5HIK57kNn/cLgkWUDxM16WsM
         q++6F4oGxYCjVVO8t+Ij7IQDqxT6iUM+tJYOCegrdjdVyxp/DlSuWs8cpyk35Xc15b
         8RQCoY9qeTcmxQCaohF5OKRk4MeWd3+8v0zOUPGA39o9FSx9ziGZRMhLmY3BtdQIG9
         vzmRNOFwkd70g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210825134251.220098-3-krzysztof.kozlowski@canonical.com>
References: <20210825134056.219884-6-krzysztof.kozlowski@canonical.com> <20210825134251.220098-3-krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v3 8/8] MAINTAINERS: clock: include S3C and S5P in Samsung SoC clock entry
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
Date:   Sun, 29 Aug 2021 00:08:38 -0700
Message-ID: <163022091855.2676726.10244708006623939894@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Krzysztof Kozlowski (2021-08-25 06:42:51)
> Cover the S3C and S5Pv210 clock controller binding headers by Samsung
> SoC clock controller drivers maintainer entry.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---

Applied to clk-next
