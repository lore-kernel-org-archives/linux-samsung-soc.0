From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [GIT PULL] ARM: EXYNOS: dts: Improvements for 4.2, second try
Date: Sun, 17 May 2015 11:05:53 +0900
Message-ID: <5557F781.3060405@kernel.org>
References: <1431314022-17062-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:48587 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750774AbbEQCGG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 16 May 2015 22:06:06 -0400
In-Reply-To: <1431314022-17062-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Inha Song <ideal.song@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>, Jacek Anaszewski <j.anaszewski@samsung.com>

On 05/11/15 12:13, Krzysztof Kozlowski wrote:
> Dear Kukjin,
> 
> I gathered various improvements for upcoming 4.2 merge window.
> Description along with a tag.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 2495ae559826c60e3ccde9850e3b38815725b9c9:
> 
>   ARM: dts: Add keep-power-in-suspend to WiFi SDIO node for Peach Boards (2015-05-11 11:00:00 +0900)
> 
> are available in the git repository at:
> 
>   https://github.com/krzk/linux.git tags/samsung-dt-for-next-4.2-2
> 
> for you to fetch changes up to c5f41228c9fad4c7343df8547b870766163b76dc:
> 
>   ARM: dts: exynos3250-rinato: add support for JPEG codec (2015-05-11 11:01:57 +0900)
> 
Hi,

I've applied all of changes you requested with sorting them out.

Thanks and please test on your own boards with samsung's for-next then
if anything, let us know.

Note, I think re-post to use lables in dt would be better based on
current for-next.

Thanks,
Kukjin
