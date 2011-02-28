From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/6] ARM: SAMSUNG: Add support PWM backlight
Date: Mon, 28 Feb 2011 19:53:28 +0900
Message-ID: <003401cbd735$be0b20f0$3a2162d0$%kim@samsung.com>
References: <1298694546-16816-1-git-send-email-banajit.g@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:48482 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753557Ab1B1Kxe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Feb 2011 05:53:34 -0500
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHB00CLZQ99W6B0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Feb 2011 19:53:33 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHB007WZQ99XZ@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Feb 2011 19:53:33 +0900 (KST)
In-reply-to: <1298694546-16816-1-git-send-email-banajit.g@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Banajit Goswami' <banajit.g@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

Banajit Goswami wrote:
> 
> This patch adds support PWM backlight for S5P SoCs.
> 
> 1. Move PWM timer code from plat-s3c24xx to plat-samsung for common
> useability
> 2. Add PWM backlight support for SMDK6410/6440/6450/C100 and SMDKV210
> 
> Note: The modification of GPIO F for S5P64X0 patch should be merged first
as
> there is a dependency for PWM on S5P64X0.
> 
> [PATCH 1/6] ARM: SAMSUNG: Move PWM device definition from plat-s3c24xx to
> plat-samsung
> [PATCH 2/6] ARM: S3C64XX: Add PWM backlight support on SMDK6410
> [PATCH 3/6] ARM: S5P64X0: Add PWM backlight support on SMDK6440
> [PATCH 4/6] ARM: S5P64X0: Add PWM backlight support on SMDK6450
> [PATCH 5/6] ARM: S5PC100: Add PWM backlight support on SMDKC100
> [PATCH 6/6] ARM: S5PV210: Add PWM backlight support on SMDKV210

Ok, looks ok to me except adding unrelated platform devices.
Could you please re-work?

And please make sure that it works fine on each board before re-submitting
:)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
