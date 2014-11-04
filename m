From: Juergen Borleis <juergen127@kreuzholzen.de>
Subject: Samsung S3C6410 SoC/devicetree: how to describe RTC interrupts
 connected to two different interrupt parents?
Date: Tue, 4 Nov 2014 21:04:45 +0100
Message-ID: <201411042104.45632.juergen127@kreuzholzen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

the Samsung S3C6410 SoC comes with an RTC with two interrupts connected to two 
different interrupt controllers.

The old platform code uses this resource to describe it:

static struct resource s3c_rtc_resource[] = {
	[0] = DEFINE_RES_MEM(S3C24XX_PA_RTC, SZ_256),
	[1] = DEFINE_RES_IRQ(IRQ_RTC),  <-- channel 2 at VIC0
	[2] = DEFINE_RES_IRQ(IRQ_TICK), <-- channel 28 at VIC1
};

In the devicetree I can define multiple interrupt channels with the 
keyword 'interrupts' but it seems all of them must share the same interrupt 
parent defined via 'interrupt-parent'. How to handle the special S3C6410 
case?
The file "Documentation/devicetree/bindings/rtc/s3c-rtc.txt" isn't really 
helpful.

jbo
