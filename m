From: Ming Lei <ming.lei@canonical.com>
Subject: [PATCH v1 0/2] ARM EXYNOS5 & net: add fixed phy support
Date: Mon, 26 Jan 2015 10:37:36 +0800
Message-ID: <1422239858-3452-1-git-send-email-ming.lei@canonical.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f169.google.com ([209.85.216.169]:40145 "EHLO
	mail-qc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751092AbbAZChq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 25 Jan 2015 21:37:46 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, "David S. Miller" <davem@davemloft.net>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, netdev@vger.kernel.org, Byungho An <bh74.an@samsung.com>, Florian Fainelli <f.fainelli@gmail.com>

Hi,

These two patches adds fixed phy support using the fixed-link DT binding
for stmmac.

v1:
	- bypassing check on phy id for fixed phy (patch 2/2)

Thanks,
Ming Lei
