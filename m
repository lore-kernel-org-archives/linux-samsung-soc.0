From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] PCI: exynos: missing clk_disable_unprepare() on error in
 exynos_pcie_probe()
Date: Fri, 4 Oct 2013 16:50:39 -0600
Message-ID: <20131004225039.GA26108@google.com>
References: <CAPgLHd_RTNxi-OYhmTZ35NttjnAg-gQ_WKHkUQr5ueMhXVLTMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAPgLHd_RTNxi-OYhmTZ35NttjnAg-gQ_WKHkUQr5ueMhXVLTMg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: kgene.kim@samsung.com, tgih.jun@samsung.com, linux-pci@vger.kernel.org, jg1.han@samsung.com, rob.herring@calxeda.com, yongjun_wei@trendmicro.com.cn, linux-samsung-soc@vger.kernel.org, grant.likely@linaro.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, Sep 29, 2013 at 10:29:11AM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Add the missing clk_disable_unprepare() before return
> from exynos_pcie_probe() in the error handling case.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Applied with Jingoo's ack and Sylwester's subject line to
pci/host-exynos.  Thanks!

Bjorn

> ---
>  drivers/pci/host/pci-exynos.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/host/pci-exynos.c b/drivers/pci/host/pci-exynos.c
> index 94e096b..e25598a 100644
> --- a/drivers/pci/host/pci-exynos.c
> +++ b/drivers/pci/host/pci-exynos.c
> @@ -487,18 +487,24 @@ static int __init exynos_pcie_probe(struct platform_device *pdev)
>  
>  	elbi_base = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	exynos_pcie->elbi_base = devm_ioremap_resource(&pdev->dev, elbi_base);
> -	if (IS_ERR(exynos_pcie->elbi_base))
> -		return PTR_ERR(exynos_pcie->elbi_base);
> +	if (IS_ERR(exynos_pcie->elbi_base)) {
> +		ret = PTR_ERR(exynos_pcie->elbi_base);
> +		goto fail_bus_clk;
> +	}
>  
>  	phy_base = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>  	exynos_pcie->phy_base = devm_ioremap_resource(&pdev->dev, phy_base);
> -	if (IS_ERR(exynos_pcie->phy_base))
> -		return PTR_ERR(exynos_pcie->phy_base);
> +	if (IS_ERR(exynos_pcie->phy_base)) {
> +		ret = PTR_ERR(exynos_pcie->phy_base);
> +		goto fail_bus_clk;
> +	}
>  
>  	block_base = platform_get_resource(pdev, IORESOURCE_MEM, 2);
>  	exynos_pcie->block_base = devm_ioremap_resource(&pdev->dev, block_base);
> -	if (IS_ERR(exynos_pcie->block_base))
> -		return PTR_ERR(exynos_pcie->block_base);
> +	if (IS_ERR(exynos_pcie->block_base)) {
> +		ret = PTR_ERR(exynos_pcie->block_base);
> +		goto fail_bus_clk;
> +	}
>  
>  	ret = add_pcie_port(pp, pdev);
>  	if (ret < 0)
> 
