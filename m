From: Ming Lei <ming.lei@canonical.com>
Subject: [PATCH 0/2] ARM & NET: add fixed phy support on stmmac
Date: Fri, 23 Jan 2015 10:41:31 +0800
Message-ID: <1421980893-14475-1-git-send-email-ming.lei@canonical.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f44.google.com ([209.85.213.44]:62324 "EHLO
	mail-yh0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750917AbbAWClp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Jan 2015 21:41:45 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, "David S. Miller" <davem@davemloft.net>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, netdev@vger.kernel.org

The EXYNOS5440 sd5v1(arch/arm/boot/dts/exynos5440-sd5v1.dts) has
one stmmc gmac which uses fixed phy, so add fixed phy support for
both EXYNOS5440 and stmmac.

Thanks,
Ming Lei
