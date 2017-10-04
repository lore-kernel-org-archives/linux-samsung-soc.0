From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 0/2] ARM-SAMSUNG: Adjustments for 14 function implementations
Date: Wed, 4 Oct 2017 13:10:44 +0200
Message-ID: <75c352ad-c51e-2e63-2f93-0f14522ff09c@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 4 Oct 2017 12:48:24 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in three functions
  Improve a size determination in 13 functions

 arch/arm/plat-samsung/adc.c          | 12 ++++--------
 arch/arm/plat-samsung/devs.c         | 33 +++++++++++----------------------
 arch/arm/plat-samsung/platformdata.c |  4 +---
 3 files changed, 16 insertions(+), 33 deletions(-)

-- 
2.14.2
