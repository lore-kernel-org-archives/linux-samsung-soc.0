From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/2] clk: samsung: exynos5422: add missing parent GSCL
 block clocks
Date: Wed, 16 Dec 2015 18:23:56 +0100
Message-ID: <56719E2C.2030103@samsung.com>
References: <1449582415-30164-1-git-send-email-m.szyprowski@samsung.com>
 <5667B2F3.9040807@samsung.com> <5667FEF3.4080703@samsung.com>
 <56682E44.6020303@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:25722 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933033AbbLPR0A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Dec 2015 12:26:00 -0500
In-reply-to: <56682E44.6020303@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: k.kozlowski.k@gmail.com, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Kukjin Kim <kgene@kernel.org>, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>

Krzysztof,

On 09/12/15 14:36, Krzysztof Kozlowski wrote:
> W dniu 09.12.2015 o 19:14, Sylwester Nawrocki pisze:
>> > Adding Stephen and linux-clk at Cc.
>> > 
>> > On 09/12/15 05:49, Krzysztof Kozlowski wrote:
>>> >> On 08.12.2015 22:46, Marek Szyprowski wrote:
>>>>> >>>> This patch adds clocks, which are required for preserving parent clock
>>>>> >>>> configuration on GSCL power domain on/off.
>>>>> >>>>
>>>>> >>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>> >>>> ---
>>>>> >>>>  drivers/clk/samsung/clk-exynos5420.c   | 8 ++++----
>>>>> >>>>  include/dt-bindings/clock/exynos5420.h | 2 ++
>>>>> >>>>  2 files changed, 6 insertions(+), 4 deletions(-)
>>> >>
>>> >> I suppose that, with ack from clock folks, this can go through samsung-soc?
>> > 
>> > I guess it makes more sense that making a stable branch with just
>> > this patch to be pulled into arm-soc and clk tree. I'm fine with
>> > applying this patch through arm-soc, but I think we also need
>> > Mike's or Stephen ack for this.
>> > 
>> > Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>
> I am fine with the branch approach (actually in such cases I make them
> anyway just in case).
> 
> As you suggested I'll wait for Mike's or Stepen's acks.

I've put the $subject patch and the other exynos5420 patch which 
was a dependency for dts patches (both touching include/dt-bindings/
clock/exynos5420.h) onto a stable branch. Below are details if 
you need to pull.


The following changes since commit 9f9499ae8e6415cefc4fe0a96ad0e27864353c89:

  Linux 4.4-rc5 (2015-12-13 17:42:58 -0800)

are available in the git repository at:

  git://linuxtv.org/snawrocki/samsung.git tags/for-4.5-clk-exynos5420

for you to fetch changes up to bee4f87f01dc30fcf9e05eb55b833f89fd9bb4f4:

  clk: samsung: exynos5420: add cpu clock configuration data and instantiate cpu clock (2015-12-16 16:35:26 +0100)

----------------------------------------------------------------
Samsung exynos5420 SoC clk subsystem support updates:
instantiation of the cpu clocks and addition of the GSCL
IP parent clocks to the list of available consumer clocks.

----------------------------------------------------------------
Marek Szyprowski (1):
      clk: samsung: exynos542x: add missing parent GSCL block clocks

Thomas Abraham (1):
      clk: samsung: exynos5420: add cpu clock configuration data and instantiate cpu clock

 drivers/clk/samsung/clk-exynos5420.c   |   66 +++++++++++++++++++++++++++++---
 include/dt-bindings/clock/exynos5420.h |    4 ++
 2 files changed, 64 insertions(+), 6 deletions(-)

-- 
Thanks
Sylwester
