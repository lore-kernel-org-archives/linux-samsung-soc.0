From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/2] clk: samsung: exynos5422: add missing parent GSCL
 block clocks
Date: Tue, 22 Dec 2015 20:39:01 +0100
Message-ID: <5679A6D5.5010604@samsung.com>
References: <1449582415-30164-1-git-send-email-m.szyprowski@samsung.com>
 <5667B2F3.9040807@samsung.com> <5667FEF3.4080703@samsung.com>
 <56682E44.6020303@samsung.com> <56719E2C.2030103@samsung.com>
 <567208C4.4090806@samsung.com> <20151222184412.GD6596@quark.deferred.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <20151222184412.GD6596@quark.deferred.io>
Sender: linux-clk-owner@vger.kernel.org
To: Mike Turquette <mturquette@baylibre.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, k.kozlowski.k@gmail.com, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
List-Id: linux-samsung-soc@vger.kernel.org

Mike,

On 22/12/15 19:44, Mike Turquette wrote:
> This is superseded by the pull request found in Message-ID:
> <5671A456.9030203@samsung.com>, correct?

The two pull requests are based on same branch, first 2 commits are
tagged with for-4.5-clk-exynos5420 tag and the whole branch is tagged
as clk-samsung-4.5. I assumed it's fine to use just the below tag for
arm-soc.

>>> > > The following changes since commit 9f9499ae8e6415cefc4fe0a96ad0e27864353c89:
>>> > > 
>>> > >   Linux 4.4-rc5 (2015-12-13 17:42:58 -0800)
>>> > > 
>>> > > are available in the git repository at:
>>> > > 
>>> > >   git://linuxtv.org/snawrocki/samsung.git tags/for-4.5-clk-exynos5420
>>> > > 
>>> > > for you to fetch changes up to bee4f87f01dc30fcf9e05eb55b833f89fd9bb4f4:
>>> > > 
>>> > >   clk: samsung: exynos5420: add cpu clock configuration data and instantiate cpu clock (2015-12-16 16:35:26 +0100)
>>> > > 
>>> > > ----------------------------------------------------------------
>>> > > Samsung exynos5420 SoC clk subsystem support updates:
>>> > > instantiation of the cpu clocks and addition of the GSCL
>>> > > IP parent clocks to the list of available consumer clocks.
>>> > > 
>>> > > ----------------------------------------------------------------
>>> > > Marek Szyprowski (1):
>>> > >       clk: samsung: exynos542x: add missing parent GSCL block clocks
>>> > > 
>>> > > Thomas Abraham (1):
>>> > >       clk: samsung: exynos5420: add cpu clock configuration data and instantiate cpu clock
>>> > > 
>>> > >  drivers/clk/samsung/clk-exynos5420.c   |   66 +++++++++++++++++++++++++++++---
>>> > >  include/dt-bindings/clock/exynos5420.h |    4 ++
>>> > >  2 files changed, 64 insertions(+), 6 deletions(-)

--
Regards,
Sylwester

