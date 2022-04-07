Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B083BC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Apr 2022 07:44:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242061AbiDGHqm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Apr 2022 03:46:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242071AbiDGHql (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 03:46:41 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D998A56C0;
        Thu,  7 Apr 2022 00:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1649317481;
  x=1680853481;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aubwDq9tMnlBoW39EfmW7FC5ktvDw7fUudEWZrJpI4Y=;
  b=MjpeZo21laPFd/Gt+dpIBp6NNSmRQm6vGG58NBhzagj/tP11s6XVnzOu
   akzI+GTUk061zoobOJD3TtqnvbXnCxluG7BMvDiXoRf9cWtHGADPeUFQe
   kTHWO92VYdghadWR005LyRM5ndKtGlHqKdAD8uIRglc+tbJLsYBTLWHGE
   bhZB7oXhElMHF8QBMw9teWmjjp1H/KYQUtJV1PkmFuG2FeHwKSzjA7yAR
   c4Ew+4kjlMRGFI2M38hiSVP/ZBfA7hnCVFdGUSelOmwZmOUKhIwzQY/tX
   qGXB9zd9b2NjTKkgK1/YnC/QSjD6LW6aNmIxEQ20s7DaZ2wThYqi7VeKS
   Q==;
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     <krzk@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>
CC:     <kernel@axis.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <alim.akhtar@samsung.com>,
        <devicetree@vger.kernel.org>, <robh+dt@kernel.org>
Subject: [PATCH v3 0/4] clocksource: Add MCT support for ARTPEC-8
Date:   Thu, 7 Apr 2022 09:44:28 +0200
Message-ID: <20220407074432.424578-1-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This series add supports for the timer block on ARTPEC-8.  The block itself is
fully compatible with the existing exynos4210-mct driver.  The ARTPEC-8 SoC
uses this block from two separate processors running Linux (AMP) so it needs
some extra code to allow this sharing.

v3:
- Split and rename devicetree properties
- Add vendor prefix to devicetree properties
- Change descriptions of properties to hopefully describe hardware
- Remove addition of more global variables to the driver

v2:
- The series is now rebased on top of Krzysztof's patch "dt-bindings: timer:
  exynos4210-mct: describe known hardware and its interrupts".
- Combine the Kconfig change and the local timer change into one series
- Use devicetree property rather than module parameter for the local timer handling
- Add specific compatible with the correct number of interrupts.

Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

Cc: linux-samsung-soc@vger.kernel.org
Cc: alim.akhtar@samsung.com

Cc: devicetree@vger.kernel.org
Cc: robh+dt@kernel.org

Vincent Whitchurch (4):
  dt-bindings: timer: exynos4210-mct: Add ARTPEC-8 MCT support
  clocksource/drivers/exynos_mct: Support frc-shared property
  clocksource/drivers/exynos_mct: Support local-timers property
  clocksource/drivers/exynos_mct: Enable building on ARTPEC

 .../timer/samsung,exynos4210-mct.yaml         | 26 +++++++
 drivers/clocksource/Kconfig                   |  2 +-
 drivers/clocksource/exynos_mct.c              | 72 ++++++++++++++++---
 3 files changed, 90 insertions(+), 10 deletions(-)

-- 
2.34.1

