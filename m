From: Seungwon Jeon <tgih.jun@samsung.com>
Subject: [PATCH v2 RESEND 0/2] mmc: core: Fix cache control for eMMC4.5
Date: Mon, 26 Dec 2011 18:02:18 +0900
Message-ID: <000701ccc3ad$12661420$37323c60$%jun@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-mmc-owner@vger.kernel.org>
Content-language: ko
Sender: linux-mmc-owner@vger.kernel.org
To: linux-mmc@vger.kernel.org
Cc: 'Chris Ball' <cjb@laptop.org>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch-set fixed the cache control for eMMC4.5

Seungwon Jeon (2):
      mmc: core: Separate the timeout value for cache-ctrl
      mmc: core: Add claiming a host during mmc_cache_ctrl

 drivers/mmc/core/core.c |   29 +++++++++++++++++++----------
 drivers/mmc/core/mmc.c  |   13 +++++++++++--
 2 files changed, 30 insertions(+), 12 deletions(-)

Best regards,
Seungwon Jeon.
--
1.7.2.3


