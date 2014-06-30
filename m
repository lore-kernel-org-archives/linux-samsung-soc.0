From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 00/17] ARM: S5P64X0, S5PC100: no more support in mainline
Date: Mon, 30 Jun 2014 15:34:27 +0200
Message-ID: <6153646.CZ57BgYKf3@wuerfel>
References: <1404163947-3105-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:64456 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750969AbaF3Nec (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 09:34:32 -0400
In-Reply-To: <1404163947-3105-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

On Tuesday 01 July 2014 06:32:10 Kukjin Kim wrote:
> This series removes S5P64X0 and S5PC100 related codes in mainline,
> because no more user now. And if its supporting is required later,
> it will be done with using device tree.
> 

Acked-by: Arnd Bergmann <arnd@arndb.de>

Your patch 1/17 has not made it to the mailing list, it's probably too
large. Can you try recreating the patch using 'git format-patch -D'?

I'd like to see the changes to arch/arm/plat-samsung.

	Arnd
