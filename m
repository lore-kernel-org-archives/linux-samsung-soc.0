From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 0/6] ARM-S3C24xx: Adjustments for four function implementations
Date: Mon, 2 Oct 2017 19:56:56 +0200
Message-ID: <d2ae00c8-da57-9ffc-3692-67ed6daa95e0@users.sourceforge.net>
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
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 2 Oct 2017 19:50:05 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (6):
  Delete an error message for a failed memory allocation in s3c2410_iotiming_get()
  Improve a size determination in s3c2410_iotiming_get()
  s3c2410: Fix a typo in a comment line
  Delete an error message for a failed memory allocation in s3c2412_iotiming_get()
  Improve a size determination in s3c2412_iotiming_get()
  s3c2412: Fix a typo in a comment line

 arch/arm/mach-s3c24xx/iotiming-s3c2410.c | 8 +++-----
 arch/arm/mach-s3c24xx/iotiming-s3c2412.c | 8 +++-----
 2 files changed, 6 insertions(+), 10 deletions(-)

-- 
2.14.2
