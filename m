From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v5 00/15] exynos5420: clock file cleanup
Date: Thu, 08 May 2014 13:54:44 +0200
Message-ID: <536B7084.7010002@samsung.com>
References: <1399548484-20626-1-git-send-email-shaik.ameer@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:20454 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753261AbaEHLys (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 07:54:48 -0400
In-reply-to: <1399548484-20626-1-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shaik Ameer Basha <shaik.ameer@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, shaik.samsung@gmail.com, r.sh.open@gmail.com, alim.akhtar@samsung.com

Hi Shaik,

On 08.05.2014 13:27, Shaik Ameer Basha wrote:
> Many changes/fixes have been identified for clock file for exynos5420.
> These include correct parents, bit fields, new clocks etc. Existing
> files needs some correction in terms of names of the clock and
> indentation. These issues are addressed in this patch series.
> 
> This patch series is rebased on,
> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git:3.15-rc4
> 
> This patch is also dependent on the following patch.
> clk: exynos5420: Add clock IDs needed by GPU
>     -- http://www.spinics.net/lists/arm-kernel/msg326461.html
> 
> This patch series is tested on Exynos5420 based peach-pit board.
>     -- [PATCH v4 0/2] Add peach-pit board support
> 
> Clock Summary before and after applying this patch series:
> ----------------------------------------------------------
> http://slexy.org/view/s2KMWxI3wv
> 
> As per Tomasz Figa's sugession, one more patch will be sent on
> top of this patch series to remove the unnecessary clocks
> related to GATE_BUS_* offsets.
> 
> Changes since v4:
> -----------------
> Addressed review comments from Tomasz Figa related to
> CLK_SET_RATE_PARENT and CLK_IGNORE_UNUSED.
> 
> Changes since v3:
> -----------------
> Addressed review comments from Tomasz Figa and Alim Akhtar
> Some of the changes includes,
> 1] Adding clock IDs for all the added gate clocks.
> 2] Followed bit ordering while defining new clocks.
> 3] Adding SET_RATE_PARENT flag for all the clocks having
>    dividers as parents.
> 
> Changes since v2:
> -----------------
> 1] Addressed review comments from Gerhard Sittig and Tomasz Figa.
> 
> Changes since v1:
> -----------------
> 1] Addressed review comments from Tomasz Figa.
>     http://www.spinics.net/lists/devicetree/msg16759.html
>     http://www.spinics.net/lists/devicetree/msg16760.html
> 
> Shaik Ameer Basha (15):
>   clk: exynos5420: Rename mux parent arrays
>   clk: exynos5420: add clocks for ISP block
>   clk: exynos5420: update clocks for GSCL and MSCL blocks
>   clk: exynos5420: fix parent clocks for mscl sysmmu
>   clk: exynos5420: update clocks for G2D and G3D blocks
>   clk: exynos5420: update clocks for DISP1 block
>   clk: exynos5420: update clocks for PERIC block
>   clk: exynos5420: update clocks for PERIS and GEN blocks
>   clk: exynos5420: update clocks for WCORE block
>   clk: exynos5420: update clocks for FSYS and FSYS2 blocks
>   clk: exynos5420: correct sysmmu-mfc parent clocks
>   clk: exynos5420: fix register offset for sclk_bpll
>   clk: exynos5420: update clocks for MAU Block
>   clk: exynos5420: add misc clocks
>   clk: exynos5420: add more registers to restore list
> 
>  arch/arm/boot/dts/exynos5420.dtsi      |   14 +-
>  drivers/clk/samsung/clk-exynos5420.c   |  853 ++++++++++++++++++++------------
>  include/dt-bindings/clock/exynos5420.h |   37 +-
>  3 files changed, 576 insertions(+), 328 deletions(-)
> 

Looks good. Will apply.

Best regards,
Tomasz
