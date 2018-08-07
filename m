From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/4] mfd: sec-core: Add SPDX license identifiers
Date: Tue,  7 Aug 2018 18:11:22 +0200
Message-ID: <20180807161125.18155-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Replace GPL v2.0+ license statements with SPDX license identifiers.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mfd/sec-core.c              | 16 ++++------------
 drivers/mfd/sec-irq.c               | 16 ++++------------
 include/linux/mfd/samsung/core.h    | 11 ++---------
 include/linux/mfd/samsung/irq.h     | 10 ++--------
 include/linux/mfd/samsung/rtc.h     | 15 ++-------------
 include/linux/mfd/samsung/s2mpa01.h |  7 +------
 include/linux/mfd/samsung/s2mps11.h |  9 +--------
 include/linux/mfd/samsung/s2mps13.h | 14 +-------------
 include/linux/mfd/samsung/s2mps14.h | 14 +-------------
 include/linux/mfd/samsung/s2mps15.h | 11 +----------
 include/linux/mfd/samsung/s2mpu02.h | 14 +-------------
 include/linux/mfd/samsung/s5m8763.h | 10 ++--------
 include/linux/mfd/samsung/s5m8767.h | 10 ++--------
 13 files changed, 24 insertions(+), 133 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 9613b4257302..e0835c9df7a1 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -1,15 +1,7 @@
-/*
- * sec-core.c
- *
- * Copyright (c) 2012 Samsung Electronics Co., Ltd
- *              http://www.samsung.com
- *
- *  This program is free software; you can redistribute  it and/or modify it
- *  under  the terms of  the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the  License, or (at your
- *  option) any later version.
- *
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright (c) 2012 Samsung Electronics Co., Ltd
+//              http://www.samsung.com
 
 #include <linux/module.h>
 #include <linux/moduleparam.h>
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 5eb59c233d52..295d24d4501d 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -1,15 +1,7 @@
-/*
- * sec-irq.c
- *
- * Copyright (c) 2011-2014 Samsung Electronics Co., Ltd
- *              http://www.samsung.com
- *
- *  This program is free software; you can redistribute  it and/or modify it
- *  under  the terms of  the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the  License, or (at your
- *  option) any later version.
- *
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright (c) 2011-2014 Samsung Electronics Co., Ltd
+//              http://www.samsung.com
 
 #include <linux/device.h>
 #include <linux/interrupt.h>
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index 28f4ae76271d..3ca17eb89aa2 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -1,14 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
- * core.h
- *
- * copyright (c) 2011 Samsung Electronics Co., Ltd
+ * Copyright (c) 2011 Samsung Electronics Co., Ltd
  *              http://www.samsung.com
- *
- *  This program is free software; you can redistribute  it and/or modify it
- *  under  the terms of  the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the  License, or (at your
- *  option) any later version.
- *
  */
 
 #ifndef __LINUX_MFD_SEC_CORE_H
diff --git a/include/linux/mfd/samsung/irq.h b/include/linux/mfd/samsung/irq.h
index 667aa40486dd..6cfe4201a106 100644
--- a/include/linux/mfd/samsung/irq.h
+++ b/include/linux/mfd/samsung/irq.h
@@ -1,13 +1,7 @@
-/* irq.h
- *
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
  * Copyright (c) 2012 Samsung Electronics Co., Ltd
  *              http://www.samsung.com
- *
- *  This program is free software; you can redistribute  it and/or modify it
- *  under  the terms of  the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the  License, or (at your
- *  option) any later version.
- *
  */
 
 #ifndef __LINUX_MFD_SEC_IRQ_H
diff --git a/include/linux/mfd/samsung/rtc.h b/include/linux/mfd/samsung/rtc.h
index 9ed2871ea335..0204decfc9aa 100644
--- a/include/linux/mfd/samsung/rtc.h
+++ b/include/linux/mfd/samsung/rtc.h
@@ -1,18 +1,7 @@
-/* rtc.h
- *
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
  * Copyright (c) 2011-2014 Samsung Electronics Co., Ltd
  *              http://www.samsung.com
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
  */
 
 #ifndef __LINUX_MFD_SEC_RTC_H
diff --git a/include/linux/mfd/samsung/s2mpa01.h b/include/linux/mfd/samsung/s2mpa01.h
index 2766108bca2f..0762e9de6f2f 100644
--- a/include/linux/mfd/samsung/s2mpa01.h
+++ b/include/linux/mfd/samsung/s2mpa01.h
@@ -1,12 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Copyright (c) 2013 Samsung Electronics Co., Ltd
  *		http://www.samsung.com
- *
- *  This program is free software; you can redistribute  it and/or modify it
- *  under  the terms of  the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the  License, or (at your
- *  option) any later version.
- *
  */
 
 #ifndef __LINUX_MFD_S2MPA01_H
diff --git a/include/linux/mfd/samsung/s2mps11.h b/include/linux/mfd/samsung/s2mps11.h
index 2c14eeca46f0..6e7668a389a1 100644
--- a/include/linux/mfd/samsung/s2mps11.h
+++ b/include/linux/mfd/samsung/s2mps11.h
@@ -1,14 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
- * s2mps11.h
- *
  * Copyright (c) 2012 Samsung Electronics Co., Ltd
  *              http://www.samsung.com
- *
- *  This program is free software; you can redistribute  it and/or modify it
- *  under  the terms of  the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the  License, or (at your
- *  option) any later version.
- *
  */
 
 #ifndef __LINUX_MFD_S2MPS11_H
diff --git a/include/linux/mfd/samsung/s2mps13.h b/include/linux/mfd/samsung/s2mps13.h
index 239e977ba45d..b96d8a11dcd3 100644
--- a/include/linux/mfd/samsung/s2mps13.h
+++ b/include/linux/mfd/samsung/s2mps13.h
@@ -1,19 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
- * s2mps13.h
- *
  * Copyright (c) 2014 Samsung Electronics Co., Ltd
  *              http://www.samsung.com
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
  */
 
 #ifndef __LINUX_MFD_S2MPS13_H
diff --git a/include/linux/mfd/samsung/s2mps14.h b/include/linux/mfd/samsung/s2mps14.h
index c92f4782afb5..f4afa0cfc24f 100644
--- a/include/linux/mfd/samsung/s2mps14.h
+++ b/include/linux/mfd/samsung/s2mps14.h
@@ -1,19 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
- * s2mps14.h
- *
  * Copyright (c) 2014 Samsung Electronics Co., Ltd
  *              http://www.samsung.com
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
  */
 
 #ifndef __LINUX_MFD_S2MPS14_H
diff --git a/include/linux/mfd/samsung/s2mps15.h b/include/linux/mfd/samsung/s2mps15.h
index 36d35287c3c0..eac6bf74b72e 100644
--- a/include/linux/mfd/samsung/s2mps15.h
+++ b/include/linux/mfd/samsung/s2mps15.h
@@ -1,16 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Copyright (c) 2015 Samsung Electronics Co., Ltd
  *              http://www.samsung.com
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #ifndef __LINUX_MFD_S2MPS15_H
diff --git a/include/linux/mfd/samsung/s2mpu02.h b/include/linux/mfd/samsung/s2mpu02.h
index 47ae9bc583a7..76cd5380cf0f 100644
--- a/include/linux/mfd/samsung/s2mpu02.h
+++ b/include/linux/mfd/samsung/s2mpu02.h
@@ -1,19 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
- * s2mpu02.h
- *
  * Copyright (c) 2014 Samsung Electronics Co., Ltd
  *              http://www.samsung.com
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
  */
 
 #ifndef __LINUX_MFD_S2MPU02_H
diff --git a/include/linux/mfd/samsung/s5m8763.h b/include/linux/mfd/samsung/s5m8763.h
index e025418e5589..c534f086ca16 100644
--- a/include/linux/mfd/samsung/s5m8763.h
+++ b/include/linux/mfd/samsung/s5m8763.h
@@ -1,13 +1,7 @@
-/*  s5m8763.h
- *
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
  * Copyright (c) 2011 Samsung Electronics Co., Ltd
  *              http://www.samsung.com
- *
- *  This program is free software; you can redistribute  it and/or modify it
- *  under  the terms of  the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the  License, or (at your
- *  option) any later version.
- *
  */
 
 #ifndef __LINUX_MFD_S5M8763_H
diff --git a/include/linux/mfd/samsung/s5m8767.h b/include/linux/mfd/samsung/s5m8767.h
index 243b58fec33d..704f8d80e96e 100644
--- a/include/linux/mfd/samsung/s5m8767.h
+++ b/include/linux/mfd/samsung/s5m8767.h
@@ -1,13 +1,7 @@
-/*  s5m8767.h
- *
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
  * Copyright (c) 2011 Samsung Electronics Co., Ltd
  *              http://www.samsung.com
- *
- *  This program is free software; you can redistribute  it and/or modify it
- *  under  the terms of  the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the  License, or (at your
- *  option) any later version.
- *
  */
 
 #ifndef __LINUX_MFD_S5M8767_H
-- 
2.14.1
