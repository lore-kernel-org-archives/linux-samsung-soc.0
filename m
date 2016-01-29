From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 0/6] ARM: samsung warning fixes
Date: Fri, 29 Jan 2016 15:50:32 +0100
Message-ID: <1454079040-3567945-1-git-send-email-arnd@arndb.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:54467 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756254AbcA2OvX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 Jan 2016 09:51:23 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

These are all patches addressing harmless warnings I found in
my randconfig tests. Please merge into the samsung fixes branch
for 4.6.

	Arnd
