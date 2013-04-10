From: Andrew Murray <Andrew.Murray@arm.com>
Subject: [PATCH v5 0/3] of/pci: Provide common support for PCI DT parsing
Date: Wed, 10 Apr 2013 08:29:25 +0100
Message-ID: <1365578969-30966-1-git-send-email-Andrew.Murray@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: rob.herring@calxeda.com
Cc: siva.kallam@samsung.com, linux-pci@vger.kernel.org, thierry.reding@avionic-design.de, Liviu.Dudau@arm.com, grant.likely@secretlab.ca, paulus@samba.org, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, jg1.han@samsung.com, jgunthorpe@obsidianresearch.com, thomas.abraham@linaro.org, benh@kernel.crashing.org, arnd@arndb.de, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, bhelgaas@google.com, linux-arm-kernel@lists.infradead.org, thomas.petazzoni@free-electrons.com, monstr@monstr.eu, linux-kernel@vger.kernel.org, suren.reddy@samsung.com, Andrew Murray <Andrew.Murray@arm.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patchset factors out duplicated code associated with parsing PCI
DT "ranges" properties across the architectures and introduces a
"ranges" parser. This parser "of_pci_range_parser" can be used directly
by ARM host bridge drivers enabling them to obtain ranges from device
trees.

Compared to the v4 (incorrectly labelled v3) sent by Andrew Murray,
the following changes have been made:

 * Split the patch as suggested by Rob Herring

Compared to the v3 sent by Andrew Murray, the following changes have
been made:

 * Unify and move duplicate pci_process_bridge_OF_ranges functions to
   drivers/of/of_pci.c as suggested by Rob Herring

 * Fix potential build errors with Microblaze/MIPS

Compared to "[PATCH v5 01/17] of/pci: Provide support for parsing PCI DT
ranges property", the following changes have been made:

 * Correct use of IORESOURCE_* as suggested by Russell King

 * Improved interface and naming as suggested by Thierry Reding

Compared to the v2 sent by Andrew Murray, Thomas Petazzoni did:

 * Add a memset() on the struct of_pci_range_iter when starting the
   for loop in for_each_pci_range(). Otherwise, with an uninitialized
   of_pci_range_iter, of_pci_process_ranges() may crash.

 * Add parenthesis around 'res', 'np' and 'iter' in the
   for_each_of_pci_range macro definitions. Otherwise, passing
   something like &foobar as 'res' didn't work.

 * Rebased on top of 3.9-rc2, which required fixing a few conflicts in
   the Microblaze code.

v2:
  This follows on from suggestions made by Grant Likely
  (marc.info/?l=linux-kernel&m=136079602806328)

Andrew Murray (3):
  of/pci: Unify pci_process_bridge_OF_ranges from Microblaze and
    PowerPC
  of/pci: Provide support for parsing PCI DT ranges property
  of/pci: mips: convert to common of_pci_range_parser

 arch/microblaze/include/asm/pci-bridge.h |    5 +-
 arch/microblaze/pci/pci-common.c         |  192 ------------------------------
 arch/mips/pci/pci.c                      |   50 +++------
 arch/powerpc/include/asm/pci-bridge.h    |    5 +-
 arch/powerpc/kernel/pci-common.c         |  192 ------------------------------
 drivers/of/address.c                     |   63 ++++++++++
 drivers/of/of_pci.c                      |  168 ++++++++++++++++++++++++++
 include/linux/of_address.h               |   42 +++++++
 include/linux/of_pci.h                   |    3 +
 9 files changed, 294 insertions(+), 426 deletions(-)
