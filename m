From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [GIT PULL] ARM: exynos: Late mach/soc for v4.10
Date: Mon, 02 Jan 2017 10:20:21 +0100
Message-ID: <5b0e55c8-01db-3f02-3526-2f71f4a73d88@samsung.com>
References: <1482003132-8844-1-git-send-email-krzk@kernel.org>
 <20161230155312.oupgyip7wtqwcuy2@kozik-lap>
 <CGME20170102092044epcas1p3cbe831b7b6528f818b034d73c85dbe7d@epcas1p3.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44862 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932283AbdABJUr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Jan 2017 04:20:47 -0500
In-reply-to: <20161230155312.oupgyip7wtqwcuy2@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc: Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>

On 12/30/2016 04:53 PM, Krzysztof Kozlowski wrote:
> 
> Any comments on this? I guess it won't come as late-late-4.10, so can
> you pull it for v4.11?
 
>> Sylwester Nawrocki (1):
>>       ARM: S3C24XX: Add DMA slave maps for remaining s3c24xx SoCs

We need this patch in v4.10 to avoid possible I2S and MMC regressions
on selected s3c24xx SoC, since the DMA clients are already modified.
If the patch goes in only for v4.11 it would be good to mark it for 
inclusion in v4.10 stable kernels.  

--
Thanks, 
Sylwester
