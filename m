From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] PCI: exynos: missing clk_disable_unprepare() on error in
 exynos_pcie_probe()
Date: Wed, 02 Oct 2013 08:44:01 +0900
Message-ID: <003501cebf00$1b57fee0$5207fca0$%han@samsung.com>
References: <CAPgLHd_RTNxi-OYhmTZ35NttjnAg-gQ_WKHkUQr5ueMhXVLTMg@mail.gmail.com>
 <000301cebe46$42e86e00$c8b94a00$%han@samsung.com> <524AD2E3.9010808@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-reply-to: <524AD2E3.9010808@gmail.com>
Content-language: ko
Sender: linux-pci-owner@vger.kernel.org
To: 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>
Cc: 'Bjorn Helgaas' <bhelgaas@google.com>, 'Wei Yongjun' <weiyj.lk@gmail.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Grant Likely' <grant.likely@linaro.org>, 'Rob Herring' <rob.herring@calxeda.com>, 'Seungwon Jeon' <tgih.jun@samsung.com>, 'Wei Yongjun' <yongjun_wei@trendmicro.com.cn>, 'Jingoo Han' <jg1.han@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday, October 01, 2013 10:49 PM, Sylwester Nawrocki wrote:
> On 10/01/2013 03:33 AM, Jingoo Han wrote:
> > On Sunday, September 29, 2013 11:29 AM, Wei Yongjun wrote:
> >>
> >> From: Wei Yongjun<yongjun_wei@trendmicro.com.cn>
> >>
> >> Add the missing clk_disable_unprepare() before return
> >> from exynos_pcie_probe() in the error handling case.
> >>
> >> Signed-off-by: Wei Yongjun<yongjun_wei@trendmicro.com.cn>
> >
> > Acked-by: Jingoo Han<jg1.han@samsung.com>
> >
> > However, the commit name should be fixed as below:
> > [PATCH] PCI: exynos: use missing clk_disable_unprepare() on error in exynos_pcie_probe()
> 
> Perhaps just:
> 
> "PCI: exynos: Add missing clk_disable_unprepare() on error path
> 
> How can something that is missing be used ? :)

Hi Sylwester Nawrocki,

OK, I see.
The following looks good, as you mentioned.
[PATCH] PCI: exynos: Add missing clk_disable_unprepare() on error path

Thank you for your comment. :-)

Best regards,
Jingoo Han
