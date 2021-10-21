Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0C9C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 09:10:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1024611C7
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 09:10:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbhJUJMa (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Oct 2021 05:12:30 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:57908
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231321AbhJUJMa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 05:12:30 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4C0333F304
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 09:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634807411;
        bh=bbSHRxsR73bGstaaNlqrnr2h4OekYl5/Y0NpOv9VPBw=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=GiU2ougumgmG6uUTccWbtxnuXlWgVr3da9PbCxCKBeDFG/r5nSGbd27f0fPQdp9Qk
         zMpP8NuMd69UlfOcHqnQ2wZnV82hAZNalisRtj1eqeBRcX4D4uLIc8jwyzQhSEq/7W
         oGoFINOMP3IKltFK04IK5U0dcuj+H8ta0hzy9ogjd5tnnHW7XNE8unhF6OeG4FHvNs
         Dx1Cix6eB/TKFN6ovimHQqgNz7IoAiscFS9xU7rCyaP33b2fAFQAoAlMN2JYftnziW
         kewhpBsjMhgQMIoumEls940J/I+TjLUzrGlioCZzxKr1NZw6MyS8/pZ6wTMgHxI5fP
         lDYkka2ciCSOA==
Received: by mail-lf1-f69.google.com with SMTP id br42-20020a056512402a00b003fd94a74905so4384584lfb.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 02:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bbSHRxsR73bGstaaNlqrnr2h4OekYl5/Y0NpOv9VPBw=;
        b=1kUrJnzlIp3vblenUh7HE9aU2s6EwoCsnePGRDmK8BO4pVWsghw4gddFU8w38MG0Z8
         XOQyNm4aajRf9BDaEMoGrGEvKhVKr/hJ/HdVcNGKD6Y/BptVAemstpaBCCC0djiWTTiB
         q/PQgCrVvmjiMzMzN+GMW+8/9/UGutCB09H5iR3M4hG4S9P0u+6u7YuWcWl/20Qn+KXW
         xLJpnxY3SG9wBgWaDBfQOuHtD3Kna7MMUEPtQKoUoKTF0JyuYm/3o2Mz8nLWjf6d76Uy
         rSzBHmlHMMPwIVEAjHn7dedjCo/c5egirW05TYyozOvEqO3x0DHZeWgHnO7i0iWhUXIF
         jWQw==
X-Gm-Message-State: AOAM533/kuP4y5oYcGGOKMAKQjvaSOkDnH9NHiW8oygXUJv6+r9RTp0I
        se/QpJMrBANC4Gen+j5DiQlYgzOrxFDXLCxm7QgChaVPK5+svpowjmBs8TWeYJ9ka5gI73Klb7u
        hLTzEmjDeihn0ahbuoDztv79jZyCRafGzztWfNiVCz2G8lcyV
X-Received: by 2002:a2e:a171:: with SMTP id u17mr4669564ljl.371.1634807410715;
        Thu, 21 Oct 2021 02:10:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJi51V3uLcQ6VQf22lZE+UEugXH6TyHQQH8xsi40Ilosw8EeaKsw6tjG5kUM2pWTCLIevk/g==
X-Received: by 2002:a2e:a171:: with SMTP id u17mr4669547ljl.371.1634807410497;
        Thu, 21 Oct 2021 02:10:10 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id v7sm523707lji.81.2021.10.21.02.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 02:10:10 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [GIT PULL] riscv: dts: few cleanups for v5.16
Date:   Thu, 21 Oct 2021 11:09:55 +0200
Message-Id: <20211021090955.115005-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Arnd and Olof,

I have an old patchset for RISC-V dts cleanups which I sent to mailing lists in
August 2021 (v1, v2), resent in September and pinged two times.  They got some
review (from Alexandre Ghiti for SiFive, from Conor Dooley for Microchip) but
unfortunately Palmer (RISC-V maintainer) did not respond here.

The usual RISC-V patches go via Palmer to Linus and I am not planning to change
that, but I want to get these fixed.

Could you grab these to soc tree?

Best regards,
Krzysztof



The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/riscv-sifive-dt-5.16

for you to fetch changes up to 9962a066f3c1d4588d0dd876ceac2c03ef87acf3:

  riscv: dts: sifive: add missing compatible for plic (2021-10-19 10:59:57 +0200)

----------------------------------------------------------------
RISC-V DTS changes for v5.16

Cleanups of RISC-V SiFive and Microchip DTSes with dtschema.  These are
few minor fixes to make DTSes pass the dtschema, without actual
functional effect.

----------------------------------------------------------------
Krzysztof Kozlowski (5):
      riscv: dts: sifive: use only generic JEDEC SPI NOR flash compatible
      riscv: dts: sifive: fix Unleashed board compatible
      riscv: dts: sifive: drop duplicated nodes and properties in sifive
      riscv: dts: microchip: add missing compatibles for clint and plic
      riscv: dts: sifive: add missing compatible for plic

 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi   |  4 ++--
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi          |  2 +-
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 10 +++-------
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts |  7 +------
 4 files changed, 7 insertions(+), 16 deletions(-)
