From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/4] ARM: S5P64X0: Add S5P6450 GPIOlib support
Date: Thu, 25 Nov 2010 14:30:13 +0900
Message-ID: <1290663017-9350-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:58855 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750785Ab0KYFle (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Nov 2010 00:41:34 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patch adds S5P6450 GPIOlib support. S5P6440 GPIOlib already can
be supported, this patch just adds GPIO chips for S5P6450 and changes
the file name according to other S5P SoCs.

[PATCH 1/4] ARM: S5P64X0: Add GPIOlib support for S5P6450
[PATCH 2/4] ARM: SAMSUNG: Cleanup GPIOlib adding 2bit chips
[PATCH 3/4] ARM: S5P64X0: Cleanup S5P64X0 GPIOlib adding 2bit chips
[PATCH 4/4] ARM: S5P64X0: Rename GPIOlib file to gpiolib.c
