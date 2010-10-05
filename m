From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/4] ARM: SAMSUNG: Change VMALLOC_END and Samsung SoCs' VA space
Date: Tue,  5 Oct 2010 11:06:34 +0900
Message-ID: <1286244398-9333-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:39307 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753291Ab0JEC1x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Oct 2010 22:27:53 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patch changes Samsung SoCs' VA space and VMALLOC_END this can help to use
more vmalloc() / ioremap() area with reducing useless area.

[PATCH 1/4] ARM: SAMSUNG: Move the start address of Samsung SoCs' VA space
[PATCH 2/4] ARM: S3C: Change VMALLOC_END to use more vmalloc()/ioremap() area
[PATCH 3/4] ARM: S5P: Change VMALLOC_END to use more vmalloc()/ioremap() area
[PATCH 4/4] ARM: S5P: Cleanup the S5P SoCs' VA address mapping
