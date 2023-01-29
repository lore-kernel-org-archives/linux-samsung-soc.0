Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA00C61D97
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 29 Jan 2023 14:45:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232422AbjA2Opc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 29 Jan 2023 09:45:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbjA2Opb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 29 Jan 2023 09:45:31 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF5815C8F
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Jan 2023 06:45:29 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso6520338wms.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Jan 2023 06:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L3+adTROaQB+gYcBuJMg8idTi/GfFjWlX30uDggGK3g=;
        b=yJxkCDePAZSNSiIp6Ms3j0H9NQgCYu0j0f/BHOuZ1GzoQUXsOC1ppbl7Cmtiznrzx/
         wA0MYkuEXDU68p1lIApL1j6GWw1IbUlUelnXiHdEZl/lnRF6Eo0qTQL0Wy9RcHt0sJI+
         xMx5F+lGstj/0SBWuyNU2iTvHhI/+EEjCrSY3CieBUsYJdjHMbYe7AwPuXTZDJjjA5cr
         SM1WlRgwnnz42D9K30xYafCa+rhT7s8Q6MePm3fEUaq49Lf8kRbM3bIKwXgA9TWcAhhW
         4MKQGgKoeJtVOMo3al7o4fqVP22O4z5AmRL4oxZSq/gl27QYbnxIIb/18kr4wkcH+fOX
         KH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L3+adTROaQB+gYcBuJMg8idTi/GfFjWlX30uDggGK3g=;
        b=1rJamODtipCUvx35488/wYblhjXY+C8bFGTy6EWgBpftbgnCBut+u1R4UdRcsJ3dmB
         JJB5wralO5wNAxh0h+HzFFgYUAgM+11ewCADKysbVUQDvCoy13kfIAl0ILL791PPadmI
         ibShEJTR9efzJ5F2VLPR3uxihnRanqzl0TTLfhuwxRi5YQqKPTE8FHhGUpeh7cVFuAwC
         RWdvAgonEVcHQFpJql3p+ONnkPCA9fYmR2yUj29d1qMNthwmkQJH3H53msqtsOSyXpCf
         PGlK24YKNF0Q0w/tnPoV/xo0X2xP4jvrsTeZCjrYg9/gERuy2qMWudoJgM8mzOT2s/Ri
         8Tdw==
X-Gm-Message-State: AO0yUKVjfcMJInM3f9xblZweGMYaXWCzj4eNipedU6Jc25IBFpRqG1AB
        RkOuxtpXlCuiBMmDUrCNQ1IdcQ==
X-Google-Smtp-Source: AK7set+Sx3rrx+oc+SUEi1ahvM+ewtnnrVP7wTBDdd9hcsB+U6I5HSbLvhQ0mvSzwuidc+pojB60Yg==
X-Received: by 2002:a05:600c:188a:b0:3dc:506e:6559 with SMTP id x10-20020a05600c188a00b003dc506e6559mr4061076wmp.37.1675003528361;
        Sun, 29 Jan 2023 06:45:28 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m14-20020a05600c4f4e00b003a3442f1229sm14950038wmq.29.2023.01.29.06.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 06:45:27 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] arm64: dts: cleanup for v6.3, part two
Date:   Sun, 29 Jan 2023 15:45:24 +0100
Message-Id: <20230129144525.5802-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Cleanup of several platforms, not picked up by maintainers. On top of previous
pull request.

Best regards,
Krzysztof


The following changes since commit d0931f1d5e9c1655cfa8128edd14e813b4044801:

  arm64: dts: hisilicon: align LED node names with dtschema (2023-01-13 11:38:56 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.3-2

for you to fetch changes up to 9f2c9170934eace462499ba0bfe042cc72900173:

  arm64: dts: amd: use "okay" for status (2023-01-28 11:16:00 +0100)

----------------------------------------------------------------
Minor improvements in ARM64 DTS for v6.3, part two

1. Drop deprecated "device_type" property from serial nodes (apm,
   amazon).
2. Align UART node names and OPP table names with bindings (hisilicon,
   realtek, synaptics).
3. Use "okay" for status, as expected by Devicetree specification and
   dtschema.

----------------------------------------------------------------
Krzysztof Kozlowski (8):
      arm64: dts: apm: drop deprecated serial device_type
      arm64: dts: amazon: drop deprecated serial device_type
      arm64: dts: realtek: align UART node name with bindings
      arm64: dts: hisilicon: align UART node name with bindings
      arm64: dts: synaptics: align UART node name with bindings
      arm64: dts: microchip: use "okay" for status
      arm64: dts: apm: use "okay" for status
      arm64: dts: amd: use "okay" for status

 arch/arm64/boot/dts/amazon/alpine-v2.dtsi          |  4 ----
 arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts   | 16 +++++++--------
 arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts   | 24 +++++++++++-----------
 arch/arm64/boot/dts/apm/apm-merlin.dts             | 16 +++++++--------
 arch/arm64/boot/dts/apm/apm-mustang.dts            | 16 +++++++--------
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi         |  1 -
 arch/arm64/boot/dts/apm/apm-storm.dtsi             | 16 ++++++---------
 arch/arm64/boot/dts/hisilicon/hip07.dtsi           |  2 +-
 .../boot/dts/microchip/sparx5_pcb134_board.dtsi    |  2 +-
 .../boot/dts/microchip/sparx5_pcb135_board.dtsi    |  6 +++---
 arch/arm64/boot/dts/realtek/rtd16xx.dtsi           |  6 +++---
 arch/arm64/boot/dts/synaptics/berlin4ct.dtsi       |  2 +-
 12 files changed, 51 insertions(+), 60 deletions(-)
