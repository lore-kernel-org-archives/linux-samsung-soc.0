From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCHv3 0/2] clk: samsung: Add clock controller driver for
 Exynos4415 SoC
Date: Tue, 28 Oct 2014 13:09:59 +0900
Message-ID: <02dd01cff265$0a846060$1f8d2120$@kernel.org>
References: <1414372318-594-1-git-send-email-cw00.choi@samsung.com>
 <544E20E3.5030609@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <544E20E3.5030609@samsung.com>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Chanwoo Choi' <cw00.choi@samsung.com>
Cc: tomasz.figa@gmail.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, inki.dae@samsung.com, geunsik.lim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Sylwester Nawrocki wrote:
> 
> On 27/10/14 02:11, Chanwoo Choi wrote:
> > Chanwoo Choi (2):
> >   clk: samsung: exynos4415: Add clocks using common clock framework
> >   clk: samsung: Document binding for Exynos4415 clock controller
> 
> Added both to my tree, thanks. In future please put DT binding
> documentation first in the series, before the actual driver patch.
> 
Hi Sylwester,

Can you please provide a topic branch for clk-exynos4415? Because exynos4415 dt
file needs inclusion of following header files.

+#include <dt-bindings/clock/exynos4415.h>
+#include <dt-bindings/clock/exynos-audss-clk.h>

Thanks,
Kukjin
