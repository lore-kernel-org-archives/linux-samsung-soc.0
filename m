From: Murali Karicheri <m-karicheri2@ti.com>
Subject: Re: [RESEND: RFC PATCH 3/3] pcie: keystone: add pcie driver based
 on designware core driver
Date: Fri, 4 Apr 2014 12:15:27 -0400
Message-ID: <533EDA9F.5090801@ti.com>
References: <1395707726-20437-1-git-send-email-m-karicheri2@ti.com>
 <1395707726-20437-4-git-send-email-m-karicheri2@ti.com>
 <235376049.yyfljDtinu@wuerfel> <533C460D.1030608@ti.com>
 <1396513926.5057.12.camel@weser.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1396513926.5057.12.camel@weser.hi.pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Richard Zhu <r65037@freescale.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Jingoo Han <jg1.han@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "Shilimkar,
 Santosh" <santosh.shilimkar@ti.com>, Mohit Kumar <mohit.kumar@st.com>, Bjorn Helgaas <bhelgaas@google.com>, "xobs@kosagi.com" <xobs@kosagi.com>, Shawn Guo <shawn.guo@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 4/3/2014 4:32 AM, Lucas Stach wrote:
> Am Mittwoch, den 02.04.2014, 13:17 -0400 schrieb Murali Karicheri:
>> Arnd,
>>
>> Thanks for reviewing the RFC patch. Please see below my response.
>>
>> On 3/25/2014 3:44 AM, Arnd Bergmann wrote:
>>> On Monday 24 March 2014 20:35:26 Murali Karicheri wrote:
> [...]
>>>> +	ks_pcie->clk = devm_clk_get(&pdev->dev, "pcie");
>>>> +	if (IS_ERR(ks_pcie->clk)) {
>>>> +		dev_err(&pdev->dev, "Failed to get pcie rc clock\n");
>>>> +		return PTR_ERR(ks_pcie->clk);
>>>> +	}
>>>> +	ret = clk_prepare_enable(ks_pcie->clk);
>>>> +	if (ret)
>>>> +		return ret;
>>> Could you move the clock handling into the generic dw-pcie code?
>> Could be. But currently only pci-exynos.c is using a clock name
>> "pcie".pci-imx6.c uses pcie_axi" and
>> will have to be fixed so that we can move this code to the generic
>> dw-pcie code.  Sean Cross is the
>> author for pci-imx6.c.
>>
>> Sean,
>>
>> Is "pcie_axi" is the pcie hw clock? If so, can you rename this to "pcie"
>> so that  my patch can move the
>> clock handling code to pcie designware code?
>>
> My series "i.MX6 PCIe binding change and MSI support" already changes
> the clock name. So we could consolidate the clock handling once this is
> in. Only difference is that the i.MX6 needs an additional PHY clock.
>
> Regards,
> Lucas
Lucas,

Thanks. I will send a patch for this.

Murali
