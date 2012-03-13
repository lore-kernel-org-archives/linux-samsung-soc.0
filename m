From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 00/12] ARM: EXYNOS: add support new EXYNOS5250
Date: Tue, 13 Mar 2012 16:22:08 +0000
Message-ID: <201203131622.09048.arnd@arndb.de>
References: <1331652643-12626-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:60844 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757419Ab2CMQWQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Mar 2012 12:22:16 -0400
In-Reply-To: <1331652643-12626-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, olof@lixom.net

On Tuesday 13 March 2012, Kukjin Kim wrote:
> 
> This patch adds support EXYNOS5250 SoC which has two A15 cores
> can be used on mobile and tablet devices.

Looks basically ok to me. I've commented on patches 5 and 9 and
in both cases, I would either like to see the patch get dropped
or the changeset description expanded to give a good explanation
why the change is actually needed.

	Arnd
