From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v2 0/7] ARM: S5P6442: Add support for Samsung's S5P6442 SoC
Date: Fri, 29 Jan 2010 11:21:28 +0900
Message-ID: <000101caa089$c64e1490$52ea3db0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:33028 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752694Ab0A2CTi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Jan 2010 21:19:38 -0500
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KWZ00HKML4OL7@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 29 Jan 2010 11:19:36 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KWZ002M4L4NTV@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 29 Jan 2010 11:19:36 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

Hi All,

This patches add basic support for Samsung's S5P6442 SoC.
The feature set that is added are clock, timer, uart and interrupts.

[PATCH v2 1/7] ARM: S5P6442: Add Samsung S5P6442 CPU support
[PATCH v2 2/7] ARM: S5P6442: Add clock support for S5P6442
[PATCH v2 3/7] ARM: S5P6442: Add IRQ support
[PATCH v2 4/7] ARM: S5P6442: Update Kconfig and Makefiles
[PATCH v2 5/7] ARM: S5P6442: Add SMDK6442 board support file
[PATCH v2 6/7] ARM: S5P6442: Add S5P6442 configuration file
[PATCH v2 7/7] ARM: S5P6442: Add serial port support

Changes since v1:
1. Common macros are used such as S3C_PA_XXX and S3C_VA_XXX
2. Renamed S5P_VA_VICx definitions as VA_VICx
3. Removed unnecessary definitions in the header files like map.h
4. Added VIC2 definitions.
5. Fixed code as per comments from Ben in linux-samsung-soc mailing list.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
System LSI Division, SAMSUNG ELECTRONICS CO., LTD.
