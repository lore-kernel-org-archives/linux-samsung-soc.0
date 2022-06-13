Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF5BC43334
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Jun 2022 19:06:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347938AbiFMTGv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Jun 2022 15:06:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347945AbiFMTGm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Jun 2022 15:06:42 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89A19C5E71
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jun 2022 10:01:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 41925CE13FD
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jun 2022 17:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078CDC34114;
        Mon, 13 Jun 2022 17:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655139710;
        bh=zH7DwkKRGFFZLBmAteDlsCQw8yPj/w0q9YqYHZgyiVA=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=bkjewIXiUaJie2/EFRI2Y6+WB0SV1vS+n59R8pKdxGZaIjTc2Zkr5uclzJWcg1tFu
         Hx7hvnEr8mGj3M/GTIgQAE0y8tGzsSEQHYXNZLoHPlr845yaC0jHwBWLyTHvDz4rFe
         +ss1xm/nAdObcdxocEjm2LorKEpdlFjeeEOpDugA7sdt13DkDxbaA+pV4Dp8r3mPcq
         n4DPLGyOxwKjaUYp834Om6WsBCnuSoUsCPejZwTrG0ALwOc23P/aYug+kjBExpzCtY
         cw238838J/TPZsu5YwDO2n4nLgpmQKdXIbiTusuSNgifO2xH82OYNbaimjMCmpk5K0
         eKHk2TnY291Jw==
From:   Mark Brown <broonie@kernel.org>
To:     andrzej.hajda@intel.com, airlied@linux.ie,
        kyungmin.park@samsung.com, jy0922.shim@samsung.com,
        narmstrong@baylibre.com, linux@armlinux.org.uk,
        robert.foss@linaro.org, daniel@ffwll.ch, alim.akhtar@samsung.com,
        lgirdwood@gmail.com, inki.dae@samsung.com, broonie@kernel.org,
        sw0312.kim@samsung.com
Cc:     jonas@kwiboo.se, dri-devel@lists.freedesktop.org,
        linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org,
        jernej.skrabec@gmail.com, Laurent.pinchart@ideasonboard.com
In-Reply-To: <20220602103029.3498791-1-broonie@kernel.org>
References: <20220602103029.3498791-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: hdmi-codec: Update to modern DAI terminology
Message-Id: <165513970673.636966.9826730904967146178.b4-ty@kernel.org>
Date:   Mon, 13 Jun 2022 18:01:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 2 Jun 2022 12:30:29 +0200, Mark Brown wrote:
> As part of retiring the old defines used to specify DAI formats update the
> hdmi_codec driver to use the modern names, including the variables in the
> struct hdmi_codec_daifmt exported to the DRM drivers.
> 
> In updating this I did note that the only use of this information in DRM
> drivers is to reject clock provider settings, thinking about what this
> hardware is doing I rather suspect that there might not be any hardware
> out there which needs the configuration so it may be worth considering
> just having hdmi-codec support only clock consumer.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdmi-codec: Update to modern DAI terminology
      commit: 9f1c8677724a0e6a6ac7a74d2b0192a584df859d

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
