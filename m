From: Girish K S <girish.shivananjappa@linaro.org>
Subject: [PATCH 0/2] mmc: core: Power off notify/handle (eMMC 4.5)
Date: Mon,  5 Sep 2011 17:19:57 +0530
Message-ID: <1315223399-21599-1-git-send-email-girish.shivananjappa@linaro.org>
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: linux-mmc@vger.kernel.org
Cc: cjb@laptop.org, kgene.kim@samsung.com, patches@linaro.org, linux-samsung-soc@vger.kernel.org, Girish K S <girish.shivananjappa@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

This set of patch add the feature of notify and handling of
PowerOff notification for eMMC 4.5 devices

Girish K S (2):
  mmc: core: Add power off notify feature(eMMC 4.5)
  mmc: core: Add poweroff notify handling feature

 drivers/mmc/core/core.c  |   29 +++++++++++++++++++++++++++++
 drivers/mmc/core/mmc.c   |   22 ++++++++++++++++++++--
 drivers/mmc/host/sdhci.c |   11 +++++++++++
 include/linux/mmc/card.h |   30 ++++++++++++++++++++++++++----
 include/linux/mmc/host.h |    6 +++++-
 include/linux/mmc/mmc.h  |    8 +++++++-
 6 files changed, 98 insertions(+), 8 deletions(-)

