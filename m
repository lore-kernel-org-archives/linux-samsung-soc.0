From: Yadwinder Singh <yadi.brar@samsung.com>
Subject: [PATCH 0/2] regulator: add initial suport for max77686
Date: Wed, 09 May 2012 21:54:53 +0530
Message-ID: <1336580695-1184-1-git-send-email-yadi.brar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:57514 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760050Ab2EIQM5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 May 2012 12:12:57 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

This patch series adds support for max77686 which is a multifunction device which
includes regulator (pmic), rtc and charger sub-blocks within it. The support for
mfd driver and regulator driver are added by this patch series. This patch series
also includes device tree and irqdomain support for mfd and regulator portions.

Thanks,
Yadwinder Singh
