From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 00/10] ARM: S5PV210: Add support for Samsung's S5PV210 SoC
Date: Tue, 19 Jan 2010 11:34:07 +0900
Message-ID: <002201ca98af$e08594f0$a190bed0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:50509 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752590Ab0ASCcP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jan 2010 21:32:15 -0500
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KWH0072M31PPH@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jan 2010 11:32:13 +0900 (KST)
Received: from kgenekim ([12.23.109.129])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KWH005MY31OWQ@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jan 2010 11:32:13 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: 'Ben Dooks' <ben-linux@fluff.org>

This patch set adds support for Samsung's S5PV210. The S5PV210 integrates
a ARM Cortex A8 microprocessor with several other peripherals to support
features such as multimedia, storage, graphics and gaming. The S5PV210 can be
used in products such as Netbooks and Mobile devices.

This patch set consists of the following patches.

[PATCH 01/10] ARM: S5PV210: Add Samsung S5PV210 CPU support
[PATCH 02/10] ARM: S5PV210: Add clock support for S5PV210
[PATCH 03/10] ARM: S5PV210: Add IRQ support
[PATCH 04/10] ARM: S5PV210: Add Timer support
[PATCH 05/10] ARM: S5PV210: Add Kconfig and Makefiles
[PATCH 06/10] ARM: S5PV210: Add SMDKV210 board support file
[PATCH 07/10] ARM: S5PV210: Add SMDKC110 board support file
[PATCH 08/10] ARM: S5PV210: Add S5PV210 configuration file
[PATCH 09/10] ARM: S5PV210: Add S5PC110 configuration file
[PATCH 10/10] ARM: S5PV210: Add serial port support

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
System LSI Division, SAMSUNG ELECTRONICS CO., LTD.
