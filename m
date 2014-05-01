From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: Map SYSRAM through generic SRAM bindings
Date: Thu, 01 May 2014 15:32:14 +0200
Message-ID: <5153376.z2oJ163pLF@wuerfel>
References: <1398941085-10224-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:52115 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750741AbaEANcU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 May 2014 09:32:20 -0400
In-Reply-To: <1398941085-10224-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, t.figa@samsung.com, kgene.kim@samsung.com, robh+dt@kernel.org, Heiko Stuebner <heiko@sntech.de>

On Thursday 01 May 2014 16:14:44 Sachin Kamat wrote:
> Instead of hardcoding the SYSRAM details for each SoC,
> pass this information through device tree (DT) and make
> the code SoC agnostic. Generic SRAM bindings are used
> for achieving this.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> 

Looks good to me. Both patches

Acked-by: Arnd Bergmann <arnd@arndb.de>

Heiko, can you also have a look?
