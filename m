From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/6] [CPUFREQ] S5PV210: Update CPUFREQ
Date: Wed, 22 Jun 2011 17:07:39 +0900
Message-ID: <1308730065-24737-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:51243 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751534Ab1FVIQt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jun 2011 04:16:49 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: davej@redhat.com

This patch updates CPUFREQ driver on S5VP210 boards.

[PATCH 1/6] [CPUFREQ] S5PV210: Add additional symantics for "relation" in cpufreq with pm
[PATCH 2/6] [CPUFREQ] S5PV210: Add arm/int voltage control support
[PATCH 3/6] [CPUFREQ] S5PV210: Add pm_notifier to prevent system unstable
[PATCH 4/6] [CPUFREQ] S5PV210: Lock a mutex while changing the cpu frequency
[PATCH 5/6] [CPUFREQ] S5PV210: Adjust udelay prior to voltage scaling down
[PATCH 6/6] [CPUFREQ] S5PV210: Add reboot notifier to prevent system hang
