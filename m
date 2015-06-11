From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] MAINTAINERS: ARM64: EXYNOS: Extend entry for ARM64
 DTS
Date: Fri, 12 Jun 2015 08:35:13 +0900
Message-ID: <557A1B31.1090201@samsung.com>
References: <1433584939-3520-1-git-send-email-k.kozlowski@samsung.com> <CAMAWPa-3RhXgCjXcdQkPn3W1SJ++iAkfaBdp_p4Se9Ykg1A1mw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f67.google.com ([209.85.220.67]:36523 "EHLO
	mail-pa0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752367AbbFKXfU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jun 2015 19:35:20 -0400
In-Reply-To: <CAMAWPa-3RhXgCjXcdQkPn3W1SJ++iAkfaBdp_p4Se9Ykg1A1mw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>

W dniu 12.06.2015 o 06:48, Kevin Hilman pisze:
> Hi Krzysztof,
> 
> On Sat, Jun 6, 2015 at 3:02 AM, Krzysztof Kozlowski
> <k.kozlowski@samsung.com> wrote:
>> Extend the Exynos entry to ARM64 device tree sources.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will.deacon@arm.com>
>> Cc: Russell King <linux@arm.linux.org.uk>
>> Cc: Kukjin Kim <kgene@kernel.org>
>> Cc: Kevin Hilman <khilman@kernel.org>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: Olof Johansson <olof@lixom.net>
>> Cc: linux-samsung-soc@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> 
> Applied to arm-soc's next/soc branch.
> 
> Note I found this by chance.  It almost fell through the cracks
> because arm@kernel.org (for arm-soc maintainers) wasn't on the to/cc
> list.

Thanks. I was not aware of this email/list address. It isn't mentioned
in MAINTAINERS. So I suspect that any stuff intended to go directly to
arm-soc maintainers (not through vendor SoC tree) should be sent there?

Best regards,
Krzysztof
