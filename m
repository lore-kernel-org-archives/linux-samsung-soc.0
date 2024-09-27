Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0611BBBF1;
	Fri, 27 Sep 2024 10:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727431852; cv=none; b=kQOrUVDkD4m9q2M1/XqgNOeCD0GJNETjO07TbLIxhVw+JUbfv/ALDVv0XklSXOJ7cSMHMfCZkv875e9NBURoUAjtGoLUECmAav8zXoCePWPaqWJX7DhzZmLrsyW6MnxDLgq3WORBTyoIoCW8UDR2i9+CVNXJmu+FB0jbg2OrTCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727431852; c=relaxed/simple;
	bh=46DKFiOZKtMOy5C/LqDJYVkvP8CaYTA8ZDmphOoRNmI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t0n92j90NnF8tmwC6FTQuz928twixCxQix999b89tah8BVWY4/RJRhpBhwFXJYUms3hmhT8EAY/tPNC26OBKUIH7lJcIq69m09/SlHtnw/HHynJ9f/+Pdr3yB/GAe+YdC2Nm6RHMZmOid5h0lVtxhYAPfmjpqkFZ4P6xysbscss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4XFR6D3g4vz1SBK2;
	Fri, 27 Sep 2024 18:09:56 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id F1B6E180042;
	Fri, 27 Sep 2024 18:10:46 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 27 Sep
 2024 18:10:46 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <krzk@kernel.org>, <s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<alim.akhtar@samsung.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<sunyeal.hong@samsung.com>, <linux-samsung-soc@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] clk: samsung: Fix out-of-bound access of of_match_node()
Date: Fri, 27 Sep 2024 18:21:04 +0800
Message-ID: <20240927102104.3268790-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Currently, there is no terminator entry for exynosautov920_cmu_of_match,
hence facing below KASAN warning,

	==================================================================
	BUG: KASAN: global-out-of-bounds in of_match_node+0x120/0x13c
	Read of size 1 at addr ffffffe31cc9e628 by task swapper/0/1

	CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0+ #334
	Hardware name: linux,dummy-virt (DT)
	Call trace:
	 dump_backtrace+0x94/0xec
	 show_stack+0x18/0x24
	 dump_stack_lvl+0x90/0xd0
	 print_report+0x1f4/0x5b4
	 kasan_report+0xc8/0x110
	 __asan_report_load1_noabort+0x20/0x2c
	 of_match_node+0x120/0x13c
	 of_match_device+0x70/0xb4
	 platform_match+0xa0/0x25c
	 __device_attach_driver+0x7c/0x2d4
	 bus_for_each_drv+0x100/0x188
	 __device_attach+0x174/0x364
	 device_initial_probe+0x14/0x20
	 bus_probe_device+0x128/0x158
	 device_add+0xb3c/0x10fc
	 of_device_add+0xdc/0x150
	 of_platform_device_create_pdata+0x120/0x20c
	 of_platform_bus_create+0x2bc/0x620
	 of_platform_populate+0x58/0x108
	 of_platform_default_populate_init+0x100/0x120
	 do_one_initcall+0x110/0x788
	 kernel_init_freeable+0x44c/0x61c
	 kernel_init+0x24/0x1e4
	 ret_from_fork+0x10/0x20

	The buggy address belongs to the variable:
	 exynosautov920_cmu_of_match+0xc8/0x2c80

	The buggy address belongs to the virtual mapping at
	 [ffffffe31c7d0000, ffffffe31d700000) created by:
	 paging_init+0x424/0x60c

	The buggy address belongs to the physical page:
	page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x4349e
	flags: 0x3fffe0000002000(reserved|node=0|zone=0|lastcpupid=0x1ffff)
	raw: 03fffe0000002000 fffffffec00d2788 fffffffec00d2788 0000000000000000
	raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
	page dumped because: kasan: bad access detected

	Memory state around the buggy address:
	 ffffffe31cc9e500: f9 f9 f9 f9 00 00 03 f9 f9 f9 f9 f9 00 00 00 00
	 ffffffe31cc9e580: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
	>ffffffe31cc9e600: 00 00 00 00 00 f9 f9 f9 f9 f9 f9 f9 04 f9 f9 f9
	                                  ^
	 ffffffe31cc9e680: f9 f9 f9 f9 00 00 06 f9 f9 f9 f9 f9 00 00 06 f9
	 ffffffe31cc9e700: f9 f9 f9 f9 00 00 06 f9 f9 f9 f9 f9 00 00 06 f9
	==================================================================

Add a dummy terminator entry at the end to assist
of_match_node() in traversing up to the terminator entry
without accessing an out-of-boundary index.

Fixes: 485e13fe2fb6 ("clk: samsung: add top clock support for ExynosAuto v920 SoC")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/clk/samsung/clk-exynosautov920.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
index 7ba9748c0526..a3634003b29b 100644
--- a/drivers/clk/samsung/clk-exynosautov920.c
+++ b/drivers/clk/samsung/clk-exynosautov920.c
@@ -1155,6 +1155,7 @@ static const struct of_device_id exynosautov920_cmu_of_match[] = {
 		.compatible = "samsung,exynosautov920-cmu-peric0",
 		.data = &peric0_cmu_info,
 	},
+	{ },
 };
 
 static struct platform_driver exynosautov920_cmu_driver __refdata = {
-- 
2.34.1

