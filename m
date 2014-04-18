From: Jungseok Lee <jays.lee@samsung.com>
Subject: [PATCH v3 0/7] Support 4 levels of translation tables for ARM64
Date: Fri, 18 Apr 2014 16:58:59 +0900
Message-ID: <000101cf5adc$0e403e70$2ac0bb50$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, Catalin.Marinas@arm.com, Marc Zyngier <Marc.Zyngier@arm.com>, Christoffer Dall <christoffer.dall@linaro.org>
Cc: kgene.kim@samsung.com, steve.capper@linaro.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, ilho215.lee@samsung.com, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, sungjinn.chung@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi All,

This the 3rd patchset supports 4 levels of tranlsation tables for ARM64.

Firstly, The patchset decouples page size from level of translation tables
as taking account into the comment from Catalin Marinas:
http://www.spinics.net/linux/lists/arm-kernel/msg319552.html

Then, it implements 4 levels of translation tables for native, HYP
and stage2 sides.

All ARMv8 and ARMv7 related changes are validated with FastModels+kvmtool
and A15+QEMU, respectively.

Changes since v1:
- fixed unmatched data types as per Steve's comment
- removed unnecessary #ifdef in arch/arm64/mm/* as per Steve's comment
- revised create_pgd_entry to deal with PUD entry as per Steve's comment
- introduced a macro for initial memblock limit as per Steve's comment
- dropped "Fix line length exceeding 80 characters" patch as per Marc's comment
- removed unnecessary #ifdef in arch/arm/kvm/mmu.c as per Marc's comment
- added a macro for a number of objects of as per Marc's comment

Changes since v2:
- revised some macros in a generic way as per Marc's comment
- added a 2 level option for kvm mmu cache allocation as per Marc's comment

Jungseok Lee (7):
      arm64: Use pr_* instead of printk
      arm64: Decouple page size from level of translation tables
      arm64: Introduce a kernel configuration option for VA_BITS
      arm64: Add a description on 48-bit address space with 4KB pages
      arm64: Add 4 levels of page tables definition with 4KB pages
      arm64: mm: Implement 4 levels of translation tables
      arm64: KVM: Implement 4 levels of translation tables for HYP and stage2

 Documentation/arm64/memory.txt                |   59 +++++++++--
 arch/arm/include/asm/kvm_mmu.h                |   10 ++
 arch/arm/kvm/mmu.c                            |   88 ++++++++++++++---
 arch/arm64/Kconfig                            |   51 +++++++++-
 arch/arm64/include/asm/kvm_arm.h              |   34 +++++--
 arch/arm64/include/asm/kvm_mmu.h              |   12 +++
 arch/arm64/include/asm/memblock.h             |    6 ++
 arch/arm64/include/asm/memory.h               |    6 +-
 arch/arm64/include/asm/page.h                 |    6 +-
 arch/arm64/include/asm/pgalloc.h              |   24 ++++-
 arch/arm64/include/asm/pgtable-4level-hwdef.h |   50 ++++++++++
 arch/arm64/include/asm/pgtable-4level-types.h |   71 +++++++++++++
 arch/arm64/include/asm/pgtable-hwdef.h        |    8 +-
 arch/arm64/include/asm/pgtable.h              |   52 ++++++++--
 arch/arm64/include/asm/tlb.h                  |   10 +-
 arch/arm64/kernel/head.S                      |   40 +++++---
 arch/arm64/kernel/traps.c                     |   19 ++--
 arch/arm64/mm/fault.c                         |    1 +
 arch/arm64/mm/mmu.c                           |   16 ++-
 19 files changed, 495 insertions(+), 68 deletions(-)
