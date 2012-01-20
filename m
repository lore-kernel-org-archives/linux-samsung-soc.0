From: Mitsyanko Igor <i.mitsyanko@samsung.com>
Subject: EXYNOS4: Atmel mXT touchscreen device on NURI board fails to initialise
Date: Fri, 20 Jan 2012 14:18:17 +0400
Message-ID: <4F193F69.5060603@samsung.com>
Reply-To: i.mitsyanko@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:53880 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752469Ab2ATKSU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Jan 2012 05:18:20 -0500
Received: from euspt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LY300ALRDYI7J30@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Jan 2012 10:18:18 +0000 (GMT)
Received: from [106.109.8.162] by spt1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LY300KX2DYHZX@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Jan 2012 10:18:18 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jy0922.shim@samsung.com, kyungmin.park@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, Dmitry Solodkiy <d.solodkiy@samsung.com>

Good day.

It looks like Atmel MXT initialisation code on nuri board is broken. I 
don't have a datasheet for this touchscreen, but from what I can see in 
atmel mxt driver code(drivers/input/touchscreen/atmel_mxt_ts.c), I make 
assumption that MXT must have a mandatory MXT_GEN_MESSAGE_T5 object. But 
in structure mxt_init_vals (arch/arm/mach-exynos/mach-nuri.c) there are 
no configuration data for this object. So mxt_probe() function in Atmel 
MXT driver fails during mxt_make_highchg() when it tries to read 
registers of GEN_MESSAGE_T5 object.

-- 
Mitsyanko Igor
ASWG, Moscow R&D center, Samsung Electronics
email:i.mitsyanko@samsung.com
