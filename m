From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v3 0/6] move s3c24xx-irq to drivers/irqchip and add dt support
Date: Sun, 17 Mar 2013 14:04:05 +0100
Message-ID: <201303171404.06146.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

In contrast to the previous versions, this variant gets rid of the irq
mappings in the dt files and provides individual compatible properties
for the different s3c24xx variants and therefore does not need to
introduce any new dt-properties.

It also now encapsulates the different sub-controllers inside a
node to make it possible to map the register region completely.

This series depends on the latest s3c24xx-irq changes currently in the
linux-samsung tree, and should therefore probably go thru there.

Tested on a s3c2416-based machine with preliminary dt support.

Heiko Stuebner (6):
  ARM: S3C24XX: move irq driver to drivers/irqchip
  irqchip: s3c24xx: fix comments on some camera interrupts
  irqchip: s3c24xx: fix irqlist of second s3c2416 controller
  irqchip: s3c24xx: use irq_create_mapping for parent irqs
  irqchip: s3c24xx: add devicetree support
  irqchip: s3c24xx: add s3c2450 interrupt definitions

 .../interrupt-controller/samsung,s3c24xx-irq.txt   |   54 ++++
 arch/arm/mach-s3c24xx/Makefile                     |    2 +-
 drivers/irqchip/Makefile                           |    1 +
 .../irq.c => drivers/irqchip/irq-s3c24xx.c         |  293 +++++++++++++++++++-
 4 files changed, 342 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/samsung,s3c24xx-irq.txt
 rename arch/arm/mach-s3c24xx/irq.c => drivers/irqchip/irq-s3c24xx.c (80%)

-- 
1.7.2.3
