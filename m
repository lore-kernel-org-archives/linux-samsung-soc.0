From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: s3c64xx: avoid warning about 'struct device_node'
Date: Mon, 11 Jul 2016 13:15:11 +0200
Message-ID: <1807726.lxvlsY5ymW@wuerfel>
References: <20160627110303.3391769-1-arnd@arndb.de> <57710F1F.8090304@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.135]:55380 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751203AbcGKLM3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jul 2016 07:12:29 -0400
In-Reply-To: <57710F1F.8090304@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Rob Herring <robh@kernel.org>, Kefeng Wang <wangkefeng.wang@huawei.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Monday, June 27, 2016 1:33:51 PM CEST Krzysztof Kozlowski wrote:
> On 06/27/2016 01:02 PM, Arnd Bergmann wrote:
> > The change to simplify of_platform_populate() had an unintended
> > side-effect of introducing a build warning on s3c64xx:
> > 
> > In file included from arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c:18:0:
> > arch/arm/mach-s3c64xx/common.h:27:30: error: 'struct device_node' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
> > 
> > This adds a forward-declaration for the structure name in the
> > header to avoid the warning.
> > 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > Fixes: 850bea2335e4 ("arm: Remove unnecessary of_platform_populate with default match table")
> > ---
> > Rob, can you apply this on top of the devicetree git so we don't
> > have to coordinate the merges?
> 
> Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hi Rob,

I still get the warning in every linux-next build, do you plan to pick
up the fix for the commit you merged, or should I try to work around it
in arm-soc and leave this as a bisection problem?

	Arnd
