From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/4] mfd: maxim: Add SPDX license identifiers
Date: Tue,  7 Aug 2018 18:11:23 +0200
Message-ID: <20180807161125.18155-2-krzk@kernel.org>
References: <20180807161125.18155-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180807161125.18155-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Replace GPL v2.0+ license statements with SPDX license identifiers.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mfd/max14577.c               | 28 +++++++++-------------------
 drivers/mfd/max77686.c               | 32 +++++++++-----------------------
 drivers/mfd/max77693.c               | 34 ++++++++++------------------------
 drivers/mfd/max77843.c               | 19 +++++++------------
 drivers/mfd/max8997-irq.c            | 30 ++++++++----------------------
 drivers/mfd/max8997.c                | 30 ++++++++----------------------
 drivers/mfd/max8998-irq.c            | 18 ++++++------------
 drivers/mfd/max8998.c                | 28 +++++++---------------------
 include/linux/mfd/max14577-private.h | 11 +----------
 include/linux/mfd/max14577.h         | 11 +----------
 include/linux/mfd/max77686-private.h | 15 +--------------
 include/linux/mfd/max77686.h         | 15 +--------------
 include/linux/mfd/max77693-common.h  |  6 +-----
 include/linux/mfd/max77693-private.h | 15 +--------------
 include/linux/mfd/max77693.h         | 15 +--------------
 include/linux/mfd/max77843-private.h |  6 +-----
 include/linux/mfd/max8997-private.h  | 15 +--------------
 include/linux/mfd/max8997.h          | 15 +--------------
 include/linux/mfd/max8998-private.h  | 15 +--------------
 include/linux/mfd/max8998.h          | 15 +--------------
 20 files changed, 76 insertions(+), 297 deletions(-)

diff --git a/drivers/mfd/max14577.c b/drivers/mfd/max14577.c
index 6cbe96b28f42..ebb13d5de530 100644
--- a/drivers/mfd/max14577.c
+++ b/drivers/mfd/max14577.c
@@ -1,22 +1,12 @@
-/*
- * max14577.c - mfd core driver for the Maxim 14577/77836
- *
- * Copyright (C) 2014 Samsung Electronics
- * Chanwoo Choi <cw00.choi@samsung.com>
- * Krzysztof Kozlowski <krzk@kernel.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * This driver is based on max8997.c
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// max14577.c - mfd core driver for the Maxim 14577/77836
+//
+// Copyright (C) 2014 Samsung Electronics
+// Chanwoo Choi <cw00.choi@samsung.com>
+// Krzysztof Kozlowski <krzk@kernel.org>
+//
+// This driver is based on max8997.c
 
 #include <linux/err.h>
 #include <linux/module.h>
diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c
index b0e8e13c0049..71faf503844b 100644
--- a/drivers/mfd/max77686.c
+++ b/drivers/mfd/max77686.c
@@ -1,26 +1,12 @@
-/*
- * max77686.c - mfd core driver for the Maxim 77686/802
- *
- * Copyright (C) 2012 Samsung Electronics
- * Chiwoong Byun <woong.byun@samsung.com>
- * Jonghwa Lee <jonghwa3.lee@samsung.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- *
- * This driver is based on max8997.c
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// max77686.c - mfd core driver for the Maxim 77686/802
+//
+// Copyright (C) 2012 Samsung Electronics
+// Chiwoong Byun <woong.byun@samsung.com>
+// Jonghwa Lee <jonghwa3.lee@samsung.com>
+//
+//This driver is based on max8997.c
 
 #include <linux/export.h>
 #include <linux/slab.h>
diff --git a/drivers/mfd/max77693.c b/drivers/mfd/max77693.c
index 1c05ea0cba61..901d99d65924 100644
--- a/drivers/mfd/max77693.c
+++ b/drivers/mfd/max77693.c
@@ -1,27 +1,13 @@
-/*
- * max77693.c - mfd core driver for the MAX 77693
- *
- * Copyright (C) 2012 Samsung Electronics
- * SangYoung Son <hello.son@samsung.com>
- *
- * This program is not provided / owned by Maxim Integrated Products.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- *
- * This driver is based on max8997.c
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// max77693.c - mfd core driver for the MAX 77693
+//
+// Copyright (C) 2012 Samsung Electronics
+// SangYoung Son <hello.son@samsung.com>
+//
+// This program is not provided / owned by Maxim Integrated Products.
+//
+// This driver is based on max8997.c
 
 #include <linux/module.h>
 #include <linux/slab.h>
diff --git a/drivers/mfd/max77843.c b/drivers/mfd/max77843.c
index da9612dbb222..25cbb2242b26 100644
--- a/drivers/mfd/max77843.c
+++ b/drivers/mfd/max77843.c
@@ -1,15 +1,10 @@
-/*
- * MFD core driver for the Maxim MAX77843
- *
- * Copyright (C) 2015 Samsung Electronics
- * Author: Jaewon Kim <jaewon02.kim@samsung.com>
- * Author: Beomho Seo <beomho.seo@samsung.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// MFD core driver for the Maxim MAX77843
+//
+// Copyright (C) 2015 Samsung Electronics
+// Author: Jaewon Kim <jaewon02.kim@samsung.com>
+// Author: Beomho Seo <beomho.seo@samsung.com>
 
 #include <linux/err.h>
 #include <linux/i2c.h>
diff --git a/drivers/mfd/max8997-irq.c b/drivers/mfd/max8997-irq.c
index 326f17b632a7..93a3b1698d9c 100644
--- a/drivers/mfd/max8997-irq.c
+++ b/drivers/mfd/max8997-irq.c
@@ -1,25 +1,11 @@
-/*
- * max8997-irq.c - Interrupt controller support for MAX8997
- *
- * Copyright (C) 2011 Samsung Electronics Co.Ltd
- * MyungJoo Ham <myungjoo.ham@samsung.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- *
- * This driver is based on max8998-irq.c
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// max8997-irq.c - Interrupt controller support for MAX8997
+//
+// Copyright (C) 2011 Samsung Electronics Co.Ltd
+// MyungJoo Ham <myungjoo.ham@samsung.com>
+//
+// This driver is based on max8998-irq.c
 
 #include <linux/err.h>
 #include <linux/irq.h>
diff --git a/drivers/mfd/max8997.c b/drivers/mfd/max8997.c
index 3f554c447521..8dbae31911a1 100644
--- a/drivers/mfd/max8997.c
+++ b/drivers/mfd/max8997.c
@@ -1,25 +1,11 @@
-/*
- * max8997.c - mfd core driver for the Maxim 8966 and 8997
- *
- * Copyright (C) 2011 Samsung Electronics
- * MyungJoo Ham <myungjoo.ham@samsung.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- *
- * This driver is based on max8998.c
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// max8997.c - mfd core driver for the Maxim 8966 and 8997
+//
+// Copyright (C) 2011 Samsung Electronics
+// MyungJoo Ham <myungjoo.ham@samsung.com>
+//
+// This driver is based on max8998.c
 
 #include <linux/err.h>
 #include <linux/slab.h>
diff --git a/drivers/mfd/max8998-irq.c b/drivers/mfd/max8998-irq.c
index 90bad9ffa7e2..83b6f510bc05 100644
--- a/drivers/mfd/max8998-irq.c
+++ b/drivers/mfd/max8998-irq.c
@@ -1,15 +1,9 @@
-/*
- * Interrupt controller support for MAX8998
- *
- * Copyright (C) 2010 Samsung Electronics Co.Ltd
- * Author: Joonyoung Shim <jy0922.shim@samsung.com>
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- *
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Interrupt controller support for MAX8998
+//
+// Copyright (C) 2010 Samsung Electronics Co.Ltd
+// Author: Joonyoung Shim <jy0922.shim@samsung.com>
 
 #include <linux/device.h>
 #include <linux/interrupt.h>
diff --git a/drivers/mfd/max8998.c b/drivers/mfd/max8998.c
index b1d3f70782d9..56409df120f8 100644
--- a/drivers/mfd/max8998.c
+++ b/drivers/mfd/max8998.c
@@ -1,24 +1,10 @@
-/*
- * max8998.c - mfd core driver for the Maxim 8998
- *
- *  Copyright (C) 2009-2010 Samsung Electronics
- *  Kyungmin Park <kyungmin.park@samsung.com>
- *  Marek Szyprowski <m.szyprowski@samsung.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// max8998.c - mfd core driver for the Maxim 8998
+//
+//  Copyright (C) 2009-2010 Samsung Electronics
+//  Kyungmin Park <kyungmin.park@samsung.com>
+//  Marek Szyprowski <m.szyprowski@samsung.com>
 
 #include <linux/err.h>
 #include <linux/init.h>
diff --git a/include/linux/mfd/max14577-private.h b/include/linux/mfd/max14577-private.h
index df75234f979d..a21374f8ad26 100644
--- a/include/linux/mfd/max14577-private.h
+++ b/include/linux/mfd/max14577-private.h
@@ -1,19 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * max14577-private.h - Common API for the Maxim 14577/77836 internal sub chip
  *
  * Copyright (C) 2014 Samsung Electrnoics
  * Chanwoo Choi <cw00.choi@samsung.com>
  * Krzysztof Kozlowski <krzk@kernel.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #ifndef __MAX14577_PRIVATE_H__
diff --git a/include/linux/mfd/max14577.h b/include/linux/mfd/max14577.h
index d81b52bb8bee..8b3ef891ba42 100644
--- a/include/linux/mfd/max14577.h
+++ b/include/linux/mfd/max14577.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * max14577.h - Driver for the Maxim 14577/77836
  *
@@ -5,16 +6,6 @@
  * Chanwoo Choi <cw00.choi@samsung.com>
  * Krzysztof Kozlowski <krzk@kernel.org>
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
  * This driver is based on max8997.h
  *
  * MAX14577 has MUIC, Charger devices.
diff --git a/include/linux/mfd/max77686-private.h b/include/linux/mfd/max77686-private.h
index 643dae777b43..833e578e051e 100644
--- a/include/linux/mfd/max77686-private.h
+++ b/include/linux/mfd/max77686-private.h
@@ -1,22 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * max77686-private.h - Voltage regulator driver for the Maxim 77686/802
  *
  *  Copyright (C) 2012 Samsung Electrnoics
  *  Chiwoong Byun <woong.byun@samsung.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
 #ifndef __LINUX_MFD_MAX77686_PRIV_H
diff --git a/include/linux/mfd/max77686.h b/include/linux/mfd/max77686.h
index d4b72d519115..d0fb510875e6 100644
--- a/include/linux/mfd/max77686.h
+++ b/include/linux/mfd/max77686.h
@@ -1,23 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * max77686.h - Driver for the Maxim 77686/802
  *
  *  Copyright (C) 2012 Samsung Electrnoics
  *  Chiwoong Byun <woong.byun@samsung.com>
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- *
  * This driver is based on max8997.h
  *
  * MAX77686 has PMIC, RTC devices.
diff --git a/include/linux/mfd/max77693-common.h b/include/linux/mfd/max77693-common.h
index 095b121aa725..a5bce099f1ed 100644
--- a/include/linux/mfd/max77693-common.h
+++ b/include/linux/mfd/max77693-common.h
@@ -1,12 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Common data shared between Maxim 77693 and 77843 drivers
  *
  * Copyright (C) 2015 Samsung Electronics
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
  */
 
 #ifndef __LINUX_MFD_MAX77693_COMMON_H
diff --git a/include/linux/mfd/max77693-private.h b/include/linux/mfd/max77693-private.h
index 3c7a63b98ad6..e798c81aec31 100644
--- a/include/linux/mfd/max77693-private.h
+++ b/include/linux/mfd/max77693-private.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * max77693-private.h - Voltage regulator driver for the Maxim 77693
  *
@@ -5,20 +6,6 @@
  *  SangYoung Son <hello.son@samsung.com>
  *
  * This program is not provided / owned by Maxim Integrated Products.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
 #ifndef __LINUX_MFD_MAX77693_PRIV_H
diff --git a/include/linux/mfd/max77693.h b/include/linux/mfd/max77693.h
index d450f687301b..c67c16ba8649 100644
--- a/include/linux/mfd/max77693.h
+++ b/include/linux/mfd/max77693.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * max77693.h - Driver for the Maxim 77693
  *
@@ -6,20 +7,6 @@
  *
  * This program is not provided / owned by Maxim Integrated Products.
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- *
  * This driver is based on max8997.h
  *
  * MAX77693 has PMIC, Charger, Flash LED, Haptic, MUIC devices.
diff --git a/include/linux/mfd/max77843-private.h b/include/linux/mfd/max77843-private.h
index b8908bf8d315..0bc7454c4dbe 100644
--- a/include/linux/mfd/max77843-private.h
+++ b/include/linux/mfd/max77843-private.h
@@ -1,14 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Common variables for the Maxim MAX77843 driver
  *
  * Copyright (C) 2015 Samsung Electronics
  * Author: Jaewon Kim <jaewon02.kim@samsung.com>
  * Author: Beomho Seo <beomho.seo@samsung.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
  */
 
 #ifndef __MAX77843_PRIVATE_H_
diff --git a/include/linux/mfd/max8997-private.h b/include/linux/mfd/max8997-private.h
index 78c76cd4d37b..a10cd6945232 100644
--- a/include/linux/mfd/max8997-private.h
+++ b/include/linux/mfd/max8997-private.h
@@ -1,22 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * max8997-private.h - Voltage regulator driver for the Maxim 8997
  *
  *  Copyright (C) 2010 Samsung Electrnoics
  *  MyungJoo Ham <myungjoo.ham@samsung.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
 #ifndef __LINUX_MFD_MAX8997_PRIV_H
diff --git a/include/linux/mfd/max8997.h b/include/linux/mfd/max8997.h
index cf815577bd68..3c4e920b4727 100644
--- a/include/linux/mfd/max8997.h
+++ b/include/linux/mfd/max8997.h
@@ -1,23 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * max8997.h - Driver for the Maxim 8997/8966
  *
  *  Copyright (C) 2009-2010 Samsung Electrnoics
  *  MyungJoo Ham <myungjoo.ham@samsung.com>
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- *
  * This driver is based on max8998.h
  *
  * MAX8997 has PMIC, MUIC, HAPTIC, RTC, FLASH, and Fuel Gauge devices.
diff --git a/include/linux/mfd/max8998-private.h b/include/linux/mfd/max8998-private.h
index d68ada502ff3..6deb5f577602 100644
--- a/include/linux/mfd/max8998-private.h
+++ b/include/linux/mfd/max8998-private.h
@@ -1,23 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * max8998-private.h - Voltage regulator driver for the Maxim 8998
  *
  *  Copyright (C) 2009-2010 Samsung Electrnoics
  *  Kyungmin Park <kyungmin.park@samsung.com>
  *  Marek Szyprowski <m.szyprowski@samsung.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
 #ifndef __LINUX_MFD_MAX8998_PRIV_H
diff --git a/include/linux/mfd/max8998.h b/include/linux/mfd/max8998.h
index e3956a654cbc..061af220dcd3 100644
--- a/include/linux/mfd/max8998.h
+++ b/include/linux/mfd/max8998.h
@@ -1,23 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * max8998.h - Voltage regulator driver for the Maxim 8998
  *
  *  Copyright (C) 2009-2010 Samsung Electrnoics
  *  Kyungmin Park <kyungmin.park@samsung.com>
  *  Marek Szyprowski <m.szyprowski@samsung.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
 #ifndef __LINUX_MFD_MAX8998_H
-- 
2.14.1
