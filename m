From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 0/2, v2] cpufreq: build fixes
Date: Wed, 18 Feb 2015 21:54:01 +0100
Message-ID: <7331404.XKGG8rohnR@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:57738 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750927AbbBRUyj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Feb 2015 15:54:39 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, Kukjin Kim <kgene@kernel.org>, Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org

This is an unmodified re-send of two patches I originally submitted
on January 28. Both patches were Acked by Viresh, while a third patch
got replaced with a better fix. Please merge these through the cpufreq
tree for 3.20 and backports.

	Arnd
