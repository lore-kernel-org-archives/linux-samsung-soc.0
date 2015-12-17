From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [GIT PULL 0/9] ARM: EXYNOS: Pull request for v4.5
Date: Thu, 17 Dec 2015 10:43:02 +0900
Message-ID: <56721326.30004@samsung.com>
References: <1449020386-20250-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:31199 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753811AbbLQBnG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Dec 2015 20:43:06 -0500
In-reply-to: <1449020386-20250-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 02.12.2015 10:39, Krzysztof Kozlowski wrote:
> Hi Kukjin,
> 
> A lot of stuff for v4.5 with 3 dependencies split into
> separate tags. The need for dependency is explained both
> in merge-commit and in description of a tag which is using
> the dependency.

Hi everyone,

It's been like two weeks... we are after v4.4-rc5 and Christmas season
is coming... there are some dependencies here and even more stuff waits
out of queue for this pull request (moving SROM and PMU to drivers/soc,
cpufreq for Exynos542x).

What I want to say is that I am really not sure whether further waiting
is beneficial...
All these patches have been boiling in linux-next for some time (through
my tree).


Are there any comments about this pull request? Ordering of branches?
Weird looking tags? Bugs? etc.? Anything waits in your tree Kukjin?


Maybe this could be pulled directly by arm-soc folks?


Best regards,
Krzysztof

> 
> The order goes like (but of course dependencies
> could be pulled all at once at beginning):
> 1. tags/samsung-dt-syscon-restart-4.5
> 2. tags/samsung-soc-4.5
> 3. tags/samsung-clk-arm64-symbols-4.5
> 4. tags/samsung-soc64-4.5
> 5. tags/samsung-drivers-4.5
> 6. tags/samsung-clk-exynos4-4.5
> 7. tags/samsung-dt-4.5
> 8. tags/samsung-dt64-4.5
> 9. tags/samsung-defconfig-4.5
> 
> I split dependencies to three tags so clock or other folks could
> easily grab them if needed.
> 
> Please share your comments or pull as early as possible as we have here
> some more dependencies than usual.
> 
> 
> Kind regards,
> Krzysztof
> 
