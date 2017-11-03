From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [GIT PULL] clk/samsung updates for v4.15, part 2
Date: Fri, 03 Nov 2017 16:40:36 +0100
Message-ID: <1940180d-438c-6774-aeb9-79907e83df9d@samsung.com>
References: <CGME20171016102923epcas1p445d71065cec89b9f62b9f02a5446c2dc@epcas1p4.samsung.com>
        <148bdf52-8e47-7696-f42d-98625d9dc43e@samsung.com>
        <20171031215141.GF30645@codeaurora.org>
        <48933534-41b1-82e3-5090-018acc7ed2a7@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:51388 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755491AbdKCPkq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Nov 2017 11:40:46 -0400
In-reply-to: <48933534-41b1-82e3-5090-018acc7ed2a7@samsung.com>
Content-language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>

On 11/02/2017 05:24 PM, Sylwester Nawrocki wrote:
> On 10/31/2017 10:51 PM, Stephen Boyd wrote:
>> Did you change keys recently? My older version of gnupg chokes on
>> your signature which is slightly concerning. The other PR didn't
>> have problems.
> I thought I didn't, In fact I moved the key from one machine to the other
> recently, but both pull requests should be signed in same way. Let me
> have a closer look.

I couldn't find anything wrong, the signatures looked good and git tag -v 
didn't report any issues. I regenerated the tag and the pull request, it's
inlined below. I didn't noticed earlier the tag is already pulled into
clk-next.

-- 
Regards,
Sylwester


The following changes since commit ae432a9b314e07d486acfadc4df2f922721e6757:

  clk: samsung: exynos-audss: Add support for runtime PM (2017-09-07 15:26:01 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/clk-v4.15-exynos-pm

for you to fetch changes up to 7679eb20353dc74e47fbc97b2d77fd4f88a77c0f:

  clk: samsung: Add a separate driver for Exynos4412 ISP clocks (2017-10-16 11:25:50 +0200)

----------------------------------------------------------------
clk/samsung updates for v4.15, part 2

 - An addition of separate driver for the Exynos 4412 ISP CMU, needed
   to model and properly handle the clock controller's dependencies
   on the ISP power domain.
 - Adding __maybe_unused attributes to the exynos5433_cmu_{suspend,
   resume} ops to suppress compiler warnings with CONFIG_PM disabled.

----------------------------------------------------------------
Arnd Bergmann (1):
      clk: samsung: exynos5433: mark PM functions as __maybe_unused

Marek Szyprowski (3):
      clk: samsung: Instantiate Exynos4412 ISP clocks only when available
      clk: samsung: Add dt bindings for Exynos4412 ISP clock controller
      clk: samsung: Add a separate driver for Exynos4412 ISP clocks

 Documentation/devicetree/bindings/clock/exynos4-clock.txt |  43 ++++++
 drivers/clk/samsung/Makefile                              |   1 +
 drivers/clk/samsung/clk-exynos4.c                         |  31 +++-
 drivers/clk/samsung/clk-exynos4412-isp.c                  | 179 ++++++++++++++++++++++++
 drivers/clk/samsung/clk-exynos5433.c                      |   4 +-
 include/dt-bindings/clock/exynos4.h                       |  35 +++++
 6 files changed, 284 insertions(+), 9 deletions(-)
 create mode 100644 drivers/clk/samsung/clk-exynos4412-isp.c
