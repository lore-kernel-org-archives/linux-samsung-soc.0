From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 5/5] ASoC: samsung: Add compatible strings for
 Odroid X, X2, U3 boards
Date: Wed, 14 Mar 2018 17:42:42 +0100
Message-ID: <20180314164242.22927-2-s.nawrocki@samsung.com>
References: <20180314164242.22927-1-s.nawrocki@samsung.com>
 <CGME20180314164310epcas2p30b434dfadb7e5a2edffe97451d70ab03@epcas2p3.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-reply-to: <20180314164242.22927-1-s.nawrocki@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: broonie@kernel.org
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, lgirdwood@gmail.com, krzk@kernel.org, robh+dt@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

The driver can also support Odroid X/X2 and Odroid U3 without further
modifications so related compatible strings are added to the list.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/odroid.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index e7b371b07230..f4fa0312e8c8 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -202,6 +202,8 @@ static int odroid_audio_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id odroid_audio_of_match[] = {
+	{ .compatible	= "hardkernel,odroid-x-audio" },
+	{ .compatible	= "hardkernel,odroid-u3-audio" },
 	{ .compatible	= "hardkernel,odroid-xu3-audio" },
 	{ .compatible	= "hardkernel,odroid-xu4-audio" },
 	{ .compatible	= "samsung,odroid-xu3-audio" },
-- 
2.14.2
