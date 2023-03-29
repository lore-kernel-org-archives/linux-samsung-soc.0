Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE52C6FD18
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Mar 2023 02:38:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbjC2CiK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Mar 2023 22:38:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjC2CiJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Mar 2023 22:38:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C29103AA6;
        Tue, 28 Mar 2023 19:37:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ECF1661A3F;
        Wed, 29 Mar 2023 02:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50CD7C433D2;
        Wed, 29 Mar 2023 02:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680057470;
        bh=1RFsG6x8eZ36wYfC6N47RWuv4Mkbp0c4c/ba7d+2ep4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lnnk8/YZYqFEFWLi0lWET0x+O6KjLcQHhoqrLiA/WNJ7Y8EGyc7Mf77RLxJtztXeH
         g6ErWEg4iZcwKX5rsT+6IgEGi6DqZ8WZJsrFh0VPAznmI3Jm9mofOxQSqehEzIVnaO
         3ZlaASYCDIAaoJO5zANHTDyfwlIVDIXeteEQwr0+FuvqnE+ddrMLXAamPRnIKBCHdy
         VI6z6OEly7oWSCcjg01O0WSEOit2vf8CUubIC0fmojJi3z60rblKMpBWGE9s04EogD
         94YpbL4Dma/SUyzyQl5VdWUg17iv0+HLxtU1I97muYHP000rf0ccKNmy/Jr7wdPRf1
         vFG29d7AWfLGQ==
Message-ID: <3e542c589fbd57848205a15139457a98.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230312161512.2715500-15-u.kleine-koenig@pengutronix.de>
References: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de> <20230312161512.2715500-15-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 14/30] clk: s2mps11: Convert to platform remove callback returning void
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Tue, 28 Mar 2023 19:37:48 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2023-03-12 09:14:56)
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied to clk-next
