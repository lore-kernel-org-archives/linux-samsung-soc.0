From: Girish K S <girish.shivananjappa@linaro.org>
Subject: [PATCH v3 0/2] mmc: core: Add Poweroff Notify handling eMMC 4.5
Date: Thu,  8 Sep 2011 09:58:35 +0530
Message-ID: <1315456117-26730-1-git-send-email-girish.shivananjappa@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:40913 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751526Ab1IHEgz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Sep 2011 00:36:55 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-mmc@vger.kernel.org
Cc: cjb@laptop.org, kgene.kim@samsung.com, patches@linaro.org, linux-samsung-soc@vger.kernel.org, Girish K S <girish.shivananjappa@linaro.org>

This patch series adds the power off notification handling
during suspend and system poweroff.
For suspend mode short timeout is used, whereas for the
normal poweroff long timeout is used. 
Includes the updates suggested for V2 patches.

Girish K S (2):
  mmc: core: Add power off notify feature(eMMC 4.5)
  mmc: core: Add Poweroff Notify handling

 drivers/mmc/core/core.c  |   33 +++++++++++++++++++++++++++++++++
 drivers/mmc/core/mmc.c   |   21 +++++++++++++++++++--
 drivers/mmc/host/sdhci.c |   10 ++++++++++
 include/linux/mmc/card.h |   20 ++++++++++++++++++++
 include/linux/mmc/host.h |    5 +++++
 include/linux/mmc/mmc.h  |    7 +++++++
 6 files changed, 94 insertions(+), 2 deletions(-)
