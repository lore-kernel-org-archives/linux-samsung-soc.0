From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH] pci: exynos: split into two parts such as Synopsys part
 and Exynos part
Date: Wed, 10 Jul 2013 19:32:04 +0530
Message-ID: <51DD695C.6060209@ti.com>
References: <000201ce7959$bf0fb150$3d2f13f0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <000201ce7959$bf0fb150$3d2f13f0$@samsung.com>
Sender: linux-pci-owner@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: 'Bjorn Helgaas' <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, Pratyush Anand <pratyush.anand@st.com>, Mohit KUMAR <Mohit.KUMAR@st.com>, 'Arnd Bergmann' <arnd@arndb.de>, 'Sean Cross' <xobs@kosagi.com>, 'SRIKANTH TUMKUR SHIVANAND' <ts.srikanth@samsung.com>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Friday 05 July 2013 01:59 PM, Jingoo Han wrote:
> Exynos PCIe IP consists of Synopsys specific part and Exynos
> specific part. Only core block is a Synopsys designware part;
> other parts are Exynos specific.
> Also, the Synopsys designware part can be shared with other
> platforms; thus, it can be split two parts such as Synopsys
> designware part and Exynos specific part.

Thanks for doing that :-)

I'll be using the synopsys specific part as Jacinto6 also uses the same pcie
core. Once I start implementing, I'll have some queries and comments ;-)

Cheers
Kishon
