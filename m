Return-Path: <SRS0=VGRb=DV=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C13A1C433E7
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Oct 2020 02:43:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 761AA22202
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Oct 2020 02:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602643423;
	bh=UWEJk82Cdbiv30DvTjPsPNZGzD+7d86evQl7VsGfmuY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=1W873QfSGQtF8v4MeKQP+vKdj8NDzjKQt764Y0qlib4UDY086p+NWrBhKCIQ6Q8GE
	 +Lg24sEvVbufFfYy31F3HLPqcGopjBcIA7ZB5nTYmm099Swtrfn/1ZfenA22L9ZAK0
	 2ftiiPywLowh3JY7OangjJn1UPPwYDiSTmB57pik=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgJNCnm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 13 Oct 2020 22:43:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:36626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725899AbgJNCnm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 13 Oct 2020 22:43:42 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2178221775;
        Wed, 14 Oct 2020 02:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602643422;
        bh=UWEJk82Cdbiv30DvTjPsPNZGzD+7d86evQl7VsGfmuY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ogRWYKh+ENCQGLilusGcgXCaz1Rsb1GCofihg7UkjNuGai+Ugl6IpflPFAlX0jXIm
         6vb299IC15HXM92Rz9wwYpI4KVZe9ZxbRPQOGwgtpI81S5I3P/+fMtIpX3uHGUp06b
         VQGgvHHDqVKWtCDu1WhCckyEPVnwpoXdsAX7+wS8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201001165646.32279-3-krzk@kernel.org>
References: <20201001165646.32279-1-krzk@kernel.org> <20201001165646.32279-3-krzk@kernel.org>
Subject: Re: [PATCH 2/2] clk: samsung: exynos-clkout: convert to module driver
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
Date:   Tue, 13 Oct 2020 19:43:40 -0700
Message-ID: <160264342071.310579.16332243912081691987@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Krzysztof Kozlowski (2020-10-01 09:56:46)
> diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsun=
g/clk-exynos-clkout.c
> index 34ccb1d23bc3..68af082d4716 100644
> --- a/drivers/clk/samsung/clk-exynos-clkout.c
> +++ b/drivers/clk/samsung/clk-exynos-clkout.c
> @@ -28,41 +31,103 @@ struct exynos_clkout {
[...]
> +       if (!match) {
> +               dev_err(dev, "cannot match parent device\n");
> +               return -EINVAL;
> +       }
> +       variant =3D match->data;
> +
> +       *mux_mask =3D variant->mux_mask;
> +       dev_err(dev, "MATCH: %x\n", variant->mux_mask);

Is this a debug print?

> +
> +       return 0;
> +}
>
