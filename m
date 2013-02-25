From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: S5PV210: Fix compilation error in mach-goni.c
Date: Mon, 25 Feb 2013 13:42:18 +0530
Message-ID: <1361779938-30023-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:59671 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754567Ab3BYIWa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Feb 2013 03:22:30 -0500
Received: by mail-pa0-f52.google.com with SMTP id fb1so1615171pad.25
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Feb 2013 00:22:30 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Commit 56bc91 ("[media] s5p-fimc: Redefine platform data structure for =
fimc-is")
split bus_type into fimc_bus_type and sensor_bus_type and converted all
instances of it. This file however escaped the change.

Without this patch we get the following build error:
arch/arm/mach-s5pv210/mach-goni.c:848:3: error:
unknown field =E2=80=98bus_type=E2=80=99 specified in initializer

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Based on Linus' mainline kernel tree (v3.8+).
---
 arch/arm/mach-s5pv210/mach-goni.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/=
mach-goni.c
index 3a38f7b..e373de4 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -845,7 +845,7 @@ static struct fimc_source_info goni_camera_sensors[=
] =3D {
 		.mux_id		=3D 0,
 		.flags		=3D V4L2_MBUS_PCLK_SAMPLE_FALLING |
 				  V4L2_MBUS_VSYNC_ACTIVE_LOW,
-		.bus_type	=3D FIMC_BUS_TYPE_ITU_601,
+		.fimc_bus_type	=3D FIMC_BUS_TYPE_ITU_601,
 		.board_info	=3D &noon010pc30_board_info,
 		.i2c_bus_num	=3D 0,
 		.clk_frequency	=3D 16000000UL,
--=20
1.7.4.1
