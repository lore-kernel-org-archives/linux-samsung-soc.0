Return-Path: <SRS0=odV2=C7=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E2DC2D0E2
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Sep 2020 19:31:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D1E323787
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Sep 2020 19:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600803068;
	bh=pUiCqpmiBnRvZTY0i20SbClpoG81rlDX6FiAvbNu0nE=;
	h=In-Reply-To:References:Subject:From:To:Date:List-ID:From;
	b=ZzVMkFdvmjhEsA/a9WmqS6jV7pbksbx+zjwOyCoaUeSLO8lHcbErI0mCFV3sRkh/r
	 RNRAyygKq8gky5GGogHRu1zFbir1d4e3MuEAUxrAfNTV/ttJ4VioIHi9rnaVVnpHbo
	 RV18Urj3Hc2MMkn901RrFLuU4XWWsnhFj9KLYl7g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgIVTbI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 22 Sep 2020 15:31:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:42720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726448AbgIVTbH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Sep 2020 15:31:07 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6B42A207C3;
        Tue, 22 Sep 2020 19:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600803067;
        bh=pUiCqpmiBnRvZTY0i20SbClpoG81rlDX6FiAvbNu0nE=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=j/z7ht+1QBbUKmw3c/u9O6AtMG5CIGvilLgZEAoROraBxzS1gtOhW6sytjv6VGdyz
         +QZGiu25JgKnJMbgwqkHhDoy9bwvmlU6qsqt47OunRQC6TdVdLdwwUfJkKazkIJjqe
         oRNWPs9FWyP1E9ufODhdjweO94LZy1mgzrFz8TPY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200921203558.19554-1-krzk@kernel.org>
References: <20200921203558.19554-1-krzk@kernel.org>
Subject: Re: [PATCH] clk: s2mps11: initialize driver via module_platform_driver
From:   Stephen Boyd <sboyd@kernel.org>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sangbeom Kim <sbkim73@samsung.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Date:   Tue, 22 Sep 2020 12:31:06 -0700
Message-ID: <160080306613.310579.7180322224684096553@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Krzysztof Kozlowski (2020-09-21 13:35:57)
> The driver was using subsys_initcall() because in old times deferred
> probe was not supported everywhere and specific ordering was needed.
> Since probe deferral works fine and specific ordering is discouraged
> (hides dependencies between drivers and couples their boot order), the
> driver can be converted to regular module_platform_driver.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Applied to clk-next
