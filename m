From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v4 0/6] clk/exynos5250: add clocks for hdmi subsystem
Date: Tue, 30 Jul 2013 14:08:14 -0700
Message-ID: <20130730210814.5270.44742@quantum>
References: <1374728857-4208-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1374728857-4208-1-git-send-email-rahul.sharma@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, joshi@samsung.com, inki.dae@samsung.com, thomas.abraham@linaro.org, s.nawrocki@samsung.com, r.sh.open@gmail.com, Cho KyongHo <pullip.cho@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Rahul Sharma (2013-07-24 22:07:31)
> Add clock changes for hdmi subsystem for exynos5250 SoC. These
> include addition of new clocks like mout_hdmi and smmu_tv, associating
> ID to clk_hdmiphy and some essential corrections.
> 
> This set is based on kukjin's for-next branch at
> http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git.

I've taken patches 2-4 into the clk-next branch. Patch #1 can be
dropped.

Patches 5 & 6 need to be rebased onto clk-next as the g2d clock has
reserved mapping 345.  Also I've cc'd Cho KyongHo who is rebasing his
system mmu clock patch[1] onto clk-next. Can the two of your coordinate
your changes to avoid mapping conflicts in the binding? Perhaps Rahul
can carry Cho's patch in his next version when he rebases patches 5 & 6.

Thanks,
Mike

[1] https://lkml.org/lkml/2013/7/30/51

> 
> V4:
> 1) Added Arun's patch hdmi clock number correction in this series.
> 2) Corrected clock number for smmu_mixer
> 
> V3:
> 1) Rebase to kgene for-next based on 3.11-rc1.
> 2) Added Tushar's patch in the series.
> 
> V2:
> 1) Dropped "clk/exynos5250: Fix HDMI clock number in documentation" as
> it already get merged.
> 
> Arun Kumar K (1):
>   clk/exynos5250: Fix HDMI clock number in documentation
> 
> Rahul Sharma (4):
>   clk/exynos5250: add mout_hdmi mux clock for hdmi
>   clk/exynos5250: add sclk_hdmiphy in the list of special clocks
>   clk/exynos5250: add clock for mixer sysmmu
>   clk/exynos5250: change parent to aclk200_disp1 for hdmi subsystem
> 
> Tushar Behera (1):
>   Documentation: exynos5250-clock: Add div_i2s1 and div_i2s2
> 
>  .../devicetree/bindings/clock/exynos5250-clock.txt |   14 +++++++++++++-
>  drivers/clk/samsung/clk-exynos5250.c               |   20 ++++++++++++++------
>  2 files changed, 27 insertions(+), 7 deletions(-)
> 
> -- 
> 1.7.10.4
