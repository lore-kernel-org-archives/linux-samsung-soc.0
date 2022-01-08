Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87084C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  8 Jan 2022 22:05:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233313AbiAHWFt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 8 Jan 2022 17:05:49 -0500
Received: from h03mx16.reliablemail.org ([173.236.90.20]:38559 "EHLO
        h03mx16.reliablemail.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbiAHWFs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 8 Jan 2022 17:05:48 -0500
X-Greylist: delayed 361 seconds by postgrey-1.27 at vger.kernel.org; Sat, 08 Jan 2022 17:05:48 EST
X-Halon-Out: 4a7d464f-70ce-11ec-a67c-00163c72d6d3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grimler.se;
        s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=6uLsU6c990rAA76TwqbDUG8qg9wyPyNeSIbRCdMXz7o=; b=juExpkgGkZAtte4l3C9XkqMUJR
        7DKcNvkXlGnlTcSPNEjHZaDQYvnprN90FCj9BrqFT3AxhQFPuJJ8z4L6XbZolMX3vMlMiD7aoHAJa
        JF1zrbrYi+qikwSfz19chJVLaTx0zVp8iUexchIpHUzxUigcJQ46rq10bEmOrLxslnoRsxvHQGBDE
        ebFqsdBbkxDwzcUSDC3piURT301yGy6fItM0MhKnaEesaA5HQLSzU3eRSVH6YrKawtPozUHVQf8NM
        KcO7AOqq+HyGOH2xknhFDiNiaMphIe3xwVXVaW/psZC7dRGCWb3et+4H63En84bpfL5fe10exGlny
        rPbiuVdA==;
From:   Henrik Grimler <henrik@grimler.se>
To:     linux@armlinux.org.uk, krzysztof.kozlowski@canonical.com,
        m.szyprowski@samsung.com, semen.protsenko@linaro.org,
        martin.juecker@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Henrik Grimler <henrik@grimler.se>
Subject: [RFC PATCH 1/1] ARM: exynos: only do SMC_CMD_CPU1BOOT call on Exynos4
Date:   Sat,  8 Jan 2022 22:57:33 +0100
Message-Id: <20220108215733.705865-2-henrik@grimler.se>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220108215733.705865-1-henrik@grimler.se>
References: <20220108215733.705865-1-henrik@grimler.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpsrv07.misshosting.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - grimler.se
X-Get-Message-Sender-Via: cpsrv07.misshosting.com: authenticated_id: henrik@grimler.se
X-Authenticated-Sender: cpsrv07.misshosting.com: henrik@grimler.se
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Exynos5 the call is simply ignored by most variants of the
trustzone firmware.  However, on some devices it instead causes the
device to hang, so let's avoid the call for the SoCs where it should
not be needed.

To see that the call is ignored, we can look into sboot/tzsw.  On most
of the Exynos{4,5} devices the part of sboot/tzsw that seem to handle
the secure monitor calls is quite easy to recognise, the SMC number is
compared to known ones, and if equal it branches to the relevant
function.  In assembly this looks something like:

;-- handle_smc:
0x00000514      650070e3       cmn r0, 0x65
0x00000518      0a00000a       beq loc.smc_cmd_reg
0x0000051c      010070e3       cmn r0, 1
0x00000520      6c00000a       beq loc.smc_cmd_init
0x00000524      020070e3       cmn r0, 2
0x00000528      6b00000a       beq loc.smc_cmd_info
0x0000052c      030070e3       cmn r0, 3
0x00000530      6e00000a       beq loc.smc_cmd_sleep
0x00000534      060070e3       cmn r0, 6
0x00000538      ae00000a       beq loc.smc_cmd_save_state
0x0000053c      070070e3       cmn r0, 7
0x00000540      b400000a       beq loc.smc_cmd_standby
0x00000544      2b01001a       bne loc.smc_return_minus1

where above example is from exynos5420-arndale-octa.  As can be seen
the case where r0 is 4 (i.e. SMC_CMD_CPU1BOOT) is not handled.  The
annotations are taken from github.com/hsnaves/exynos5410-firmware,
where a large part of the exynos5410 trustzone firmware has been
reverse-engineered.

Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
 arch/arm/mach-exynos/firmware.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
index 2eaf2dbb8e81..2da5b60b59e2 100644
--- a/arch/arm/mach-exynos/firmware.c
+++ b/arch/arm/mach-exynos/firmware.c
@@ -60,8 +60,10 @@ static int exynos_cpu_boot(int cpu)
 	/*
 	 * Exynos3250 doesn't need to send smc command for secondary CPU boot
 	 * because Exynos3250 removes WFE in secure mode.
+	 *
+	 * On Exynos5 devices the call is ignored by trustzone firmware.
 	 */
-	if (soc_is_exynos3250())
+	if (!soc_is_exynos4210() && !soc_is_exynos4412())
 		return 0;
 
 	/*
-- 
2.34.1

