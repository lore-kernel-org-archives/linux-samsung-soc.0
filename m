Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013056.outbound.protection.outlook.com [52.101.72.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38263A0B24;
	Fri, 18 Sep 2026 14:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741229; cv=fail; b=OARqu4TAlFjSJIaB3Lr7/9si95gzSjkyhoIEk9s0mlUCWflHeAeLVm3nUeoo32w2S2RvSBD3q2MlSmTHbMD/fFvfzHq4Tvsxpu5QWZC3zn38T2YdOUlI1rMliQkVd6utgYnm95hcGcBuzPE9tTdUEaU50oR8+tB7i828evwEecs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741229; c=relaxed/simple;
	bh=Ptu0orVI7KiexKbTb/vB9bfRcsjbOpbioX9b64k1v0c=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ji6WQgq+H9MkahKJFd4vUdey69naLFtjh1LfIm4Gl/DL1xmzHkcVUi3URoHClQb14+gZDb2e2hok5S9IzZna8RiKyGlShpukXEnQujCLXeZ9lgUmiyFZE3116tmrwgypfW+FiYMjEQo0dUSUgZHUL245LDTvBNKbKsN46joJpp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=E2zHen4o; arc=fail smtp.client-ip=52.101.72.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="E2zHen4o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SGg1Xc3EeRqZoLcaiyMmCHpKgev27On0HtZ7PCIEWDtdL6361faNhzkdHcEaok1EcGi6JDwJ3XNCxZqjfViVzy2Yn1mSXjXn2S9T0VqphnA4P8WkrA7iBWV+2KMJFmrxFq6SLQzjVALHlxZbJschjQdOz6vPthg2VBmOKf6io6mw0yVuWZjd9y1fSVVd4tEQVsNWbVn6t+FmfAntRTiUr6PFWCOAxcwSSeqcECHHrEy1+9N6zhPk7EvoT0CS1jHgt5hIxvjoMmPR/6SZ4Z9FORvlPHRzD/6ZPozhtnJPM10y3qxT2OEj6VhspxGVZ+4xpVzHd9k2MZ+pKn6xm24P3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42rUBtlyT3sfKuf88X+9wuo6WWnR0H9NnfhuXblCuJM=;
 b=gdZj1xK1EGKGVZmk8ZJ7WgEmqaGqKvLQU4Yk/DQTw4DwD5Q5BqacMoMutzVOdI8KQhp7+d+e8BKXyOznqaaDprAD/3xdk8Wcmt9DGDWDVWJwY2xoTir8PXmNsVxbxQKJC6MgtGN6sYDBnXN6dYnl6bnLmF8GjNCCAsxVKIBxmSEjo70bWL/ATz9gF9/fg4VmVFPI5uu0jOXtXtAOU3eVaUqckKXRMs6+ar5SWTpHpdtg8QtkVdNA+X1baWRdzg8xXtEeLBEVLVhVGedGlDKqBvAdO/fA/czlPuoYhcxXOKRtWRaKRYQaJc4mxQ29o+aqdAUuhNy+uvWbxfQIYsZqig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42rUBtlyT3sfKuf88X+9wuo6WWnR0H9NnfhuXblCuJM=;
 b=E2zHen4o/E8YLbFoUJ0Lli2zmpOp2WSJpDdBR04jD7cRKdrGYbOX9SwMAUkN3ghtiYwCTb+14tNoyaBevU9TRNYPPMXxJUDYQ035pepetjK+1Xrl6zh75Xui3GgaCjblle7ZCPpqUoaK3/ezGpQ+emPZ+0f+b53dsQgFC9v9P4R2DWY1zTJ5mek/kDyMMC9XZ8c1faHjrCUCPeYCxZFLcFBhZ5xb/CJ8Hx3at+f+csxVnel/U1ElXF4zKzBE9iBnCnjxhlTIx3vuFuXLB9Ddx8A8jL4E2y2292JvIA+BT3jqK+czQgqeGAg6FmC939TLkRhXKabFBgbhKfrv1NAuDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by ZR6PR04MB296659.eurprd04.prod.outlook.com (2603:10a6:910:e1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 14:20:24 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 14:20:24 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Fan Wu <fanwu01@zju.edu.cn>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH] media: use assign_bit() where applicable
Date: Fri, 18 Sep 2026 22:17:43 +0800
Message-ID: <20260918141757.3023034-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|ZR6PR04MB296659:EE_
X-MS-Office365-Filtering-Correlation-Id: b7aa482d-0224-468b-66bb-08df158ffb16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|19092799006|1800799024|56012099006|10067099003|11063799006|921020|18002099003;
X-Microsoft-Antispam-Message-Info:
	cZA/VEcZU01RiPkFSvOUx2hrej+LrEPcNYiWC7oW18eWe/43yBibvbZS7n06p1TccwVY4yimjg26JstdU4lado8OE7SwcyPZiI+J8kCsSR3nsX+yyDCWkjGgqTV5AAQfzgogCaZcIejM89BTjlfTZO585Ob5EUM9As+xnBlaAOdJkXCGAw3QUWxcVU5DtFVbKKNHBpT3ST/kE9ZzCp06D3pHONm9d2DnQG0W7QvQvAU5GVihoDpgwIU8qp8JBY10YrVqqJPYH1wCiUwdrSPsUt/OM5aRwSBoiUj3n/sDtusEPfTvHH94dNU7MLDYsQW74e8KW8nyqZRz8XwSSx0VoSdzXNwxg8rR8daWEhN6LXGePHUzb0pGs+QxUazETKvfuW5sbqr7Idp8uPir/XKRVEewYvCHcNHrjyXbjzXr9rjT1wZH4qcNvU1Odb6jzuL4GXl5C5KVCCGDsIXuxajeAuoEMyh1ru0J7fHPDriLcnjT+QBM+1LSp3n98sz5wBphqTC7g4uRvwSI9eP0DmTLs+8aKZOFiYGRpbRSt8rd1GhDOrd3cxo4DLSDKe+6yaRWdFb5NTHKsB5QeDv0YSW/+TzsIE1CiPwMjJtqJoT/i8U2V8jB30FYo49FGCDcR02RNMHYhlEu7hmSic5TPX6szzAOVeHWiKZCu0oFhQcpKxpzZIXfaFLftUu4OVDaPNXrmLRcPB/7NoVYw2pI5JkxKg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(19092799006)(1800799024)(56012099006)(10067099003)(11063799006)(921020)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?470KHUl5fpcPan/Km0FPypbsSIx+5d3u5D3SDoxQ+U1dQT58b0i4KmuG3QFZ?=
 =?us-ascii?Q?DDPhatyE2S4pK0TRbhJAn5OKI9iawy2UJDfrmjaHbX6yDOBJItopBBCeoxje?=
 =?us-ascii?Q?ogtRwpAGTGPOmXG0iHLG8vtY9WIlFw8s6sEwr+DsoH57q3tYS4DzKYuexCxV?=
 =?us-ascii?Q?LB357oWHUxt4uqXrI1YQlis4mfXeE/AmF6ZvAaoikW8w7AGXpQHmq4sKWUKm?=
 =?us-ascii?Q?B2+bp87yatk6iW8zSdUm3e4LCN4hiu63dG8M9YiOE1qnDOREVhvOE7dFD98r?=
 =?us-ascii?Q?CZMN7T3VnQXswM7AOVqMwAl0P6yBcGMHbycXHvWn1Bj73y8fDLmbqrApoTcy?=
 =?us-ascii?Q?K0dwcXnacS6pjqexEbxosEW9pDgC3uo/AJMAmm2QBMMV9UGE05WVGM6qIAnS?=
 =?us-ascii?Q?nzBAuHdE9ihto79D8otowK7twW41GtkAvEFlajouXJEHSg3X356nFT2fCfKm?=
 =?us-ascii?Q?f6dlPI3NmuFcsO+gQ0FBmjp/m2vZVpRilNTg4Isd8odDPbxA6Pr0NGalD5q3?=
 =?us-ascii?Q?rZoQI8MbSB15LDEJwJHVY8jt7epyXTX7h6tSyngvHFJEfx+SQND/3kd3hnR8?=
 =?us-ascii?Q?uYvjFOtYYeiHNpXOvl3aFjLSRZ1Pv9DDRAPZd8zNsnzC1783PqGs2hUK0Bee?=
 =?us-ascii?Q?OyiFADjuQ7SbRMF+b18aCUEgVPSZuD/fgllMtDFwKJUY2IVLZ8pTfiFbLyH9?=
 =?us-ascii?Q?RkbQYU9lzEp/D5AcmugATocxpfEUrPdunJP3gTQ3+G4qGjiZbT6+NbX5n9S+?=
 =?us-ascii?Q?kzmgWp59+IrpBwux7SOoZ6OYZzKQ1dQM+zvhL9dw9iQoU+4Q3LRoF8Ij0TIb?=
 =?us-ascii?Q?nxm2KPKcRdGddaQBFyN+4Ohfwc4YNn08C1eiVtu+suolGeSPyuF7iLQ8xVDJ?=
 =?us-ascii?Q?Q1Lsnr+29zx5PwFxWd28/2Ukx/VtdR5R2NBX6qJsS9Ec9KMV9sojhDR+DIYW?=
 =?us-ascii?Q?Myq4UFjDZH0hs0KKGKmWhM0UsnI4w+y2lQKGdXHb2LGpiQVFbHDZEuHzftl/?=
 =?us-ascii?Q?XKCmTnRkZILqriSA3INx6FVZtVOcojLOy5Ozja4r+rYN/yOTC9dFgzdHd19G?=
 =?us-ascii?Q?ygDG5Hc0hYsa59fnLyoptyfKS/8IF5eSH35Fs+9ryTyuHsi07rAqYKbyR/QZ?=
 =?us-ascii?Q?r5MWJLde6DKb+ial2Zs73+xH9JHn/YsJXvXAPCzjdCmSSuJiftLo8yp1ck2z?=
 =?us-ascii?Q?WTnWUbNWih1du2iWG058RMa3t9MJColLxzxDC7iahKjb4c/kpOBrpAWmg+Bh?=
 =?us-ascii?Q?ahVCwnepX07dHjOgddBCE3omMETiY66VQsGUvVPvcLnyyn92/tWz/ZDJWSWu?=
 =?us-ascii?Q?QeoMNt6a3egmtJ9rqU1zUVMmP0RXM4CMcfnC4aW4svrCN2eBLANcvo/0vSjL?=
 =?us-ascii?Q?CiKJbAVP2glyqSCBSJ+Cskvlc9km2Lg5Dr5nHhGcouhv1dJCcxyCzmpLMlRR?=
 =?us-ascii?Q?kiD8MdXysOVbfGZ4p+NA3MjpYbt+PfF+OBpFbUp7JQ2zO6rBR98oBlQAMESa?=
 =?us-ascii?Q?P02jht43Oy9MqD8CfO2f8jXrPANE3hr9CtClY5g2lpXj7Bl7Sgk8xlz96K/K?=
 =?us-ascii?Q?qPGLBitvU9vwpaIQI0UvjAQ6R4Xv1oNwc/5Pky7Kin6W8oGRPGHvARaqgXi6?=
 =?us-ascii?Q?mewnftx9toLVW2xJU5CH7JAQ2FOXnBlwqFyi7Y4fLIZRCFwq3XRsOBnRyf2o?=
 =?us-ascii?Q?QIFVG+1pc1jerBnuGHf+R/pHNUm7vP52l2GjzeIq+0boac3429f/ULDXZwfS?=
 =?us-ascii?Q?ay11alcTmoqCbDruGyPGgpWe777oVlioOhAS9H+SYYlsC/RuVKDz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7aa482d-0224-468b-66bb-08df158ffb16
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 14:20:24.8876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jCWe1mmO6441JHYUoiu+gJQNI4QKb5F1mS6ANFdx6gUfU0w1DnUfux2J7W1AMjcKKZGjv258jG0P1Kzm3Pt4R552Y8h72L2K1E+ybxxEstnoyYeqVhSwZIbPHSVwkWNA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB296659

From: Peng Fan <peng.fan@nxp.com>

Convert open-coded if/else with set_bit/clear_bit and their
non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
API.

Done with Coccinelle semantic patch:
    // set_bit -> clear_bit => assign_bit

    @@
    expression cond, bit, addr;
    @@

    -if (cond)
    -        set_bit(bit, addr);
    -else
    -        clear_bit(bit, addr);
    +assign_bit(bit, addr, cond);

    // clear_bit -> set_bit => assign_bit

    @@
    expression cond, bit, addr;
    @@

    -if (cond)
    -        clear_bit(bit, addr);
    -else
    -        set_bit(bit, addr);
    +assign_bit(bit, addr, !cond);

    // __set_bit -> __clear_bit => __assign_bit

    @@
    expression cond, bit, addr;
    @@

    -if (cond)
    -        __set_bit(bit, addr);
    -else
    -        __clear_bit(bit, addr);
    +__assign_bit(bit, addr, cond);

    // __clear_bit -> __set_bit => __assign_bit

    @@
    expression cond, bit, addr;
    @@

    -if (cond)
    -        __clear_bit(bit, addr);
    -else
    -        __set_bit(bit, addr);
    +__assign_bit(bit, addr, !cond);

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/media/dvb-frontends/rtl2830.c                    | 5 +----
 drivers/media/dvb-frontends/rtl2832.c                    | 5 +----
 drivers/media/platform/marvell/mcam-core.c               | 5 +----
 drivers/media/platform/samsung/exynos4-is/fimc-capture.c | 5 +----
 4 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/media/dvb-frontends/rtl2830.c b/drivers/media/dvb-frontends/rtl2830.c
index 4c44e2d695f8..fadc12c6d6ae 100644
--- a/drivers/media/dvb-frontends/rtl2830.c
+++ b/drivers/media/dvb-frontends/rtl2830.c
@@ -612,10 +612,7 @@ static int rtl2830_pid_filter(struct dvb_frontend *fe, u8 index, u16 pid, int on
 	if (pid > 0x1fff || index >= 32)
 		return 0;
 
-	if (onoff)
-		set_bit(index, &dev->filters);
-	else
-		clear_bit(index, &dev->filters);
+	assign_bit(index, &dev->filters, onoff);
 
 	/* enable / disable PIDs */
 	buf[0] = (dev->filters >>  0) & 0xff;
diff --git a/drivers/media/dvb-frontends/rtl2832.c b/drivers/media/dvb-frontends/rtl2832.c
index b31cdb44b383..011c1366e0db 100644
--- a/drivers/media/dvb-frontends/rtl2832.c
+++ b/drivers/media/dvb-frontends/rtl2832.c
@@ -986,10 +986,7 @@ static int rtl2832_pid_filter(struct dvb_frontend *fe, u8 index, u16 pid,
 	if (pid > 0x1fff || index >= 32)
 		return 0;
 
-	if (onoff)
-		set_bit(index, &dev->filters);
-	else
-		clear_bit(index, &dev->filters);
+	assign_bit(index, &dev->filters, onoff);
 
 	/* enable / disable PIDs */
 	buf[0] = (dev->filters >>  0) & 0xff;
diff --git a/drivers/media/platform/marvell/mcam-core.c b/drivers/media/platform/marvell/mcam-core.c
index 2d0b8b60c509..074b86ae09c0 100644
--- a/drivers/media/platform/marvell/mcam-core.c
+++ b/drivers/media/platform/marvell/mcam-core.c
@@ -252,10 +252,7 @@ static inline int mcam_needs_config(struct mcam_camera *cam)
 
 static void mcam_set_config_needed(struct mcam_camera *cam, int needed)
 {
-	if (needed)
-		set_bit(CF_CONFIG_NEEDED, &cam->flags);
-	else
-		clear_bit(CF_CONFIG_NEEDED, &cam->flags);
+	assign_bit(CF_CONFIG_NEEDED, &cam->flags, needed);
 }
 
 /* ------------------------------------------------------------------- */
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
index d85811f4b8c5..1e34119ee117 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
@@ -997,10 +997,7 @@ static void fimc_capture_mark_jpeg_xfer(struct fimc_ctx *ctx,
 	ctx->scaler.enabled = !jpeg;
 	fimc_ctrls_activate(ctx, !jpeg);
 
-	if (jpeg)
-		set_bit(ST_CAPT_JPEG, &ctx->fimc_dev->state);
-	else
-		clear_bit(ST_CAPT_JPEG, &ctx->fimc_dev->state);
+	assign_bit(ST_CAPT_JPEG, &ctx->fimc_dev->state, jpeg);
 }
 
 static int __fimc_capture_set_format(struct fimc_dev *fimc,
-- 
2.51.0

