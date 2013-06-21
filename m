From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V9 1/4] pci: Add PCIe driver for Samsung Exynos
Date: Fri, 21 Jun 2013 09:40:48 +0530
Message-ID: <CAK9yfHxCy0JcvsFHo8gERefdiZhxi1J8MNALe5-g6ooTGR-QjA@mail.gmail.com>
References: <002001ce6e2e$623d7970$26b86c50$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <002001ce6e2e$623d7970$26b86c50$@samsung.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Siva Reddy Kallam <siva.kallam-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Surendranath Gurivireddy Balla <suren.reddy-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mohit KUMAR <Mohit.KUMAR-qxv4g6HH51o@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Jingoo,

Some small corrections inline.

On 21 June 2013 08:51, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Exynos5440 has a PCIe controller which can be used as Root Complex.
> This driver supports a PCIe controller as Root Complex mode.
>
> Signed-off-by: Surendranath Gurivireddy Balla <suren.reddy-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Siva Reddy Kallam <siva.kallam-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
>  .../devicetree/bindings/pci/designware-pcie.txt    |   73 ++
>  drivers/pci/host/Kconfig                           |    9 +
>  drivers/pci/host/Makefile                          |    1 +
>  drivers/pci/host/pci-designware.c                  | 1057 ++++++++++++++++++++
>  4 files changed, 1140 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/designware-pcie.txt
>  create mode 100644 drivers/pci/host/pci-designware.c
>
> diff --git a/Documentation/devicetree/bindings/pci/designware-pcie.txt b/Documentation/devicetree/bindings/pci/designware-pcie.txt
> new file mode 100644
> index 0000000..e4681e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/designware-pcie.txt
> @@ -0,0 +1,73 @@
> +* Synopsis Designware PCIe interface
> +
> +Required properties:
> +-compatible: should contain "snps,dw-pcie" to identify the
> +       core, plus an identifier for the specific instance, such
> +       as "samsung,exynos5440-pcie".
> +-reg: base addresses and lengths of the pcie conteroller,

s/conteroller/controller

> +       the phy controller, additional register for the phy controller.
> +- interrupts: interrupt values for level interrupt,
> +       pulse interrupt, special interrupt.
> +- clocks: from common clock binding: handle to pci clock.
> +- clock-names: from common clock binding: Shall be "pcie", "pcie_bus".

s/Shall be .../should be "pcie" and "pcie_bus".

[snip]

> +
> +MODULE_AUTHOR("Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>");
> +MODULE_DESCRIPTION("Samsung PCIe host controller driver");
> +MODULE_LICENSE("GPLv2");

I think this should be "GPL v2"  (with a space between GPL and v2).


-- 
With warm regards,
Sachin
