From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v8 1/3] of/pci: Unify pci_process_bridge_OF_ranges from
 Microblaze and PowerPC
Date: Tue, 07 May 2013 20:19:18 +1000
Message-ID: <1367921958.25488.8.camel@pasglop>
References: <1366627295-16964-1-git-send-email-Andrew.Murray@arm.com>
         <1366627295-16964-2-git-send-email-Andrew.Murray@arm.com>
         <1367721709.11982.37.camel@pasglop> <20130507080142.GA8808@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20130507080142.GA8808@arm.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Andrew Murray <andrew.murray@arm.com>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "jgunthorpe@obsidianresearch.com" <jgunthorpe@obsidianresearch.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "siva.kallam@samsung.com" <siva.kallam@samsung.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "jg1.han@samsung.com" <jg1.han@samsung.com>, Liviu Dudau <Liviu.Dudau@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "suren.reddy@samsung.com" <suren.reddy@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 2013-05-07 at 09:01 +0100, Andrew Murray wrote:
> 
> There were no objections to this latest revision until now and it is
> currently sitting with Jason Cooper (mvebu-next/pcie). [1]

Ok, well I've just sent Linus a pull request for my changes so at least
drop the powerpc changes from your tree for the time being.

> This is a view that was also shared by Bjorn [2] when I attempted to
> submit a patchset which moves struct pci_controller to asm-generic.

Right, it's the logical way to go

> The motativation for my patchsets were to give a way for ARM PCI host
> bridge drivers to parse the DT ranges property, but this snow-balled
> into unifying pci_process_bridge_OF_ranges.

Which I understand, I would probably have done the same thing in your
shoes :-)

> My v8 patchset provides a of_pci_range_parser which is used directly
> by a few ARM PCI DT host bridge drivers, this has been generally
> accepted and tested. I don't see why this can't remain and so I'd
> really like to keep this around. 

Sure, no objection, in fact I should/could probably update my new code
to use it as well.

> Grant, Benjamin would you be happy for me to resubmit this series
> which provides the of_pci_range_parser which will be used by the
> separate implementations of pci_process_bridge_OF_ranges in
> PowerPC/Microblaze?

Sure, in fact feel free to update my new code if you have more bandwidth
than I do, it should hit Linus tree soon hopefully unless he objects to
me having a second pull request this merge window...

> Benjamin are you able to still use of_pci_range_parser in your
> 'Support per-aperture memory offset' patch?

I see no reason why not. I just haven't looked into it much, I admit,
being bogged down with a pile of new HW bringup in the lab etc...

Cheers,
Ben.
