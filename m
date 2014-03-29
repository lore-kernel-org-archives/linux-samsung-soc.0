From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 4/4] Samsung Exynos cleanup/consolidate for v3.15
Date: Sat, 29 Mar 2014 02:54:36 +0100
Message-ID: <201403290254.36822.arnd@arndb.de>
References: <532B6D80.9070302@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.131]:53759 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751455AbaC2Byl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Mar 2014 21:54:41 -0400
In-Reply-To: <532B6D80.9070302@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, "arm@kernel.org" <arm@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Thursday 20 March 2014, Kukjin Kim wrote:
> Exynos cleanup for v3.15
> 
> - reorganize code for
> - add support reserve memory for mfc-v7
> - consolidate exynos4 and exynos5 machine codes
> - add generic compatible strings for exynos4 and exynos5
> - update DT with generic compatible strings
> - move clk related dt-binding header file in dt-bindings/clock

Merged into next/cleanup3, thanks

	Arnd
