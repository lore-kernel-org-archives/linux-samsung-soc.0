From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V8 1/4] pci: Add PCIe driver for Samsung Exynos
Date: Thu, 20 Jun 2013 15:20:48 +0200
Message-ID: <201306201520.49212.arnd@arndb.de>
References: <00db01ce6db3$7f9a3830$7ecea890$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <00db01ce6db3$7f9a3830$7ecea890$@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: 'Thomas Petazzoni' <thomas.petazzoni@free-electrons.com>, 'Jason Gunthorpe' <jgunthorpe@obsidianresearch.com>, linux-samsung-soc@vger.kernel.org, 'Siva Reddy Kallam' <siva.kallam@samsung.com>, 'Surendranath Gurivireddy Balla' <suren.reddy@samsung.com>, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, 'Thierry Reding' <thierry.reding@avionic-design.de>, linux-kernel@vger.kernel.org, 'Grant Likely' <grant.likely@secretlab.ca>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Mohit KUMAR' <Mohit.KUMAR@st.com>, 'Bjorn Helgaas' <bhelgaas@google.com>, 'Andrew Murray' <andrew.murray@arm.com>, 'Pratyush Anand' <pratyush.anand@st.com>, 'Tomasz Figa' <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thursday 20 June 2013, Jingoo Han wrote:

> diff --git a/Documentation/devicetree/bindings/pci/exynos-pcie.txt b/Documentation/devicetree/bindings/pci/exynos-pcie.txt
> new file mode 100644
> index 0000000..f71d835
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/exynos-pcie.txt
> @@ -0,0 +1,73 @@
> +* Samsung Exynos PCIe interface

Please adapt the name of the binding as well, and name it snps-dwc-pcie.txt
for instance, to match the change in the driver and in the binding.

> +Required properties:
> +-compatible: should contain "snps,dwc-pcie" to identify the
> +	core, plus an identifier for the specific instance, such
> +	as "samsung,exynos5440-pcie".

Thanks for changing it here.

> +
> +	pcie@290000 {
> +		compatible = "samsung,exynos5440-pcie";
> +		reg = <0x290000 0x1000
> +			0x270000 0x1000
> +			0x271000 0x40>;


but please also change the example and the .dts files to match.
It should say here

		compatible = "samsung,exynos5440-pcie", "snps,dwc-pcie";

as now required by the binding.

	Arnd
