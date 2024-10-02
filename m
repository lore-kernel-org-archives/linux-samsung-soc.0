Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC38322071
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Oct 2024 05:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727847231; cv=none; b=IfwKwtFCbRJMJhRjGMFclBy76DZacnVdOvZTrn+rqHtB22rmI1QiwO8DljylAgEg3hR5nkhKTUMMt8EHVVJKB+rz9z1LiuJXLA2XYTo2+vpU662N0G6kPG/Qla43kjyghPE8zXg7C++3tjBu5HUnv2nXyt9jMNaIAM43kTErBnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727847231; c=relaxed/simple;
	bh=2IasgynumCz2PlrBNsOErOTHOXXEsINpHik6DHniQLQ=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=Y2g8/AyPySNmF1l0ksoHgyb4Djz263rU69HS4XZ4jPtLzPk0URVI5w0wqcx2VqHusNBf+EJiJJB/F5FN6p22MoqCcWvCJtiCAy7y0gxmxTR9nqihY5s9ygyZvZ41d3OsKkfpDxKxK5inWCHeI5M7NSYQ9X4d84d5kQVb48vL/Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=vKXbMH5F; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="vKXbMH5F"
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241002053343epoutp029f038a2c1c59a4b4948eb360807fc68a~6i_VEPru32858728587epoutp02Q
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Oct 2024 05:33:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241002053343epoutp029f038a2c1c59a4b4948eb360807fc68a~6i_VEPru32858728587epoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1727847223;
	bh=5UHtMAoSAU9RlCmE9YmphOFxtehz5jmservIkITXERY=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=vKXbMH5F/YbWGsr5I4t6St4TGgxsMjM2+qSDEU3QQ34bvxbl1IfloU3HPkq5hx3gc
	 iNI5hWFd9y0VjRvInzazl5hnrOj+1Ko0vW6ZmiCEd4S6C8lla+TNDP5ANjZEyqvFgL
	 Usf9dGXgKkrjtKWgA47Qh7IBLGQZXSIad+IOQuaA=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTP id
	20241002053343epcas1p3b403cb30eaca8500517d0e5292f20f3a~6i_UxY8DP0767607676epcas1p3B;
	Wed,  2 Oct 2024 05:33:43 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.36.132]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4XJNlB3lsCz4x9Pt; Wed,  2 Oct
	2024 05:33:42 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
	epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	06.30.08588.63BDCF66; Wed,  2 Oct 2024 14:33:42 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
	20241002053342epcas1p41e1434d5a9d08e8afd343a4036d87ded~6i_TYCZqr1369013690epcas1p42;
	Wed,  2 Oct 2024 05:33:42 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241002053342epsmtrp29b2a9060b839a94253fecf93dad852b5~6i_TXLkRT3067930679epsmtrp2Q;
	Wed,  2 Oct 2024 05:33:42 +0000 (GMT)
X-AuditID: b6c32a33-aadb87000000218c-c2-66fcdb3609a9
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	05.66.07371.53BDCF66; Wed,  2 Oct 2024 14:33:41 +0900 (KST)
Received: from [127.0.1.1] (unknown [10.113.111.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241002053341epsmtip15c4b739c2d67e88ad37d2804d0daf606~6i_TErmYT1899818998epsmtip1O;
	Wed,  2 Oct 2024 05:33:41 +0000 (GMT)
From: Kwanghoon Son <k.son@samsung.com>
Date: Wed, 02 Oct 2024 14:33:22 +0900
Subject: [PATCH WIP 2/7] drm/exynos: Add Exynosautov9 decon
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20241002-auto9-v1-2-c4dc3385f415@samsung.com>
In-Reply-To: <20241002-auto9-v1-0-c4dc3385f415@samsung.com>
To: Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,  David Virag
	<virag.david003@gmail.com>,  Sam Protsenko <semen.protsenko@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, Kwanghoon Son <k.son@samsung.com>
X-Mailer: b4 0.14.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkk+LIzCtJLcpLzFFi42LZdlhTX9fs9p80g2sLhSwezNvGZjHp/gQW
	i941V5kszp/fwG4x4/w+JovnfUDi+PvHjA7sHjtn3WX32LSqk83jzrU9bB59W1YxenzeJBfA
	GpVtk5GamJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuWmQN0hpJC
	WWJOKVAoILG4WEnfzqYov7QkVSEjv7jEVim1ICWnwLRArzgxt7g0L10vL7XEytDAwMgUqDAh
	O+PhlilMBY2tbBVvj01namDc0sbaxcjJISFgIjH732mWLkYuDiGBHYwSvTcvMoMkhAQ+MUr0
	z/KFSHxjlLh56xZcx5KdP6A69jJK3Jj/gxXCecUocejeCkaQKjYBdYklbWvZQWwWAVWJ/19+
	MoHYwgLWEm1L9rGB2LwCghInZz5hAbGZBeQltr+dwwwRt5I483Mp2BxOoPpVt56C2SICpxkl
	/s9VhKj3kJjxbB07xEXCEp93r2EDOUJCoJFD4sT684wQCReJPc0f4IpeHd8CZUtJfH63lw3C
	zpY4+hHGLpG4PmsR1JvGEvuXTgY6mgNomabE+l36EHv5JN597WEFCUsI8Ep0tAlBmPIStzrL
	IRpFJc48/Qg10ENi8uN+Nkjw9DFKrNt2g2kCo/wsJN/PQvL9LIRlCxiZVzGKpRYU56anJhsW
	GMKjNTk/dxMjOC1qGe9gvDz/n94hRiYOxkOMEhzMSiK89w79TBPiTUmsrEotyo8vKs1JLT7E
	aAqMg4nMUqLJ+cDEnFcSb2hiaWBiZmRsYmFoZqgkznvmSlmqkEB6YklqdmpqQWoRTB8TB6dU
	A9M27pMc9V7OXRv5lvR3xN/seruWuVvo4IMUATPb64H6pYq5r8oWqX0veSNtoTJjQoHcxVXf
	zCPi3e4Gxa1et+mA1Oq6a9tuz+DgmGx0ol28NveqRwSj9WqW1Xvln2QIqjxnYnJ+kfrt9KNG
	3m+GH4rF3HsaN19oDl5XknXJVIK9S+6DIUe8cFXXIgnnYNVwVw27oq1Vv2RSPp6MnuwzxXW9
	qM2fAPNg1W4f+1XJ2d7S2/3WJXsqmXY5MVlZRpdMEuyMbk4LEfgeUz3330HFyT9ddOo1T03h
	mzfhfnft9x866YsmvKuvf/3//vO6CQuNpuX055d19/479qLmF4dtZXdNobnXGWHrvrBX0dVK
	LMUZiYZazEXFiQCeU4ggFAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPLMWRmVeSWpSXmKPExsWy7bCSnK7p7T9pBr8umFg8mLeNzWLS/Qks
	Fr1rrjJZnD+/gd1ixvl9TBbP+4DE8fePGR3YPXbOusvusWlVJ5vHnWt72Dz6tqxi9Pi8SS6A
	NYrLJiU1J7MstUjfLoEr4+GWKUwFja1sFW+PTWdqYNzSxtrFyMkhIWAisWTnD5YuRi4OIYHd
	jBLv/u5jhkiISnRcbmTsYuQAsoUlDh8uhqh5wSjR2PmQEaSGTUBdYknbWnYQm0VAVeL/l59M
	ILawgLVE25J9bCA2r4CgxMmZT1hA5jALaEqs36UPEmYWkJfY/nYOM0SJlcSZn0vBRgoB2Wt3
	vgG7jRNozKpbTxlB9ooInGOUuPZnLztEs4fEjGfr2CHuFJb4vHsN2wRGwVlI1s1CWDcLyboF
	jMyrGCVTC4pz03OTDQsM81LL9YoTc4tL89L1kvNzNzGC40BLYwfjvfn/9A4xMnEwHmKU4GBW
	EuG9d+hnmhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFewxmzU4QE0hNLUrNTUwtSi2CyTBycUg1M
	rz1mHbE7kXJhsYGmajLnRsZ5TYZeTQezWTpWVbTkd/mFLn1pdFhCcc8b6czZvklX35tcuue2
	KJrxw/7o096bJtjqyz3cxMPec8H04espna56rglvWAKDpNJO2H66wlgvzN7TPV9A8lHKvPKy
	D70l30/LzvnfMfst78qncQUC5sL/J36XYqjU/WX5r0QtUFEtuL54fb4Rk1/L5Q/bf8znylGK
	W/XBdfrcLXJrbX1PnorM2Vu85NqPv+1S82KzCnqZHmo0b47xcy3rtE+y8s54HHElIi4uY8l9
	6xt88y6pdBcnN3zffuXq1pMvb7Dt3NjGkxW24uTFtESFAxfuGtvlnTpya8INu+iOLMfbKoVK
	LMUZiYZazEXFiQDqitLE8gIAAA==
X-CMS-MailID: 20241002053342epcas1p41e1434d5a9d08e8afd343a4036d87ded
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241002053342epcas1p41e1434d5a9d08e8afd343a4036d87ded
References: <20241002-auto9-v1-0-c4dc3385f415@samsung.com>
	<CGME20241002053342epcas1p41e1434d5a9d08e8afd343a4036d87ded@epcas1p4.samsung.com>

Signed-off-by: Kwanghoon Son <k.son@samsung.com>
---
 drivers/gpu/drm/exynos/exynos9_decon.c | 1765 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/exynos/regs-decon9.h   | 1244 ++++++++++++++++++++++
 2 files changed, 3009 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos9_decon.c b/drivers/gpu/drm/exynos/exynos9_decon.c
new file mode 100644
index 000000000000..d51922eeeabd
--- /dev/null
+++ b/drivers/gpu/drm/exynos/exynos9_decon.c
@@ -0,0 +1,1765 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/console.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/irq.h>
+#include <linux/iopoll.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_vblank.h>
+#include <drm/drm_mode.h>
+#include <drm/drm_blend.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_framebuffer.h>
+#include <video/videomode.h>
+
+#include "exynos_drm_fb.h"
+#include "exynos_dpp.h"
+#include "exynos_dpu_dma.h"
+#include "exynos_drm_crtc.h"
+#include "exynos_drm_drv.h"
+#include "exynos_drm_plane.h"
+
+#include "regs-decon9.h"
+
+enum decon_type {
+	EXYNOS9_DECON0 = 0,
+	EXYNOS9_DECON1 = 1,
+	EXYNOS9_DECON2 = 2,
+};
+
+/* PD : Porter-Duff */
+enum decon_blend_pd_func {
+	PD_FUNC_CLEAR = 0x0,
+	PD_FUNC_COPY = 0x1,
+	PD_FUNC_DESTINATION = 0x2,
+	PD_FUNC_SOURCE_OVER = 0x3,
+	PD_FUNC_DESTINATION_OVER = 0x4,
+	PD_FUNC_SOURCE_IN = 0x5,
+	PD_FUNC_DESTINATION_IN = 0x6,
+	PD_FUNC_SOURCE_OUT = 0x7,
+	PD_FUNC_DESTINATION_OUT = 0x8,
+	PD_FUNC_SOURCE_A_TOP = 0x9,
+	PD_FUNC_DESTINATION_A_TOP = 0xa,
+	PD_FUNC_XOR = 0xb,
+	PD_FUNC_PLUS = 0xc,
+	PD_FUNC_USER_DEFINED = 0xd,
+};
+
+/*
+ * ALPHA_MULT_SRC_SEL_ALPHA0 : ALPHA_MULT = WINx_ALPHA_0_F * WINx_ALPHA_0_F
+ * ALPHA_MULT_SRC_SEL_ALPHA1 : ALPHA_MULT = WINx_ALPHA_1_F * WINx_ALPHA_0_F
+ * ALPHA_MULT_SRC_SEL_AF     : ALPHA_MULT = Af (Foreground incoming pixel-alpha) * WINx_ALPHA_0_F
+ * ALPHA_MULT_SRC_SEL_AB     : ALPHA_MULT = Ab (Background incoming pixel-alpha) * WINx_ALPHA_0_F
+ */
+enum decon_blend_alpha_mult_src {
+	ALPHA_MULT_SRC_SEL_ALPHA0 = 0x0,
+	ALPHA_MULT_SRC_SEL_ALPHA1 = 0x1,
+	ALPHA_MULT_SRC_SEL_AF = 0x2,
+	ALPHA_MULT_SRC_SEL_AB = 0x3,
+};
+
+enum decon_blend_mode {
+	DECON_BLENDING_NONE = 0x0,
+	DECON_BLENDING_PREMULT = 0x1,
+	DECON_BLENDING_COVERAGE = 0x2,
+	DECON_BLENDING_MAX = 0x3,
+};
+
+enum decon_win_alpha_coef {
+	BND_COEF_ZERO = 0x0,
+	BND_COEF_ONE = 0x1,
+	BND_COEF_AF = 0x2,
+	BND_COEF_1_M_AF = 0x3,
+	BND_COEF_AB = 0x4,
+	BND_COEF_1_M_AB = 0x5,
+	BND_COEF_PLANE_ALPHA0 = 0x6,
+	BND_COEF_1_M_PLANE_ALPHA0 = 0x7,
+	BND_COEF_PLANE_ALPHA1 = 0x8,
+	BND_COEF_1_M_PLANE_ALPHA1 = 0x9,
+	BND_COEF_ALPHA_MULT = 0xA,
+	BND_COEF_1_M_ALPHA_MULT = 0xB,
+};
+
+enum decon_rgb_order {
+	DECON_RGB = 0x0,
+	DECON_GBR = 0x1,
+	DECON_BRG = 0x2,
+	DECON_BGR = 0x4,
+	DECON_RBG = 0x5,
+	DECON_GRB = 0x6,
+};
+
+enum decon_op_mode {
+	DECON_VIDEO_MODE = 0,
+	DECON_MIPI_COMMAND_MODE = 1,
+	/* TODO: ADD DP command mode */
+};
+
+enum decon_te_mode { DECON_HW_TRIG = 0, DECON_SW_TRIG };
+
+enum decon_set_trig { DECON_TRIG_MASK = 0, DECON_TRIG_UNMASK };
+
+enum decon_te_from {
+	DECON_TE_FROM_DDI0 = 0,
+	DECON_TE_FROM_DDI1 = 1,
+	DECON_TE_FROM_DDI2 = 2,
+	MAX_DECON_TE_FROM_DDI = 3,
+};
+
+enum decon_out_type {
+	DECON_OUT_DSI0 = 1 << 0,
+	DECON_OUT_DSI1 = 1 << 1,
+	DECON_OUT_DSI = DECON_OUT_DSI0 | DECON_OUT_DSI1,
+	DECON_OUT_DP0_SST1 = 1 << 4,
+	DECON_OUT_DP0_SST2 = 1 << 5,
+	DECON_OUT_DP0_SST3 = 1 << 6,
+	DECON_OUT_DP0_SST4 = 1 << 7,
+	DECON_OUT_DP1_SST1 = 1 << 8,
+	DECON_OUT_DP1_SST2 = 1 << 9,
+	DECON_OUT_DP1_SST3 = 1 << 10,
+	DECON_OUT_DP1_SST4 = 1 << 11,
+	DECON_OUT_DP0 = DECON_OUT_DP0_SST1 | DECON_OUT_DP0_SST2 |
+			DECON_OUT_DP0_SST3 | DECON_OUT_DP0_SST4,
+	DECON_OUT_DP1 = DECON_OUT_DP1_SST1 | DECON_OUT_DP1_SST2 |
+			DECON_OUT_DP1_SST3 | DECON_OUT_DP1_SST4,
+	DECON_OUT_DP = DECON_OUT_DP0 | DECON_OUT_DP1,
+
+	DECON_OUT_WB = 1 << 12,
+};
+
+enum decon_dsi_mode {
+	DSI_MODE_SINGLE = 0,
+	DSI_MODE_DUAL_DSI,
+	DSI_MODE_DUAL_DISPLAY,
+	DSI_MODE_NONE
+};
+
+enum decon_irq {
+	DECON_IRQ_FS = 0,
+	DECON_IRQ_FD,
+	DECON_IRQ_EXT,
+	DECON_IRQ_DQE_DIM_S,
+	DECON_IRQ_DQE_DIM_E,
+};
+
+struct decon_mode {
+	enum decon_op_mode op_mode;
+	enum decon_dsi_mode dsi_mode;
+	enum decon_te_mode te_mode;
+};
+
+struct decon_urgent {
+	u32 rd_en;
+	u32 rd_hi_thres;
+	u32 rd_lo_thres;
+	u32 rd_wait_cycle;
+	u32 wr_en;
+	u32 wr_hi_thres;
+	u32 wr_lo_thres;
+	bool dta_en;
+	u32 dta_hi_thres;
+	u32 dta_lo_thres;
+};
+
+struct decon_vendor_pps {
+	unsigned int initial_xmit_delay;
+	unsigned int initial_dec_delay;
+	unsigned int scale_increment_interval;
+	unsigned int final_offset;
+};
+
+struct decon_config {
+	enum decon_out_type out_type;
+	unsigned int image_height;
+	unsigned int image_width;
+	unsigned int out_bpc;
+	struct decon_mode mode;
+	unsigned int fps;
+};
+
+struct win_color_map {
+	bool en;
+	u32 val;
+};
+
+struct decon_win_config {
+	u32 x, y, w, h;
+	u32 start_time;
+	u32 alpha;
+	enum decon_blend_mode blend_mode;
+	struct win_color_map color_map;
+	u32 dpp_type;
+};
+
+#define IS_DECON0(decon_idx) ((decon_idx) & 1 ? 0 : 1)
+#define IS_DSC0(dsc_idx) ((dsc_idx) & 1 ? 0 : 1)
+
+struct decon_cal_info {
+	u32 id;
+	const char *name;
+};
+
+#define DECON_CAL_INFO(_type) [(_type)] = { .id = (_type), .name = #_type }
+
+#define DECON_VIDEO_MODE_WIDTH_MIN 160
+#define DECON_COMMAND_MODE_WIDTH_MIN 16
+#define DECON_WIDTH_MAX 8192
+#define DECON_HEIGHT_MIN 8
+#define DECON_HEIGHT_MAX 8192
+
+struct decon_win {
+	u32 idx;
+	struct decon_win_config config;
+	struct exynos_dpp_context *dpp;
+	struct exynos_drm_plane plane;
+	struct exynos_drm_plane_config plane_config;
+};
+
+struct decon_context {
+	u32 idx;
+	u32 plane_mask;
+	enum decon_type type;
+	struct device *dev;
+	struct drm_device *drm_dev;
+	struct exynos_drm_crtc *crtc;
+	struct decon_win *win;
+	u32 win_cnt;
+	u32 win_max;
+	u32 disable_mask;
+	struct videomode v_mode;
+	struct decon_config config;
+
+	struct clk *aclk;
+
+	u32 irq_fd; /* frame done */
+
+	/* device ops */
+	const struct decon_cal_ops *cal_ops;
+
+	bool is_colormap;
+
+	bool fake_vblank;
+	struct delayed_work dwork;
+	void __iomem *regs[3]; /* main, sub0, sub1*/
+};
+
+#ifndef MSEC
+#define MSEC (1000)
+#endif
+
+#define MAX_WIN_PER_DECON 8
+
+enum {
+	DPUM_DECON0 = 0,
+	DPUM_DECON1,
+
+	DPUS0_DECON0,
+	DPUS0_DECON1,
+
+	DPUS1_DECON0,
+	DPUS1_DECON1,
+
+	MAX_EXYNOS910_DECON,
+};
+
+enum decon_idma_type {
+	IDMA_GF0 = 0,
+	IDMA_G0,
+	IDMA_VG0,
+	IDMA_G1,
+	IDMA_GF1,
+	IDMA_G2 = 5,
+	IDMA_VG1,
+	IDMA_G3,
+	IOTF0,
+	IOTF1,
+	IDMA_NONE,
+};
+
+enum decon_fifo_mode {
+	DECON_FIFO_00K = 0,
+	DECON_FIFO_04K,
+	DECON_FIFO_08K,
+	DECON_FIFO_12K,
+	DECON_FIFO_16K,
+	DECON_FIFO_20K,
+	DECON_FIFO_24K,
+	DECON_FIFO_28K,
+};
+
+enum decon_dsc_path {
+	DECON_DSC_NONE = 0x0,
+	DECON0_DSC_ENC0 = 0x1,
+	DECON1_DSC_ENC1 = 0x2,
+	DECON0_DSCC_DSC_ENC01 = 0xB,
+};
+
+enum decon_outif_path {
+	DECON0_OUTFIFO0_DSIMIF0 = 0x1,
+	DECON0_OUTFIFO0_DSIMIF1 = 0x2,
+	DECON0_SPLITTER_OUTFIFO01_DSIMIF01 = 0x3,
+	DECON0_OUTFIFO0_DPIF = 0x8,
+	DECON1_OUTFIFO0_DSIMIF = 0x1,
+	DECON1_OUTFIFO0_DPIF = 0x8,
+};
+
+enum decon_connection {
+	DECON0_OUT0_TO_DSIM0 = 0,
+	DECON0_OUT1_TO_DSIM0 = 1,
+	DECON1_OUT0_TO_DSIM0 = 2,
+
+	DECON0_OUT0_TO_DSIM1 = 0,
+	DECON0_OUT1_TO_DSIM1 = 1,
+	DECON1_OUT0_TO_DSIM1 = 2,
+
+	DECON0_OUT0_TO_DP = 0,
+	DECON1_OUT0_TO_DP = 1,
+};
+
+static void __iomem *regs_decon[MAX_EXYNOS910_DECON];
+static inline uint32_t decon_read(u32 idx, u32 offset)
+{
+	return readl(regs_decon[idx] + offset);
+}
+static inline void decon_write(u32 idx, u32 offset, u32 val)
+{
+	writel(val, regs_decon[idx] + offset);
+}
+static inline void decon_write_mask(u32 idx, u32 offset, u32 val, u32 mask)
+{
+	uint32_t old = decon_read(idx, offset);
+	val = (val & mask) | (old & ~mask);
+	decon_write(idx, offset, val);
+}
+
+static void __iomem *regs_decon_con[MAX_EXYNOS910_DECON];
+static inline uint32_t decon_con_read(u32 idx, u32 offset)
+{
+	return readl(regs_decon_con[idx] + offset);
+}
+static inline void decon_con_write(u32 idx, u32 offset, u32 val)
+{
+	writel(val, regs_decon_con[idx] + offset);
+}
+static inline void decon_con_write_mask(u32 idx, u32 offset, u32 val, u32 mask)
+{
+	uint32_t old = decon_con_read(idx, offset);
+	val = (val & mask) | (old & ~mask);
+	decon_con_write(idx, offset, val);
+}
+static void __iomem *regs_decon_global[MAX_EXYNOS910_DECON];
+static inline uint32_t decon_global_read(u32 idx, u32 offset)
+{
+	return readl(regs_decon_global[idx] + offset);
+}
+static inline void decon_global_write(u32 idx, u32 offset, u32 val)
+{
+	writel(val, regs_decon_global[idx] + offset);
+}
+static inline void decon_global_write_mask(u32 idx, u32 offset, u32 val,
+					   u32 mask)
+{
+	uint32_t old = decon_global_read(idx, offset);
+	val = (val & mask) | (old & ~mask);
+	decon_global_write(idx, offset, val);
+}
+static void __iomem *regs_win[MAX_EXYNOS910_DECON * 8];
+static inline uint32_t win_read(u32 idx, u32 offset)
+{
+	return readl(regs_win[idx] + offset);
+}
+static inline void win_write(u32 idx, u32 offset, u32 val)
+{
+	writel(val, regs_win[idx] + offset);
+}
+static inline void win_write_mask(u32 idx, u32 offset, u32 val, u32 mask)
+{
+	uint32_t old = win_read(idx, offset);
+	val = (val & mask) | (old & ~mask);
+	win_write(idx, offset, val);
+}
+static void __iomem *regs_winctrl[MAX_EXYNOS910_DECON * 8];
+static inline uint32_t winctrl_read(u32 idx, u32 offset)
+{
+	return readl(regs_winctrl[idx] + offset);
+}
+static inline uint32_t winctrl_read_mask(u32 idx, u32 offset, u32 mask)
+{
+	uint32_t val = winctrl_read(idx, offset);
+	val &= (mask);
+	return val;
+}
+static inline void winctrl_write(u32 idx, u32 offset, u32 val)
+{
+	writel(val, regs_winctrl[idx] + offset);
+}
+static inline void winctrl_write_mask(u32 idx, u32 offset, u32 val, u32 mask)
+{
+	uint32_t old = winctrl_read(idx, offset);
+	val = (val & mask) | (old & ~mask);
+	winctrl_write(idx, offset, val);
+}
+
+#define to_regwin_idx(decon_idx, win_idx) \
+	((decon_idx) * MAX_WIN_PER_DECON + (win_idx))
+
+static inline u32 decon_reg_dmaid2chmap(u32 dma_id)
+{
+	switch (dma_id) {
+	case 0:
+		return IDMA_GF0;
+	case 1:
+		return IDMA_G0;
+	case 2:
+		return IDMA_G1;
+	case 3:
+		return IDMA_GF1;
+	case 4:
+		return IDMA_VG0;
+	case 5:
+		return IDMA_G2;
+	case 6:
+		return IDMA_VG1;
+	case 7:
+		return IDMA_G3;
+	default:
+		return IDMA_NONE;
+	}
+}
+
+static void decon_reg_set_window_channel(u32 decon_idx, u32 win_idx, u32 dma_id)
+{
+	u32 val, mask;
+	u32 ch_type = decon_reg_dmaid2chmap(dma_id);
+
+	val = WIN_CHMAP_F(1, ch_type);
+	mask = WIN_CHMAP_MASK(1);
+	winctrl_write_mask(to_regwin_idx(decon_idx, win_idx),
+			   DATA_PATH_CONTROL_WIN, val, mask);
+}
+
+/*
+ * argb_color : 32-bit
+ * A[31:24] - R[23:16] - G[15:8] - B[7:0]
+ */
+static void decon_reg_set_window_colormap(u32 decon_idx, u32 win_idx,
+					  u32 argb_color)
+{
+	u32 val, mask;
+	u32 mc_alpha = 0, mc_red = 0;
+	u32 mc_green = 0, mc_blue = 0;
+
+	mc_alpha = (argb_color >> 24) & 0xFF;
+	mc_red = (argb_color >> 16) & 0xFF;
+	mc_green = (argb_color >> 8) & 0xFF;
+	mc_blue = (argb_color >> 0) & 0xFF;
+
+	val = WIN_MAPCOLOR_A_F(mc_alpha) | WIN_MAPCOLOR_R_F(mc_red);
+	mask = WIN_MAPCOLOR_A_MASK | WIN_MAPCOLOR_R_MASK;
+	win_write_mask(to_regwin_idx(decon_idx, win_idx), WIN_COLORMAP_0, val,
+		       mask);
+
+	val = WIN_MAPCOLOR_G_F(mc_green) | WIN_MAPCOLOR_B_F(mc_blue);
+	mask = WIN_MAPCOLOR_G_MASK | WIN_MAPCOLOR_B_MASK;
+	win_write_mask(to_regwin_idx(decon_idx, win_idx), WIN_COLORMAP_1, val,
+		       mask);
+}
+
+/* ALPHA_MULT selection used in (a',b',c',d') coefficient */
+static void decon_reg_set_win_alpha_mult(u32 decon_idx, u32 win_idx,
+					 enum decon_blend_alpha_mult_src a_sel)
+{
+	u32 val, mask;
+
+	val = WIN_ALPHA_MULT_SRC_SEL_F(a_sel);
+	mask = WIN_ALPHA_MULT_SRC_SEL_MASK;
+	win_write_mask(to_regwin_idx(decon_idx, win_idx), WIN_CONTROL_0, val,
+		       mask);
+}
+
+static void decon_reg_set_win_func(u32 decon_idx, u32 win_idx,
+				   enum decon_blend_pd_func pd_func)
+{
+	u32 val, mask;
+
+	val = WIN_FUNC_F(pd_func);
+	mask = WIN_FUNC_MASK;
+	win_write_mask(to_regwin_idx(decon_idx, win_idx), WIN_CONTROL_0, val,
+		       mask);
+}
+
+static void decon_reg_set_win_sub_coeff(u32 decon_idx, u32 win_idx, u32 fgd,
+					u32 bgd, u32 fga, u32 bga)
+{
+	u32 val, mask;
+
+	/*
+	 * [ Blending Equation ]
+	 * Color : Cr = (a x Cf) + (b x Cb)  <Cf=FG pxl_C, Cb=BG pxl_C>
+	 * Alpha : Ar = (c x Af) + (d x Ab)  <Af=FG pxl_A, Ab=BG pxl_A>
+	 *
+	 * [ User-defined ]
+	 * a' = WINx_FG_ALPHA_D_SEL : Af' that is multiplied by FG Pixel Color
+	 * b' = WINx_BG_ALPHA_D_SEL : Ab' that is multiplied by BG Pixel Color
+	 * c' = WINx_FG_ALPHA_A_SEL : Af' that is multiplied by FG Pixel Alpha
+	 * d' = WINx_BG_ALPHA_A_SEL : Ab' that is multiplied by BG Pixel Alpha
+	 */
+
+	val = (WIN_FG_ALPHA_D_SEL_F(fgd) | WIN_BG_ALPHA_D_SEL_F(bgd) |
+	       WIN_FG_ALPHA_A_SEL_F(fga) | WIN_BG_ALPHA_A_SEL_F(bga));
+	mask = (WIN_FG_ALPHA_D_SEL_MASK | WIN_BG_ALPHA_D_SEL_MASK |
+		WIN_FG_ALPHA_A_SEL_MASK | WIN_BG_ALPHA_A_SEL_MASK);
+	win_write_mask(to_regwin_idx(decon_idx, win_idx), WIN_CONTROL_1, val,
+		       mask);
+}
+
+static void decon_reg_set_win_plane_alpha(u32 decon_idx, u32 win_idx, u32 a0,
+					  u32 a1)
+{
+	u32 val, mask;
+
+	val = WIN_ALPHA1_F(a1) | WIN_ALPHA0_F(a0);
+	mask = WIN_ALPHA1_MASK | WIN_ALPHA0_MASK;
+	win_write_mask(to_regwin_idx(decon_idx, win_idx), WIN_CONTROL_0, val,
+		       mask);
+}
+
+static void decon_reg_set_win_blend_config(u32 decon_idx, u32 win_idx,
+					   struct decon_win_config *config)
+{
+	enum decon_blend_pd_func pd_func = PD_FUNC_USER_DEFINED;
+	u32 af_d = BND_COEF_ONE, ab_d = BND_COEF_ZERO, af_a = BND_COEF_ONE,
+	    ab_a = BND_COEF_ZERO;
+
+	switch (config->blend_mode) {
+	case DECON_BLENDING_COVERAGE:
+		af_d = BND_COEF_ALPHA_MULT;
+		ab_d = BND_COEF_1_M_ALPHA_MULT;
+		af_a = BND_COEF_ALPHA_MULT;
+		ab_a = BND_COEF_1_M_ALPHA_MULT;
+		break;
+	case DECON_BLENDING_PREMULT:
+		af_d = BND_COEF_PLANE_ALPHA0;
+		ab_d = BND_COEF_1_M_ALPHA_MULT;
+		af_a = BND_COEF_PLANE_ALPHA0;
+		ab_a = BND_COEF_1_M_ALPHA_MULT;
+		break;
+	case DECON_BLENDING_NONE:
+		pd_func = PD_FUNC_COPY;
+		pr_debug("%s:%d none blending mode\n", __func__, __LINE__);
+		break;
+	default:
+		pr_warn("%s:%d undefined blending mode\n", __func__, __LINE__);
+		break;
+	}
+
+	/* We use 'ALPHA_MULT_SRC_SEL_AF' alpha mode only */
+	decon_reg_set_win_alpha_mult(decon_idx, win_idx, ALPHA_MULT_SRC_SEL_AF);
+	decon_reg_set_win_plane_alpha(decon_idx, win_idx, config->alpha, 0x00);
+	decon_reg_set_win_func(decon_idx, win_idx, pd_func);
+	if (pd_func == PD_FUNC_USER_DEFINED)
+		decon_reg_set_win_sub_coeff(decon_idx, win_idx, af_d, ab_d,
+					    af_a, ab_a);
+}
+
+static inline u32 win_start_pos(int x, int y)
+{
+	return (WIN_STRPTR_Y_F(y) | WIN_STRPTR_X_F(x));
+}
+
+static inline u32 win_end_pos(int x, int y, u32 w, u32 h)
+{
+	return (WIN_ENDPTR_Y_F(y + h - 1) | WIN_ENDPTR_X_F(x + w - 1));
+}
+
+static void decon_reg_set_window_enable_colormap(u32 decon_idx, u32 win_idx,
+						 u32 en)
+{
+	u32 val, mask;
+
+	val = en ? ~0 : 0;
+	mask = WIN_MAPCOLOR_EN_F(0);
+	winctrl_write_mask(to_regwin_idx(decon_idx, win_idx),
+			   DATA_PATH_CONTROL_WIN, val, mask);
+}
+
+/* Decon window setting procedure
+ *
+ * 1. decon_reg_clear_window_update_req()
+ * 2. decon_reg_set_window_config()
+ * 3. decon_reg_set_window_enable()
+ * 4. decon_reg_set_window_update_req()
+ */
+
+static void decon_reg_set_window_enable(u32 decon_idx, u32 win_idx, u32 dma_id)
+{
+	u32 mask;
+
+	decon_reg_set_window_channel(decon_idx, win_idx, dma_id);
+	mask = WIN_EN_F(0);
+	winctrl_write_mask(to_regwin_idx(decon_idx, win_idx),
+			   DATA_PATH_CONTROL_WIN, ~0, mask);
+}
+
+static void decon_reg_set_window_disable(u32 decon_idx, u32 win_idx)
+{
+	u32 mask;
+
+	mask = WIN_EN_F(0);
+	winctrl_write_mask(to_regwin_idx(decon_idx, win_idx),
+			   DATA_PATH_CONTROL_WIN, 0, mask);
+	decon_reg_set_window_channel(decon_idx, win_idx, IDMA_GF0);
+}
+
+static void decon_reg_set_window_config(u32 decon_idx, u32 win_idx,
+					struct decon_win_config *config)
+{
+	u32 start_pos = win_start_pos(config->x, config->y);
+	u32 end_pos = win_end_pos(config->x, config->y, config->w, config->h);
+
+	win_write(to_regwin_idx(decon_idx, win_idx), WIN_START_POSITION,
+		  start_pos);
+	win_write(to_regwin_idx(decon_idx, win_idx), WIN_END_POSITION, end_pos);
+	win_write(to_regwin_idx(decon_idx, win_idx), WIN_START_TIME_CONTROL,
+		  config->start_time);
+
+	decon_reg_set_window_enable_colormap(decon_idx, win_idx,
+					     config->color_map.en);
+	decon_reg_set_window_colormap(decon_idx, win_idx,
+				      config->color_map.val);
+
+	decon_reg_set_win_blend_config(decon_idx, win_idx, config);
+}
+
+static void decon_reg_clear_window_config(u32 decon_idx, u32 win_idx)
+{
+	win_write(to_regwin_idx(decon_idx, win_idx), WIN_CONTROL_0, 0);
+	win_write(to_regwin_idx(decon_idx, win_idx), WIN_CONTROL_1, 0);
+
+	win_write(to_regwin_idx(decon_idx, win_idx), WIN_START_POSITION, 0);
+	win_write(to_regwin_idx(decon_idx, win_idx), WIN_END_POSITION, 0);
+	win_write(to_regwin_idx(decon_idx, win_idx), WIN_START_TIME_CONTROL, 0);
+}
+
+static void decon_reg_set_window_update_req(u32 decon_idx, u32 win_idx)
+{
+	u32 mask;
+
+	mask = SHD_UP_REQ;
+	winctrl_write_mask(to_regwin_idx(decon_idx, win_idx), UPDATE_REQ_WIN,
+			   ~0, mask);
+}
+
+static u32 decon_reg_get_window_status(u32 decon_idx, u32 win_idx)
+{
+	/* FIXME: Due to HW restrictions, cannot use to the shadow register
+	 * of winctrl(WINx_EN_F bit) in auto9. As an alternative, use the
+	 * WIN_END_POSITION value to check the status.
+	 */
+	return win_read(to_regwin_idx(decon_idx, win_idx),
+			WIN_END_POSITION + WIN_SHD_OFFSET) ?
+		       1 :
+		       0;
+}
+
+static int decon_reg_reset(u32 decon_idx)
+{
+	int tries;
+
+	decon_write_mask(decon_idx, GLOBAL_CONTROL, ~0, GLOBAL_CONTROL_SRESET);
+	for (tries = 2000; tries; --tries) {
+		if (~decon_read(decon_idx,
+				GLOBAL_CONTROL & GLOBAL_CONTROL_SRESET))
+			break;
+		udelay(10);
+	}
+
+	if (!tries) {
+		pr_err("failed to reset Decon\n");
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
+static void __decon_reg_set_enable(u32 decon_idx)
+{
+	u32 val, mask;
+
+	val = ~0;
+	mask = (GLOBAL_CONTROL_DECON_EN | GLOBAL_CONTROL_DECON_EN_F);
+	decon_write_mask(decon_idx, GLOBAL_CONTROL, val, mask);
+}
+
+static void __decon_reg_set_disable(u32 decon_idx)
+{
+	u32 val, mask;
+
+	val = 0;
+	mask = (GLOBAL_CONTROL_DECON_EN | GLOBAL_CONTROL_DECON_EN_F);
+	decon_write_mask(decon_idx, GLOBAL_CONTROL, val, mask);
+}
+
+static void decon_reg_set_disable_per_frame(u32 decon_idx)
+{
+	decon_write_mask(decon_idx, GLOBAL_CONTROL, 0,
+			 GLOBAL_CONTROL_DECON_EN_F);
+}
+
+static void decon_reg_set_operation_mode(u32 decon_idx, enum decon_op_mode mode)
+{
+	u32 val, mask;
+
+	mask = GLOBAL_CONTROL_OPERATION_MODE_F;
+
+	if (mode == DECON_MIPI_COMMAND_MODE)
+		val = GLOBAL_CONTROL_OPERATION_MODE_CMD_F;
+	else
+		val = GLOBAL_CONTROL_OPERATION_MODE_VIDEO_F;
+
+	decon_write_mask(decon_idx, GLOBAL_CONTROL, val, mask);
+}
+
+static void decon_reg_set_blender_bg_image_size(u32 decon_idx, u32 width,
+						u32 height)
+{
+	u32 val, mask;
+
+	val = BLENDER_BG_HEIGHT_F(height) | BLENDER_BG_WIDTH_F(width);
+	mask = BLENDER_BG_HEIGHT_MASK | BLENDER_BG_WIDTH_MASK;
+	decon_write_mask(decon_idx, BLENDER_BG_IMAGE_SIZE_0, val, mask);
+}
+
+static u32 decon_reg_get_run_status(u32 decon_idx)
+{
+	u32 val;
+
+	val = decon_read(decon_idx, GLOBAL_CONTROL);
+	if (val & GLOBAL_CONTROL_RUN_STATUS)
+		return 1;
+
+	return 0;
+}
+
+static int decon_reg_wait_run_status_timeout(u32 decon_idx,
+					     unsigned long timeout)
+{
+	u32 val;
+	int ret;
+
+	ret = read_poll_timeout_atomic(decon_reg_get_run_status, val, val, 100,
+				       timeout, false, decon_idx);
+	if (ret)
+		pr_err("decon%u wait timeout decon run status(%u)\n", decon_idx,
+		       val);
+
+	return ret;
+}
+
+/* Determine that DECON is perfectly shuttled off through
+ * checking this function
+ */
+static int decon_reg_wait_run_is_off_timeout(u32 decon_idx,
+					     unsigned long timeout)
+{
+	u32 val;
+	int ret;
+
+	ret = read_poll_timeout_atomic(decon_reg_get_run_status, val, !val, 100,
+				       timeout, false, decon_idx);
+	if (ret)
+		pr_err("decon%u wait timeout decon run is shut-off(%u)\n",
+		       decon_idx, val);
+
+	return ret;
+}
+
+/*
+ * API is considering real possible Display Scenario
+ * such as following examples
+ *  < Single display >
+ *  < Dual/Triple display >
+ *  < Dual display + DP >
+ *
+ * Modify/add configuration cases if necessary
+ * "Resource Confliction" will happen if enabled simultaneously
+ *
+ * it's in EVT1
+ * Total of SRAM = 28k (4k * 7ea)
+ *  DECON0 + DECON1 <= under 28k
+ * The SRAM should be combinated in accordance with the scenario
+ * without "resource conflicts"
+ *
+ * DECON0 : ~5k (DSC supported dual DSI and dual DSC)
+ * DECON1 : ~3k (not supported dual DSI and      DSC)
+ *
+ *   OF0    OF1    CAPA
+ *  SRAM0  SRAM0    2K (Shared)
+ *  SRAM1  SRAM4    4K
+ *  SRAM2  SRAM5    4K
+ *  SRAM3  SRAM6    4K
+ */
+static void decon_reg_set_sram_share(u32 decon_idx,
+				     enum decon_fifo_mode fifo_mode)
+{
+	u32 val = 0;
+	u32 id = IS_DECON0(decon_idx) ? 0 : 1;
+
+	switch (fifo_mode) {
+	case DECON_FIFO_04K:
+		if (id == 0)
+			val = SRAM0_SHARE_ENABLE_F;
+		else
+			val = SRAM1_SHARE_ENABLE_F;
+		break;
+	case DECON_FIFO_08K:
+		if (id == 0)
+			val = SRAM1_SHARE_ENABLE_F | SRAM4_SHARE_ENABLE_F;
+		else
+			val = SRAM2_SHARE_ENABLE_F | SRAM5_SHARE_ENABLE_F;
+		break;
+	case DECON_FIFO_12K:
+		if (id == 0)
+			val = SRAM1_SHARE_ENABLE_F | SRAM4_SHARE_ENABLE_F |
+			      SRAM0_SHARE_ENABLE_F;
+		else
+			val = SRAM3_SHARE_ENABLE_F | SRAM6_SHARE_ENABLE_F |
+			      SRAM0_SHARE_ENABLE_F;
+		break;
+	case DECON_FIFO_16K:
+		if (id == 0)
+			val = SRAM1_SHARE_ENABLE_F | SRAM4_SHARE_ENABLE_F |
+			      SRAM2_SHARE_ENABLE_F | SRAM5_SHARE_ENABLE_F;
+		else
+			val = SRAM2_SHARE_ENABLE_F | SRAM5_SHARE_ENABLE_F |
+			      SRAM3_SHARE_ENABLE_F | SRAM6_SHARE_ENABLE_F;
+		break;
+	case DECON_FIFO_20K:
+		if (id == 0)
+			val = SRAM1_SHARE_ENABLE_F | SRAM4_SHARE_ENABLE_F |
+			      SRAM3_SHARE_ENABLE_F | SRAM6_SHARE_ENABLE_F |
+			      SRAM0_SHARE_ENABLE_F;
+		else
+			val = SRAM2_SHARE_ENABLE_F | SRAM5_SHARE_ENABLE_F |
+			      SRAM3_SHARE_ENABLE_F | SRAM6_SHARE_ENABLE_F |
+			      SRAM0_SHARE_ENABLE_F;
+		break;
+	case DECON_FIFO_24K:
+		if (id == 0)
+			val = SRAM0_SHARE_ENABLE_F | SRAM4_SHARE_ENABLE_F |
+			      SRAM2_SHARE_ENABLE_F | SRAM5_SHARE_ENABLE_F |
+			      SRAM3_SHARE_ENABLE_F | SRAM6_SHARE_ENABLE_F;
+		else
+			val = SRAM1_SHARE_ENABLE_F | SRAM4_SHARE_ENABLE_F |
+			      SRAM2_SHARE_ENABLE_F | SRAM5_SHARE_ENABLE_F |
+			      SRAM3_SHARE_ENABLE_F | SRAM6_SHARE_ENABLE_F;
+		break;
+	case DECON_FIFO_28K:
+		val = ALL_SRAM_SHARE_ENABLE;
+		break;
+	case DECON_FIFO_00K:
+		val = ALL_SRAM_SHARE_DISABLE;
+		break;
+	default:
+		break;
+	}
+
+	decon_write(decon_idx, SRAM_SHARE_ENABLE, val);
+}
+
+static void decon_reg_set_outfifo_size_ctl0(u32 decon_idx, u32 width,
+					    u32 height)
+{
+	u32 val;
+	u32 th, mask;
+
+	/* OUTFIFO_0 */
+	val = OUTFIFO_HEIGHT_F(height) | OUTFIFO_WIDTH_F(width);
+	mask = OUTFIFO_HEIGHT_MASK | OUTFIFO_WIDTH_MASK;
+	decon_write(decon_idx, OUTFIFO_SIZE_CONTROL_0, val);
+
+	/* may be implemented later by considering 1/2H transfer */
+	th = OUTFIFO_TH_1H_F; /* 1H transfer */
+	mask = OUTFIFO_TH_MASK;
+	decon_write_mask(decon_idx, OUTFIFO_TH_CONTROL_0, th, mask);
+}
+
+static void decon_reg_set_outfifo_rgb_order(u32 decon_idx,
+					    enum decon_rgb_order order)
+{
+	u32 val, mask;
+
+	val = OUTFIFO_PIXEL_ORDER_SWAP_F(order);
+	mask = OUTFIFO_PIXEL_ORDER_SWAP_MASK;
+	decon_write_mask(decon_idx, OUTFIFO_DATA_ORDER_CONTROL, val, mask);
+}
+
+static void decon_reg_clear_interrupt_all(u32 decon_idx)
+{
+	u32 mask;
+
+	mask = (DPU_FRAME_DONE_INT_EN | DPU_FRAME_START_INT_EN);
+	decon_write_mask(decon_idx, INTERRUPT_PENDING, ~0, mask);
+
+	mask = (DPU_RESOURCE_CONFLICT_INT_EN | DPU_TIME_OUT_INT_EN);
+	decon_write_mask(decon_idx, EXTRA_INTERRUPT_PENDING, ~0, mask);
+}
+
+static void decon_reg_set_dsc_path(u32 decon_idx, enum decon_dsc_path dpath)
+{
+	u32 mask;
+
+	mask = DSC_PATH_MASK;
+
+	decon_write_mask(decon_idx, DATA_PATH_CONTROL_2, DSC_PATH_F(dpath),
+			 mask);
+}
+
+static void decon_reg_set_outif_path(u32 decon_idx, enum decon_outif_path opath)
+{
+	u32 mask;
+
+	mask = OUTIF_PATH_MASK;
+
+	decon_write_mask(decon_idx, DATA_PATH_CONTROL_2, OUTIF_PATH_F(opath),
+			 mask);
+}
+
+/*  <SEL_ATB relation between DECON and DPTX>
+DPUM ATB0 DP0_SST1
+     ATB1 DP0_SST2
+     ATB2 X(non wired)
+     ATB3 X(non wired)
+DPUS0 ATB0 DP0_SST3
+      ATB1 DP0_SST4
+      ATB2 DP1_SST1
+      ATB3 DP1_SST2
+DPUS1 ATB0 DP1_SST3
+      ATB1 DP1_SST4
+      ATB2 X(non wired)
+      ATB3 X(non wired) */
+static u32 decon_reg_get_sel_atb(u32 decon_idx, enum decon_out_type out_type)
+{
+	u32 sel_atb =
+		0x4; /* The ATB reset value is 0x4.(DP does not drive any ATB path) */
+
+	switch (out_type) {
+	case DECON_OUT_DP0_SST1:
+	case DECON_OUT_DP0_SST3:
+	case DECON_OUT_DP1_SST3:
+		sel_atb = 0x0;
+		break;
+	case DECON_OUT_DP0_SST2:
+	case DECON_OUT_DP0_SST4:
+	case DECON_OUT_DP1_SST4:
+		sel_atb = 0x1;
+		break;
+	case DECON_OUT_DP1_SST1:
+		sel_atb = 0x2;
+		break;
+	case DECON_OUT_DP1_SST2:
+		sel_atb = 0x3;
+		break;
+	default:
+		pr_err("decon %u, invalid out_type = %#x\n", decon_idx,
+		       out_type);
+		break;
+	}
+
+	return DP_CONNECTION_SEL_ATB_F(sel_atb);
+}
+
+static void decon_reg_set_output(u32 decon_idx, enum decon_out_type out_type)
+{
+	u32 con_ctrl, out_if, sel_if, sel_atb = 0x4; /* IF: Interface */
+
+	if (out_type & DECON_OUT_DSI) {
+		if (decon_idx > DPUM_DECON1)
+			return;
+
+		if (out_type & DECON_OUT_DSI0) {
+			if (IS_DECON0(decon_idx)) {
+				/*
+				 * DSIM can be connected with any DSIMIF.
+				 * Below two combinations are possible.
+				 * 1. OUT0 + OUTFIFO0_DSIMIF0
+				 * 2. OUT1 + OUTFIFO0_DSIMIF1
+				 */
+				out_if = DECON0_OUTFIFO0_DSIMIF0;
+				sel_if = DECON0_OUT0_TO_DSIM0;
+			} else {
+				out_if = DECON1_OUTFIFO0_DSIMIF;
+				sel_if = DECON1_OUT0_TO_DSIM0;
+			}
+			con_ctrl = DSIM0_CONNECTION_CONTROL;
+
+			decon_reg_set_outif_path(decon_idx, out_if);
+			decon_con_write_mask(decon_idx, con_ctrl, sel_if,
+					     DSIM_CONNECTION_DSIM_MASK);
+		}
+		if (out_type & DECON_OUT_DSI1) {
+			if (IS_DECON0(decon_idx)) {
+				/*
+				 * DSIM can be connected with any DSIMIF.
+				 * Below two combinations are possible.
+				 * 1. OUT0 + OUTFIFO0_DSIMIF0
+				 * 2. OUT1 + OUTFIFO0_DSIMIF1
+				 */
+				out_if = DECON0_OUTFIFO0_DSIMIF1;
+				sel_if = DECON0_OUT1_TO_DSIM1;
+			} else {
+				out_if = DECON1_OUTFIFO0_DSIMIF;
+				sel_if = DECON1_OUT0_TO_DSIM1;
+			}
+			con_ctrl = DSIM1_CONNECTION_CONTROL;
+
+			decon_reg_set_outif_path(decon_idx, out_if);
+			decon_con_write_mask(decon_idx, con_ctrl, sel_if,
+					     DSIM_CONNECTION_DSIM_MASK);
+		}
+	}
+
+	if (out_type & DECON_OUT_DP) {
+		sel_atb = decon_reg_get_sel_atb(decon_idx, out_type);
+
+		if (IS_DECON0(decon_idx)) {
+			out_if = DECON0_OUTFIFO0_DPIF;
+			sel_if = DP_CONNECTION_SEL_F(DECON0_OUT0_TO_DP) |
+				 sel_atb;
+			con_ctrl = DP0_CONNECTION_CONTROL_0;
+		} else {
+			out_if = DECON1_OUTFIFO0_DPIF;
+			sel_if = DP_CONNECTION_SEL_F(DECON1_OUT0_TO_DP) |
+				 sel_atb;
+			con_ctrl = DP1_CONNECTION_CONTROL_0;
+		}
+
+		decon_reg_set_outif_path(decon_idx, out_if);
+		decon_con_write_mask(decon_idx, con_ctrl, sel_if,
+				     DP_CONNECTION_SEL_MASK |
+					     DP_CONNECTION_SEL_ATB_MASK);
+	}
+}
+
+static void decon_reg_set_te(u32 decon_idx, struct decon_mode mode,
+			     enum decon_set_trig trig)
+{
+	u32 val, mask;
+
+	if (mode.op_mode == DECON_VIDEO_MODE)
+		return;
+
+	if (mode.te_mode == DECON_SW_TRIG) {
+		val = (trig == DECON_TRIG_UNMASK) ? SW_TRIG_EN : 0;
+		mask = HW_TRIG_EN | SW_TRIG_EN;
+	} else { /* DECON_HW_TRIG */
+		val = (trig == DECON_TRIG_UNMASK) ? HW_TRIG_EN :
+						    HW_TRIG_MASK_DECON;
+		mask = HW_TRIG_EN | HW_TRIG_MASK_DECON;
+	}
+
+	decon_write_mask(decon_idx, HW_SW_TRIG_CONTROL, val, mask);
+}
+
+static void decon_reg_set_update_req_global(u32 decon_idx)
+{
+	decon_global_write_mask(decon_idx, SHADOW_REG_UPDATE_REQ, ~0,
+				SHADOW_REG_UPDATE_REQ_GLOBAL);
+}
+
+static void decon_reg_set_interrupt(u32 decon_idx, u32 en)
+{
+	u32 val, mask;
+
+	decon_reg_clear_interrupt_all(decon_idx);
+
+	if (en) {
+		val = (DPU_FRAME_DONE_INT_EN | DPU_FRAME_START_INT_EN |
+		       DPU_EXTRA_INT_EN | DPU_INT_EN);
+
+		decon_write_mask(decon_idx, INTERRUPT_ENABLE, val,
+				 INTERRUPT_ENABLE_MASK);
+		pr_debug("decon %u, interrupt val = %x\n", decon_idx, val);
+
+		val = (DPU_RESOURCE_CONFLICT_INT_EN | DPU_TIME_OUT_INT_EN);
+		decon_write(decon_idx, EXTRA_INTERRUPT_ENABLE, val);
+	} else {
+		mask = (DPU_EXTRA_INT_EN | DPU_INT_EN);
+		decon_write_mask(decon_idx, INTERRUPT_ENABLE, 0, mask);
+	}
+}
+
+static u32 decon_reg_clear_extra_interrupt(u32 decon_idx)
+{
+	u32 reg = EXTRA_INTERRUPT_PENDING;
+	u32 val = decon_read(decon_idx, reg);
+
+	if (val & DPU_RESOURCE_CONFLICT_INT_PEND) {
+		decon_write(decon_idx, reg, DPU_RESOURCE_CONFLICT_INT_PEND);
+		pr_warn("decon%u INFO0: SRAM_RSC & DSC = 0x%x\n", decon_idx,
+			decon_read(decon_idx, RESOURCE_OCCUPANCY_INFO_0));
+		pr_warn("decon%u INFO1: DMA_CH_RSC= 0x%x\n", decon_idx,
+			decon_read(decon_idx, RESOURCE_OCCUPANCY_INFO_1));
+		pr_warn("decon%u INFO2: WIN_RSC= 0x%x\n", decon_idx,
+			decon_read(decon_idx, RESOURCE_OCCUPANCY_INFO_2));
+	}
+
+	/*
+	 * Timeout interrupt is occurred when aclk counter is over
+	 * 'DECONx_TIME_OUT_VALUE'.
+	 * This counter value is reset by FRAME_DONE signal
+	 */
+	if (val & DPU_TIME_OUT_INT_PEND) {
+		decon_write(decon_idx, reg, DPU_TIME_OUT_INT_PEND);
+		pr_warn("decon%u time out interrupt occured!\n", decon_idx);
+		pr_warn("decon%u maybe stuck now!\n", decon_idx);
+	}
+
+	return val;
+}
+
+static u32 decon_reg_clear_interrupt(u32 decon_idx, enum decon_irq irq)
+{
+	u32 pending_val = decon_read(decon_idx, INTERRUPT_PENDING);
+
+	if (irq == DECON_IRQ_FS && (pending_val & DPU_FRAME_START_INT_PEND)) {
+		/* Clear Interrupt */
+		decon_write(decon_idx, INTERRUPT_PENDING,
+			    DPU_FRAME_START_INT_PEND);
+	}
+
+	if (irq == DECON_IRQ_FD && (pending_val & DPU_FRAME_DONE_INT_PEND)) {
+		/* Clear Interrupt */
+		decon_write(decon_idx, INTERRUPT_PENDING,
+			    DPU_FRAME_DONE_INT_PEND);
+	}
+
+	if (irq == DECON_IRQ_EXT && (pending_val & DPU_EXTRA_INT_PEND)) {
+		/* Clear Interrupt */
+		decon_write(decon_idx, INTERRUPT_PENDING, DPU_EXTRA_INT_PEND);
+		decon_reg_clear_extra_interrupt(decon_idx);
+	}
+
+	return pending_val;
+}
+
+#define SHADOW_UPDATE_TIMEOUT (50 * 1000)
+
+static u32 decon_reg_get_window_update_req(u32 decon_idx, u32 win_idx)
+{
+	return winctrl_read_mask(to_regwin_idx(decon_idx, win_idx),
+				 UPDATE_REQ_WIN, SHD_UP_REQ);
+}
+
+static u32 decon_reg_get_shadow_update_req(u32 decon_idx)
+{
+	return decon_global_read(decon_idx, SHADOW_REG_UPDATE_REQ);
+}
+
+static void decon_reg_set_bpc(u32 decon_idx, u32 bpc)
+{
+	u32 val;
+
+	val = (bpc == 10) ? GLOBAL_CONTROL_TEN_BPC_MODE_F : 0;
+
+	decon_write_mask(decon_idx, GLOBAL_CONTROL, val,
+			 GLOBAL_CONTROL_TEN_BPC_MODE_MASK);
+}
+
+static int decon_reg_set_config(u32 decon_idx, struct decon_config config)
+{
+	enum decon_rgb_order rgb_order = DECON_RGB;
+
+	/* OUTFIFO_PIXEL_ORDER_SWAP_F
+	  * Use DECON_BGR at raw image transfer to DSIM.
+	  * Use DECON_RGB at compressed stream tranfer to DSIM.
+	  * Use DECON_RGB at DP connection.
+	  *
+	  * TODO : if DSC feature added, code must be modified like this.
+	  * if((config->out_type & DECON_OUT_DSI) && (DSC==DISABLE))
+	  * 	rgb_order = DECON_BGR;
+	  * else
+	  * 	rgb_order = DECON_RGB;
+	 */
+	if (config.out_type & DECON_OUT_DSI)
+		rgb_order = DECON_BGR;
+
+	decon_reg_set_operation_mode(decon_idx, config.mode.op_mode);
+	decon_reg_set_blender_bg_image_size(decon_idx,
+					    (config.mode.dsi_mode ==
+					     DSI_MODE_DUAL_DSI) ?
+						    (config.image_width * 2) :
+						    config.image_width,
+					    config.image_height);
+	decon_reg_set_bpc(decon_idx, config.out_bpc);
+	decon_reg_clear_interrupt_all(decon_idx);
+	decon_reg_set_outfifo_size_ctl0(decon_idx, config.image_width,
+					config.image_height);
+	decon_reg_set_sram_share(decon_idx, DECON_FIFO_08K);
+
+	decon_reg_set_outfifo_rgb_order(decon_idx, rgb_order);
+	decon_reg_set_output(decon_idx, config.out_type);
+
+	return 0;
+}
+
+static int decon_reg_set_enable(u32 decon_idx, struct decon_config config)
+{
+	int ret = 0;
+
+	decon_reg_set_config(decon_idx, config);
+	// if (config.dsc.enable)
+	// 	decon_reg_set_dsc(decon_idx, config.dsc);
+	// else
+	decon_reg_set_dsc_path(decon_idx, DECON_DSC_NONE);
+	__decon_reg_set_enable(decon_idx);
+	decon_reg_set_update_req_global(decon_idx);
+	decon_reg_wait_run_status_timeout(decon_idx, 20 * 1000);
+	decon_reg_set_te(decon_idx, config.mode, DECON_TRIG_UNMASK);
+
+	return ret;
+}
+
+static int decon_reg_set_disable(u32 decon_idx, struct decon_mode mode)
+{
+	int ret = 0;
+	const int timeout_value = 1000 / 60 * 12 / 10 + 5;
+
+	if (!decon_reg_get_run_status(decon_idx)) {
+		pr_info("already IDLE status\n");
+		return 0;
+	}
+
+	decon_reg_set_te(decon_idx, mode, DECON_TRIG_MASK);
+
+	decon_reg_set_disable_per_frame(decon_idx);
+	decon_reg_set_update_req_global(decon_idx);
+
+	ret = decon_reg_wait_run_is_off_timeout(decon_idx,
+						timeout_value * MSEC);
+	if (!ret) {
+		decon_reg_reset(decon_idx);
+		return 0;
+	} else {
+		__decon_reg_set_disable(decon_idx);
+		decon_reg_set_update_req_global(decon_idx);
+
+		ret = decon_reg_wait_run_is_off_timeout(decon_idx,
+							timeout_value * MSEC);
+		decon_reg_clear_interrupt_all(decon_idx);
+	}
+
+	return ret;
+}
+
+static void decon_reg_enable_window(u32 decon_idx, u32 win_idx,
+				    struct decon_win_config *config)
+{
+	if (!config) {
+		pr_err("window%d config is NULL\n", win_idx);
+		return;
+	}
+
+	decon_reg_set_window_config(decon_idx, win_idx, config);
+	decon_reg_set_window_enable(decon_idx, win_idx, config->dpp_type);
+}
+
+static void decon_reg_disable_window(u32 decon_idx, u32 win_idx)
+{
+	decon_reg_clear_window_config(decon_idx, win_idx);
+	decon_reg_set_window_disable(decon_idx, win_idx);
+}
+
+static int decon_reg_enable(u32 decon_idx, struct decon_config config)
+{
+	int ret = 0;
+
+	ret = decon_reg_set_enable(decon_idx, config);
+	if (ret)
+		return ret;
+
+	decon_reg_set_interrupt(decon_idx, 1);
+
+	return ret;
+}
+
+static int decon_reg_disable(u32 decon_idx, struct decon_config config)
+{
+	int ret = 0;
+
+	decon_reg_set_interrupt(decon_idx, 0);
+
+	ret = decon_reg_set_disable(decon_idx, config.mode);
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
+struct decon_dev_data {
+	const u32 nr_decon;
+	const u32 nr_win;
+	const struct decon_cal_ops *cal_ops;
+};
+
+static const struct decon_dev_data exynos910_decon = {
+	.nr_decon = 2,
+	.nr_win = 8,
+};
+
+static const struct of_device_id decon_driver_dt_match[] = {
+	{ .compatible = "samsung,exynos910-decon",
+	  .data = (void *)&exynos910_decon },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, decon_driver_dt_match);
+
+static struct decon_win *plane_to_decon_win(struct drm_plane *e)
+{
+	return container_of(to_exynos_plane(e), struct decon_win, plane);
+}
+
+/* ARGB value */
+#define COLOR_MAP_VALUE 0x00ff0000
+
+static void decon_set_win_color_map(struct decon_win *window, bool en)
+{
+	struct decon_win_config *config = &window->config;
+
+	config->color_map.en = en;
+	config->color_map.val = COLOR_MAP_VALUE;
+}
+
+static enum drm_mode_status
+decon_mode_valid(struct exynos_drm_crtc *crtc,
+		 const struct drm_display_mode *mode)
+{
+	struct decon_context *ctx = crtc->ctx;
+
+	/* DECON use only video mode */
+	if ((mode->hdisplay < DECON_VIDEO_MODE_WIDTH_MIN) ||
+	    (mode->hdisplay > DECON_WIDTH_MAX) || (mode->hdisplay % 2)) {
+		drm_err(ctx->drm_dev, "mode hdisplay(%d) is bad\n",
+			mode->hdisplay);
+		return MODE_BAD_HVALUE;
+	}
+
+	if ((mode->vdisplay < DECON_HEIGHT_MIN) ||
+	    (mode->vdisplay > DECON_WIDTH_MAX)) {
+		drm_err(ctx->drm_dev, "mode vdisplay(%d) is bad\n",
+			mode->vdisplay);
+		return MODE_BAD_VVALUE;
+	}
+
+	return MODE_OK;
+}
+
+static void decon_atomic_begin(struct exynos_drm_crtc *crtc)
+{
+	struct decon_context *ctx = crtc->ctx;
+
+	decon_reg_set_te(ctx->idx, ctx->config.mode, DECON_TRIG_MASK);
+}
+
+static enum decon_blend_mode to_decon_blend_mode(u16 drm_blend_mode)
+{
+	switch (drm_blend_mode) {
+	case DRM_MODE_BLEND_PIXEL_NONE:
+		return DECON_BLENDING_NONE;
+
+	case DRM_MODE_BLEND_COVERAGE:
+		return DECON_BLENDING_COVERAGE;
+
+	case DRM_MODE_BLEND_PREMULTI:
+	default:
+		return DECON_BLENDING_PREMULT;
+	}
+}
+
+static void decon_update_plane(struct exynos_drm_crtc *crtc,
+			       struct exynos_drm_plane *plane)
+{
+	struct exynos_drm_plane_state *state =
+		to_exynos_plane_state(plane->base.state);
+	struct decon_context *ctx = crtc->ctx;
+	struct decon_win *window = plane_to_decon_win(&plane->base);
+	struct decon_win_config *config = &window->config;
+	struct exynos_drm_rect *rect = &state->crtc;
+	struct drm_device *drm_dev = ctx->drm_dev;
+	struct exynos_drm_private *priv = drm_dev->dev_private;
+	struct exynos_dpu_dma_context *dma_ctx = dev_get_drvdata(priv->dma_dev);
+
+	ctx->plane_mask |= drm_plane_mask(&plane->base);
+
+	config->x = state->crtc.x;
+	config->y = state->crtc.y;
+	config->w = state->crtc.w;
+	config->h = state->crtc.h;
+	config->start_time = 0;
+	config->alpha = state->base.alpha >> 8;
+	config->blend_mode = to_decon_blend_mode(state->base.pixel_blend_mode);
+	config->dpp_type = window->dpp->type;
+
+	decon_set_win_color_map(window, ctx->is_colormap);
+
+	dpp_update(window->dpp, 0, state);
+	dpu_dma_update(dma_ctx, 0, state);
+
+	decon_reg_enable_window(ctx->idx, window->idx, config);
+
+	drm_dbg(ctx->drm_dev, "WINDOW-%d(%s)(%4d, %4d, %4d, %4d)", window->idx,
+		dev_name(window->dpp->dev), rect->x, rect->y, rect->w, rect->h);
+}
+
+static void decon_disable_plane(struct exynos_drm_crtc *crtc,
+				struct exynos_drm_plane *plane)
+{
+	struct decon_context *ctx = crtc->ctx;
+	struct decon_win *window = plane_to_decon_win(&plane->base);
+
+	ctx->plane_mask |= drm_plane_mask(&plane->base);
+
+	decon_reg_disable_window(ctx->idx, window->idx);
+
+	ctx->disable_mask |= (1 << window->idx);
+
+	drm_dbg(ctx->drm_dev, "WINDOW-%d(%s)\n", window->idx,
+		dev_name(window->dpp->dev));
+}
+
+static void decon_atomic_flush(struct exynos_drm_crtc *crtc)
+{
+	struct decon_context *ctx = crtc->ctx;
+	struct drm_crtc_state *state = crtc->base.state;
+	struct drm_plane *plane;
+	bool req_global = true;
+
+	synchronize_irq(ctx->irq_fd);
+
+	drm_for_each_plane_mask(plane, ctx->drm_dev, ctx->plane_mask) {
+		struct decon_win *window = plane_to_decon_win(plane);
+
+		/* window update first to guarantee dma stop during dpp_disable */
+		decon_reg_set_window_update_req(ctx->idx, window->idx);
+
+		// if (ctx->disable_mask & (1 << window->idx))
+		// 	dpp_disable(window->dpp);
+
+		/* If at least one window is running, there is no need to set
+		 * global update
+		 */
+		if (req_global &&
+		    decon_reg_get_window_status(ctx->idx, window->idx))
+			req_global = false;
+	}
+	ctx->disable_mask = 0;
+
+	if (drm_atomic_crtc_needs_modeset(state) || req_global)
+		decon_reg_set_update_req_global(ctx->idx);
+
+	/* In case of fake vblank, it make vblank after 1 vsync time(16ms) */
+	// if (ctx->fake_vblank)
+	// 	drm_crtc_handle_vblank(&crtc->base);
+	// schedule_delayed_work(&ctx->dwork, msecs_to_jiffies(16));
+
+	decon_reg_set_te(ctx->idx, ctx->config.mode, DECON_TRIG_UNMASK);
+	exynos_crtc_handle_event(crtc);
+
+	drm_dbg(ctx->drm_dev, "flushed\n");
+}
+
+static void decon_config_print(struct decon_config *config)
+{
+	struct decon_context *ctx =
+		container_of(config, struct decon_context, config);
+	char *str_output = NULL;
+
+	drm_dbg(ctx->drm_dev, "Operation Mode: %s\n",
+		config->mode.op_mode ? "MIPI Command" : "Video");
+	if (config->mode.op_mode == DECON_MIPI_COMMAND_MODE)
+		drm_info(ctx->drm_dev, "Trigger Mode: %s\n",
+			 config->mode.te_mode ? "SW" : "HW");
+
+	if (config->out_type & DECON_OUT_DSI0)
+		str_output = "DSI0";
+	else if (config->out_type & DECON_OUT_DSI1)
+		str_output = "DSI1";
+	else if (config->out_type & DECON_OUT_DP0)
+		str_output = "DP0";
+	else if (config->out_type & DECON_OUT_DP1)
+		str_output = "DP1";
+
+	drm_info(ctx->drm_dev, "Output: %s\n", str_output);
+}
+
+static void decon_set_mode(struct exynos_drm_crtc *crtc)
+{
+	struct decon_context *ctx = crtc->ctx;
+	struct decon_mode *mode = &(ctx->config.mode);
+	enum decon_out_type out_type = 0;
+	struct drm_encoder *encoder;
+
+	drm_for_each_encoder_mask(encoder, crtc->base.dev,
+				  crtc->base.state->encoder_mask)
+		// TODO: make read port number and get it.
+		out_type = DECON_OUT_DP0_SST1;
+
+	if (out_type & DECON_OUT_DP)
+		mode->op_mode = DECON_VIDEO_MODE;
+
+	ctx->config.out_type = out_type;
+}
+
+static void decon_enable(struct exynos_drm_crtc *crtc)
+{
+	struct decon_context *ctx = crtc->ctx;
+
+	drm_display_mode_to_videomode(&crtc->base.mode, &ctx->v_mode);
+
+	ctx->config.image_width = ctx->v_mode.hactive;
+	ctx->config.image_height = ctx->v_mode.vactive;
+	ctx->config.fps = drm_mode_vrefresh(&crtc->base.mode);
+
+	decon_set_mode(crtc);
+
+	decon_reg_enable(ctx->idx, ctx->config);
+
+	enable_irq(ctx->irq_fd);
+
+	decon_config_print(&ctx->config);
+	drm_info(ctx->drm_dev, "enabled! crtc[%d] = %dx%d-%dHz (%d out_bpc)\n",
+		 crtc->base.base.id, ctx->config.image_width,
+		 ctx->config.image_height, ctx->config.fps,
+		 ctx->config.out_bpc);
+}
+
+static void decon_disable(struct exynos_drm_crtc *crtc)
+{
+	struct decon_context *ctx = crtc->ctx;
+
+	disable_irq(ctx->irq_fd);
+}
+
+static const struct exynos_drm_crtc_ops decon_crtc_ops = {
+	.atomic_enable = decon_enable,
+	.atomic_disable = decon_disable,
+	.mode_valid = decon_mode_valid,
+	.atomic_begin = decon_atomic_begin,
+	.update_plane = decon_update_plane,
+	.disable_plane = decon_disable_plane,
+	.atomic_flush = decon_atomic_flush,
+};
+
+/* H/W goes to stop or reset state when OS restarting during h/w operation */
+static void decon_reset(struct decon_context *ctx, int rpm_req)
+{
+	int ret;
+	struct decon_config config = { 0 };
+
+	ret = decon_reg_disable(ctx->idx, config);
+	if (ret) {
+		drm_err(ctx->drm_dev, "failed to try job_abort\n");
+	}
+}
+
+static enum drm_plane_type decon_get_win_type(int win_idx, int last_idx)
+{
+	if (win_idx == 0)
+		return DRM_PLANE_TYPE_PRIMARY;
+	else if (win_idx == last_idx)
+		return DRM_PLANE_TYPE_CURSOR;
+	else
+		return DRM_PLANE_TYPE_OVERLAY;
+};
+
+static const u32 dpp_gf_formats[] = {
+	DRM_FORMAT_ARGB8888,	DRM_FORMAT_ABGR8888,	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_BGRA8888,	DRM_FORMAT_XRGB8888,	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBX8888,	DRM_FORMAT_BGRX8888,	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,	DRM_FORMAT_ARGB2101010, DRM_FORMAT_ABGR2101010,
+	DRM_FORMAT_RGBA1010102, DRM_FORMAT_BGRA1010102,
+};
+
+static bool exynos_crtc_handle_vblank(struct exynos_drm_crtc *exynos_crtc)
+{
+	return drm_crtc_handle_vblank(&exynos_crtc->base);
+}
+
+static void exynos_crtc_delayed_vblank(struct work_struct *work)
+{
+	struct delayed_work *delayed_work =
+		container_of(work, struct delayed_work, work);
+	struct decon_context *ctx =
+		container_of(delayed_work, struct decon_context, dwork);
+
+	exynos_crtc_handle_vblank(ctx->crtc);
+}
+
+static int decon_bind(struct device *dev, struct device *master, void *data)
+{
+	struct decon_context *ctx = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = data;
+	struct drm_plane *primary_plane = NULL;
+	struct exynos_drm_private *priv = drm_dev->dev_private;
+
+	int i, ret = 0;
+
+	/* Release a pm_runtime opposite to xxx_reset */
+	decon_reset(ctx, RPM_REQ_SUSPEND);
+
+	ctx->drm_dev = drm_dev;
+
+	for (i = 0; i < ctx->win_cnt; i++) {
+		struct decon_win *win = &ctx->win[i];
+		struct exynos_dpp_context *dpp = dev_get_drvdata(priv->dpp_dev);
+		ctx->win[i].dpp = dpp;
+
+		if (!dpp)
+			continue;
+
+		win->plane_config.pixel_formats = dpp_gf_formats;
+		win->plane_config.num_pixel_formats = 14;
+		win->plane_config.zpos = i;
+		win->plane_config.type =
+			decon_get_win_type(i, ctx->win_cnt - 1);
+
+		ret = exynos_plane_init(drm_dev, &win->plane, i,
+					&win->plane_config);
+		if (ret)
+			return ret;
+
+		if (win->plane_config.type == DRM_PLANE_TYPE_PRIMARY)
+			primary_plane = &win->plane.base;
+		// if (win->plane_config.type == DRM_PLANE_TYPE_CURSOR)
+		// 	cursor_plane = &win->plane.base;
+	}
+
+	ctx->crtc = exynos_drm_crtc_create(drm_dev, primary_plane, 0,
+					   &decon_crtc_ops, ctx);
+
+	INIT_DELAYED_WORK(&ctx->dwork, exynos_crtc_delayed_vblank);
+
+	if (IS_ERR(ctx->crtc))
+		return PTR_ERR(ctx->crtc);
+
+	//encoder, connector init. not this way
+	ctx->crtc->base.port = of_graph_get_port_by_id(dev->of_node, 0);
+
+	return 0;
+}
+
+static void decon_unbind(struct device *dev, struct device *master, void *data)
+{
+	struct decon_context *ctx = dev_get_drvdata(dev);
+	decon_disable(ctx->crtc);
+}
+
+static const struct component_ops decon_component_ops = {
+	.bind = decon_bind,
+	.unbind = decon_unbind,
+};
+
+static bool decon_get_window_update_req(struct exynos_drm_crtc *crtc)
+{
+	struct decon_context *ctx = crtc->ctx;
+	struct drm_plane *plane;
+
+	drm_for_each_plane_mask(plane, ctx->drm_dev, ctx->plane_mask) {
+		u32 win_idx = plane_to_decon_win(plane)->idx;
+
+		if (decon_reg_get_window_update_req(ctx->idx, win_idx))
+			return true;
+	}
+
+	return false;
+}
+
+static irqreturn_t decon_irq_handler(int irq, void *dev_id)
+{
+	struct decon_context *ctx = dev_id;
+
+	// decon_reg_clear_interrupt(ctx->idx, DECON_IRQ_FS);
+	decon_reg_clear_interrupt(ctx->idx, DECON_IRQ_FD);
+
+	decon_reg_get_shadow_update_req(ctx->idx);
+
+	if (ctx->config.mode.op_mode == DECON_VIDEO_MODE ||
+	    !decon_get_window_update_req(ctx->crtc)) {
+		drm_crtc_handle_vblank(&ctx->crtc->base);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int decon_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct decon_context *ctx;
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+
+	ctx = devm_kzalloc(dev, sizeof(struct decon_context), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->dev = dev;
+	ctx->aclk = devm_clk_get_enabled(dev, "aclk");
+	if (IS_ERR(ctx->aclk))
+		return dev_err_probe(dev, PTR_ERR(ctx->aclk),
+				     "Cannot get aclk\n");
+
+	ctx->irq_fd = platform_get_irq(pdev, 0);
+	irq_set_status_flags(ctx->irq_fd, IRQ_NOAUTOEN);
+	ret = devm_request_irq(dev, ctx->irq_fd, decon_irq_handler,
+			       IRQF_ONESHOT, dev_name(dev), ctx);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to register interrupt handler\n");
+
+	ctx->type = 0;
+	ctx->win_max = 8;
+
+	ctx->win_cnt = 1;
+
+	ctx->win = devm_kzalloc(ctx->dev, sizeof(struct decon_win) * 8,
+				GFP_KERNEL);
+	if (!ctx->win)
+		return -ENOMEM;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "main");
+	ctx->regs[0] = devm_ioremap_resource(dev, res);
+	regs_win[0] = ctx->regs[0];
+
+	regs_decon[0] = ctx->regs[0] + 0x8000;
+	regs_decon_con[0] = ctx->regs[0] + 0xc000;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sub0");
+	ctx->regs[1] = devm_ioremap_resource(dev, res);
+	regs_decon_global[0] = ctx->regs[1] + 0xa000;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sub1");
+	ctx->regs[2] = devm_ioremap_resource(dev, res);
+	regs_winctrl[0] = ctx->regs[2];
+
+	platform_set_drvdata(pdev, ctx);
+
+	return component_add(dev, &decon_component_ops);
+}
+
+struct platform_driver decon_driver = {
+	.probe		= decon_probe,
+	.driver		= {
+		.name	= "exynos9-decon",
+		.of_match_table = decon_driver_dt_match,
+	},
+};
diff --git a/drivers/gpu/drm/exynos/regs-decon9.h b/drivers/gpu/drm/exynos/regs-decon9.h
new file mode 100644
index 000000000000..e45ee71676cb
--- /dev/null
+++ b/drivers/gpu/drm/exynos/regs-decon9.h
@@ -0,0 +1,1244 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef _REGS_DECON_H
+#define _REGS_DECON_H
+
+#define CHK_DPU_ID(_decon_idx) (_decon_idx >> 1)
+#define CHK_DECON_ID(_decon_idx) (_decon_idx & 0x1)
+#define SYSREG_DPUM 0x18C20000
+#define SYSREG_DPUS(_v) (0x1AA10000 + ((0x2 * (_v - 1)) << 20))
+#define SYSREG_DPU(_dpu_id) \
+	((_dpu_id == 0) ? SYSREG_DPUM : SYSREG_DPUS(_dpu_id))
+
+#define DISP_DPU_MIPI_PHY_CON 0x0008
+/* _v : [0,1] */
+#define SEL_RESET_DPHY_MASK(_v) (0x1 << (4 + (_v)))
+#define M_RESETN_M4S4_MODULE_MASK (0x1 << 1)
+#define M_RESETN_M4S4_TOP_MASK (0x1 << 0)
+
+#define DISP_DPU_TE_QACTIVE_PLL_EN 0x1010
+#define TE_QACTIVE_PLL_EN (0x1 << 0)
+
+/*
+ * [ BLK_DPU BASE ADDRESS ]
+ *
+ * - CMU_DPUM			0x18C0_0000
+ * - CMU_DPUS0 			0x1AA0_0000
+ * - CMU_DPUS1 			0x1AC0_0000
+ * - SYSREG_DPUM 		0x18C1_0000
+ * - SYSREG_DPUS0 		0x1AA1_0000
+ * - SYSREG_DPUS1 		0x1AC1_0000
+ * - DPP_DPUM 			0x18C2_0000
+ * - DPP_DPUS0 			0x1AA2_0000
+ * - DPP_DPUS1 			0x1AC2_0000
+ * - DECON0_DPUM 		0x18C3_0000
+ * - DECON1_DPUM 		0x18C4_0000
+ * - DECON0_DPUS0 		0x1AA3_0000
+ * - DECON1_DPUS0 		0x1AA4_0000
+ * - DECON0_DPUS1 		0x1AC3_0000
+ * - DECON1_DPUS1 		0x1AC4_0000
+ * - DPUM_DMA 			0x18C5_0000
+ * - DPUS0_DMA 			0x1AA5_0000
+ * - DPUS1_DMA 			0x1AC5_0000
+ * - MIPI_DSIM0 		0x18C6_0000
+ * - MIPI_DSIM1 		0x18C7_0000
+ * - MIPI_DPHY 			0x18D8_0000
+ * - SYSMMU_D0_DPUM 		0x18C8_0000
+ * - SYSMMU_D1_DPUM 		0x18C9_0000
+ * - SYSMMU_D2_DPUM 		0x18CA_0000
+ * - SYSMMU_D3_DPUM 		0x18CB_0000
+ * - SYSMMU_D0_DPUM_S 		0x18CC_0000
+ * - SYSMMU_D1_DPUM_S 		0x18CD_0000
+ * - SYSMMU_D2_DPUM_S 		0x18CE_0000
+ * - SYSMMU_D3_DPUM_S 		0x18CF_0000
+ * - SYSMMU_D0_DPUS0 		0x1AA8_0000
+ * - SYSMMU_D1_DPUS0 		0x1AA9_0000
+ * - SYSMMU_D2_DPUS0 		0x1AAA_0000
+ * - SYSMMU_D3_DPUS0 		0x1AAB_0000
+ * - SYSMMU_D0_DPUS0_S 		0x1AAC_0000
+ * - SYSMMU_D1_DPUS0_S 		0x1AAD_0000
+ * - SYSMMU_D2_DPUS0_S 		0x1AAE_0000
+ * - SYSMMU_D3_DPUS0_S 		0x1AAF_0000
+ * - SYSMMU_D0_DPUS1 		0x1AC8_0000
+ * - SYSMMU_D1_DPUS1 		0x1AC9_0000
+ * - SYSMMU_D2_DPUS1 		0x1ACA_0000
+ * - SYSMMU_D3_DPUS1 		0x1ACB_0000
+ * - SYSMMU_D0_DPUS1_S 		0x1ACC_0000
+ * - SYSMMU_D1_DPUS1_S 		0x1ACD_0000
+ * - SYSMMU_D2_DPUS1_S 		0x1ACE_0000
+ * - SYSMMU_D3_DPUS1_S 		0x1ACF_0000
+ * - PPMU_D0_DPUM 		0x18D0_0000
+ * - PPMU_D1_DPUM 		0x18D1_0000
+ * - PPMU_D2_DPUM 		0x18D2_0000
+ * - PPMU_D3_DPUM 		0x18D3_0000
+ * - PPMU_D0_DPUS0 		0x1AB0_0000
+ * - PPMU_D1_DPUS0 		0x1AB1_0000
+ * - PPMU_D2_DPUS0 		0x1AB2_0000
+ * - PPMU_D3_DPUS0 		0x1AB3_0000
+ * - PPMU_D0_DPUS1 		0x1AD0_0000
+ * - PPMU_D1_DPUS1 		0x1AD1_0000
+ * - PPMU_D2_DPUS1 		0x1AD2_0000
+ * - PPMU_D3_DPUS1 		0x1AD3_0000
+ * - BTM_D0_DPUM 		0x18D4_0000
+ * - BTM_D1_DPUM 		0x18D5_0000
+ * - BTM_D2_DPUM 		0x18D6_0000
+ * - BTM_D3_DPUM 		0x18D7_0000
+ * - BTM_D0_DPUS0 		0x1AB4_0000
+ * - BTM_D1_DPUS0 		0x1AB5_0000
+ * - BTM_D2_DPUS0 		0x1AB6_0000
+ * - BTM_D3_DPUS0 		0x1AB7_0000
+ * - BTM_D0_DPUS1 		0x1AD4_0000
+ * - BTM_D1_DPUS1 		0x1AD5_0000
+ * - BTM_D2_DPUS1 		0x1AD6_0000
+ * - BTM_D3_DPUS1 		0x1AD7_0000
+ * - VGEN_DPUM 			0x18DA_0000
+ * - VGEN_DPUS0 		0x1ABA_0000
+ * - VGEN_DPUS1 		0x1ADA_0000
+ * - D_TZPC_DPUM 		0x18DB_0000
+ * - D_TZPC_DPUS0 		0x1ABB_0000
+ * - D_TZPC_DPUS1 		0x1ADB_0000
+ */
+
+/*
+ *	IP			start_offset	end_offset
+ *=================================================
+ *	DECON0			0x8000		0x82A4
+ * 	DECON1			0x9000 		0x92A4
+ *	BLENDER			0x0004		0x701C
+ *-------------------------------------------------
+ *	DSC0			0x2000		0x2fff
+ *	DSC1			0x3000		0x3fff
+ *-------------------------------------------------
+ */
+
+/*
+ * DECON registers
+ * ->
+ * updated by
+ * SHADOW_REG_UPDATE_REQ[31] 		: 0x0000~0x0FFF
+ * SHADOW_REG_UPDATE_REQ_WIN5[0] 	: 0x10E0~0x110C (0x0218[22:20],0x0214[21:20])
+ * SHADOW_REG_UPDATE_REQ_WIN4[4] 	: 0x10B0~0x10DC (0x0218[18:16],0x0214[17:16])
+ * SHADOW_REG_UPDATE_REQ_WIN3[3] 	: 0x1090~0x10AC (0x0218[14:12],0x0214[13:12])
+ * SHADOW_REG_UPDATE_REQ_WIN2[2] 	: 0x1060~0x108C (0x0218[10:8] ,0x0214[9:8]  )
+ * SHADOW_REG_UPDATE_REQ_WIN1[1] 	: 0x1030~0x105C (0x0218[6:4]  ,0x0214[5:4]  )
+ * SHADOW_REG_UPDATE_REQ_WIN0[0] 	: 0x0004~0x001C (0x0218[2:0]  ,0x0214[1:0]  )
+ */
+
+/*
+ * DECON0 : Base Address + 0x8xxx
+ * DECON1 : Base Address + 0x9xxx
+ * Base Addr was defined by DT.
+ * DPUx_DECON0 : 0x****_8000
+ * DPUx_DECON1 : 0x****_9000
+ * ex) DPUM_DECON0 : 0x18C3_8000
+ */
+
+#define BASED_DECON0 0
+#define BASED_DECON1 1
+
+#define GLOBAL_CONTROL 0x0000
+#define GLOBAL_CONTROL_SRESET (1 << 28)
+#define GLOBAL_CONTROL_PSLVERR_EN (1 << 24)
+#define GLOBAL_CONTROL_TEN_BPC_MODE_F (1 << 20)
+#define GLOBAL_CONTROL_TEN_BPC_MODE_MASK (1 << 20)
+#define GLOBAL_CONTROL_STANDALONE_MODE_F (0x0 << 12)
+#define GLOBAL_CONTROL_OPERATION_MODE_VIDEO_BY_TE_F (1 << 9)
+#define GLOBAL_CONTROL_OPERATION_MODE_F (1 << 8)
+#define GLOBAL_CONTROL_OPERATION_MODE_VIDEO_F (0 << 8)
+#define GLOBAL_CONTROL_OPERATION_MODE_CMD_F (1 << 8)
+#define GLOBAL_CONTROL_IDLE_STATUS (1 << 5)
+#define GLOBAL_CONTROL_RUN_STATUS (1 << 4)
+#define GLOBAL_CONTROL_DECON_EN (1 << 1)
+#define GLOBAL_CONTROL_DECON_EN_F (1 << 0)
+
+#define RESOURCE_OCCUPANCY_INFO_0 0x0010
+#define RESOURCE_OCCUPANCY_INFO_1 0x0014
+#define RESOURCE_OCCUPANCY_INFO_2 0x0018
+
+#define SRAM_SHARE_ENABLE 0x0030
+#define SRAM0_SHARE_ENABLE_F (1 << 0)
+#define SRAM1_SHARE_ENABLE_F (1 << 4)
+#define SRAM2_SHARE_ENABLE_F (1 << 8)
+#define SRAM3_SHARE_ENABLE_F (1 << 12)
+#define SRAM4_SHARE_ENABLE_F (1 << 16)
+#define SRAM5_SHARE_ENABLE_F (1 << 20)
+#define SRAM6_SHARE_ENABLE_F (1 << 24)
+#define ALL_SRAM_SHARE_ENABLE (0x1111111 << 0)
+#define ALL_SRAM_SHARE_DISABLE (0x0)
+
+#define INTERRUPT_ENABLE 0x0040
+#define DPU_DQE_DIMMING_END_INT_EN (1 << 21)
+#define DPU_DQE_DIMMING_START_INT_EN (1 << 20)
+#define DPU_FRAME_DONE_INT_EN (1 << 13)
+#define DPU_FRAME_START_INT_EN (1 << 12)
+#define DPU_EXTRA_INT_EN (1 << 4)
+#define DPU_INT_EN (1 << 0)
+#define INTERRUPT_ENABLE_MASK 0x3011
+
+#define EXTRA_INTERRUPT_ENABLE 0x0044
+#define DPU_RESOURCE_CONFLICT_INT_EN (1 << 8)
+#define DPU_TIME_OUT_INT_EN (1 << 4)
+
+#define TIME_OUT_VALUE 0x0048
+
+#define INTERRUPT_PENDING 0x004C
+#define DPU_DQE_DIMMING_END_INT_PEND (1 << 21)
+#define DPU_DQE_DIMMING_START_INT_PEND (1 << 20)
+#define DPU_FRAME_DONE_INT_PEND (1 << 13)
+#define DPU_FRAME_START_INT_PEND (1 << 12)
+#define DPU_EXTRA_INT_PEND (1 << 4)
+
+#define EXTRA_INTERRUPT_PENDING 0x0050
+#define DPU_RESOURCE_CONFLICT_INT_PEND (1 << 8)
+#define DPU_TIME_OUT_INT_PEND (1 << 4)
+
+#define INTERRUPT_ENABLE_SFI 0x0054
+#define DPU_ECC_ERROR_SFI_INT_EN (1 << 5)
+#define DPU_FRAME_DONE_SFI_INT_EN (1 << 4)
+#define DPU_INT_EN_SFI (1 << 0)
+
+#define INTERRUPT_PENDING_SFI 0x0058
+#define DPU_ECC_ERROR_SFI_INT_PEND (1 << 5)
+#define DPU_FRAME_DONE_SFI_INT_PEND (1 << 4)
+
+#define HW_SW_TRIG_CONTROL 0x0070
+#define HW_SW_TRIG_HS_STATUS (1 << 28)
+#define HW_TRIG_SEL(_v) ((_v) << 24)
+#define HW_TRIG_SEL_MASK (0x3 << 24)
+#define HW_TRIG_SEL_FROM_DDI1 (1 << 24)
+#define HW_TRIG_SEL_FROM_DDI0 (0 << 24)
+#define HW_TRIG_SKIP(_v) ((_v) << 16)
+#define HW_TRIG_SKIP_MASK (0xff << 16)
+#define HW_TRIG_ACTIVE_VALUE (1 << 13)
+#define HW_TRIG_EDGE_POLARITY (1 << 12)
+#define SW_TRIG_EN (1 << 8)
+#define HW_TRIG_MASK_DECON (1 << 4)
+#define HW_SW_TRIG_TIMER_CLEAR (1 << 3)
+#define HW_SW_TRIG_TIMER_EN (1 << 2)
+#define HW_TRIG_EN (1 << 0)
+
+#define HW_SW_TRIG_TIMER 0x0074
+
+#define HW_TE_CNT 0x0078
+#define HW_TRIG_CNT_B_GET(_v) (((_v) >> 16) & 0xffff)
+#define HW_TRIG_CNT_A_GET(_v) (((_v) >> 0) & 0xffff)
+
+#define OTF_FRAME_START_SEL 0x0080
+#define OTF_FS_SEL_OTF(_v) ((_v) << 0)
+
+#define CLOCK_CONTROL_0 0x00F0
+/*
+ * [28] QACTIVE_PLL_VALUE = 0
+ * [24] QACTIVE_VALUE = 0
+ *   0: QACTIVE is dynamically changed by DECON h/w,
+ *   1: QACTIVE is stuck to 1'b1
+ * [16][12][8][4][0] AUTO_CG_EN_xxx
+ */
+/* clock gating is disabled on bringup */
+#define CLOCK_CONTROL_0_CG_MASK (0x11111 << 0)
+#define CLOCK_CONTROL_0_QACTIVE_MASK ((0x1 << 24) | (0x1 << 28))
+#define CLOCK_CONTROL_0_TE_QACTIVE_PLL_ON (0x1 << 28)
+
+#define SPLITTER_SIZE_CONTROL_0 0x0100
+#define SPLITTER_HEIGHT_F(_v) ((_v) << 16)
+#define SPLITTER_HEIGHT_MASK (0x3fff << 16)
+#define SPLITTER_HEIGHT_GET(_v) (((_v) >> 16) & 0x3fff)
+#define SPLITTER_WIDTH_F(_v) ((_v) << 0)
+#define SPLITTER_WIDTH_MASK (0x3fff << 0)
+#define SPLITTER_WIDTH_GET(_v) (((_v) >> 0) & 0x3fff)
+
+#define SPLITTER_SPLIT_IDX_CONTROL 0x0104
+#define SPLITTER_SPLIT_IDX_F(_v) ((_v) << 0)
+#define SPLITTER_SPLIT_IDX_MASK (0x3fff << 0)
+#define SPLITTER_OVERLAP_F(_v) ((_v) << 16)
+#define SPLITTER_OVERLAP_MASK (0x7f << 16)
+
+#define OUTFIFO_SIZE_CONTROL_0 0x0120
+#define OUTFIFO_HEIGHT_F(_v) ((_v) << 16)
+#define OUTFIFO_HEIGHT_MASK (0x3fff << 16)
+#define OUTFIFO_HEIGHT_GET(_v) (((_v) >> 16) & 0x3fff)
+#define OUTFIFO_WIDTH_F(_v) ((_v) << 0)
+#define OUTFIFO_WIDTH_MASK (0x3fff << 0)
+#define OUTFIFO_WIDTH_GET(_v) (((_v) >> 0) & 0x3fff)
+
+#define OUTFIFO_SIZE_CONTROL_1 0x0124
+#define OUTFIFO_1_WIDTH_F(_v) ((_v) << 0)
+#define OUTFIFO_1_WIDTH_MASK (0x3fff << 0)
+#define OUTFIFO_1_WIDTH_GET(_v) (((_v) >> 0) & 0x3fff)
+
+#define OUTFIFO_SIZE_CONTROL_2 0x0128
+#define OUTFIFO_COMPRESSED_SLICE_HEIGHT_F(_v) ((_v) << 16)
+#define OUTFIFO_COMPRESSED_SLICE_HEIGHT_MASK (0x3fff << 16)
+#define OUTFIFO_COMPRESSED_SLICE_HEIGHT_GET(_v) (((_v) >> 16) & 0x3fff)
+#define OUTFIFO_COMPRESSED_SLICE_WIDTH_F(_v) ((_v) << 0)
+#define OUTFIFO_COMPRESSED_SLICE_WIDTH_MASK (0x3fff << 0)
+#define OUTFIFO_COMPRESSED_SLICE_WIDTH_GET(_v) (((_v) >> 0) & 0x3fff)
+
+#define OUTFIFO_TH_CONTROL_0 0x012C
+#define OUTFIFO_TH_1H_F (0x5 << 0)
+#define OUTFIFO_TH_2H_F (0x6 << 0)
+#define OUTFIFO_TH_F(_v) ((_v) << 0)
+#define OUTFIFO_TH_MASK (0x7 << 0)
+#define OUTFIFO_TH_GET(_v) ((_v) >> 0 & 0x7)
+
+#define OUTFIFO_DATA_ORDER_CONTROL 0x0130
+#define OUTFIFO_PIXEL_ORDER_SWAP_F(_v) ((_v) << 4)
+#define OUTFIFO_PIXEL_ORDER_SWAP_MASK (0x7 << 4)
+#define OUTFIFO_PIXEL_ORDER_SWAP_GET(_v) (((_v) >> 4) & 0x7)
+
+#define OUTFIFO_LEVEL 0x0134
+#define OUTFIFO_FIFO_LEVEL_F(_v) (((_v) & 0xffff) << 0)
+
+#define READ_URGENT_CONTROL_0 0x0140
+#define READ_URGETN_GENERATION_EN_F (0x1 << 0)
+
+#define READ_URGENT_CONTROL_1 0x0144
+#define READ_URGENT_HIGH_THRESHOLD_F(_v) ((_v) << 16)
+#define READ_URGENT_HIGH_THRESHOLD_MASK (0xffff << 16)
+#define READ_URGENT_HIGH_THRESHOLD_GET(_v) (((_v) >> 16) & 0xffff)
+#define READ_URGENT_LOW_THRESHOLD_F(_v) ((_v) << 0)
+#define READ_URGENT_LOW_THRESHOLD_MASK (0xffff << 0)
+#define READ_URGENT_LOW_THRESHOLD_GET(_v) (((_v) >> 0) & 0xffff)
+
+#define READ_URGENT_CONTROL_2 0x0148
+#define READ_URGENT_WAIT_CYCLE_F(_v) ((_v) << 0)
+#define READ_URGENT_WAIT_CYCLE_GET(_v) ((_v) >> 0)
+
+#define DTA_CONTROL 0x0180
+#define DTA_EN_F (1 << 0)
+
+#define DTA_THRESHOLD 0x0184
+#define DTA_HIGH_TH_F(_v) ((_v) << 16)
+#define DTA_HIGH_TH_MASK (0xffff << 16)
+#define DTA_HIGH_TH_GET(_v) (((_v) >> 16) & 0xffff)
+#define DTA_LOW_TH_F(_v) ((_v) << 0)
+#define DTA_LOW_TH_MASK (0xffff << 0)
+#define DTA_LOW_TH_GET(_v) (((_v) >> 0) & 0xffff)
+
+#define BLENDER_BG_IMAGE_SIZE_0 0x0200
+#define BLENDER_BG_HEIGHT_F(_v) ((_v) << 16)
+#define BLENDER_BG_HEIGHT_MASK (0x3fff << 16)
+#define BLENDER_BG_HEIGHT_GET(_v) (((_v) >> 16) & 0x3fff)
+#define BLENDER_BG_WIDTH_F(_v) ((_v) << 0)
+#define BLENDER_BG_WIDTH_MASK (0x3fff << 0)
+#define BLENDER_BG_WIDTH_GET(_v) (((_v) >> 0) & 0x3fff)
+
+#define BLENDER_BG_IMAGE_COLOR_0 0x0208
+#define BLENDER_BG_A_F(_v) ((_v) << 16)
+#define BLENDER_BG_A_MASK (0xff << 16)
+#define BLENDER_BG_A_GET(_v) (((_v) >> 16) & 0xff)
+#define BLENDER_BG_R_F(_v) ((_v) << 0)
+#define BLENDER_BG_R_MASK (0x3ff << 0)
+#define BLENDER_BG_R_GET(_v) (((_v) >> 0) & 0x3ff)
+
+#define BLENDER_BG_IMAGE_COLOR_1 0x020C
+#define BLENDER_BG_G_F(_v) ((_v) << 16)
+#define BLENDER_BG_G_MASK (0x3ff << 16)
+#define BLENDER_BG_G_GET(_v) (((_v) >> 16) & 0x3ff)
+#define BLENDER_BG_B_F(_v) ((_v) << 0)
+#define BLENDER_BG_B_MASK (0x3ff << 0)
+#define BLENDER_BG_B_GET(_v) (((_v) >> 0) & 0x3ff)
+
+#define LRMERGER_MODE_CONTROL 0x0210
+#define LRM23_MODE_F(_v) ((_v) << 16)
+#define LRM23_MODE_MASK (0x7 << 16)
+#define LRM01_MODE_F(_v) ((_v) << 0)
+#define LRM01_MODE_MASK (0x7 << 0)
+
+#define DATA_PATH_CONTROL_0 0x0214
+#define WIN_MAPCOLOR_EN_F(_win) (1 << (4 * _win + 1))
+#define WIN_EN_F(_win) (1 << (4 * _win + 0))
+
+#define DATA_PATH_CONTROL_1 0x0218
+#define WIN_CHMAP_F(_win, _ch) (((_ch) & 0xf) << (4 * _win))
+#define WIN_CHMAP_MASK(_win) (0xf << (4 * _win))
+
+#define DATA_PATH_CONTROL_2 0x0230
+#define EHNANCE_PATH_F(_v) ((_v) << 12)
+#define EHNANCE_PATH_MASK (0x7 << 12)
+#define EHNANCE_PATH_GET(_v) (((_v) >> 12) & 0x7)
+
+#define DSC_PATH_F(_v) ((_v) << 4)
+#define DSC_PATH_MASK (0xF << 4)
+#define DSC_PATH_GET(_v) (((_v) >> 4) & 0xF)
+
+#define OUTIF_PATH_F(_v) ((_v) << 0)
+#define OUTIF_PATH_MASK (0xF << 0)
+#define OUTIF_PATH_GET(_v) (((_v) >> 0) & 0xF)
+
+#define COMP_OUTIF_PATH_F(_v) ((_v) << 0)
+#define COMP_OUTIF_PATH_MASK (0xff << 0)
+#define COMP_OUTIF_PATH_GET(_v) (((_v) >> 0) & 0xff)
+
+#define OTF_DITH_CONTROL 0x0270
+#define DITH_MASK_SEL_F (1 << 1)
+#define DITH_MASK_SPIN_F (1 << 0)
+
+/* DECON CRC for ASB */
+#define CRC_LINKIF_DATA_0 0x0280
+#define CRC_DATA_DSIMIF1_GET(_v) (((_v) >> 16) & 0xffff)
+#define CRC_DATA_DSIMIF0_GET(_v) (((_v) >> 0) & 0xffff)
+
+#define CRC_LINKIF_DATA_2 0x0288
+#define CRC_DATA_DP1_GET(_v) (((_v) >> 16) & 0xffff)
+#define CRC_DATA_DP0_GET(_v) (((_v) >> 0) & 0xffff)
+
+#define CRC_LINKIF_CONTROL 0x028C
+#define CRC_COLOR_SEL(_v) ((_v) << 16)
+#define CRC_COLOR_SEL_MASK (0x3 << 16)
+#define CRC_START (1 << 0)
+
+#define FRAME_COUNT 0x02A0
+
+/* WAIT_CYCLE_AFTER_SFR_UPDATE register is hidden for customer. */
+#define WAIT_CYCLE_AFTER_SFR_UPDATE 0x02A4
+#define WAIT_CYCLE_AFTER_SFR_UPDATE_F(_v) (((_v) & 0x1f) << 0)
+
+/* DECON DEBUG guided from SoC Team */
+#define DECON_DEBUG_SFR_START 0x0400
+#define DECON_DEBUG_SFR_END 0x05FC
+
+/* COMMON SFR DECON0 AND DECON1 */
+#define DECON_CONIF_BASE 0x0000
+#define DSIM0_CONIF_BASE (DECON_CONIF_BASE + 0x0000)
+#define DSIM1_CONIF_BASE (DECON_CONIF_BASE + 0x1000)
+#define DP0_CONIF_BASE (DECON_CONIF_BASE + 0x2000)
+#define DP1_CONIF_BASE (DECON_CONIF_BASE + 0x3000)
+
+#define DSIM0_CONNECTION_CONTROL (DSIM0_CONIF_BASE + 0x0000)
+#define DSIM1_CONNECTION_CONTROL (DSIM1_CONIF_BASE + 0x0000)
+#define DSIM_CONNECTION_DSIM_F(_v) (((_v) & 0x3) << 0)
+#define DSIM_CONNECTION_DSIM_GET(_v) (((_v) >> 0) & 0x3)
+#define DSIM_CONNECTION_DSIM_MASK (0x7 << 0)
+
+#define DSIM0_TE_TIMEOUT_CONTROL (DSIM0_CONIF_BASE + 0x0004)
+#define DSIM1_TE_TIMEOUT_CONTROL (DSIM1_CONIF_BASE + 0x0004)
+#define DSIM_TE_TIMEOUT_CNT(_v) ((_v) << 0)
+#define DSIM_TE_TIMEOUT_CNT_MASK (0xffff << 0)
+#define DSIM_TE_TIMEOUT_CNT_GET(_v) (((_v) >> 0) & 0xffff)
+
+#define DSIM0_START_TIME_CONTROL (DSIM0_CONIF_BASE + 0x0008)
+#define DSIM0_START_TIME(_v) ((_v) << 0)
+
+#define DSIM1_START_TIME_CONTROL (DSIM1_CONIF_BASE + 0x0008)
+#define DSIM1_START_TIME(_v) ((_v) << 0)
+
+#define DP0_CONNECTION_CONTROL_0 DP0_CONIF_BASE
+#define DP1_CONNECTION_CONTROL_0 DP1_CONIF_BASE
+#define DP_CONNECTION_SEL_ATB_F(_v) (((_v) & 0x7) << 4)
+#define DP_CONNECTION_SEL_F(_v) (((_v) & 0x7) << 0)
+#define DP_CONNECTION_SEL_ATB_MASK (0x7 << 4)
+#define DP_CONNECTION_SEL_MASK (0x7 << 0)
+#define DP_CONNECTION_SEL_GET(_v) (((_v) >> 0) & 0x7)
+
+/* DECON GLOBAL */
+#define SHADOW_REG_UPDATE_REQ 0x0000
+#define SHADOW_REG_UPDATE_REQ_GLOBAL (1 << 31)
+#define SHADOW_REG_UPDATE_REQ_DQE (1 << 28)
+#define SHADOW_REG_UPDATE_REQ_WIN(_win) (1 << (_win))
+#define SHADOW_REG_UPDATE_REQ_FOR_DECON (0xff)
+
+#define HW_TRIG_MASK 0x0030
+#define HW_TRIG_MASK_SECURE 0x0034
+
+/* BLENDER */
+
+#define WIN_SHD_OFFSET 0x0800
+
+#define WIN_SECURE_CONTROL 0x0000
+
+#define WIN_CONTROL_0 0x0004
+#define WIN_ALPHA1_F(_v) (((_v) & 0xFF) << 24)
+#define WIN_ALPHA1_MASK (0xFF << 24)
+#define WIN_ALPHA0_F(_v) (((_v) & 0xFF) << 16)
+#define WIN_ALPHA0_MASK (0xFF << 16)
+#define WIN_ALPHA_GET(_v, _n) (((_v) >> (16 + 8 * (_n))) & 0xFF)
+#define WIN_FUNC_F(_v) (((_v) & 0xF) << 8)
+#define WIN_FUNC_MASK (0xF << 8)
+#define WIN_FUNC_GET(_v) (((_v) >> 8) & 0xf)
+#define WIN_SRESET (1 << 4)
+#define WIN_ALPHA_MULT_SRC_SEL_F(_v) (((_v) & 0x3) << 0)
+#define WIN_ALPHA_MULT_SRC_SEL_MASK (0x3 << 0)
+
+#define WIN_CONTROL_1 0x0008
+#define WIN_FG_ALPHA_D_SEL_F(_v) (((_v) & 0xF) << 24)
+#define WIN_FG_ALPHA_D_SEL_MASK (0xF << 24)
+#define WIN_BG_ALPHA_D_SEL_F(_v) (((_v) & 0xF) << 16)
+#define WIN_BG_ALPHA_D_SEL_MASK (0xF << 16)
+#define WIN_FG_ALPHA_A_SEL_F(_v) (((_v) & 0xF) << 8)
+#define WIN_FG_ALPHA_A_SEL_MASK (0xF << 8)
+#define WIN_BG_ALPHA_A_SEL_F(_v) (((_v) & 0xF) << 0)
+#define WIN_BG_ALPHA_A_SEL_MASK (0xF << 0)
+
+#define WIN_START_POSITION 0x000C
+#define WIN_STRPTR_Y_F(_v) (((_v) & 0x3FFF) << 16)
+#define WIN_STRPTR_X_F(_v) (((_v) & 0x3FFF) << 0)
+
+#define WIN_END_POSITION 0x0010
+#define WIN_ENDPTR_Y_F(_v) (((_v) & 0x3FFF) << 16)
+#define WIN_ENDPTR_X_F(_v) (((_v) & 0x3FFF) << 0)
+
+#define WIN_COLORMAP_0 0x0014
+#define WIN_MAPCOLOR_A_F(_v) ((_v) << 16)
+#define WIN_MAPCOLOR_A_MASK (0xff << 16)
+#define WIN_MAPCOLOR_R_F(_v) ((_v) << 0)
+#define WIN_MAPCOLOR_R_MASK (0x3ff << 0)
+
+#define WIN_COLORMAP_1 0x0018
+#define WIN_MAPCOLOR_G_F(_v) ((_v) << 16)
+#define WIN_MAPCOLOR_G_MASK (0x3ff << 16)
+#define WIN_MAPCOLOR_B_F(_v) ((_v) << 0)
+#define WIN_MAPCOLOR_B_MASK (0x3ff << 0)
+
+#define WIN_START_TIME_CONTROL 0x001C
+#define WIN_START_TIME_CONTROL_F(_v) ((_v) << 0)
+#define WIN_START_TIME_CONTROL_MASK (0x3fff << 0)
+
+/*
+ * DSC registers (Base Addr = DECON_SUB0 + 0x2000)
+ * ->
+ * 0x2000 ~
+ * DSC 0 : 0x0000
+ * DSC 1 : 0x1000
+ *
+ * <-
+ * DSC registers
+ */
+
+#define DSC0_OFFSET 0x0000
+#define DSC1_OFFSET 0x1000
+
+#define DSC_CONTROL0 0x0000
+#define DSC_SW_RESET (0x1 << 28)
+#define DSC_DCG_EN_REF(_v) ((_v) << 19)
+#define DSC_DCG_EN_SSM(_v) ((_v) << 18)
+#define DSC_DCG_EN_ICH(_v) ((_v) << 17)
+#define DSC_DCG_EN_ALL_OFF (0x0 << 17)
+#define DSC_DCG_EN_ALL_MASK (0x7 << 17)
+#define DSC_BIT_SWAP(_v) ((_v) << 10)
+#define DSC_BYTE_SWAP(_v) ((_v) << 9)
+#define DSC_WORD_SWAP(_v) ((_v) << 8)
+#define DSC_SWAP(_b, _c, _w) ((_b << 10) | (_c << 9) | (_w << 8))
+#define DSC_SWAP_MASK ((1 << 10) | (1 << 9) | (1 << 8))
+#define DSC_FLATNESS_DET_TH_MASK (0xf << 4)
+#define DSC_FLATNESS_DET_TH_F(_v) ((_v) << 4)
+#define DSC_SLICE_MODE_CH_MASK (0x1 << 3)
+#define DSC_SLICE_MODE_CH_F(_v) ((_v) << 3)
+#define DSC_CG_EN_MASK (0x1 << 1)
+#define DSC_CG_EN_F(_v) ((_v) << 1)
+#define DSC_DUAL_SLICE_EN_MASK (0x1 << 0)
+#define DSC_DUAL_SLICE_EN_F(_v) ((_v) << 0)
+
+#define DSC_CONTROL3 0x000C
+#define DSC_REMAINDER_F(_v) ((_v) << 12)
+#define DSC_REMAINDER_MASK (0x3 << 12)
+#define DSC_REMAINDER_GET(_v) (((_v) >> 12) & 0x3)
+#define DSC_GRPCNTLINE_F(_v) ((_v) << 0)
+#define DSC_GRPCNTLINE_MASK (0x7ff << 0)
+#define DSC_GRPCNTLINE_GET(_v) (((_v) >> 0) & 0x7ff)
+
+#define DSC_CRC_0 0x0010
+#define DSC_CRC_EN_MASK (0x1 << 16)
+#define DSC_CRC_EN_F(_v) ((_v) << 16)
+#define DSC_CRC_CODE_MASK (0xffff << 0)
+#define DSC_CRC_CODE_F(_v) ((_v) << 0)
+
+#define DSC_CRC_1 0x0014
+#define DSC_CRC_Y_S0_MASK (0xffff << 16)
+#define DSC_CRC_Y_S0_F(_v) ((_v) << 16)
+#define DSC_CRC_CO_S0_MASK (0xffff << 0)
+#define DSC_CRC_CO_S0_F(_v) ((_v) << 0)
+
+#define DSC_CRC_2 0x0018
+#define DSC_CRC_CG_S0_MASK (0xffff << 16)
+#define DSC_CRC_CG_S0_F(_v) ((_v) << 16)
+#define DSC_CRC_Y_S1_MASK (0xffff << 0)
+#define DSC_CRC_Y_S1_F(_v) ((_v) << 0)
+
+#define DSC_CRC_3 0x001C
+#define DSC_CRC_CO_S1_MASK (0xffff << 16)
+#define DSC_CRC_CO_S1_F(_v) ((_v) << 16)
+#define DSC_CRC_CG_S1_MASK (0xffff << 0)
+#define DSC_CRC_CG_S1_F(_v) ((_v) << 0)
+
+#define DSC_PPS00_03 0x0020
+#define PPS00_VER(_v) ((_v) << 24)
+#define PPS00_VER_MASK (0xff << 24)
+#define PPS01_ID(_v) (_v << 16)
+#define PPS01_ID_MASK (0xff << 16)
+#define PPS03_BPC_MASK (0x00f0 << 0)
+#define PPS03_LBD_MASK (0x000f << 0)
+#define PPS03_BPC_LBD(_v) (_v << 0)
+
+#define DSC_PPS04_07 0x0024
+#define PPS04_COMP_CFG(_v) ((_v) << 24)
+#define PPS04_COMP_CFG_MASK (0x3f << 24)
+#define PPS05_BPP(_v) (_v << 16)
+#define PPS05_BPP_MASK (0xff << 16)
+#define PPS06_07_PIC_HEIGHT_MASK (0xffff << 0)
+#define PPS06_07_PIC_HEIGHT(_v) (_v << 0)
+
+#define DSC_PPS08_11 0x0028
+#define PPS08_09_PIC_WIDHT_MASK (0xffff << 16)
+#define PPS08_09_PIC_WIDHT(_v) ((_v) << 16)
+#define PPS10_11_SLICE_HEIGHT_MASK (0xffff << 0)
+#define PPS10_11_SLICE_HEIGHT(_v) (_v << 0)
+
+#define DSC_PPS12_15 0x002C
+#define PPS12_13_SLICE_WIDTH_MASK (0xffff << 16)
+#define PPS12_13_SLICE_WIDTH(_v) ((_v) << 16)
+#define PPS14_15_CHUNK_SIZE_MASK (0xffff << 0)
+#define PPS14_15_CHUNK_SIZE(_v) (_v << 0)
+
+#define DSC_PPS16_19 0x0030
+#define PPS16_17_INIT_XMIT_DELAY_MASK (0x3ff << 16)
+#define PPS16_17_INIT_XMIT_DELAY(_v) ((_v) << 16)
+#define PPS18_19_INIT_DEC_DELAY_MASK (0xffff << 0)
+#define PPS18_19_INIT_DEC_DELAY(_v) ((_v) << 0)
+
+#define DSC_PPS20_23 0x0034
+#define PPS21_INIT_SCALE_VALUE_MASK (0x3f << 16)
+#define PPS21_INIT_SCALE_VALUE(_v) ((_v) << 16)
+#define PPS22_23_SCALE_INC_INTERVAL_MASK (0xffff << 0)
+#define PPS22_23_SCALE_INC_INTERVAL(_v) (_v << 0)
+
+#define DSC_PPS24_27 0x0038
+#define PPS24_25_SCALE_DEC_INTERVAL_MASK (0xfff << 16)
+#define PPS24_25_SCALE_DEC_INTERVAL(_v) ((_v) << 16)
+/* FL : First Line */
+#define PPS27_FL_BPG_OFFSET_MASK (0x1f << 0)
+#define PPS27_FL_BPG_OFFSET(_v) (_v << 0)
+
+#define DSC_PPS28_31 0x003C
+/* NFL : Not First Line */
+#define PPS28_29_NFL_BPG_OFFSET_MASK (0xffff << 16)
+#define PPS28_29_NFL_BPG_OFFSET(_v) ((_v) << 16)
+#define PPS30_31_SLICE_BPG_OFFSET_MASK (0xffff << 0)
+#define PPS30_31_SLICE_BPG_OFFSET(_v) (_v << 0)
+
+#define DSC_PPS32_35 0x0040
+#define PPS32_33_INIT_OFFSET_MASK (0xffff << 16)
+#define PPS32_33_INIT_OFFSET(_v) ((_v) << 16)
+#define PPS34_35_FINAL_OFFSET_MASK (0xffff << 0)
+#define PPS34_35_FINAL_OFFSET(_v) (_v << 0)
+
+#define DSC_PPS36_39 0x0044
+#define PPS36_FLATNESS_MIN_QP_MASK (0xff << 24)
+#define PPS36_FLATNESS_MIN_QP(_v) ((_v) << 24)
+#define PPS37_FLATNESS_MAX_QP_MASK (0xff << 16)
+#define PPS37_FLATNESS_MAX_QP(_v) ((_v) << 16)
+#define PPS38_39_RC_MODEL_SIZE_MASK (0xffff << 0)
+#define PPS38_39_RC_MODEL_SIZE(_v) (_v << 0)
+
+#define DSC_PPS40_43 0x0048
+#define PPS40_RC_EDGE_FACTOR_MASK (0xff << 24)
+#define PPS40_RC_EDGE_FACTOR(_v) ((_v) << 24)
+#define PPS41_RC_QUANT_INCR_LIMIT0_MASK (0xff << 16)
+#define PPS41_RC_QUANT_INCR_LIMIT0(_v) ((_v) << 16)
+#define PPS42_RC_QUANT_INCR_LIMIT1_MASK (0xff << 8)
+#define PPS42_RC_QUANT_INCR_LIMIT1(_v) ((_v) << 8)
+#define PPS44_RC_TGT_OFFSET_HI_MASK (0xf << 4)
+#define PPS44_RC_TGT_OFFSET_HI(_v) ((_v) << 4)
+#define PPS44_RC_TGT_OFFSET_LO_MASK (0xf << 0)
+#define PPS44_RC_TGT_OFFSET_LO(_v) ((_v) << 0)
+
+#define DSC_PPS44_47 0x004C
+#define PPS44_RC_BUF_THRESH_0_MASK (0xff << 24)
+#define PPS44_RC_BUF_THRESH_0(_v) ((_v) << 24)
+#define PPS45_RC_BUF_THRESH_1_MASK (0xff << 16)
+#define PPS45_RC_BUF_THRESH_1(_v) ((_v) << 16)
+#define PPS46_RC_BUF_THRESH_2_MASK (0xff << 8)
+#define PPS46_RC_BUF_THRESH_3(_v) ((_v) << 8)
+#define PPS47_RC_BUF_THRESH_3_MASK (0xff << 0)
+#define PPS47_RC_BUF_THRESH_3(_v) ((_v) << 0)
+
+#define DSC_PPS48_51 0x0050
+#define PPS48_RC_BUF_THRESH_4_MASK (0xff << 24)
+#define PPS48_RC_BUF_THRESH_4(_v) ((_v) << 24)
+#define PPS49_RC_BUF_THRESH_5_MASK (0xff << 16)
+#define PPS49_RC_BUF_THRESH_5(_v) ((_v) << 16)
+#define PPS50_RC_BUF_THRESH_6_MASK (0xff << 8)
+#define PPS50_RC_BUF_THRESH_6(_v) ((_v) << 8)
+#define PPS51_RC_BUF_THRESH_7_MASK (0xff << 0)
+#define PPS51_RC_BUF_THRESH_7(_v) ((_v) << 0)
+
+#define DSC_PPS52_55 0x0054
+#define PPS52_RC_BUF_THRESH_8_MASK (0xff << 24)
+#define PPS52_RC_BUF_THRESH_8(_v) ((_v) << 24)
+#define PPS53_RC_BUF_THRESH_9_MASK (0xff << 16)
+#define PPS53_RC_BUF_THRESH_9(_v) ((_v) << 16)
+#define PPS54_RC_BUF_THRESH_A_MASK (0xff << 8)
+#define PPS54_RC_BUF_THRESH_A(_v) ((_v) << 8)
+#define PPS55_RC_BUF_THRESH_B_MASK (0xff << 0)
+#define PPS55_RC_BUF_THRESH_B(_v) ((_v) << 0)
+
+#define DSC_PPS56_59 0x0058
+#define PPS56_RC_BUF_THRESH_C_MASK (0xff << 24)
+#define PPS56_RC_BUF_THRESH_C(_v) ((_v) << 24)
+#define PPS57_RC_BUF_THRESH_D_MASK (0xff << 16)
+#define PPS57_RC_BUF_THRESH_D(_v) ((_v) << 16)
+#define PPS58_RC_RANGE_PARAM_MASK (0xff << 8)
+#define PPS58_RC_RANGE_PARAM(_v) (_v << 8)
+#define PPS59_RC_RANGE_PARAM_MASK (0xff << 0)
+#define PPS59_RC_RANGE_PARAM(_v) (_v << 0)
+#define PPS58_59_RC_RANGE_PARAM_MASK (0xFFFF << 0)
+#define PPS58_59_RC_RANGE_PARAM(_v) (_v << 0)
+
+#define DSC_PPS60_63 0x005C
+#define DSC_PPS64_67 0x0060
+#define DSC_PPS68_71 0x0064
+#define DSC_PPS72_75 0x0068
+#define DSC_PPS76_79 0x006C
+#define DSC_PPS80_83 0x0070
+#define DSC_PPS84_87 0x0074
+
+#define DSC_DEBUG_EN 0x0078
+#define DSC_DBG_EN_MASK (1 << 31)
+#define DSC_DBG_EN(_v) ((_v) << 31)
+#define DSC_DBG_SEL_MASK (0xffff << 0)
+#define DSC_DBG_SEL(_v) ((_v) << 0)
+
+#define DSC_DEBUG_DATA 0x007C
+
+#define DSCC_DEBUG_EN 0x0080
+#define DSCC_DBG_EN_MASK (1 << 31)
+#define DSCC_DBG_EN(_v) ((_v) << 31)
+#define DSCC_DBG_SEL_MASK (0xffff << 0)
+#define DSCC_DBG_SEL(_v) ((_v) << 0)
+
+#define DSCC_DEBUG_DATA 0x0084
+
+/*
+ * DQE registers (Base Addr : DECON1)
+ * ->
+ * 0x0000 ~
+ * DQE 0 : 0x0000
+ * DQE 1 : 0x1000
+ *
+ * <-
+ * DQE registers
+ */
+
+#define DQE0_OFFSET 0x0000
+#define DQE1_OFFSET 0x1000
+#define DQE_OFFSET(_id) ((_id == 0) ? DQE0_OFFSET : DQE1_OFFSET)
+
+#define DQE_CON(_id) (0x0000 + DQE_OFFSET(_id))
+#define DQE_LPD_MODE_EXIT(_v) ((_v) << 24)
+#define DQE_LPD_MODE_EXIT_MASK (1 << 24)
+#define DQE_APS_SW_RESET(_v) ((_v) << 18)
+#define DQE_APD_SW_RESET_MASK (1 << 18)
+#define DQE_APD_SW_RESET_CLEAR (0 << 18)
+#define DQE_HSC_SW_RESET(_v) ((_v) << 16)
+#define DQE_HSC_SW_RESET_MASK (1 << 16)
+#define DQE_HSC_SW_RESET_CLEAR (0 << 16)
+#define PN_NEXT_CALC(_v) ((_v) << 7)
+#define PN_NEXT_CALC_NEW (0 << 7)
+#define PN_NEXT_CALC_OLD (1 << 7)
+#define APS_UPGRADE_ON(_v) ((_v) << 6)
+#define APS_UPGRADE_ON_MASK (1 << 6)
+#define DQE_APS_ON(_v) ((_v) << 4)
+#define DQE_APS_ON_MASK (1 << 4)
+#define DQE_HSC_ON(_v) ((_v) << 3)
+#define DQE_HSC_ON_MASK (1 << 3)
+#define DQE_GAMMA_ON(_v) ((_v) << 2)
+#define DQE_GAMMA_ON_MASK (1 << 2)
+#define DQE_CGC_ON(_v) ((_v) << 1)
+#define DQE_CGC_ON_MASK (1 << 1)
+
+#define DQE_IMG_SIZESET_0(_id) (0x0004 + DQE_OFFSET(_id))
+#define DQE_IMG_VSIZE_0(_v) (((_v) & 0x3fff) << 16)
+#define DQE_IMG_VSIZE_0_MASK (0x3fff << 16)
+#define DQE_IMG_HSIZE_0(_v) (((_v) & 0x3fff) << 0)
+#define DQE_IMG_HSIZE_0_MASK (0x3fff << 0)
+
+#define DQE_CGC1_RED(_id) (0x0010 + DQE_OFFSET(_id))
+#define DQE_CGC2_RED(_id) (0x0410 + DQE_OFFSET(_id))
+#define CGC_R_R(_v) (((_v) & 0x3ff) << 20)
+#define CGC_R_R_MASK (0x3ff << 20)
+#define CGC_R_G(_v) (((_v) & 0x3ff) << 10)
+#define CGC_R_G_MASK (0x3ff << 10)
+#define CGC_R_B(_v) (((_v) & 0x3ff) << 0)
+#define CGC_R_B_MASK (0x3ff << 0)
+
+#define DQE_CGC1_GREEN(_id) (0x0014 + DQE_OFFSET(_id))
+#define DQE_CGC2_GREEN(_id) (0x0414 + DQE_OFFSET(_id))
+#define CGC_G_R(_v) (((_v) & 0x3ff) << 20)
+#define CGC_G_R_MASK (0x3ff << 20)
+#define CGC_G_G(_v) (((_v) & 0x3ff) << 10)
+#define CGC_G_G_MASK (0x3ff << 10)
+#define CGC_G_B(_v) (((_v) & 0x3ff) << 0)
+#define CGC_G_B_MASK (0x3ff << 0)
+
+#define DQE_CGC1_BLUE(_id) (0x0018 + DQE_OFFSET(_id))
+#define DQE_CGC2_BLUE(_id) (0x0418 + DQE_OFFSET(_id))
+#define CGC_B_R(_v) (((_v) & 0x3ff) << 20)
+#define CGC_B_R_MASK (0x3ff << 20)
+#define CGC_B_G(_v) (((_v) & 0x3ff) << 10)
+#define CGC_B_G_MASK (0x3ff << 10)
+#define CGC_B_B(_v) (((_v) & 0x3ff) << 0)
+#define CGC_B_B_MASK (0x3ff << 0)
+
+#define DQE_CGC1_CYAN(_id) (0x001C + DQE_OFFSET(_id))
+#define DQE_CGC2_CYAN(_id) (0x041C + DQE_OFFSET(_id))
+#define CGC_C_R(_v) (((_v) & 0x3ff) << 20)
+#define CGC_C_R_MASK (0x3ff << 20)
+#define CGC_C_G(_v) (((_v) & 0x3ff) << 10)
+#define CGC_C_G_MASK (0x3ff << 10)
+#define CGC_C_B(_v) (((_v) & 0x3ff) << 0)
+#define CGC_C_B_MASK (0x3ff << 0)
+
+#define DQE_CGC1_MAGENTA(_id) (0x0020 + DQE_OFFSET(_id))
+#define DQE_CGC2_MAGENTA(_id) (0x0420 + DQE_OFFSET(_id))
+#define CGC_M_R(_v) (((_v) & 0x3ff) << 20)
+#define CGC_M_R_MASK (0x3ff << 20)
+#define CGC_M_G(_v) (((_v) & 0x3ff) << 10)
+#define CGC_M_G_MASK (0x3ff << 10)
+#define CGC_M_B(_v) (((_v) & 0x3ff) << 0)
+#define CGC_M_B_MASK (0x3ff << 0)
+
+#define DQE_CGC1_YELLOW(_id) (0x0024 + DQE_OFFSET(_id))
+#define DQE_CGC2_YELLOW(_id) (0x0424 + DQE_OFFSET(_id))
+#define CGC_Y_R(_v) (((_v) & 0x3ff) << 20)
+#define CGC_Y_R_MASK (0x3ff << 20)
+#define CGC_Y_G(_v) (((_v) & 0x3ff) << 10)
+#define CGC_Y_G_MASK (0x3ff << 10)
+#define CGC_Y_B(_v) (((_v) & 0x3ff) << 0)
+#define CGC_Y_B_MASK (0x3ff << 0)
+
+#define DQE_CGC1_WHITE(_id) (0x0028 + DQE_OFFSET(_id))
+#define DQE_CGC2_WHITE(_id) (0x0428 + DQE_OFFSET(_id))
+#define CGC_W_R(_v) (((_v) & 0x3ff) << 20)
+#define CGC_W_R_MASK (0x3ff << 20)
+#define CGC_W_G(_v) (((_v) & 0x3ff) << 10)
+#define CGC_W_G_MASK (0x3ff << 10)
+#define CGC_W_B(_v) (((_v) & 0x3ff) << 0)
+#define CGC_W_B_MASK (0x3ff << 0)
+
+#define DQE_CGC1_BLACK(_id) (0x002C + DQE_OFFSET(_id))
+#define DQE_CGC2_BLACK(_id) (0x042C + DQE_OFFSET(_id))
+#define CGC_K_R(_v) (((_v) & 0x3ff) << 20)
+#define CGC_K_R_MASK (0x3ff << 20)
+#define CGC_K_G(_v) (((_v) & 0x3ff) << 10)
+#define CGC_K_G_MASK (0x3ff << 10)
+#define CGC_K_B(_v) (((_v) & 0x3ff) << 0)
+#define CGC_K_B_MASK (0x3ff << 0)
+
+#define DQE_CGC_CONTROL(_id) (0x0030 + DQE_OFFSET(_id))
+#define CGC_MC_GAIN(_v) (((_v) & 0xfff) << 4)
+#define CGC_MC_GAIN_MASK (0xfff << 4)
+#define CGC_MC_EN(_v) ((_v) < 0)
+#define CGC_MC_EN_MASK (1 < 0)
+
+#define DQE_GAMMALUT_R_01_00(_id) (0x0034 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_03_02(_id) (0x0038 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_05_04(_id) (0x003C + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_07_06(_id) (0x0040 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_09_08(_id) (0x0044 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_11_10(_id) (0x0048 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_13_12(_id) (0x004C + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_15_14(_id) (0x0050 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_17_16(_id) (0x0054 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_19_18(_id) (0x0058 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_21_20(_id) (0x005C + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_23_22(_id) (0x0060 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_25_24(_id) (0x0064 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_27_26(_id) (0x0068 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_29_28(_id) (0x006C + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_31_30(_id) (0x0070 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_33_32(_id) (0x0074 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_35_34(_id) (0x0078 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_37_36(_id) (0x007C + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_39_38(_id) (0x0080 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_41_40(_id) (0x0084 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_43_42(_id) (0x0088 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_45_44(_id) (0x008C + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_47_46(_id) (0x0090 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_49_48(_id) (0x0094 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_51_50(_id) (0x0098 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_53_52(_id) (0x009C + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_55_54(_id) (0x00A0 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_57_56(_id) (0x00A4 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_59_58(_id) (0x00A8 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_61_60(_id) (0x00AC + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_63_62(_id) (0x00B0 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_R_64(_id) (0x00B4 + DQE_OFFSET(_id))
+
+#define DQE_GAMMALUT_G_01_00(_id) (0x00B8 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_03_02(_id) (0x00BC + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_05_04(_id) (0x00C0 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_07_06(_id) (0x00C4 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_09_08(_id) (0x00C8 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_11_10(_id) (0x00CC + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_13_12(_id) (0x00D0 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_15_14(_id) (0x00D4 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_17_16(_id) (0x00D8 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_19_18(_id) (0x00DC + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_21_20(_id) (0x00E0 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_23_22(_id) (0x00E4 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_25_24(_id) (0x00E8 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_27_26(_id) (0x00EC + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_29_28(_id) (0x00F0 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_31_30(_id) (0x00F4 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_33_32(_id) (0x00F8 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_35_34(_id) (0x00FC + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_37_36(_id) (0x0100 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_39_38(_id) (0x0104 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_41_40(_id) (0x0108 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_43_42(_id) (0x010C + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_45_44(_id) (0x0110 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_47_46(_id) (0x0114 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_49_48(_id) (0x0118 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_51_50(_id) (0x011C + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_53_52(_id) (0x0120 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_55_54(_id) (0x0124 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_57_56(_id) (0x0128 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_59_58(_id) (0x012C + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_61_60(_id) (0x0130 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_63_62(_id) (0x0134 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_G_64(_id) (0x0138 + DQE_OFFSET(_id))
+
+#define DQE_GAMMALUT_B_01_00(_id) (0x013C + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_03_02(_id) (0x0140 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_05_04(_id) (0x0144 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_07_06(_id) (0x0148 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_09_08(_id) (0x014C + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_11_10(_id) (0x0150 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_13_12(_id) (0x0154 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_15_14(_id) (0x0158 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_17_16(_id) (0x015C + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_19_18(_id) (0x0160 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_21_20(_id) (0x0164 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_23_22(_id) (0x0168 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_25_24(_id) (0x016C + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_27_26(_id) (0x0170 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_29_28(_id) (0x0174 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_31_30(_id) (0x0178 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_33_32(_id) (0x017C + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_35_34(_id) (0x0180 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_37_36(_id) (0x0184 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_39_38(_id) (0x0188 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_41_40(_id) (0x018C + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_43_42(_id) (0x0190 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_45_44(_id) (0x0194 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_47_46(_id) (0x0198 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_49_48(_id) (0x019C + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_51_50(_id) (0x01A0 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_53_52(_id) (0x01A4 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_55_54(_id) (0x01A8 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_57_56(_id) (0x01AC + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_59_58(_id) (0x01B0 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_61_60(_id) (0x01B4 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_63_62(_id) (0x01B8 + DQE_OFFSET(_id))
+#define DQE_GAMMALUT_B_64(_id) (0x01BC + DQE_OFFSET(_id))
+
+/*
+ * ODD : 1,3,5,7,9,...
+ * EVEN : 0,2,4,6,8,10,...
+	 */
+
+#define GAMMA_R_LUT_ODD(_v) (((_v) & 0x7ff) << 16)
+#define GAMMA_R_LUT_ODD_MASK (0x7ff << 16)
+#define GAMMA_R_LUT_EVEN(_v) (((_v) & 0x7ff) << 0)
+#define GAMMA_R_LUT_EVEN_MASK (0x7ff << 0)
+
+#define DQE_APS_GAIN(_id) (0x01C0 + DQE_OFFSET(_id))
+#define APS_ST(_v) (((_v) & 0xff) << 16)
+#define APS_ST_MASK (0xff << 16)
+#define APS_NS(_v) (((_v) & 0xff) << 8)
+#define APS_NS_MASK (0xff << 8)
+#define APS_LT(_v) (((_v) & 0xff) << 0)
+#define APS_LT_MASK (0xff << 0)
+
+#define DQE_APS_WEIGHT(_id) (0x01C4 + DQE_OFFSET(_id))
+#define APS_PL_W2(_v) (((_v) & 0xf) << 16)
+#define APS_PL_W2_MASK (0xf << 16)
+#define APS_PL_W1(_v) (((_v) & 0xf) << 0)
+#define APS_PL_W1_MASK (0xf << 0)
+
+#define DQE_APS_CTMODE(_id) (0x01C8 + DQE_OFFSET(_id))
+#define APS_CTMODE(_v) (((_v) & 0x3) << 0)
+#define APS_CTMODE_MASK (0x3 << 0)
+
+#define DQE_APS_PPEN(_id) (0x01CC + DQE_OFFSET(_id))
+#define APS_PP_EN(_v) ((_v) << 0)
+#define APS_PP_EN_MASK (1 << 0)
+
+#define DQE_APS_TDRMINMAX(_id) (0x01D0 + DQE_OFFSET(_id))
+#define APS_TDR_MAX(_v) (((_v) & 0x3ff) << 16)
+#define APS_TDR_MAX_MASK (0x3ff << 16)
+#define APS_TDR_MIN(_v) (((_v) & 0x3ff) << 0)
+#define APS_TDR_MIN_MASK (0x3ff << 0)
+
+#define DQE_APS_AMBIENT_LIGHT(_id) (0x01D4 + DQE_OFFSET(_id))
+#define APS_AMBIENT_LIGHT(_v) (((_v) & 0xff) << 0)
+#define APS_AMBIENT_LIGHT_MASK (0xff << 0)
+
+#define DQE_APS_BACK_LIGHT(_id) (0x01D8 + DQE_OFFSET(_id))
+#define APS_BACK_LIGHT(_v) (((_v) & 0xff) << 0)
+#define APS_BACK_LIGHT_MASK (0xff << 0)
+
+#define DQE_APS_DSTEP(_id) (0x01DC + DQE_OFFSET(_id))
+#define APS_DSTEP(_v) (((_v) & 0x3f) << 0)
+#define APS_DSTEP_MASK (0x3f << 0)
+
+#define DQE_APS_THRESHOLD(_id) (0x01E4 + DQE_OFFSET(_id))
+#define APS_THRESHOLD_3(_v) (((_v) & 0x3) << 4)
+#define APS_THRESHOLD_3_MASK (0x3 << 4)
+#define APS_THRESHOLD_2(_v) (((_v) & 0x3) << 2)
+#define APS_THRESHOLD_2_MASK (0x3 << 2)
+#define APS_THRESHOLD_1(_v) (((_v) & 0x3) << 0)
+#define APS_THRESHOLD_1_MASK (0x3 << 0)
+
+#define DQE_APS_GAIN_LIMIT(_id) (0x01E8 + DQE_OFFSET(_id))
+#define APS_GAIN_LIMIT(_v) (((_v) & 0x3ff) << 0)
+#define APS_GAIN_LIMIT_MASK (0x3ff << 0)
+
+#define DQE_APS_DIMMING_DONE_INTR(_id) (0x01EC + DQE_OFFSET(_id))
+#define APS_DIMMING_IN_PROGRESS(_v) ((_v) << 0)
+#define APS_DIMMING_IN_PROGRESS_MASK (1 << 0)
+
+#define DQE_APS_LT_CALC_AB_SHIFT(_id) (0x01F0 + DQE_OFFSET(_id))
+#define APS_LT_CALC_AB_SHIFT(_v) (((_v) & 0x3) << 0)
+#define APS_LT_CALC_AB_SHIFT_MASK (0x3 << 0)
+
+#define DQE_HSC_CONTROL(_id) (0x0204 + DQE_OFFSET(_id))
+#define HSC_PPSC_ON(_v) (((_v) & 0x1) << 5)
+#define HSC_PPSC_ON_MASK (0x1 << 5)
+#define HSC_YCOMP_ON(_v) (((_v) & 0x1) << 4)
+#define HSC_YCOMP_ON_MASK (0x1 << 4)
+#define HSC_TSC_ON(_v) (((_v) & 0x1) << 3)
+#define HSC_TSC_ON_MASK (0x1 << 3)
+#define HSC_DITHER_ON(_v) (((_v) & 0x1) << 2)
+#define HSC_DITHER_ON_MASK (0x1 << 2)
+#define HSC_PPHC_ON(_v) (((_v) & 0x1) << 1)
+#define HSC_PPHC_ON_MASK (0x1 << 1)
+#define HSC_SKIN_ON(_v) (((_v) & 0x1) << 0)
+#define HSC_SKIN_ON_MASK (0x1 << 0)
+
+#define DQE_HSC_PPSCGAIN_RGB(_id) (0x0208 + DQE_OFFSET(_id))
+#define HSC_PPSC_GAIN_B(_v) (((_v) & 0x3ff) << 20)
+#define HSC_PPSC_GAIN_B_MASK (0x3ff << 20)
+#define HSC_PPSC_GAIN_G(_v) (((_v) & 0x3ff) << 10)
+#define HSC_PPSC_GAIN_G_MASK (0x3ff << 10)
+#define HSC_PPSC_GAIN_R(_v) (((_v) & 0x3ff) << 0)
+#define HSC_PPSC_GAIN_R_MASK (0x3ff << 0)
+
+#define DQE_HSC_PPSCGAIN_CMY(_id) (0x020C + DQE_OFFSET(_id))
+#define HSC_PPSC_GAIN_Y(_v) (((_v) & 0x3ff) << 20)
+#define HSC_PPSC_GAIN_Y_MASK (0x3ff << 20)
+#define HSC_PPSC_GAIN_M(_v) (((_v) & 0x3ff) << 10)
+#define HSC_PPSC_GAIN_M_MASK (0x3ff << 10)
+#define HSC_PPSC_GAIN_C(_v) (((_v) & 0x3ff) << 0)
+#define HSC_PPSC_GAIN_C_MASK (0x3ff << 0)
+
+#define DQE_HSC_ALPHASCALE_SHIFT(_id) (0x0210 + DQE_OFFSET(_id))
+#define HSC_ALPHA_SHIFT2(_v) (((_v) & 0x1f) << 20)
+#define HSC_ALPHA_SHIFT2_MASK (0x1f << 20)
+#define HSC_ALPHA_SHIFT1(_v) (((_v) & 0xff) << 8)
+#define HSC_ALPHA_SHIFT1_MASK (0xff << 8)
+#define HSC_ALPHA_SCALE(_v) (((_v) & 0xf) << 0)
+#define HSC_ALPHA_SCALE_MASK (0xf << 0)
+
+#define DQE_HSC_POLY_CURVE0(_id) (0x0214 + DQE_OFFSET(_id))
+#define HSC_POLY_CURVE_3(_v) (((_v) & 0x3ff) << 20)
+#define HSC_POLY_CURVE_3_MASK (0x3ff << 20)
+#define HSC_POLY_CURVE_2(_v) (((_v) & 0x3ff) << 10)
+#define HSC_POLY_CURVE_2_MASK (0x3ff << 10)
+#define HSC_POLY_CURVE_1(_v) (((_v) & 0x3ff) << 0)
+#define HSC_POLY_CURVE_1_MASK (0x3ff << 0)
+
+#define DQE_HSC_POLY_CURVE1(_id) (0x0218 + DQE_OFFSET(_id))
+#define HSC_POLY_CURVE_6(_v) (((_v) & 0x3ff) << 20)
+#define HSC_POLY_CURVE_6_MASK (0x3ff << 20)
+#define HSC_POLY_CURVE_5(_v) (((_v) & 0x3ff) << 10)
+#define HSC_POLY_CURVE_5_MASK (0x3ff << 10)
+#define HSC_POLY_CURVE_4(_v) (((_v) & 0x3ff) << 0)
+#define HSC_POLY_CURVE_4_MASK (0x3ff << 0)
+
+#define DQE_HSC_SKIN_S(_id) (0x021C + DQE_OFFSET(_id))
+#define HSC_SKIN_S2(_v) (((_v) & 0x3ff) << 16)
+#define HSC_SKIN_S2_MASK (0x3ff << 16)
+#define HSC_SKIN_S1(_v) (((_v) & 0x3ff) << 0)
+#define HSC_SKIN_S1_MASK (0x3ff << 0)
+
+#define DQE_HSC_PPHCGAIN_RGB(_id) (0x0220 + DQE_OFFSET(_id))
+#define HSC_PPHC_GAIN_B(_v) (((_v) & 0x3ff) << 20)
+#define HSC_PPHC_GAIN_B_MASK (0x3ff << 20)
+#define HSC_PPHC_GAIN_G(_v) (((_v) & 0x3ff) << 10)
+#define HSC_PPHC_GAIN_G_MASK (0x3ff << 10)
+#define HSC_PPHC_GAIN_R(_v) (((_v) & 0x3ff) << 0)
+#define HSC_PPHC_GAIN_R_MASK (0x3ff << 0)
+
+#define DQE_HSC_PPHCGAIN_CMY(_id) (0x0224 + DQE_OFFSET(_id))
+#define HSC_PPHC_GAIN_Y(_v) (((_v) & 0x3ff) << 20)
+#define HSC_PPHC_GAIN_Y_MASK (0x3ff << 20)
+#define HSC_PPHC_GAIN_M(_v) (((_v) & 0x3ff) << 10)
+#define HSC_PPHC_GAIN_M_MASK (0x3ff << 10)
+#define HSC_PPHC_GAIN_C(_v) (((_v) & 0x3ff) << 0)
+#define HSC_PPHC_GAIN_C_MASK (0x3ff << 0)
+
+#define DQE_HSC_TSC_YCOMP(_id) (0x0228 + DQE_OFFSET(_id))
+#define HSC_Y_COMP_RATIO(_v) (((_v) & 0xf) << 12)
+#define HSC_Y_COMP_RATIO_MASK (0xf << 12)
+#define HSC_TSC_GAIN(_v) (((_v) & 0x3ff) << 0)
+#define HSC_TSC_GAIN_MASK (0x3ff << 0)
+
+#define DQE_HSC_POLY_CURVE2(_id) (0x022C + DQE_OFFSET(_id))
+#define HSC_POLY_CURVE_8(_v) (((_v) & 0x3ff) << 10)
+#define HSC_POLY_CURVE_8_MASK (0x3ff << 10)
+#define HSC_POLY_CURVE_7(_v) (((_v) & 0x3ff) << 0)
+#define HSC_POLY_CURVE_7_MASK (0x3ff << 0)
+
+#define DQE_HSC_PARTIAL_CON(_id) (0x0230 + DQE_OFFSET(_id))
+#define HSC_ROI_SAME(_v) (((_v) & 0x1) << 2)
+#define HSC_ROI_SAME_MASK (0x1 << 2)
+#define HSC_PARTIAL_UPDATE_METHOD(_v) (((_v) & 0x1) << 1)
+#define HSC_PARTIAL_UPDATE_METHOD_MASK (0x1 << 1)
+#define HSC_IMG_PARTIAL_FRAME(_v) (((_v) & 0x1) << 0)
+#define HSC_IMG_PARTIAL_FRAME_MASK (0x1 << 0)
+
+#define DQE_APS_PARTIAL_CON(_id) (0x0234 + DQE_OFFSET(_id))
+#define APS_ROI_SAME(_v) (((_v) & 0x1) << 2)
+#define APS_ROI_SAME_MASK (0x1 << 2)
+#define APS_PARTIAL_UPDATE_METHOD(_v) (((_v) & 0x1) << 1)
+#define APS_PARTIAL_UPDATE_METHOD_MASK (0x1 << 1)
+#define APS_IMG_PARTIAL_FRAME(_v) (((_v) & 0x1) << 0)
+#define APS_IMG_PARTIAL_FRAME_MASK (0x1 << 0)
+
+#define DQE_APS_FULL_IMG_SIZESET(_id) (0x0238 + DQE_OFFSET(_id))
+#define APS_FULL_IMG_VSIZE(_v) (((_v) & 0x3fff) << 16)
+#define APS_FULL_IMG_VSIZE_MASK (0x3fff << 16)
+#define APS_FULL_IMG_HSIZE(_v) (((_v) & 0x3fff) << 0)
+#define APS_FULL_IMG_HSIZE_MASK (0x3fff << 0)
+
+#define DQE_APS_PARTIAL_ROI_UP_LEFT_POS(_id) (0x023C + DQE_OFFSET(_id))
+#define APS_ROI_Y1(_v) (((_v) & 0x3fff) << 16)
+#define APS_ROI_Y1_MASK (0x3fff << 16)
+#define APS_ROI_X1(_v) (((_v) & 0x3fff) << 0)
+#define APS_ROI_X1_MASK (0x3fff << 0)
+
+#define DQE_HSC_SKIN_H(_id) (0x0240 + DQE_OFFSET(_id))
+#define HSC_SKIN_H2(_v) (((_v) & 0x3ff) << 16)
+#define HSC_SKIN_H2_MASK (0x3ff << 16)
+#define HSC_SKIN_H1(_v) (((_v) & 0x3ff) << 0)
+#define HSC_SKIN_H1_MASK (0x3ff << 0)
+
+#define DQE_APS_PARTIAL_IBSI_01_00(_id) (0x0308 + DQE_OFFSET(_id))
+#define APS_IBSI_01(_v) (((_v) & 0xffff) << 16)
+#define APS_IBSI_01_MASK (0xffff << 16)
+#define APS_IBSI_00(_v) (((_v) & 0xffff) << 0)
+#define APS_IBSI_00_MASK (0xffff << 0)
+
+#define DQE_APS_PARTIAL_IBSI_11_10(_id) (0x030C + DQE_OFFSET(_id))
+#define APS_IBSI_11(_v) (((_v) & 0xffff) << 16)
+#define APS_IBSI_11_MASK (0xffff << 16)
+#define APS_IBSI_10(_v) (((_v) & 0xffff) << 0)
+#define APS_IBSI_10_MASK (0xffff << 0)
+
+#define DQE_HSC_FULL_PXL_NUM(_id) (0x0310 + DQE_OFFSET(_id))
+#define HSC_FULL_PXL_NUM(_v) (((_v) & 0xfffffff) << 0)
+#define HSC_FULL_PXL_NUM_MASK (0xfffffff << 0)
+
+#define DQE_APS_FULL_PXL_NUM(_id) (0x0320 + DQE_OFFSET(_id))
+#define APS_FULL_PXL_NUM(_v) (((_v) & 0xfffffff) << 0)
+#define APS_FULL_PXL_NUM_MASK (0xfffffff << 0)
+
+#define DQE_LPD_DATA_CONTROL(_id) (0x0400 + DQE_OFFSET(_id))
+#define LPD_WR_OR_RD_DIRECTION(_v) (((_v) & 0x1) << 31)
+#define LPD_WR_OR_RD_DIRECTION_MASK (0x1 << 31)
+#define LPD_ADDR(_v) (((_v) & 0x7f) << 24)
+#define LPD_ADDR_MASK (0x7f << 24)
+#define LPD_DATA(_v) (((_v) & 0xfffff) << 0)
+#define LPD_DATA_MASK (0xfffff << 0)
+
+#define DQE_VER(_id) (0x0500 + DQE_OFFSET(_id))
+#define DQE_VER_F(_v) ((_v) << 0)
+#define SQE_VER_GET(_v) (((_v) >> 0) & 0xffffffff)
+
+/*
+ * TELLTALE registers (Base Addr : DECON1)
+ * ->
+ * 0x4000 ~
+ * TELLTALE0~15 : 0x4100~0x417C
+ * TELLTALE_CRC_DATA0~7 : 0x4200~0x421C
+ * FS_CRC_DATA : 0x4220
+ *
+ * <-
+ * TELLTALE registers
+ */
+
+#define TELLTALE_CON 0x4000
+#define CRC_DATA_SEL_TELLTALE(_v) (((_v) & 0x3) << 20)
+#define CRC_DATA_SEL_TELLTALE_R (0x2 << 20)
+#define CRC_DATA_SEL_TELLTALE_G (0x1 << 20)
+#define CRC_DATA_SEL_TELLTALE_B (0 << 20)
+#define FS_CRC_EN(_v) (((_v) & 0x1) << 16)
+#define FS_CRC_EN_MASK (1 << 16)
+#define ENABLE_TELLTALE_F(_v) (((_v) & 0xffff) << 0)
+
+#define TELLTALE_WIN_RESERVE 0x4004
+#define RESERVE_WIN_DECON0(_win) (0 << ((_win) * 4))
+#define RESERVE_WIN_DECON1(_win) (1 << ((_win) * 4))
+#define RESERVE_WIN_IDLE(_win) (0x3 << ((_win) * 4))
+#define RESERVE_WIN7(_v) (((_v) & 0x3) << 28)
+#define RESERVE_WIN7_DECON0 (0 << 28)
+#define RESERVE_WIN7_DECON1 (1 << 28)
+#define RESERVE_WIN7_IDLE (0x3 << 28)
+#define RESERVE_WIN6(_v) (((_v) & 0x3) << 24)
+#define RESERVE_WIN6_DECON0 (0 << 24)
+#define RESERVE_WIN6_DECON1 (1 << 24)
+#define RESERVE_WIN6_IDLE (0x3 << 24)
+#define RESERVE_WIN5(_v) (((_v) & 0x3) << 20)
+#define RESERVE_WIN5_DECON0 (0 << 20)
+#define RESERVE_WIN5_DECON1 (1 << 20)
+#define RESERVE_WIN5_IDLE (0x3 << 20)
+#define RESERVE_WIN4(_v) (((_v) & 0x3) << 16)
+#define RESERVE_WIN4_DECON0 (0 << 16)
+#define RESERVE_WIN4_DECON1 (1 << 16)
+#define RESERVE_WIN4_IDLE (0x3 << 16)
+#define RESERVE_WIN3(_v) (((_v) & 0x3) << 12)
+#define RESERVE_WIN3_DECON0 (0 << 12)
+#define RESERVE_WIN3_DECON1 (1 << 12)
+#define RESERVE_WIN3_IDLE (0x3 << 12)
+#define RESERVE_WIN2(_v) (((_v) & 0x3) << 8)
+#define RESERVE_WIN2_DECON0 (0 << 8)
+#define RESERVE_WIN2_DECON1 (1 << 8)
+#define RESERVE_WIN2_IDLE (0x3 << 8)
+#define RESERVE_WIN1(_v) (((_v) & 0x3) << 4)
+#define RESERVE_WIN1_DECON0 (0 << 4)
+#define RESERVE_WIN1_DECON1 (1 << 4)
+#define RESERVE_WIN1_IDLE (0x3 << 4)
+#define RESERVE_WIN0(_v) (((_v) & 0x3) << 0)
+#define RESERVE_WIN0_DECON0 (0 << 0)
+#define RESERVE_WIN0_DECON1 (1 << 0)
+#define RESERVE_WIN0_IDLE (0x3 << 0)
+
+#define TELLTALE_START_POSITION(_v) (0x4100 + ((_v) * 8))
+#define TELLTALE_STRPTR_Y_F(_v) (((_v) & 0x3fff) << 16)
+#define TELLTALE_STRPTR_X_F(_v) (((_v) & 0x3fff) << 0)
+
+#define TELLTALE_END_POSITION(_v) (0x4104 + ((_v) * 8))
+#define TELLTALE_ENDPTR_Y_F(_v) (((_v) & 0x3fff) << 16)
+#define TELLTALE_ENDPTR_X_F(_v) (((_v) & 0x3fff) << 0)
+
+#define TELLTALE_CRC_DATA(_v) (0x4200 + ((_v) * 4))
+#define TELLTALE_ODD_CRC_DATA(_v) (((_v) & 0xffff) << 16)
+#define TELLTALE_ODD_DATA_GET(_v) (((_v) >> 16) & 0xffff)
+#define TELLTALE_EVEN_CRC_DATA(_v) (((_v) & 0xffff) << 0)
+#define TELLTALE_EVEN_CRC_DATA_GET(_v) (((_v) >> 0) & 0xffff)
+
+#define FS_CRC_DATA 0x4220
+#define FS_CRC_DATA_F(_v) (((_v) & 0xffff) << 0)
+#define FS_CRC_DATA_GET(_v) (((_v) >> 0) & 0xffff)
+
+#define DATA_PATH_CONTROL_WIN (0x0000)
+
+#define UPDATE_CONTROL_WIN (0x0010)
+#define SHD_UP_REQ_MASK_ALLOW (1 << 0)
+#define SHD_UP_REQ_MASK_BLOCK (1 << 1)
+
+#define UPDATE_REQ_WIN (0x0014)
+#define SHD_UP_REQ (1 << 0)
+
+#endif

-- 
2.39.2

