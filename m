From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 2/5] ARM: dts: exynos: DT for v4.7
Date: Sun, 24 Apr 2016 23:18:58 +0200
Message-ID: <5773702.Vl2lnk0PfR@wuerfel>
References: <1460541682-32417-1-git-send-email-k.kozlowski@samsung.com> <1460541682-32417-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:53604 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753198AbcDXVTg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 24 Apr 2016 17:19:36 -0400
In-Reply-To: <1460541682-32417-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Wednesday 13 April 2016 12:01:19 Krzysztof Kozlowski wrote:
> Samsung Device Tree updates and improvements for v4.7:
> 1. Enable accelerated AES (Security SubSystem) on Exynos4412-based boards.
> 2. Enable HDMI CEC on Exynos4412-based Odroid.
> 3. Add regulator supplies for eMMC/SD on Odroid XU3/XU4.
> 4. Fix DTC unit name warnings.
> 5. Merge topic branch of new Artik5 board.
> 

Pulled into next/dt. Thanks for splitting this into a separate branch
aside from the Artik5 stuff, that makes sense. Two minor things you
could have done even better:

- split out the DTC unit name warning fixes into yet another branch,
  as there are lots of them and they are unrelated to the rest

- not merge the Artik5 changes into this, but let us deal with
  any conflicts ourselves.

	Arnd
