Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4364AC74A44
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 11 Mar 2023 21:17:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbjCKVRW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 11 Mar 2023 16:17:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbjCKVRU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 11 Mar 2023 16:17:20 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C29D472B2D;
        Sat, 11 Mar 2023 13:17:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 793E4B80B48;
        Sat, 11 Mar 2023 21:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F00D9C433AA;
        Sat, 11 Mar 2023 21:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678569434;
        bh=i58cMUcvV9SN6nc+tdaBI+yzBZU613bAQW0ASuRfHX4=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=M+5X/sSJ5WYKnPpqpHUJFpubp2RC6c968SZFzZMS4FtG9cMxyFnYoB/dO1uZ1cQD2
         bSJH43QscrPvFc8X37Z5BcIFIoBKs6Z+xqqLbMDNcaIkdQZtIk+Vt0XObLRdzKWjrw
         +lm+JmLfSKmFBY+L8fzYR9lUx1TA26wEWu0KJcjy/X5wKTyoDfgciBTLPSJzkdKMwa
         1TKsivXT6VzSP9nIiwVdNPSHMZmVv4MGA/Ouc0T9OotGHn0BzQAOILPPH3vq6rcAhP
         knwuft6plloDSeYGrWIVEonaJODNoGiL3gl77RiZAPJnD0bMWt3deYIKjbMhdkYJSg
         YGOmFERpj00sg==
From:   Mark Brown <broonie@kernel.org>
To:     linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311170516.178913-1-andi.shyti@kernel.org>
References: <20230311170516.178913-1-andi.shyti@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: update Andi's e-mail to @kernel.org
Message-Id: <167856943148.964268.7581454997931747608.b4-ty@kernel.org>
Date:   Sat, 11 Mar 2023 21:17:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 11 Mar 2023 18:05:16 +0100, Andi Shyti wrote:
> Use the kernel.org e-mail for the maintainer entry
> 
> 

Applied to

   broonie/spi.git for-next

Thanks!

[1/1] MAINTAINERS: update Andi's e-mail to @kernel.org
      commit: 5d1f9ac1e3b57b3a8d7cf317153cc5d8600be33a

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

