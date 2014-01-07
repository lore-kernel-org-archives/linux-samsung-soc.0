From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: [PATCH] exynos4-is: Compile runtime PM callbacks in conditionally
Date: Tue,  7 Jan 2014 23:08:48 +0100
Message-ID: <1389132528-21281-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Enclose the runtime PM helpers in #ifdef CONFIG_PM_RUNTIME/#endif
to avoid following compile warning when CONFIG_PM_RUNTIME is disabled:

 CC      drivers/media/platform/exynos4-is/fimc-core.o
drivers/media/platform/exynos4-is/fimc-core.c:1040:12: warning: =E2=80=98=
fimc_runtime_resume=E2=80=99 defined but not used
drivers/media/platform/exynos4-is/fimc-core.c:1057:12: warning: =E2=80=98=
fimc_runtime_suspend=E2=80=99 defined but not used

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/media/platform/exynos4-is/fimc-core.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-core.c b/drivers/me=
dia/platform/exynos4-is/fimc-core.c
index dcbea59..da2fc86 100644
--- a/drivers/media/platform/exynos4-is/fimc-core.c
+++ b/drivers/media/platform/exynos4-is/fimc-core.c
@@ -1037,6 +1037,7 @@ err_sclk:
 	return ret;
 }

+#ifdef CONFIG_PM_RUNTIME
 static int fimc_runtime_resume(struct device *dev)
 {
 	struct fimc_dev *fimc =3D	dev_get_drvdata(dev);
@@ -1069,6 +1070,7 @@ static int fimc_runtime_suspend(struct device *de=
v)
 	dbg("fimc%d: state: 0x%lx", fimc->id, fimc->state);
 	return ret;
 }
+#endif

 #ifdef CONFIG_PM_SLEEP
 static int fimc_resume(struct device *dev)
--
1.7.4.1
