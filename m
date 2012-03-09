From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] s5p-csis: Fix compilation with PM_SLEEP disabled
Date: Fri, 09 Mar 2012 13:56:39 +0100
Message-ID: <1331297799-6335-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

=46ix following compilation error when CONFIG_PM_SLEEP is disabled:

  CC      drivers/media/video/s5p-fimc/mipi-csis.o
drivers/media/video/s5p-fimc/mipi-csis.c: In function =E2=80=98s5pcsis_=
remove=E2=80=99:
drivers/media/video/s5p-fimc/mipi-csis.c:956: error: implicit declarati=
on of function =E2=80=98s5pcsis_suspend=E2=80=99

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/media/video/s5p-fimc/mipi-csis.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/media/video/s5p-fimc/mipi-csis.c b/drivers/media/v=
ideo/s5p-fimc/mipi-csis.c
index a903138..f44f690 100644
--- a/drivers/media/video/s5p-fimc/mipi-csis.c
+++ b/drivers/media/video/s5p-fimc/mipi-csis.c
@@ -684,7 +684,7 @@ static int __devexit s5pcsis_remove(struct platform=
_device *pdev)
 	struct csis_state *state =3D sd_to_csis_state(sd);
=20
 	pm_runtime_disable(&pdev->dev);
-	s5pcsis_suspend(&pdev->dev);
+	s5pcsis_pm_suspend(&pdev->dev, false);
 	clk_disable(state->clock[CSIS_CLK_MUX]);
 	pm_runtime_set_suspended(&pdev->dev);
 	s5pcsis_clk_put(state);
--=20
1.7.9
