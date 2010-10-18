From: Jongsun Han <jongsun.han@samsung.com>
Subject: [PATCH V2 0/3] ARM: S5PV310: Add EINT support
Date: Mon, 18 Oct 2010 14:06:31 +0900
Message-ID: <1287378393-15699-1-git-send-email-jongsun.han@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:39700 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750718Ab0JRFMK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Oct 2010 01:12:10 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

This is a sencond version of patches adding EINT for S5PV310/C210

Changes since v1:
- Replace some functions with macro define
- Add register definition and macro

[PATCH 1/2] ARM: S5PV310: Add the definition for external interrupt
[PATCH 2/2] ARM: S5PV310: Add external interrupt support
