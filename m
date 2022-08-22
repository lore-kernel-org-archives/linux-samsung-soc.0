Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28704C28D13
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 22 Aug 2022 16:16:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235004AbiHVQQr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 22 Aug 2022 12:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234679AbiHVQQr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 12:16:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D49932A8D
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Aug 2022 09:16:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DC8C4611E1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Aug 2022 16:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DACB0C433D6;
        Mon, 22 Aug 2022 16:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661185005;
        bh=u35J4IpHSFEfh+GYLrukSlUjmHxOKq2CFdVZojhZiak=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=OGr4nayobT6fT8ydoU5LaYZCf1MEoWJVF9F9YmHC7hO56OMJpwx+AyNNt4o7KVqiF
         x57Bv/LtnMW8C7gcV3uqwyiZQweD07AZ7wmFX16zjILwaF2SxjU+JyZujFcAx18ztk
         d+bHBKHVw7FRlxhtTPIfdOvzlMORUUa+e5UbGkFksjve2vIQZB+N3wQdRErwYaQBcd
         EFcSDq9eB+QBQ4GxA4GTN+egSUCfTF8GlnpskD5pE3ehyWMhgsfpWFwAaE/j6o1ERd
         GwmqQo1kWXPESQ58hduyI2bEnAWtNrR2MX7s2O7eVsUvwu0Xhwj5TikzIAA9Vfenun
         uHln2YHXB2/Ww==
From:   Mark Brown <broonie@kernel.org>
To:     Jonathan Cameron <jic23@kernel.org>,
        linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220821160914.2207116-1-jic23@kernel.org>
References: <20220821160914.2207116-1-jic23@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: Use iio_get_channel_type() accessor.
Message-Id: <166118500362.214851.13933856221972874063.b4-ty@kernel.org>
Date:   Mon, 22 Aug 2022 17:16:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 21 Aug 2022 17:09:14 +0100, Jonathan Cameron wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> struct iio_chan_spec is meant to be opaque to IIO consumer drivers
> which should only use the interfaces in linux/iio/consumer.h.
> Use the provided accessor function to find get the type of the
> channel instead of directly reading it form the structure.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: samsung: Use iio_get_channel_type() accessor.
      commit: 94f072748337424c9cf92cd018532a34db3a5516

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
