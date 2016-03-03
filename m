From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] ARM: EXYNOS: SROM driver for v4.6, 2nd try
Date: Thu, 03 Mar 2016 14:11:32 +0100
Message-ID: <2210448.V5gsMerLz6@wuerfel>
References: <1456825042-23733-1-git-send-email-k.kozlowski@samsung.com> <1456825042-23733-3-git-send-email-k.kozlowski@samsung.com> <56D77FA6.5070500@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.134]:56484 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751082AbcCCNMJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Mar 2016 08:12:09 -0500
In-Reply-To: <56D77FA6.5070500@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday 03 March 2016 09:04:54 Krzysztof Kozlowski wrote:
> On 01.03.2016 18:37, Krzysztof Kozlowski wrote:
> > Hi,
> > 
> > 
> > After Olof comments, second pull request with movement of SROM code
> > to separate driver - under drivers/memory/samsung (more are planned for
> > that directory).
> > 
> > This depends on (included here):
> > 1. tag samsung-dt-srom-4.6: SROM-DT changes, merged already to arm-soc,
> > 2. tag samsung-soc-4.6-2: next/soc changes, sent few days ago, not merged yet.
> > 
> > This may conflict in the future (in linux-next or Linus) around
> > drivers/memory/Kconfig with iommu tree. Just add all the changes.
> > 
> > 
> > The diff at the end contains both samsung-soc-4.6-2 and this stuff.
> > To make finding changes easier, below you will find difference between
> > this tag and samsung-soc-4.6-2:
> 
> I see you did not pull this yet so can you wait a little bit? Rob
> Herring posted some comments on bindings so this might be revisited...
> 
> This is an unlucky patchset...

It was a bit late last night, and I didn't want to check that the
dependencies were correct. I also saw that you had discussed these
contents with Olof before, but didn't follow the thread there, so
I was hoping that Olof could get back to it and check that his
concerns are all addressed before picking it up.

	Arnd
