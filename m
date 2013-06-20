From: Pratyush Anand <pratyush.anand@st.com>
Subject: Re: [PATCH V4 1/3] pci: Add PCIe driver for Samsung Exynos
Date: Thu, 20 Jun 2013 15:28:56 +0530
Message-ID: <51C2D260.6000303@st.com>
References: <003601ce6756$444e8cd0$cceba670$@samsung.com>
 <2061566.hRLrhtBK6z@wuerfel> <000901ce6838$8b514720$a1f3d560$@samsung.com>
 <28355406.ThqqvnG0Yj@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <28355406.ThqqvnG0Yj@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, Jingoo Han <jg1.han@samsung.com>
Cc: 'Thomas Petazzoni' <thomas.petazzoni@free-electrons.com>, 'Jason Gunthorpe' <jgunthorpe@obsidianresearch.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 'Siva Reddy Kallam' <siva.kallam@samsung.com>, 'Surendranath Gurivireddy Balla' <suren.reddy@samsung.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, 'Thierry Reding' <thierry.reding@avionic-design.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 'Grant Likely' <grant.likely@secretlab.ca>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, Mohit KUMAR <Mohit.KUMAR@st.com>, 'Bjorn Helgaas' <bhelgaas@google.com>, 'Andrew Murray' <andrew.murray@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 6/13/2013 7:48 PM, Arnd Bergmann wrote:
> On Thursday 13 June 2013 22:18:50 Jingoo Han wrote:
>> >On Wednesday, June 12, 2013 8:23 PM, Arnd Bergmann wrote:
>>> > >On Wednesday 12 June 2013 19:19:05 Jingoo Han wrote:
>>>> > > >+
>>>> > > >+/* synopsis specific PCIE configuration registers*/
>>>> > > >+#define PCIE_PORT_LINK_CONTROL		0x710
>>>> > > >+#define PORT_LINK_MODE_MASK		(0x3f << 16)
>>>> > > >+#define PORT_LINK_MODE_4_LANES		(0x7 << 16)
>>> > >
>>> > >Do you mean this is a "Synopsys" designware part? In that case it
>>> > >should really not be called "exynos-pcie" but "designware-pcie"
>>> > >and you should make sure that the driver makes no assumptions about
>>> > >the platform. A lot of other platforms also use designware
>>> > >parts and should be able to reuse this driver.
>> >
>> >Sorry, I don't think so.
>> >Only core block is a "Synopsys" designware part IP block,
>> >other parts are Exynos-specific.
>> >So, it is hard to share with other PCIe IPs using synopsis core.
> Just call it synopsys anyway and put a comment in to explain this.
> That should be enough for the next person with a synopsys PCI core
> to reuse your code and split out the exynos specific parts into a
> separate file.
>

I agree to Arnd that this patch should be split. I had worked in past 
with SPEAr PCIe which also had designware PCIe IP. I see some code which 
will fit both in SPEAr as well as in exynos. Unfortunately, I was not 
able to get SPEAr driver pushed to mainline, as I moved to some other 
project and got heavily occupied.

Last patch is here:

https://patchwork.kernel.org/patch/1661441/

Infact, these functions should be common to all arm platforms.

sys_to_pcie
cfg_read
cfg_write

Following functions should be common to all designware based driver (at 
least they are same in SPEAr)

exynos_pcie_prog_viewport_cfg0
exynos_pcie_prog_viewport_cfg1
exynos_pcie_rd_other_conf
exynos_pcie_wr_other_conf
exynos_pcie_setup
exynos_pcie_valid_config
exynos_pcie_rd_conf
exynos_pcie_wd_conf
exynos_pcie_scan_bus
exynos_pcie_map_irq
add_pcie_port (after a bit of generalization)
exynos_pcie_probe
exynos_pcie_remove



Following should be specific to exynos:

exynos_pcie_rd_own_conf
exynos_pcie_wr_own_conf
exynos_pcie_link_up
exynos_pcie_setup_rc
exynos_pcie_assert_core_reset
exynos_pcie_deassert_core_reset
exynos_pcie_assert_phy_reset
exynos_pcie_deassert_phy_reset
exynos_pcie_init_phy
exynos_pcie_assert_reset
exynos_pcie_establish_link
exynos_pcie_host_init



struct pcie_port_info and struct pcie_port can also be standardized.

Regards
Pratyush
