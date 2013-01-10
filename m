From: Federico Vaga <federico.vaga@gmail.com>
Subject: [PATCH v5 3/3] adv7180: remove {query/g_/s_}ctrl
Date: Thu, 10 Jan 2013 13:46:50 +0100
Message-ID: <1357822010-30419-4-git-send-email-federico.vaga@gmail.com>
References: <1357822010-30419-1-git-send-email-federico.vaga@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <1357822010-30419-1-git-send-email-federico.vaga@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel/>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: "devel" <devel-bounces@linuxdriverproject.org>
To: Mauro Carvalho Chehab <mchehab@redhat.com>, Pawel Osciak <pawel@osciak.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Hans Verkuil <hans.verkuil@cisco.com>
Cc: Kamil Debski <k.debski@samsung.com>, Srinivas Kandagatla <srinivas.kandagatla@st.com>, Peter Senna Tschudin <peter.senna@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devel@driverdev.osuosl.org, Giancarlo Asnaghi <giancarlo.asnaghi@st.com>, linux-samsung-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Sachin Kamat <sachin.kamat@linaro.org>, Prabhakar Lad <prabhakar.lad@ti.com>, Sasha Levin <sasha.levin@oracle.com>, linux-media@vger.kernel.org, Tomasz Stanislawski <t.stanislaws@samsung.com>, davinci-linux-open-source@linux.davincidsp.com, Mauro Carvalho Chehab <mchehab@infradead.org>, Jeongtae Park <jtp.park@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-arm-kernel@lists.infradead.org, Fabio Estevam <fabio.estevam@freescale.com>, Sakari Ailus <sakari.ailus@iki.fi>, Scott
List-Id: linux-samsung-soc@vger.kernel.org

All drivers which use this subdevice use also the control framework.
The v4l2_subdev_core_ops operations {query/g_/s_}ctrl are useless because
device drivers will inherit controls from this subdevice.

Signed-off-by: Federico Vaga <federico.vaga@gmail.com>
---
 drivers/media/i2c/adv7180.c | 3 ---
 1 file modificato, 3 rimozioni(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 45ecf8d..43bc2b9 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -402,9 +402,6 @@ static const struct v4l2_subdev_video_ops adv7180_video_ops = {
 static const struct v4l2_subdev_core_ops adv7180_core_ops = {
 	.g_chip_ident = adv7180_g_chip_ident,
 	.s_std = adv7180_s_std,
-	.queryctrl = v4l2_subdev_queryctrl,
-	.g_ctrl = v4l2_subdev_g_ctrl,
-	.s_ctrl = v4l2_subdev_s_ctrl,
 };
 
 static const struct v4l2_subdev_ops adv7180_ops = {
-- 
1.7.11.7
