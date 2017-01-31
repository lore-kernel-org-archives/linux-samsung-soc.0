From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] clk: samsung: exynos5433: Add IDs for
 PHYCLK_MIPIDPHY0_* clocks
Date: Tue, 31 Jan 2017 21:41:44 +0200
Message-ID: <20170131194144.b3n45kwshu2feqla@kozik-lap>
References: <1485345118-3082-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170125115214eucas1p1517ce7ca8fe88e4742a1306630b91d09@eucas1p1.samsung.com>
 <1485345118-3082-2-git-send-email-m.szyprowski@samsung.com>
 <20170125200631.ubt3x6jhoi367ex6@kozik-lap>
 <45f50263-6c5f-bbc6-1e24-a386dbabb496@samsung.com>
 <fa7f7ac4-5ac7-435e-a076-b18bf332388b@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wj0-f195.google.com ([209.85.210.195]:34418 "EHLO
        mail-wj0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752013AbdAaTlu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 31 Jan 2017 14:41:50 -0500
Content-Disposition: inline
In-Reply-To: <fa7f7ac4-5ac7-435e-a076-b18bf332388b@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>

On Fri, Jan 27, 2017 at 12:34:57PM +0100, Sylwester Nawrocki wrote:
> On 01/27/2017 12:05 PM, Sylwester Nawrocki wrote:
> > Cc: linux-clk@vger.kernel.org
> > 
> > On 01/25/2017 09:06 PM, Krzysztof Kozlowski wrote:
> >> On Wed, Jan 25, 2017 at 12:51:57PM +0100, Marek Szyprowski wrote:
> >>> Add missing identifiers for phyclk_mipidphy0_bitclkdiv8_phy and
> >>> phyclk_mipidphy0_rxclkesc0_phy clocks. Access to those clocks is needed
> >>> to setup initial clock configuration for display subsystem in device tree
> >>> in order to avoid dependency on the configuration left by the bootloader.
> >>>
> >>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >>> ---
> >>>  drivers/clk/samsung/clk-exynos5433.c   | 6 ++++--
> >>>  include/dt-bindings/clock/exynos5433.h | 5 ++++-
> >>>  2 files changed, 8 insertions(+), 3 deletions(-)
> >>>
> >> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> >>
> >> Sylwester,
> >> Could you provide a tag with this?
> > 
> > I have the tag prepared already, but please resend the patch to
> > linux-clk@vger.kernel.org and I will reply there.
> > The patches were sent only to the linux-samsung-soc mailing list.
> 
> Krzysztof, if you need this patch series as a dependency here is the tag:
> 
>  The following changes since commit 0c744ea4f77d72b3dcebb7a8f2684633ec79be88:
> 
>   Linux 4.10-rc2 (2017-01-01 14:31:53 -0800)
> 
> are available in the git repository at:
> 
>   git://linuxtv.org/snawrocki/samsung.git tags/clk-v4.11-samsung-dphy
> 
> for you to fetch changes up to 698e0d1d22346ef03d7a13fcd9c2cc86a24bf317:
> 
>   clk: samsung: exynos5433: Add data for 250MHz and 278MHz PLL rates
> (2017-01-27 11:34:00 +0100)
>

Thanks, pulled.

Best regards,
Krzysztof
