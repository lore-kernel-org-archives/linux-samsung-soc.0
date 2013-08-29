From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH V2] PCI: exynos: add support for MSI
Date: Thu, 29 Aug 2013 13:43:00 +0900
Message-ID: <003001cea472$3d6ffee0$b84ffca0$%han@samsung.com>
References: <003d01ce9fc6$9c0f1c20$d42d5460$%han@samsung.com>
 <20130823083539.GB3937@pratyush-vbox>
 <001801cea3c7$06bca9d0$1435fd70$%han@samsung.com>
 <20130829034508.GA3025@pratyush-vbox>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-reply-to: <20130829034508.GA3025@pratyush-vbox>
Content-language: ko
Sender: linux-pci-owner@vger.kernel.org
To: 'Pratyush Anand' <pratyush.anand@st.com>
Cc: 'Bjorn Helgaas' <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Mohit KUMAR DCG' <Mohit.KUMAR@st.com>, 'Siva Reddy Kallam' <siva.kallam@samsung.com>, 'SRIKANTH TUMKUR SHIVANAND' <ts.srikanth@samsung.com>, 'Arnd Bergmann' <arnd@arndb.de>, 'Sean Cross' <xobs@kosagi.com>, 'Kishon Vijay Abraham I' <kishon@ti.com>, 'Thierry Reding' <thierry.reding@gmail.com>, 'Thomas Petazzoni' <thomas.petazzoni@free-electrons.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thursday, August 29, 2013 12:45 PM, Pratyush Anand wrote:
> On Wed, Aug 28, 2013 at 04:17:24PM +0800, Jingoo Han wrote:
> > On Friday, August 23, 2013 5:36 PM, Pratyush Anand wrote:
> > > On Fri, Aug 23, 2013 at 02:04:20PM +0800, Jingoo Han wrote:
> >
> 
> [...]
> 
> > > #define MAX_PCIE_PORT_SUPPORTED 3
> > > static DECLARE_BITMAP(msi_irq_in_use[MAX_PCIE_PORT_SUPPORTED],
> > >                   NUM_MSI_IRQS);
> > > static unsigned int *msi_data[MAX_PCIE_PORT_SUPPORTED];
> >
> > No, there is no need to do it.
> > Without this, we can use 3 RCs by adding a node of 3rd RC to dt file.
> >
> 
> Yes, you can use RCs by adding nodes to dt file. But you will need one
> msi_irq_in_use and one msi_data per RC (ie per port in this driver), isn't it?

Aha, you're right.

A few minutes ago, I found the same value of msi_data is
used for 2 different RCs. It is my fault.

As you mentioned, one msi_data per RC should be used.
I will modify it in order to use one msi_data per RC.

Thank you for your kind description. :-)

Best regards,
Jingoo Han
