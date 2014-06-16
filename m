From: Doug Anderson <dianders@chromium.org>
Subject: [PATCH 03/10] mfd: cros_ec: Allow static din/dout buffers with cros_ec_register()
Date: Mon, 16 Jun 2014 14:39:53 -0700
Message-ID: <1402954800-28215-4-git-send-email-dianders@chromium.org>
References: <1402954800-28215-1-git-send-email-dianders@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1402954800-28215-1-git-send-email-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Andrew Bresticker <abrestic@chromium.org>, swarren@wwwdotorg.org, olof@lixom.net, Sonny Rao <sonnyrao@chromium.org>, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Bill Richardson <wfrichar@chromium.org>, sjg@chromium.org, Wolfram Sang <wsa@the-dreams.de>, broonie@kernel.org, Doug Anderson <dianders@chromium.org>, sameo@linux.intel.com, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Bill Richardson <wfrichar@chromium.org>

The lower-level driver may want to provide its own buffers. If so,
there's no need to allocate new ones.  This already happens to work
just fine (since we check for size of 0 and use devm allocation), but
it's good to document it.

[dianders: Resolved conflicts; documented that no code changes needed
on mainline]

Signed-off-by: Bill Richardson <wfrichar@chromium.org>
Signed-off-by: Doug Anderson <dianders@chromium.org>
---
 include/linux/mfd/cros_ec.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.h
index 7e9fe6e..2ee3190 100644
--- a/include/linux/mfd/cros_ec.h
+++ b/include/linux/mfd/cros_ec.h
@@ -68,8 +68,8 @@ struct cros_ec_msg {
  * We use this alignment to keep ARM and x86 happy. Probably word
  * alignment would be OK, there might be a small performance advantage
  * to using dword.
- * @din_size: size of din buffer
- * @dout_size: size of dout buffer
+ * @din_size: size of din buffer to allocate (zero to use static din)
+ * @dout_size: size of dout buffer to allocate (zero to use static dout)
  * @command_send: send a command
  * @command_recv: receive a command
  * @ec_name: name of EC device (e.g. 'chromeos-ec')
-- 
2.0.0.526.g5318336
