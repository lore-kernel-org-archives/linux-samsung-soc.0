Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630A8C433DB
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Jan 2021 19:43:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25DCB23A56
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Jan 2021 19:43:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbhAUTmn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Jan 2021 14:42:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:47112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726802AbhAUTmT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Jan 2021 14:42:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A53A823A3A;
        Thu, 21 Jan 2021 19:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611258071;
        bh=IbLWzH/iOhLsKIux1Zif0jmq0CGDxzFYvlX77B3nwu8=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=ghDlBtltbE7YvyOHCs9FmanZsL/lhysjQ4Me4sqydh00FMjgjC0ZTfdFqXVRT3E2v
         Xc9u1vNr/C5x/NjF0q8DwK9yfqaf6HqbANhsUURaZQwVXatLbubGcbuWKZrtF88dt5
         L77IZDR/r3nEE0d/Ixmo2dsOPBERcJc4Ii9w3YJp5DghRWZaftPL1veNYsMhpeeoaq
         qW17gfAfwwB7q1xlMCIrdk5XlDmmrSHHNQFQ7Qfd1qdN1H2b3mDvPj3FlJlz4zPmOq
         obSlVvCvpQnqmFCbdqQNq/FfOGEo2wHEHj4apO7L8/5lXwVsu1pZzMDHfhkCuIXq3J
         YaDzov7zingZw==
From:   Mark Brown <broonie@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Pan Bian <bianpan2016@163.com>
In-Reply-To: <20210121155914.48034-1-krzk@kernel.org>
References: <20210121155914.48034-1-krzk@kernel.org>
Subject: Re: [PATCH] regulator: s5m8767: Drop regulators OF node reference
Message-Id: <161125803282.35944.14669065064148445723.b4-ty@kernel.org>
Date:   Thu, 21 Jan 2021 19:40:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 21 Jan 2021 16:59:14 +0100, Krzysztof Kozlowski wrote:
> The device node reference obtained with of_get_child_by_name() should be
> dropped on error paths.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: s5m8767: Drop regulators OF node reference
      commit: a5872bd3398d0ff2ce4c77794bc7837899c69024

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
