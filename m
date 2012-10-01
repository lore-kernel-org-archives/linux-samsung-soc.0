From: Matthew Leach <matthew@mattleach.net>
Subject: Spurious IPIs on secondary cpu bringup with EXYNOS 4412
Date: Mon, 01 Oct 2012 17:48:04 +0100
Message-ID: <87obkmjfzv.fsf@mattleach.net>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from honeysuckle.london.02.net ([87.194.255.144]:48544 "EHLO
	honeysuckle.london.02.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753303Ab2JAQz4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Oct 2012 12:55:56 -0400
Received: from mail.mattleach.net (93.97.29.167) by honeysuckle.london.02.net (8.5.140)
        id 4FFD9654024ABBE2 for linux-samsung-soc@vger.kernel.org; Mon, 1 Oct 2012 17:48:06 +0100
Received: from matt-laptop.mattleach.net (unknown [192.168.0.20])
	by mail.mattleach.net (Postfix) with ESMTPSA id C3B397EC25
	for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Oct 2012 17:47:37 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hi,

I applied the secondary CPU bringup patch [1] to mainline, however when
booting I get the following spurious IPIs after each core has booted:

[    0.050000] CPU1: Booted secondary processor
[    0.075000] CPU1: thread -1, cpu 1, socket 10, mpidr 80000a01
[    0.080000] CPU1: Unknown IPI message 0x1
[    0.090000] CPU2: Booted secondary processor
[    0.115000] CPU2: thread -1, cpu 2, socket 10, mpidr 80000a02
[    0.120000] CPU2: Unknown IPI message 0x1
[    0.130000] CPU3: Booted secondary processor
[    0.155000] CPU3: thread -1, cpu 3, socket 10, mpidr 80000a03
[    0.160000] CPU3: Unknown IPI message 0x1

Has anyone that has access to the documentation for the 4412 know what
this could be?

[1]: ARM: EXYNOS: Add support for secondary CPU bring-up on Exynos4412

---

Thanks,
Matt
