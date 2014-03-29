From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 2/4] Samsung 3rd DT updates for v3.15
Date: Sat, 29 Mar 2014 02:53:57 +0100
Message-ID: <201403290253.57994.arnd@arndb.de>
References: <532B6C11.5070607@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:65094 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751280AbaC2By0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Mar 2014 21:54:26 -0400
In-Reply-To: <532B6C11.5070607@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, "arm@kernel.org" <arm@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Thursday 20 March 2014, Kukjin Kim wrote:
> Samsung 3rd DT updates for v3.15
> 
> - Arndale Octa board updates:
>    LDO3 and LDO23 enabled for soft-reset
>    LDO9 enabled for USB operation
>    MDMA1 disabled to avoid imprecise external abort
> 
> Note that this is based on previous tags/samsung-dt-2

Merged into next/cleanup3, thanks

	Arnd
