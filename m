From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v2 00/10] ARM: S5PV210: Add support for Samsung's S5PV210 CPU
Date: Thu, 21 Jan 2010 09:03:19 +0900
Message-ID: <003001ca9a2d$242d6100$6c882300$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:58226 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754668Ab0AUAB1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jan 2010 19:01:27 -0500
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KWK00DWLLECL4@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jan 2010 09:01:24 +0900 (KST)
Received: from kgenekim ([12.23.109.129])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KWK003IILECP1@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jan 2010 09:01:24 +0900 (KST)
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

[PATCH v2 01/10] ARM: S5PV210: Add Samsung S5PV210 CPU support
[PATCH v2 02/10] ARM: S5PV210: Add clock support for S5PV210
[PATCH v2 03/10] ARM: S5PV210: Add IRQ support
[PATCH v2 04/10] ARM: S5PV210: Add Timer support
[PATCH v2 05/10] ARM: S5PV210: Update Kconfig and Makefiles
[PATCH v2 06/10] ARM: S5PV210: Add SMDKV210 board support file
[PATCH v2 07/10] ARM: S5PV210: Add SMDKC110 board support file
[PATCH v2 08/10] ARM: S5PV210: Add S5PV210 configuration file
[PATCH v2 09/10] ARM: S5PV210: Add S5PC110 configuration file
[PATCH v2 10/10] ARM: S5PV210: Add serial port support

Changes since v1 :

1. Removed mach/s5pv210/include/mach/gpio-core.h file.
2. Removed unused clock gate defines.
3. Removed machine fixup code from smdkv210 and smdkc110 board support.
4. Merged Kconfig and Makefiles with other source code patches.
5. Replaced multiple definition of UART info with macro.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
System LSI Division, SAMSUNG ELECTRONICS CO., LTD.
