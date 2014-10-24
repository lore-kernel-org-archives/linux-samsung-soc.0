From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 5/5] ARM: dts: Add dts files for Exynos4415 SoC
Date: Fri, 24 Oct 2014 15:34:48 +0200
Message-ID: <544A5578.7030009@samsung.com>
References: <1413775749-17539-1-git-send-email-cw00.choi@samsung.com>
 <1413775935-17743-5-git-send-email-cw00.choi@samsung.com>
 <CAD8Lp46Y1WBF2Bq5SKtQDZ4kUb2fDCsbBs1THFWcV=8-OXh_SQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45854 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756582AbaJXNex (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Oct 2014 09:34:53 -0400
In-reply-to: <CAD8Lp46Y1WBF2Bq5SKtQDZ4kUb2fDCsbBs1THFWcV=8-OXh_SQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, Russell King <linux@arm.linux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>, thomas.abraham@linaro.org, Linus Walleij <linus.walleij@linaro.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, InKi Dae <inki.dae@samsung.com>, geunsik.lim@samsung.com, jh80.chung@samsung.com, jaewon02.kim@samsung.com, ideal.song@samsung.com, yj44.cho@samsung.com

Hello,

On 2014-10-24 15:23, Daniel Drake wrote:
> On Sun, Oct 19, 2014 at 9:32 PM, Chanwoo Choi <cw00.choi@samsung.com> wrote:
>> This patch adds new exynos4415.dtsi to support Exynos4415 SoC
>> based on Cortex-A9 quad cores and includes following dt nodes:
> There's a lot in common between your new exynos4415.dtsi and the
> existing exynos4.dtsi.
> Would it make more sense for the 4415 code to extend the existing
> exynos4.dtsi like the other Exynos4 variants do?

Well, I also thought about such approach, but there are some fundamental 
differences:
interrupt and clock controllers are completely different. Using a common 
exynos4.dtsi
and overriding them in every node will result in a code, which is a bit 
hard to follow.
IMHO with such differences justifies using separate base dtsi file.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
