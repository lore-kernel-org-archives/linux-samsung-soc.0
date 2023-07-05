Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 910EEEB64DA
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 Jul 2023 20:43:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233790AbjGEUne (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 Jul 2023 16:43:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233758AbjGEUnb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 16:43:31 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4BED19B;
        Wed,  5 Jul 2023 13:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1688589809;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=wyXkGZNGA5ysK2ltkve4RVlCutN+wjP1W2giIyjMZxk=;
        b=nScC7Am7eHbPkqLsb+E2gznpiUpMVyfzuF8FL3UiEEkgxgDebdCyG0lG4/LsIyuatJlX4p
        bLgSjmITOHNmgrkD8zSZN2pAMtILouf7m0vVi2R75j9CXCT1jpDBwzoRZP8oDzs/SSuMLd
        FF8hRZbcRQMFlzMf9jstb8q8Hg0pEdM=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Elie Morisse <syniurge@gmail.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Jean Delvare <jdelvare@suse.com>,
        Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Conghui Chen <conghui.chen@intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: [PATCH 00/23] i2c: Use new PM macros
Date:   Wed,  5 Jul 2023 22:42:51 +0200
Message-Id: <20230705204314.89800-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Wolfram,

This patchset converts the I2C subsystem to use the PM macros that were
introduced in v5.17, which allow the dev_pm_ops and related callbacks to
be automatically dropped by the compiler when CONFIG_PM or
CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.

The point of this, is that all this code is now compiled independently
of any Kconfig option, which makes bugs and regressions easier to catch.

This continues the work that has been started in other subsystems (DRM,
IIO, watchdog).

As an added bonus, the diff is 71+/192-, that means less code you will
have to maintain ;)

The patches generally don't change the behaviour, with a few exceptions,
that are documented in the corresponding patches.

I would like to draw the attention to a few patches in particular:

- [01/23] the driver most likely does something that it shouldn't do
  (use the same callbacks for runtime PM and system PM). The patch does
  not change this behaviour but I have questions.

- [11/23] uses platform_driver.{suspend,resume} instead of the regular
  .driver.pm. I have no idea why it does that and I believe it doesn't
  really have to.

- [18/23] I feel like the qup_i2c_suspend / qup_i2c_resume don't really
  need to exist, and the pm_runtime_force_suspend() /
  pm_runtime_force_resume() helpers should be used instead, using the
  DEFINE_RUNTIME_DEV_PM_OPS() macro.

Cheers,
-Paul

Paul Cercueil (23):
  i2c: amd-mp2: Remove #ifdef guards for PM related functions
  i2c: au1550: Remove #ifdef guards for PM related functions
  i2c: iproc: Remove #ifdef guards for PM related functions
  i2c: brcmstb: Remove #ifdef guards for PM related functions
  i2c: davinci: Remove #ifdef guards for PM related functions
  i2c: designware: Remove #ifdef guards for PM related functions
  i2c: exynos5: Remove #ifdef guards for PM related functions
  i2c: hix5hd2: Remove #ifdef guards for PM related functions
  i2c: i801: Remove #ifdef guards for PM related functions
  i2c: img-scb: Remove #ifdef guards for PM related functions
  i2c: kempld: Remove #ifdef guards for PM related functions
  i2c: lpc2k: Remove #ifdef guards for PM related functions
  i2c: mt65xx: Remove #ifdef guards for PM related functions
  i2c: nomadik: Remove #ifdef guards for PM related functions
  i2c: ocores: Remove #ifdef guards for PM related functions
  i2c: pnx: Remove #ifdef guards for PM related functions
  i2c: pxa: Remove #ifdef guards for PM related functions
  i2c: qup: Remove #ifdef guards for PM related functions
  i2c: rcar: Remove #ifdef guards for PM related functions
  i2c: s3c2410: Remove #ifdef guards for PM related functions
  i2c: sh-mobile: Remove #ifdef guards for PM related functions
  i2c: virtio: Remove #ifdef guards for PM related functions
  i2c: mux: pca954x: Remove #ifdef guards for PM related functions

 drivers/i2c/busses/i2c-amd-mp2-pci.c        | 14 +++++--------
 drivers/i2c/busses/i2c-amd-mp2-plat.c       |  8 ++------
 drivers/i2c/busses/i2c-amd-mp2.h            |  2 --
 drivers/i2c/busses/i2c-au1550.c             | 15 +++-----------
 drivers/i2c/busses/i2c-bcm-iproc.c          | 10 +---------
 drivers/i2c/busses/i2c-brcmstb.c            |  8 +++-----
 drivers/i2c/busses/i2c-davinci.c            | 12 +++--------
 drivers/i2c/busses/i2c-designware-platdrv.c | 22 ++++++---------------
 drivers/i2c/busses/i2c-exynos5.c            |  8 +++-----
 drivers/i2c/busses/i2c-hix5hd2.c            | 10 ++++------
 drivers/i2c/busses/i2c-i801.c               |  6 ++----
 drivers/i2c/busses/i2c-img-scb.c            | 13 ++++--------
 drivers/i2c/busses/i2c-kempld.c             |  9 ++-------
 drivers/i2c/busses/i2c-lpc2k.c              |  8 +-------
 drivers/i2c/busses/i2c-mt65xx.c             |  8 +++-----
 drivers/i2c/busses/i2c-nomadik.c            | 14 +++++--------
 drivers/i2c/busses/i2c-ocores.c             | 10 +++-------
 drivers/i2c/busses/i2c-pnx.c                | 12 ++++-------
 drivers/i2c/busses/i2c-pxa.c                |  8 +-------
 drivers/i2c/busses/i2c-qup.c                | 16 ++++-----------
 drivers/i2c/busses/i2c-rcar.c               | 10 ++--------
 drivers/i2c/busses/i2c-s3c2410.c            | 14 +++----------
 drivers/i2c/busses/i2c-sh_mobile.c          | 12 +++--------
 drivers/i2c/busses/i2c-virtio.c             |  8 ++------
 drivers/i2c/muxes/i2c-mux-pca954x.c         |  6 ++----
 25 files changed, 71 insertions(+), 192 deletions(-)

-- 
2.40.1

