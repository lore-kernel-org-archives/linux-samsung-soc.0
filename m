From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] more S3C HSOTG fixes
Date: Mon, 19 Jul 2010 16:01:39 +0200
Message-ID: <1279548102-32390-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:17396 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933554Ab0GSOCC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Jul 2010 10:02:02 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, greg@kroah.com

Hello,

This patch series adds 2 simple changes to enable the driver on S5PV210
SoCs and a simple compile error fix. This is a continuation of 'S3C
HSOTG fixes' series posted by Ben Dooks. The first one should be applied
to 2.6.35. The latter can be also considered as a bug fixes because it
is not possible to use the driver on Samsung Aquila and Goni boards
without them.

List of patches:
[PATCH 1/3] USB: s3c-hsotg: fix compilation problem
[PATCH 2/3] USB: s3c-hsotg: modify only selected bits in S3C_PHYPWR register
[PATCH 3/3] USB: s3c-hsotg: add support for clock gating

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
