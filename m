Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C336CC636CB
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 28 Jan 2023 20:47:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231492AbjA1Ur1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 28 Jan 2023 15:47:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233616AbjA1UrZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 28 Jan 2023 15:47:25 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 867622365D;
        Sat, 28 Jan 2023 12:47:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0C7AC60B50;
        Sat, 28 Jan 2023 20:47:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC846C433EF;
        Sat, 28 Jan 2023 20:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674938843;
        bh=LP8XV5leUFloxRKoGf3LU+y6bB6y8P4RvPXOS2KTx+Y=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=UriQreCBRdvXQ0Y/aFqUAt1x5iB8tvqnb3zyi2mhG5WjXUZ8AzLzuAqzO3uKQVxPO
         jqGUdAr/p/rFbrvHBm7CUyDNA2ysGmemMtQfJo6n/MOvOIZWgtCJANN6KhLiKl4dZW
         U8bj2eF4Hd7JhCH8FkYy1pRBZSR9ivJzymWEiJPt/9VFnToRdfJ2uQW5gjDLZhg1Xg
         FX7TDchEF5IDTdBKwzn90+ysyYwjQfvp/TjWS3X6drcfYBFHJq5eE998wT0Ii5m13x
         qj10vd41scdkOg7hfthgTtDB+k9igJTk8mRyzQzNh/L9roHZuUZHEmAxx5VscTblf/
         ZGc3TrLZaG/LA==
From:   Mark Brown <broonie@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Kees Cook <keescook@chromium.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
In-Reply-To: <20230128005358.never.313-kees@kernel.org>
References: <20230128005358.never.313-kees@kernel.org>
Subject: Re: [PATCH] regulator: s5m8767: Bounds check id indexing into
 arrays
Message-Id: <167493884134.2529563.8166230650067316693.b4-ty@kernel.org>
Date:   Sat, 28 Jan 2023 20:47:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 27 Jan 2023 16:53:58 -0800, Kees Cook wrote:
> The compiler has no way to know if "id" is within the array bounds of
> the regulators array. Add a check for this and a build-time check that
> the regulators and reg_voltage_map arrays are sized the same. Seen with
> GCC 13:
> 
> ../drivers/regulator/s5m8767.c: In function 's5m8767_pmic_probe':
> ../drivers/regulator/s5m8767.c:936:35: warning: array subscript [0, 36] is outside array bounds of 'struct regulator_desc[37]' [-Warray-bounds=]
>   936 |                         regulators[id].vsel_reg =
>       |                         ~~~~~~~~~~^~~~
> 
> [...]

Applied to

   broonie/regulator.git for-next

Thanks!

[1/1] regulator: s5m8767: Bounds check id indexing into arrays
      commit: e314e15a0b58f9d051c00b25951073bcdae61953

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

