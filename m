From: Matthew Leach <matthew@mattleach.net>
Subject: [PATCH v2 0/3] Exynos big-endian fixes
Date: Wed, 22 Jun 2016 17:57:00 +0100
Message-ID: <20160622165703.7775-1-matthew@mattleach.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Matthew Leach <matthew@mattleach.net>
List-Id: linux-samsung-soc@vger.kernel.org

Hi all,

I believe these are the outstanding patches from my Exynos big-endian
series that haven't yet been merged.  If I've missed anything, please
let me know.

Comments welcome,
Matt

v1 -> v2:
  - Fixed white-space issues.
  - Used readb_relaxed in tty driver for completeness.

Matthew Leach (3):
  irqchip: exynos_combiner: fixup reg access on be
  tty: serial: samsung: fixup accessors for endian
  tty: serial: samsung: add byte-order aware bit functions

 drivers/irqchip/exynos-combiner.c | 18 +++++++++---------
 drivers/tty/serial/samsung.c      | 16 +++++++---------
 drivers/tty/serial/samsung.h      | 38 +++++++++++++++++++++++++++++++++-----
 3 files changed, 49 insertions(+), 23 deletions(-)

-- 
2.8.3
