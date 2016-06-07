From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [GIT PULL 6/8] arm64: dts: exynos: DTS for v4.8
Date: Tue, 07 Jun 2016 08:32:23 +0200
Message-ID: <57566A77.6080104@samsung.com>
References: <1465215933-22709-1-git-send-email-k.kozlowski@samsung.com>
 <1465215933-22709-7-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:62938 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751461AbcFGGc3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jun 2016 02:32:29 -0400
In-reply-to: <1465215933-22709-7-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>

On 06/06/2016 02:25 PM, Krzysztof Kozlowski wrote:
> The following changes since commit 1a695a905c18548062509178b98bc91e67510864:
> 
>   Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-4.8
> 
> for you to fetch changes up to 8b77005c40376816885b100bcd358887d29e323f:
> 
>   arm64: dts: exynos: Use human-friendly symbols for timer interrupt flags (2016-05-30 08:45:34 +0200)
> 
> ----------------------------------------------------------------
> Samsung DeviceTree arm64 update for v4.8:
> 1. Minor cleanup.
> 
> ----------------------------------------------------------------
> Krzysztof Kozlowski (1):
>       arm64: dts: exynos: Use human-friendly symbols for timer interrupt flags

Please drop this pull request.

The patch should be rebased on top of Marc Zyngier's fix:
 - arm64: dts: Fix broken architected timer interrupt trigger
   http://www.spinics.net/lists/arm-kernel/msg508809.html

I will resend when Marc's patch hits current release.

Best regards,
Krzysztof
