From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: next-20170221 build: 2 failures 9 warnings (next-20170221)
Date: Tue, 21 Feb 2017 15:31:58 -0600
Message-ID: <20170221213158.GA26036@bhelgaas-glaptop.roam.corp.google.com>
References: <E1cg6WK-0000gP-QT@optimist>
 <20170221174737.2gf63ywzdjrh33ub@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170221174737.2gf63ywzdjrh33ub@sirena.org.uk>
Sender: linux-pci-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, linux-samsung-soc@vger.kernel.org, kernel-build-reports@lists.linaro.org, linux-pci@vger.kernel.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Feb 21, 2017 at 09:47:37AM -0800, Mark Brown wrote:
> On Tue, Feb 21, 2017 at 09:14:04AM +0000, Build bot for Mark Brown wrote:
> 
> Today's -next fails to build an ARM allmodconfig due to:
> 
> > 	arm-allmodconfig
> > ../drivers/pci/dwc/pci-exynos.c:132:25: error: 'struct exynos_pcie' has no member named 'pp'
> > ../drivers/pci/dwc/pci-exynos.c:162:25: error: 'struct exynos_pcie' has no member named 'pp'
> > ../drivers/pci/dwc/pci-exynos.c:185:25: error: 'struct exynos_pcie' has no member named 'pp'
> 
> due to b09d4ac91a3934e9 (PCI: dwc: all: Split struct pcie_port into
> host-only and core structures) which replaced the struct member pp with
> *pci but has missed some users.

Thanks a lot, Mark!

b09d4ac91a3934e9 converted all the users at the time, but 327847808474
("PCI: exynos: Refactor to make it easier to support other SoCs") from
another branch added some new uses, and I missed those when I merged the
branches together.  I think I fixed it but I can't build it personally.

Bjorn
