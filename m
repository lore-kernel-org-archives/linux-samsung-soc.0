From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [GIT PULL 1/4] ARM: exynos: SoC/Mach for v4.9
Date: Mon, 12 Sep 2016 11:38:21 +0200
Message-ID: <9c7bb7bd-d347-03af-93c7-93534f43932d@samsung.com>
References: <1472548739-20050-1-git-send-email-k.kozlowski@samsung.com>
 <1472548739-20050-5-git-send-email-k.kozlowski@samsung.com>
 <5635206.ooNAZCeQOe@wuerfel> <20160902163244.GB5534@kozik-lap>
 <08dfc5c7-e844-023c-b5a8-9996dfb403ff@samsung.com>
 <20160908192434.GA609@sam-MacBookPro>
 <CGME20160912093826eucas1p1ac2f1f08b49026f456b52f507d0de9f4@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:55367 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755177AbcILJib (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Sep 2016 05:38:31 -0400
In-reply-to: <20160908192434.GA609@sam-MacBookPro>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sam Van Den Berge <sam.van.den.berge@telenet.be>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 09/08/2016 09:24 PM, Sam Van Den Berge wrote:
> Thanks for the suggestion and apologies for the late response. Last couple of 
> days I've been figuring out what this would involve and I decided that I want
> to give this a try. I found this patch series [1] that I'll use as an example.
> If I understand it correctly, I'll need to create a dma_slave_map and
> pass that via the platform data into the s3c24xx-dma driver. There I'll
> need to fill in the filter_map of the dma slave device. Right?

Yes, AFAIU that's what needs to be done.  Subsequently, related DMA
clients could be updated to not use dma_request_slave_channel_compat().

-- 
Thanks,
Sylwester
