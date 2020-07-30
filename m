Return-Path: <SRS0=WO5W=BJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 951F9C433DF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 30 Jul 2020 22:28:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 649CF2083B
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 30 Jul 2020 22:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596148125;
	bh=mm8J/i6ZSAlgRjsL3uPXnNjYT5qwNb3j2lHa5rHt1qw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-ID:From;
	b=i38VEE3d3H0JAfZ6RPzGG1/5sRgltjqbGtPjmfRAP7sLJExihKTT26fCohob8FRnO
	 FDXcOuseLSKkNsFPgYoKTTZgmAib/cWYPtQ6J/wzwqaYycNT7j+LI0JnM3STgHm0Fo
	 T8zaidkQeZHfTijz5IQ4ELUbbnHSo1jWz2zizgrg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730609AbgG3W2n (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 30 Jul 2020 18:28:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:40908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728731AbgG3W2n (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Jul 2020 18:28:43 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 037F320829;
        Thu, 30 Jul 2020 22:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596148122;
        bh=mm8J/i6ZSAlgRjsL3uPXnNjYT5qwNb3j2lHa5rHt1qw=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=Uweg23OatF1tL9LWUhp6srSCrbhLnO5s3KtqUHVPPR4yX39LrtXPmeC5wemWS/eKP
         HFGASlrbrs3jgFcIbcHDxmagFih0ANByQ5bbE8QjZhIDC8APJiV0h8ZWaMpKKC6CSa
         VlKeBzw9u94Yoc1b4eq59TimGrUP9JOumINjoa9E=
Date:   Thu, 30 Jul 2020 23:28:22 +0100
From:   Mark Brown <broonie@kernel.org>
To:     krzk@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     b.zolnierkie@samsung.com, devicetree@vger.kernel.org,
        simon@lineageos.org, alsa-devel@alsa-project.org,
        linux-samsung-soc@vger.kernel.org, robh+dt@kernel.org,
        m.szyprowski@samsung.com
In-Reply-To: <20200728131111.14334-1-s.nawrocki@samsung.com>
References: <CGME20200728131126eucas1p16365622c52f91104373a2cd3e0ebb619@eucas1p1.samsung.com> <20200728131111.14334-1-s.nawrocki@samsung.com>
Subject: Re: [PATCH v3 1/3] ASoC: samsung: Document DT bindings for Midas sound subsystem
Message-Id: <159614804534.1473.10836514117836508755.b4-ty@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 28 Jul 2020 15:11:09 +0200, Sylwester Nawrocki wrote:
> This patch adds documentation of DT biding for the Midas sound complex.
> Partially based on the *txt version by Simon Shields <simon@lineageos.org>.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: samsung: Document DT bindings for Midas sound subsystem
      commit: f61d06ae99468e3f02b8af4b464945290c0cf2cc
[2/2] ASoC: samsung: Add sound support for Midas boards
      commit: fd0ea9cd9698edd8e9dab7dfe86163d00897b000

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
