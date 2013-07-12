From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH V2] pci: exynos: split into two parts such as Synopsys part
 and Exynos part
Date: Fri, 12 Jul 2013 09:00:28 +0900
Message-ID: <001301ce7e92$d19a04e0$74ce0ea0$@samsung.com>
References: <001201ce7dfa$716b3370$54419a50$@samsung.com>
 <51DE72CC.9050001@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-reply-to: <51DE72CC.9050001@ti.com>
Content-language: ko
Sender: linux-pci-owner@vger.kernel.org
To: 'Kishon Vijay Abraham I' <kishon@ti.com>
Cc: 'Bjorn Helgaas' <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Pratyush Anand' <pratyush.anand@st.com>, 'Mohit KUMAR' <Mohit.KUMAR@st.com>, 'Arnd Bergmann' <arnd@arndb.de>, 'Sean Cross' <xobs@kosagi.com>, 'SRIKANTH TUMKUR SHIVANAND' <ts.srikanth@samsung.com>, linux-kernel@vger.kernel.org, 'Thierry Reding' <thierry.reding@gmail.com>, Jingoo Han <jg1.han@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thursday, July 11, 2013 5:55 PM, Kishon Vijay Abraham I wrote:
> On Thursday 11 July 2013 11:19 AM, Jingoo Han wrote:
> > Exynos PCIe IP consists of Synopsys specific part and Exynos
> > specific part. Only core block is a Synopsys designware part;
> > other parts are Exynos specific.
> > Also, the Synopsys designware part can be shared with other
> > platforms; thus, it can be split two parts such as Synopsys
> > designware part and Exynos specific part.
> >
> > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> > Cc: Pratyush Anand <pratyush.anand@st.com>
> > Cc: Mohit KUMAR <Mohit.KUMAR@st.com>
> > ---
> .
> .
> <snip>
> .
> .
> > +
> > +/* Exynos PCIe driver does not allow module unload */
> 
> Just curious, why is this restriction?

CC'ed Thierry Reding,

Hi Kishon,

That's a good question.

Now, we don't have the solution to "be able to load and unload
the PCI host driver in a loop definitely without crashing or exposing
any races  or leaks", as Arnd Bergmann said.
Please refer to the following thread in mailing-list.
(http://archive.arm.linux.org.uk/lurker/message/20130614.123849.4ff363c5.pl.html)

Thus, Exynos PCIe did not support unloading module.
(http://archive.arm.linux.org.uk/lurker/message/20130614.125338.7d2bbf62.pl.html)

Best regards,
Jingoo Han
