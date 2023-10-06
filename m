Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D34E92FFB
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Oct 2023 09:28:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231331AbjJFJ2a (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Oct 2023 05:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231171AbjJFJ23 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Oct 2023 05:28:29 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E2D09E
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Oct 2023 02:28:28 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9adca291f99so329815566b.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Oct 2023 02:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696584507; x=1697189307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9oMQ4sfKITrqglJ7HukYbUVCwdr/XxwFy7LQhh9sK4U=;
        b=x23K7KJDCK/cfTMfdwdcBzxzSK6qzMv/CxjbkuTxng4xjKDsD8uWm3ZKR+0843Ea80
         i17OU35hpIcwWU5zgmMKCTtPoSZNASUV6c65QOIUozLYs4Jo2DSJSShrnRyrsRCgR8wv
         4Ltr/JnuJd0w6iBNopmVvXFE2eybCyXxtuIQY+pFlvuT6Ffs8IW+HfYpaYJKIoz7rJ4d
         /IutEMST2seJA7J9UqS3Cjgd9nH1d5bIvZYAGntvdPp3CfMPRT4FZldjClntqRplFQVv
         lgV1Q9fYcxQkDakqBn1rW1fZQ5O5kuCvf6g7xQvpRBQoXkiLPg/ZKYuyXwlwH0lFRCOR
         nvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696584507; x=1697189307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9oMQ4sfKITrqglJ7HukYbUVCwdr/XxwFy7LQhh9sK4U=;
        b=jIGqi7Z/pfi5ayq0L5TZl6KJK3PeaA/j9QDEpKy8vlPq5YKCa37SLVJQLR/wtjZI7H
         adqCYy+rIpx507YzsOU6HoO2mllLSgZbIbGH435kh4B2MHC9vyGgH+7CrSE7OLfqEhfN
         RQ8zwFtUg7lXJ9crZKgMYMHozMVG3NRovf3THCaRucm2VBoM4w2kNFLOrHFCdX+VVDx/
         Dm9kwCeEAJJgWM3hjH7JhDlKWX4USOsJeMAu74JpUzTMz2jKTHgo/NS5V0U9XdNuBPdi
         uvEEGkTulXVZkQhzWVXhKsREPyNRQZkJHkVx33faC47i6zopl7VEkHDypS3Z8rOelIJN
         RZiQ==
X-Gm-Message-State: AOJu0Yyknlns6afa6OvGtJeYEINGp+wehrKIDdByvo/PxDfScJPifKKg
        IuU9sSwcpcJW7SGa2BNaurK1MQoWMBsSDxWpkNM=
X-Google-Smtp-Source: AGHT+IGpxsusnlFnvTn4ZM0ktTcxxo0I0Dt559z6iS7MDTS1MwPqy0hAbGZ+L98X7zoY9l/NctcgWw==
X-Received: by 2002:a17:906:1097:b0:9ad:be8a:a588 with SMTP id u23-20020a170906109700b009adbe8aa588mr6450602eju.1.1696584506696;
        Fri, 06 Oct 2023 02:28:26 -0700 (PDT)
Received: from krzk-bin.. (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id u25-20020a1709063b9900b0099bc2d1429csm2573006ejf.72.2023.10.06.02.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 02:28:26 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] arm64: dts: minor cleanup for v6.7
Date:   Fri,  6 Oct 2023 11:28:22 +0200
Message-Id: <20231006092823.94839-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Few patches which were acked by maintainers or slipped through the cracks.

Best regards,
Krzysztof


The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.7

for you to fetch changes up to 12ca3ca8cf06d803b3690ef523ccf5ffd0b23a71:

  arm64: dts: marvell: minor whitespace cleanup around '=' (2023-09-24 20:56:14 +0200)

----------------------------------------------------------------
Minor improvements in ARM64 DTS for v6.7

Few cleanups and improvements: use lowercase hex for unit addresses
(Bitmain), add missing spaces before '{' (APM, MediaTek) and cleanup
whitespace around '=' (MediaTek, Marvell).

----------------------------------------------------------------
Krzysztof Kozlowski (5):
      arm64: dts: bitmain: lowercase unit addresses
      arm64: dts: apm: add missing space before {
      arm64: dts: mediatek: add missing space before {
      arm64: dts: mediatek: minor whitespace cleanup around '='
      arm64: dts: marvell: minor whitespace cleanup around '='

 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi         |  2 +-
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |  2 +-
 arch/arm64/boot/dts/bitmain/bm1880.dtsi            |  6 +--
 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi      |  4 +-
 .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts  |  6 +--
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts       |  6 +--
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts        | 48 +++++++++++-----------
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     | 12 +++---
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    | 12 +++---
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts       |  2 +-
 10 files changed, 50 insertions(+), 50 deletions(-)
