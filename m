From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] PCI: exynos: missing clk_disable_unprepare() on error in
 exynos_pcie_probe()
Date: Tue, 01 Oct 2013 10:33:41 +0900
Message-ID: <000301cebe46$42e86e00$c8b94a00$%han@samsung.com>
References: <CAPgLHd_RTNxi-OYhmTZ35NttjnAg-gQ_WKHkUQr5ueMhXVLTMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-reply-to: <CAPgLHd_RTNxi-OYhmTZ35NttjnAg-gQ_WKHkUQr5ueMhXVLTMg@mail.gmail.com>
Content-language: ko
Sender: linux-pci-owner@vger.kernel.org
To: 'Bjorn Helgaas' <bhelgaas@google.com>, 'Wei Yongjun' <weiyj.lk@gmail.com>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Grant Likely' <grant.likely@linaro.org>, 'Rob Herring' <rob.herring@calxeda.com>, 'Seungwon Jeon' <tgih.jun@samsung.com>, 'Wei Yongjun' <yongjun_wei@trendmicro.com.cn>, 'Jingoo Han' <jg1.han@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Sunday, September 29, 2013 11:29 AM, Wei Yongjun wrote:
> 
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Add the missing clk_disable_unprepare() before return
> from exynos_pcie_probe() in the error handling case.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Acked-by: Jingoo Han <jg1.han@samsung.com>

However, the commit name should be fixed as below:
[PATCH] PCI: exynos: use missing clk_disable_unprepare() on error in exynos_pcie_probe()

Best regards,
Jingoo Han

> ---
>  drivers/pci/host/pci-exynos.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
