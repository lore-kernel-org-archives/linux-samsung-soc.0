From: Ben Gamari <ben@smart-cactus.org>
Subject: Re: Exynos 5410 support (was [PATCH 6/6] ARM: dts: exynos5420: add
 sysmmu nodes)
Date: Thu, 04 Jun 2015 15:28:55 -0400
Message-ID: <5570A6F7.6010305@smart-cactus.org>
References: <1432041645-11172-1-git-send-email-m.szyprowski@samsung.com> <1433153450-3680-1-git-send-email-m.szyprowski@samsung.com> <1433153450-3680-7-git-send-email-m.szyprowski@samsung.com> <556CAE98.1080906@smart-cactus.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.smart-cactus.org ([54.187.36.80]:45740 "EHLO
	mail.smart-cactus.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753714AbbFDTdL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Jun 2015 15:33:11 -0400
In-Reply-To: <556CAE98.1080906@smart-cactus.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene@kernel.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>



On 06/01/2015 03:12 PM, Ben Gamari wrote:
> On 06/01/2015 06:10 AM, Marek Szyprowski wrote:
>> This patch adds System MMU nodes to all defined devices that are specific
>> to Exynos5420/5800/5422 series.
>
> Apologies in advance if Thunderbird mangles this message; my usual mail
> configuration has suffered an unfortunate run-in with a mug of tea.
>
> As someone who has devoted a few weekends trying to make the mainline
> kernel usable on an Odroid XU2, I can't help but notice that nearly
> every patchset that has hit this list recently excludes the Exynos 541x
> devices, including series which appear to go out of their way to support
> older devices. I would attribute this to the lack of publicly accessible
> documentation, but many of these patches are coming from Samsung
> employees.  Worse, the few patches that have been submitted for the 5410
> have languished in queue-purgatory. What is going on with support for
> this silicon?
>
> These devices really aren't that old but if Samsung insists that they
> aren't worth putting engineering time towards then perhaps they could at
> least release documentation? The Hardkernel folks are on the record[2]
> as saying there was a document under review. Perhaps this document could
> be quickly trimmed into a disclosable state? Even a quick-and-dirty
> documentation release would help my efforts substantially.
>
Could someone from Samsung please provide some sort of feedback here? It 
would be greatly appreciated.

Thanks,

- Ben
