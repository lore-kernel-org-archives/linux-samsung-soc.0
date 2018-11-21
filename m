From: Torbjorn Jansson <torbjorn.jansson@mbox200.swipnet.se>
Subject: odroid hc2?
Date: Wed, 21 Nov 2018 10:06:08 +0100
Message-ID: <d2fc632f-e0bb-6d0a-35f6-64fcb16c354e@mbox200.swipnet.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: krzk@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello.

a question for the experts and a small wish/request.
is it possible to get the odroid hc2 up to same level of support in the kernel 
as hc1?
my understanding is that they are basically the same thing but hc1 uses a 2.5 
inch disk and hc2 uses 3.5 inch discs.

there is two parts to this i believe.
i'm using fedora 29 to test this and the first part is that uboot (i think) 
doesn't recognize the hc2 properly so it tries to load the dtb file 
exynos5422-odroidunknown.dtb
i can work around this by creating a symlink from exynos5422-odroidhc1.dtb and 
get it to boot.

second part is ofcourse that there is no dtb file for hc2 so even if uboot did 
pickup the right file it wound not exist.

using the hc1 dtb file with my hc2 appears to work fine.
