From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [GIT PULL] Samsung related to updating multi_v7_defconfig
Date: Sat, 23 May 2015 11:16:36 +0900
Message-ID: <555FE304.5090706@kernel.org>
References: <555D4BF5.20008@kernel.org> <2227456.dXyEpqfCYe@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:38956 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756569AbbEWCQr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 May 2015 22:16:47 -0400
In-Reply-To: <2227456.dXyEpqfCYe@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, arm@kernel.org, Kevin Hilman <khilman@linaro.org>, Kukjin Kim <kgene@kernel.org>, 'Olof Johansson' <olof@lixom.net>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

On 05/23/15 00:15, Arnd Bergmann wrote:
> On Thursday 21 May 2015 12:07:33 Kukjin Kim wrote:
>>
>> Here is multi_v7_defconfig update and mostly including regarding exynos
>> stuff based on savedefconfig which could remove useless configs based on
>> checking of dependencies.
>>
>> This series is based on v4.1-rc1 and I can provide resolution of
>> conflicts with arm-soc/next/defconfig. See below.
>>
>> Note that, IMHO we need to check 'savedefconfig when defconfig is
>> updated so that we could remove useless lines and avoid to miss some
>> defconfigs because of dependency.
>>
>> Anyway please pull and if any concerns, please kindly let me know.
>>
Hi,

> The conflict got a little too wild for my taste, so I dropped your
> 'savedefconfig' commit and rebased the other ones on top of the
> branch I already had.
> 
OK, no problem :-)

> Please check that the result is still ok for you.
> 
When I checked, I didn't find any missing stuff from my side. Looks
good, thanks.

- Kukjin
