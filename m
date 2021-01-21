Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5FBC433DB
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Jan 2021 19:43:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1189F23A5F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Jan 2021 19:43:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727425AbhAUTnF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Jan 2021 14:43:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:47274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726374AbhAUTmT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Jan 2021 14:42:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC1CD23A5C;
        Thu, 21 Jan 2021 19:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611258087;
        bh=mU37xmaWVsYmEyXUA/R0/Rg9UFy1EWNpO+H9A0Xrad8=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=GworRcHB2aPCq59uEq9X24TIJVieY7eoe70t/N9h9AN8ErV5J6xq2ts4vNHxemVVw
         gJwTD2P7HgP8RSKsb3/YpUEGPWIBXEolwXsvnENF/aVU9XaPtTP+5msZ0Lxavhtpn8
         525oCnnLD0Hy6d1qU2PDdD+9pjG2r0mSsZ66vOlDJx3BmNuYyzEFYw6WLyZpfwRsyR
         gpRp2wCNhzAsK8bkdfj36DXUDWBe72ECc////H0SmSpiVl1UG4+gWSNKtmeaY8lvem
         L9Fa9/sk+I767dbPTeyn0gAu+az6/5cM2Us5FB/FkPlvfNZdScwLQgHqc5SZT5+u+W
         z89KXZiXJT8rw==
From:   Mark Brown <broonie@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Pan Bian <bianpan2016@163.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20210121032756.49501-1-bianpan2016@163.com>
References: <20210121032756.49501-1-bianpan2016@163.com>
Subject: Re: [PATCH] regulator: s5m8767: Fix reference count leak
Message-Id: <161125803282.35944.8538521264425095601.b4-ty@kernel.org>
Date:   Thu, 21 Jan 2021 19:40:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 20 Jan 2021 19:27:56 -0800, Pan Bian wrote:
> Call of_node_put() to drop references of regulators_np and reg_np before
> returning error code.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: s5m8767: Fix reference count leak
      commit: dea6dd2ba63f8c8532addb8f32daf7b89a368a42

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
