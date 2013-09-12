From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH V3] pci: exynos: split into two parts such as Synopsys part
 and Exynos part
Date: Thu, 12 Sep 2013 16:15:04 +0900
Message-ID: <003501ceaf87$cda45db0$68ed1910$%han@samsung.com>
References: <002801ce8376$a807dbf0$f81793d0$@samsung.com>
 <51ED49D6.9050209@ti.com> <000701ce8741$fe47deb0$fad79c10$@samsung.com>
 <51EE22DF.6090902@ti.com> <001301ce8772$522dfc50$f689f4f0$@samsung.com>
 <5231607C.10702@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-reply-to: <5231607C.10702@ti.com>
Content-language: ko
Sender: linux-pci-owner@vger.kernel.org
To: 'Kishon Vijay Abraham I' <kishon@ti.com>
Cc: 'Pratyush Anand' <pratyush.anand@st.com>, 'Bjorn Helgaas' <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Mohit KUMAR' <Mohit.KUMAR@st.com>, 'Arnd Bergmann' <arnd@arndb.de>, 'Sean Cross' <xobs@kosagi.com>, 'Thierry Reding' <thierry.reding@gmail.com>, 'SRIKANTH TUMKUR SHIVANAND' <ts.srikanth@samsung.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday 23 July 2013 12:30 PM, Kishon Vijay Abraham I wrote:
> >> .
> >> .
> >>>>> +			of_pci_range_to_resource(&range, np, &pp->cfg);
> >>>>> +			pp->config.cfg0_size = resource_size(&pp->cfg)/2;
> >>>>> +			pp->config.cfg1_size = resource_size(&pp->cfg)/2;
> >>>>> +		}
> >>>>> +	}
> >>>>> +
> >>>>> +	pp->dbi_base = devm_ioremap(pp->dev, pp->cfg.start,
> >>>>> +				resource_size(&pp->cfg));
> >>>>
> >>>> Why is configuraion space divided into two?
> >>>
> >>> Sorry, I don't know the exact reason. :(
> >>> Pratyush Anand may know about this.
> >>> Pratyush Anand, could you answer the question?
> >>>
> >>> Also, if you find some problems, please let me know.
> 
> One more query..
> 
> Where is inbound translation configuration done in your driver? how should it
> be done?

Hi Kishon,

Sorry, I cannot understand your question exactly.
However, the following thread would be helpful.

http://www.spinics.net/lists/arm-kernel/msg252078.html
https://lkml.org/lkml/2013/6/17/890

Best regards.
Jingoo Han
