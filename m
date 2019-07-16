From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v1 01/50] clk: samsung: add new IDs for Exynos5420
 clocks
Date: Tue, 16 Jul 2019 18:49:50 +0900
Message-ID: <f8ff72f9-4a55-40c6-fdb9-bb4cddd00cf9@samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124434eucas1p273e2efaad8bc3904c6f76cc1671aeb6c@eucas1p2.samsung.com>
        <20190715124417.4787-2-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-2-l.luba@partner.samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Usually, when developing the clock controller driver,
define the same sequence between the definition sequence in dt-bibing
and clock driver. As I replied, if you squash patches, it is easy.

For example,
This series add clock id as following.
                                                                             
 569         MUX(CLK_MOUT_ACLK400_ISP, "mout_aclk400_isp", mout_group1_p,            
 570                         SRC_TOP0, 0, 2),                                        
 571         MUX(CLK_MOUT_ACLK400_MSCL, "mout_aclk400_mscl", mout_group1_p,          
 572                         SRC_TOP0, 4, 2),                                        
 573         MUX(CLK_MOUT_ACLK400_WCORE, "mout_aclk400_wcore", mout_group1_p,        
 574                         SRC_TOP0, 16, 2),                                       
 575         MUX(CLK_MOUT_ACLK100_NOC, "mout_aclk100_noc", mout_group1_p,            
 576                         SRC_TOP0, 20, 2),          

In case of this code, you can define the IDs as following sequentially:

#define CLK_MOUT_ACLK400_ISP ...
#define CLK_MOUT_ACLK400_MSCL ... 
#define CLK_MOUT_ACLK400_WCORE ...
#define CLK_MOUT_ACLK100_NOC ...


But, this series define the ID as following:
	#define CLK_MOUT_ACLK400_WCORE          662                                     
#define CLK_MOUT_SCLK_DPLL      663                                             
	#define CLK_MOUT_ACLK100_NOC    664                                             
#define CLK_MOUT_ACLK200_FSYS2  665                                             
#define CLK_MOUT_PCLK200_FSYS   666                                             
#define CLK_MOUT_ACLK200_FSYS   667                                             
	#define CLK_MOUT_ACLK400_ISP    668                                             
	#define CLK_MOUT_ACLK400_MSCL   669                                             
#define CLK_MOUT_SCLK_MPLL      700                                             
#define CLK_MOUT_ACLK266        701                                             
#define CLK_MOUT_UART0          702                                             
#define CLK_MOUT_UART1          703                                             
#define CLK_MOUT_UART2          704                                             
#define CLK_MOUT_UART3          7

On 19. 7. 15. 오후 9:43, Lukasz Luba wrote:
> There is a need of new IDs which will be used for modeling proper hierarchy
> in the Exynos54xx SoCs. Previous implementation rely on bootloader
> settings, which are not configuring properly some clocks.
> These IDs provide interface to set proper parents.
> 
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>  include/dt-bindings/clock/exynos5420.h | 27 +++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/exynos5420.h b/include/dt-bindings/clock/exynos5420.h
> index 02d5ac469a3d..c37a28eeaf7e 100644
> --- a/include/dt-bindings/clock/exynos5420.h
> +++ b/include/dt-bindings/clock/exynos5420.h
> @@ -230,6 +230,30 @@
>  #define CLK_MOUT_USER_MAU_EPLL	659
>  #define CLK_MOUT_SCLK_SPLL	660
>  #define CLK_MOUT_MX_MSPLL_CCORE_PHY	661
> +#define CLK_MOUT_ACLK400_WCORE		662
> +#define CLK_MOUT_SCLK_DPLL	663
> +#define CLK_MOUT_ACLK100_NOC	664
> +#define CLK_MOUT_ACLK200_FSYS2	665
> +#define CLK_MOUT_PCLK200_FSYS	666
> +#define CLK_MOUT_ACLK200_FSYS	667
> +#define CLK_MOUT_ACLK400_ISP	668
> +#define CLK_MOUT_ACLK400_MSCL	669
> +#define CLK_MOUT_SCLK_MPLL	700
> +#define CLK_MOUT_ACLK266	701
> +#define CLK_MOUT_UART0		702
> +#define CLK_MOUT_UART1		703
> +#define CLK_MOUT_UART2		704
> +#define CLK_MOUT_UART3		705
> +#define CLK_MOUT_SCLK_CPLL	706
> +#define CLK_MOUT_PWM		707
> +#define CLK_MOUT_ACLK266_G2D		708
> +#define CLK_MOUT_SW_ACLK400_WCORE	709
> +#define CLK_MOUT_SW_ACLK400_MSCL	710
> +#define CLK_MOUT_SW_ACLK400_ISP		711
> +#define CLK_MOUT_SW_ACLK266_ISP		712
> +#define CLK_MOUT_USER_ACLK266_ISP	713
> +#define CLK_MOUT_ACLK266_ISP	714
> +#define CLK_MOUT_MMC0		715
>  
>  /* divider clocks */
>  #define CLK_DOUT_PIXEL		768
> @@ -264,8 +288,9 @@
>  #define CLK_FF_DOUT_SPLL2	797
>  #define CLK_DOUT_PCLK_DREX0	798
>  #define CLK_DOUT_PCLK_DREX1	799
> +#define CLK_DOUT_ACLK266_ISP	800
>  
>  /* must be greater than maximal clock id */
> -#define CLK_NR_CLKS		800
> +#define CLK_NR_CLKS		801
>  
>  #endif /* _DT_BINDINGS_CLOCK_EXYNOS_5420_H */
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
