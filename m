From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [GIT PULL] ARM: EXYNOS: SROM driver for v4.6, 2nd try
Date: Thu, 03 Mar 2016 09:04:54 +0900
Message-ID: <56D77FA6.5070500@samsung.com>
References: <1456825042-23733-1-git-send-email-k.kozlowski@samsung.com>
 <1456825042-23733-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1456825042-23733-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 01.03.2016 18:37, Krzysztof Kozlowski wrote:
> Hi,
> 
> 
> After Olof comments, second pull request with movement of SROM code
> to separate driver - under drivers/memory/samsung (more are planned for
> that directory).
> 
> This depends on (included here):
> 1. tag samsung-dt-srom-4.6: SROM-DT changes, merged already to arm-soc,
> 2. tag samsung-soc-4.6-2: next/soc changes, sent few days ago, not merged yet.
> 
> This may conflict in the future (in linux-next or Linus) around
> drivers/memory/Kconfig with iommu tree. Just add all the changes.
> 
> 
> The diff at the end contains both samsung-soc-4.6-2 and this stuff.
> To make finding changes easier, below you will find difference between
> this tag and samsung-soc-4.6-2:

I see you did not pull this yet so can you wait a little bit? Rob
Herring posted some comments on bindings so this might be revisited...

This is an unlucky patchset...

Best regards,
Krzysztof
