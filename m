From: Scott Matheina <scott@matheina.com>
Subject: [PATCH 2/2] staging/media/s5p-cec/exynos_hdmi_cecctrl.c Fixed blank
 line before closing brace '}'
Date: Sun,  8 Jan 2017 17:00:39 -0600
Message-ID: <1483916446-6418-2-git-send-email-scott@matheina.com>
References: <1483916446-6418-1-git-send-email-scott@matheina.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1483916446-6418-1-git-send-email-scott@matheina.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: linux-kernel@vger.kernel.org
Cc: devel@driverdev.osuosl.org, linux-samsung-soc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kamil Debski <kamil@wypas.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Fixed checkpatch check blank line before closing brace '}'

Signed-off-by: Scott Matheina <scott@matheina.com>
---
 drivers/staging/media/s5p-cec/exynos_hdmi_cecctrl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/s5p-cec/exynos_hdmi_cecctrl.c b/drivers/staging/media/s5p-cec/exynos_hdmi_cecctrl.c
index f2b24a4..1edf667 100644
--- a/drivers/staging/media/s5p-cec/exynos_hdmi_cecctrl.c
+++ b/drivers/staging/media/s5p-cec/exynos_hdmi_cecctrl.c
@@ -87,7 +87,6 @@ void s5p_cec_mask_tx_interrupts(struct s5p_cec_dev *cec)
 	reg |= S5P_CEC_IRQ_TX_DONE;
 	reg |= S5P_CEC_IRQ_TX_ERROR;
 	writeb(reg, cec->reg + S5P_CEC_IRQ_MASK);
-
 }
 
 void s5p_cec_unmask_tx_interrupts(struct s5p_cec_dev *cec)
-- 
2.7.4
