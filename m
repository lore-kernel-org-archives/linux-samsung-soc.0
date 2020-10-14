Return-Path: <SRS0=VGRb=DV=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48942C433E7
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Oct 2020 02:44:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF8CB21D81
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Oct 2020 02:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602643449;
	bh=SuJHrGeZzuy4zfE9LXRV6ODeI+7nUL3zjWs/yY99/OE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=CMu48FCTgcxQQ2qLmn9DbTwJcVLVlLI5XdGHKN9WIKqiZRFjJB/YeHtxqu1bGeYEV
	 buRmxYNOEMhf9q1OcYPA3zPKY8GSRSn5oCnT5vrQIAemOyp9/RL2g3/b4CFsLk+Xaj
	 ZluhHE/m+a3mOxwVNcpNz5FgZqcW0yYSoOSlMr44=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbgJNCoI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 13 Oct 2020 22:44:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:36870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725899AbgJNCoI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 13 Oct 2020 22:44:08 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A4F2021775;
        Wed, 14 Oct 2020 02:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602643447;
        bh=SuJHrGeZzuy4zfE9LXRV6ODeI+7nUL3zjWs/yY99/OE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Bubu46TqeADxnXG6bvtsoblzj2+v1Gf9W2cN1b35M58qV46DpMJm0iRrzG6DPzdMI
         ZkSqpNp9Bo19WGDTaGbLmEIjHtt5UUJQjgpgoyKwuAN6M70eaatc1vnAyEfICWOA2R
         uLrvKVupPScSslCUBNfP7b4kYC0mSLmuYWM3No9A=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201001165646.32279-2-krzk@kernel.org>
References: <20201001165646.32279-1-krzk@kernel.org> <20201001165646.32279-2-krzk@kernel.org>
Subject: Re: [PATCH 1/2] soc: samsung: exynos-pmu: instantiate clkout driver as MFD
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Date:   Tue, 13 Oct 2020 19:44:06 -0700
Message-ID: <160264344632.310579.1638354846177491444@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Krzysztof Kozlowski (2020-10-01 09:56:45)
> The Exynos clock output (clkout) driver uses same register address space
> (Power Management Unit address space) as Exynos PMU driver and same set
> of compatibles.  It was modeled as clock provider instantiated with
> CLK_OF_DECLARE_DRIVE().
>=20
> This however brings ordering problems and lack of probe deferral,
> therefore clkout driver should be converted to a regular module and
> instantiated as a child of PMU driver to be able to use existing
> compatibles and address space.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
