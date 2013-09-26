From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 12/26] ARM: exynos: remove custom .init_time hook
Date: Thu, 26 Sep 2013 10:08:03 +0200
Message-ID: <1573378.EKN2gyy8Sh@flatron>
References: <1379526839-14798-1-git-send-email-sebastian.hesselbarth@gmail.com> <1379526839-14798-13-git-send-email-sebastian.hesselbarth@gmail.com> <5243D267.3010704@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f172.google.com ([209.85.215.172]:59875 "EHLO
	mail-ea0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751198Ab3IZIII (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Sep 2013 04:08:08 -0400
In-Reply-To: <5243D267.3010704@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>

Hi Sebastian,

On Thursday 26 of September 2013 08:21:27 Sebastian Hesselbarth wrote:
> On 09/18/2013 07:53 PM, Sebastian Hesselbarth wrote:
> > With arch/arm calling of_clk_init(NULL) from time_init(), we can now
> > remove custom .init_time hooks. While at it, also remove some now
> > redundant includes.
> > 
> > Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> > ---
> 
> Ping,

This patch looks fine to me (as the whole series).

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

I don't see any reason why this series could introduce a regression on
Exynos SoCs, but just in case let me test it on selected Exynos4 and 
Exynos5 boards.

Best regards,
Tomasz
