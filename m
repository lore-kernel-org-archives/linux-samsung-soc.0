From: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH v7 3/3] of/pci: mips: convert to common
 of_pci_range_parser
Date: Thu, 18 Apr 2013 13:59:10 +0100
Message-ID: <20130418125910.GA17128@arm.com>
References: <1366107508-12672-1-git-send-email-Andrew.Murray@arm.com>
 <1366107508-12672-4-git-send-email-Andrew.Murray@arm.com>
 <CACRpkdbBaT1OKr5t8HW4+8y_wSDmGxmewAyVMekx8S-K9s3K8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbBaT1OKr5t8HW4+8y_wSDmGxmewAyVMekx8S-K9s3K8Q@mail.gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "siva.kallam@samsung.com" <siva.kallam@samsung.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Jingoo Han <jg1.han@samsung.com>, Liviu Dudau <Liviu.Dudau@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "suren.reddy@samsung.com" <suren.reddy>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Apr 17, 2013 at 04:42:48PM +0100, Linus Walleij wrote:
> On Tue, Apr 16, 2013 at 12:18 PM, Andrew Murray <Andrew.Murray@arm.com> wrote:
> 
> > This patch converts the pci_load_of_ranges function to use the new common
> > of_pci_range_parser.
> >
> > Signed-off-by: Andrew Murray <Andrew.Murray@arm.com>
> > Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> > Reviewed-by: Rob Herring <rob.herring@calxeda.com>
> 
> Tested-by: Linus Walleij <linus.walleij@linaro.org>

Jason - you may not have seen this, but here (Linus Walleij) is another Tested-by
to add to this patch in your tree (if you can).

Andrew Murray
