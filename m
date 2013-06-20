From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH V7 1/4] pci: Add PCIe driver for Samsung Exynos
Date: Thu, 20 Jun 2013 18:59:46 +0900
Message-ID: <00cf01ce6d9c$e5870540$b0950fc0$@samsung.com>
References: <00cb01ce6d99$0e932030$2bb96090$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <00cb01ce6d99$0e932030$2bb96090$@samsung.com>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Bjorn Helgaas' <bhelgaas@google.com>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 'Grant Likely' <grant.likely@secretlab.ca>, 'Andrew Murray' <andrew.murray@arm.com>, 'Thomas Petazzoni' <thomas.petazzoni@free-electrons.com>, 'Thierry Reding' <thierry.reding@avionic-design.de>, 'Jason Gunthorpe' <jgunthorpe@obsidianresearch.com>, 'Arnd Bergmann' <arnd@arndb.de>, 'Surendranath Gurivireddy Balla' <suren.reddy@samsung.com>, 'Siva Reddy Kallam' <siva.kallam@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, Jingoo Han <jg1.han@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thursday, June 20, 2013 6:32 PM, Jingoo Han wrote:
> 
> Exynos5440 has a PCIe controller which can be used as Root Complex.
> This driver supports a PCIe controller as Root Complex mode.
> 
> Signed-off-by: Surendranath Gurivireddy Balla <suren.reddy@samsung.com>
> Signed-off-by: Siva Reddy Kallam <siva.kallam@samsung.com>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  .../devicetree/bindings/pci/exynos-pcie.txt        |   71 ++
>  drivers/pci/host/Kconfig                           |    5 +
>  drivers/pci/host/Makefile                          |    1 +
>  drivers/pci/host/pci-exynos.c                      | 1057 ++++++++++++++++++++
>  4 files changed, 1134 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/exynos-pcie.txt
>  create mode 100644 drivers/pci/host/pci-exynos.c

Dear Bjorn Helgass,

Would you review this patch?
I have posted the Exynos PCIe patch for about 4 months.
But, I have not received your reply.
I need your feedback. :)
Thank you.

Best regards,
Jingoo Han
