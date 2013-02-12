From: Doug Anderson <dianders@chromium.org>
Subject: [PATCH v3 0/2] Add automatic bus number support for i2c busses with
 device tree
Date: Mon, 11 Feb 2013 16:48:03 -0800
Message-ID: <1360630085-26874-1-git-send-email-dianders@chromium.org>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-i2c@vger.kernel.org, Wolfram Sang <w.sang@pengutronix.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Padmavathi Venna <padma.v@samsung.com>, Haojian Zhuang <haojian.zhuang@marvell.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Doug Anderson <dianders@chromium.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Karol Lewandowski <k.lewandowsk@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Olof Johansson <olof@lixom.net>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

This was suggested by Mark Brown in response to a patch for adding
this functionality only for the s3c2410 bus:
  https://lkml.org/lkml/2012/11/20/681

I have also modified the i2c-pxa driver to use this new functionality.
The i2c-pxa driver changes have only been compile-tested and are just
for cleanup purposes.

Changes in v3:
- Addressed Wolfram's feedback; rebased atop idr-cleanup series.

Changes in v2:
- No longer tweak pdev->id as per Sylwester Nawrocki.
- No longer add the dev ID to the adap.name.  Other drivers don't
  include the device ID here and it doesn't make sense with
  dynamically (or automatically) allocated IDs.
- Use dev_name(&dev->dev) to register for the IRQ; this matches what
  the i2c-s3c2410.c does and handles dynamically allocated IDs.
- This change was only compile-tested (corgi_defconfig), since I don't
  have access to a board that uses this driver.

Doug Anderson (2):
  i2c-core: dt: Pick i2c bus number from i2c alias if present
  i2c: pxa: Use i2c-core to get bus number now

 drivers/i2c/busses/i2c-pxa.c | 20 ++++++++--------
 drivers/i2c/i2c-core.c       | 54 ++++++++++++++++++++++++++++++++------------
 2 files changed, 49 insertions(+), 25 deletions(-)

-- 
1.8.1
