From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 5/6] ARM: EXYNOS: Enable multi-platform build support
Date: Tue, 22 Apr 2014 21:56:48 +0200
Message-ID: <201404222156.48432.arnd@arndb.de>
References: <1397554134-11827-1-git-send-email-sachin.kamat@linaro.org> <1397554134-11827-6-git-send-email-sachin.kamat@linaro.org> <CAOesGMh0VdSbQ1fSjGkJOG+BDeNfo4NNQjtiznh18DxSROaT1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.131]:53303 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753367AbaDVT5B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Apr 2014 15:57:01 -0400
In-Reply-To: <CAOesGMh0VdSbQ1fSjGkJOG+BDeNfo4NNQjtiznh18DxSROaT1A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

On Tuesday 22 April 2014, Olof Johansson wrote:
> I don't think there's a point in keeping this around. A
> "single-platform" config is just enabling a single platform in the
> config, it's not a specific option. I don't think any of the other
> platforms use anything like this today.

The only one doing that is shmobile, but only because they have
some SoCs that are multiplatform capable and some that are not.
This isn't the case for Exynos, so it should no longer be needed.

When I originally created this patch 18 months ago, there were a
number of drivers that broke when multiplatform got enabled.
Now the cpufreq driver is the only one left, but it seems that
it will make it for 3.16, and I wouldn't wait for it if it doesn't.
Let's just do multiplatform-only.

	Arnd
