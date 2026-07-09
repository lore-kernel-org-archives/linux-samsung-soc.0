Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728C43BBFC0
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jul 2026 06:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578352; cv=none; b=bmeF2fazlZDAmpQxxKHpGBr2oiN68DvI8l6nrQRQ9IAih6cd+G6AmmXjrgKTHFeHehNOFVDaOCJtNZQ7/JLBefmSI4zZESoUh7TRFyspQIy9XMN6YXM/E+67OAyDcrj0Zv3Sf9ayId6zIecQzGR95c15xNalOI1UQgmGgDfhGAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578352; c=relaxed/simple;
	bh=EVgeSBR2jCHn71Glh5lSeXqBNQ4Lp10YdxPes7kiwZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XtUWBWuL6R4zz6jMSX/PWChrgPZLRcIvybEX2w5/hiyZc05dfzoGFHp5zybZm+2XVqkzfZQSM6NNf6Fg6Cio8khGgEIcjhnYkOmCABHSgKQlEuBv3uFvaAlwS/c9RwtvBZaGPmO/3pdMTkR7WBpV9hN2Z43Dbo//7rpZalJsFbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eCga41p1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UEVZ/wo2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eCga41p1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UEVZ/wo2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960HpV749792
	for <linux-samsung-soc@vger.kernel.org>; Thu, 9 Jul 2026 06:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mr/c6JHynGsswndL259fRuQJwMr/ocAoxfWbLWGTSg4=; b=eCga41p1wSaTnZyE
	z8hbPW2QC3jtrskzsNyEIVI9/1yQiwqXo7Z/VJzc9LaCMQXaBHcihK+f8r+N2yhR
	sT9NAbYz2HQh1lgI/YY8djiBfU1/6vRazEhnOA5xrYvKE2G28TG4Mt8AujabjRY+
	1LiH6LUOH08PBaPxxLNTJ0Z5qmwXyq4RSQM51T5YwGg9yphTSLIs0RY5OPHCXprH
	o21S78RV6rhfCVLr1zyPr5R/xkbuoqp0T5TkFPK1TzlwgCMcWfcaJZQvpd1Tq1n7
	robAYxr3paWdWPWHZxQhe0TZrZnXyJYYaKviOP1xAV9AQBqoz0Nby02DjPcjR/O6
	3IbAHw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwfsmp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jul 2026 06:25:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2caa9a3cf7aso7000815ad.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Jul 2026 23:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783578345; x=1784183145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mr/c6JHynGsswndL259fRuQJwMr/ocAoxfWbLWGTSg4=;
        b=UEVZ/wo2SvZrUWAhTBTY0HGfEy7+PUJNu6/QcdZ6eUHSg85nFxALzGf9Ed6B+1M1sT
         axtJ4VbcPAeRhMStd1WoMab0jaLbug4ReWtSr7EJXtMjvXleEc2SIL/kNggXekJ9WfkK
         A3lvJ5vGyORDm10txvTAX4PDgNEkg5A2y8fxp6AcWEewPNojdrkul8Ir+mAIJpXBgMVl
         Z9bs1Lfd+NlyX5ZOW/qpBF79tY2ZNjwpVfUJ+UX3vTjWw8J1dLLXlToha4hSUg1zLJ2P
         CgubuNK5itwu3vbWFw+DhAGEV42JRapLXjgQgNf8ZJmvxIqMzGbwqAIoQ+v0qmEp36TX
         Ys/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783578345; x=1784183145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mr/c6JHynGsswndL259fRuQJwMr/ocAoxfWbLWGTSg4=;
        b=Wul/LhvK+FQeSR1clmZqs7mEJNyJQ+VZZygIEvA4mWk0gAkGpcP6eZK+rUjkAw9uXc
         997sYPXle0XAcizq4zQbz9e7/1CAIHaatY5FHir/sntQshVP/lF6IfLfyfe4wRsqs3Fh
         mu/V+x84W52pG+sOtMETDiiGSEl62f7CdGc6C/eX8xh3YZoQX+GmeemQ9Smin4zQ3f2D
         mYw+SW+9D3LW0IUU78s+Tp0vbjwbwV+tU2fCnoY6acYK2j7zB8O+ZDp0V4Rt2Mvm0uLX
         5VtU9dcvTu/SUb0B9JxrZ1Tp+tGdxQPwOuNtuDaXWj0j1GnTi3PSAd0WdygYASEztEPG
         snNg==
X-Forwarded-Encrypted: i=1; AHgh+Ro2/UxK64euOzU9KeqP90aMftKqNn4nOC78YTyoVNTEpPqigPBsbQsseRpzuC1ETRBne3roqe7ZY+6eMin5A8l5ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAvQBDr98bkrpGIP1xwK7Q6Ydn2hwcZ7zyS33GDYvGZ4ylWKuL
	LtfepRCrzXhIX2HQ1ecYtuZhWlXM+jyQZK15vvlPwOTfh7eZxtAK08XVheSiNHqyRPu8+P0Dwgc
	xleaxqfnv5UNJ0c914XUX8dMeGU7F9HXHBZdOVKZo5PrOoX7n/gSoUuqcspiE7hB51tD9OCA5MQ
	==
X-Gm-Gg: AfdE7cnYc6O88lZCW2LQUzhf/MtkrXpL+4xpAC+SlOyzLSTVQQzuK430P3tO3OSdJ0J
	vyzLwEbzLVJr5vYOjy83FG3SSSvJvJSFglA/qfcoJJ0+eB3DIpXejLmfe7vSxhzno/YzTd8TKFl
	uIBPq0yC+dKTOQ8Oo6mmKau4vCa4V2NN5qhllJ8MT+lAC9fvRu3Sz8jNUexMyA7FzdeuX3b/2Vn
	FXpIPz4d+ElioKs1LD3yl3fB24AvI+NQTbwRjcyXQVz7tgYoVeS5wYPbVM4Pg6xu3QMABBqIHSu
	hjM4CJoA8k5nVPknlicO9CpRt30rZRw6Met++YH6rdDWpFMWFY6iIJWiYs8IwlfTmhSO+Ujmr04
	i1hOHxntNQyoiMQjqwnzHwFpMYUGAFeQjzE0GFMyIv6Ij
X-Received: by 2002:a17:902:f652:b0:2b0:badc:c9cf with SMTP id d9443c01a7336-2cdd8a9701fmr13907625ad.13.1783578345131;
        Wed, 08 Jul 2026 23:25:45 -0700 (PDT)
X-Received: by 2002:a17:902:f652:b0:2b0:badc:c9cf with SMTP id d9443c01a7336-2cdd8a9701fmr13907415ad.13.1783578344460;
        Wed, 08 Jul 2026 23:25:44 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf74cbsm37986405ad.18.2026.07.08.23.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 23:25:44 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 11:55:13 +0530
Subject: [PATCH 1/6] tty: serial: change uart_ops.pm callback to return int
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-add_return_check_for_uart_change_pm-v1-1-e85c6ffa8ec4@oss.qualcomm.com>
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
In-Reply-To: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Richard Genoud <richard.genoud@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Peter Korsgaard <jacmet@sunsite.dk>,
        Michal Simek <michal.simek@amd.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
        linux-mips@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783578321; l=10746;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=EVgeSBR2jCHn71Glh5lSeXqBNQ4Lp10YdxPes7kiwZ4=;
 b=04K+FA05dgAPsjdbtbwvkkTnr1RJndSAo0fpFo9UCHtlTA/CCZFQpKhBhQgjikHiSzJ3631Ch
 ghnsVnKCGOpALEgACK/qk6Q0sASwqVcDS7VZ4PYAGinvtCyryB9OB/r
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfX9hQyWmwGsreZ
 PR38v9N5ZlZ48ce12vbnREXh1LzRYIXawB3HLSPvKZMlA60NtAwxlE5S8P6Cw8D/WF/5rntBREt
 yZpI4Kc9D2sQqd0FrR2nTmpyooR4OLM7bbv2CxddS13BoWTWJLYDobI1aTs6vxj2bv7GtkCsZbH
 whb/nqblKn+wfbySH/cQLHiOLjropmg0+qvMOi4P2vljeC0tG6s9hTt68WcCqtwZR18q4qL2LRt
 sTBnDXSk+Z3iUVAFwpBnaQcOLpT0JhNa9Ut599PkdJQWE47PUGNW1rNirrFaCm/cI5M8Exyy/Pv
 QgVgwi6s+7pd++DoMwBfDbJZ4qxWGhf2Od56TdeD64ZAELfg7iACgHbs8PVG+1AiHwHEs+XvoVJ
 On3C6ruI/xsG6XOYO5izRNmVEHAFJ8eAKxLXWxbzp+q15bmNhmcsvqM4wWAV4cOHvodYdIXI8eA
 zN4eC0Qt1AKGpSYc89Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfXzvZ0+oj+Wyev
 4rVytzzDti4TnRWVSTQHt4vR7zNPIsqUHdiVik3XbW+XLOjfp0ZMBQC0qnr0rmLuycAInrvOfS4
 Iucb03gZMUIdxKNItn0fU4lZ83YcwBI=
X-Proofpoint-ORIG-GUID: 1PvAo8o1E2NgzZuXOqi2sBT8t4xFG5Q1
X-Proofpoint-GUID: 1PvAo8o1E2NgzZuXOqi2sBT8t4xFG5Q1
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4f3eea cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=og5nFkg25Al2bjqVsRcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090058

The uart_ops.pm callback is currently declared void, causing
uart_change_pm() to silently discard any error from a driver's power
management implementation. Worse, state->pm_state is unconditionally
updated even when the hardware transition failed, causing the serial core
to track a power state that does not reflect reality. Subsequent calls to
uart_change_pm() will then see the (stale) state as matching and skip the
callback entirely, leaving the hardware stuck in the wrong state with no
further recovery attempt.

Change the uart_ops.pm callback signature from void to int. Update
uart_change_pm() to propagate the driver's return value and only commit
state->pm_state on success, preserving consistency between software state
and hardware state across all transitions.

Update all call sites in serial_core.c:

  uart_port_startup(): propagate the error so that port open fails
  cleanly if the hardware cannot be powered on, rather than proceeding
  to call ops->startup() on an unpowered port.

  uart_suspend_port(): return the error directly so the PM framework
  is aware of the failed transition and can react accordingly.

  uart_resume_port(): propagate on both the console-resume and the
  suspended-port-restore paths so a failed power-on is not hidden
  from the PM core.

  uart_configure_port(): log and return early if power-on fails at
  probe time; log a warning if power-down fails after configuration,
  since the port is already registered at that point.

  uart_tty_port_shutdown(), uart_hangup(): log via dev_err() since
  these are void paths where propagation is not meaningful; teardown
  continues regardless.

  uart_line_info(): skip the modem-control status read if power-on
  fails to avoid accessing an unpowered port; log a warning if the
  original power state cannot be restored afterward.

  uart_poll_init(): propagate the power-on error; log a warning if
  the saved power state cannot be restored after a failed poll init.

Also update the uart_port.pm field (used by 8250 sub-drivers that
install a per-port pm function pointer directly) and its kernel-doc to
the new int-returning signature.

No functional change for any existing driver since all current .pm
implementations will be updated to return 0.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/serial_core.c | 89 ++++++++++++++++++++++++++++------------
 include/linux/serial_core.h      | 10 +++--
 2 files changed, 69 insertions(+), 30 deletions(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index a530ad372b43..e624a67a9395 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -52,8 +52,8 @@ static struct lock_class_key port_lock_key;
  */
 #define RS485_MAX_RTS_DELAY	100 /* msecs */
 
-static void uart_change_pm(struct uart_state *state,
-			   enum uart_pm_state pm_state);
+static int uart_change_pm(struct uart_state *state,
+			  enum uart_pm_state pm_state);
 
 static void uart_port_shutdown(struct tty_port *port);
 
@@ -312,7 +312,9 @@ static int uart_port_startup(struct tty_struct *tty, struct uart_state *state,
 	/*
 	 * Make sure the device is in D0 state.
 	 */
-	uart_change_pm(state, UART_PM_STATE_ON);
+	retval = uart_change_pm(state, UART_PM_STATE_ON);
+	if (retval)
+		return retval;
 
 	retval = uart_alloc_xmit_buf(&state->port);
 	if (retval)
@@ -1741,7 +1743,8 @@ static void uart_tty_port_shutdown(struct tty_port *port)
 
 	uart_free_xmit_buf(port);
 
-	uart_change_pm(state, UART_PM_STATE_OFF);
+	if (uart_change_pm(state, UART_PM_STATE_OFF))
+		dev_err(uport->dev, "failed to set power state off on shutdown\n");
 }
 
 static void uart_wait_until_sent(struct tty_struct *tty, int timeout)
@@ -1831,8 +1834,13 @@ static void uart_hangup(struct tty_struct *tty)
 			port->count = 0;
 		tty_port_set_active(port, false);
 		tty_port_tty_set(port, NULL);
-		if (uport && !uart_console(uport))
-			uart_change_pm(state, UART_PM_STATE_OFF);
+		if (uport && !uart_console(uport)) {
+			int ret = uart_change_pm(state, UART_PM_STATE_OFF);
+
+			if (ret)
+				dev_err(uport->dev,
+					"failed to set power state off on hangup\n");
+		}
 		wake_up_interruptible(&port->open_wait);
 		wake_up_interruptible(&port->delta_msr_wait);
 	}
@@ -1994,12 +2002,17 @@ static void uart_line_info(struct seq_file *m, struct uart_state *state)
 
 	if (capable(CAP_SYS_ADMIN)) {
 		pm_state = state->pm_state;
-		if (pm_state != UART_PM_STATE_ON)
-			uart_change_pm(state, UART_PM_STATE_ON);
+		if (pm_state != UART_PM_STATE_ON) {
+			if (uart_change_pm(state, UART_PM_STATE_ON))
+				goto line_info_end;
+		}
 		scoped_guard(uart_port_lock_irq, uport)
 			status = uport->ops->get_mctrl(uport);
-		if (pm_state != UART_PM_STATE_ON)
-			uart_change_pm(state, pm_state);
+		if (pm_state != UART_PM_STATE_ON) {
+			if (uart_change_pm(state, pm_state))
+				dev_err(uport->dev,
+					"failed to restore power state after line info\n");
+		}
 
 		seq_printf(m, " tx:%u rx:%u",
 				uport->icount.tx, uport->icount.rx);
@@ -2036,6 +2049,7 @@ static void uart_line_info(struct seq_file *m, struct uart_state *state)
 
 		seq_puts(m, stat_buf);
 	}
+line_info_end:
 	seq_putc(m, '\n');
 #undef STATBIT
 #undef INFOBIT
@@ -2265,17 +2279,24 @@ EXPORT_SYMBOL_GPL(uart_set_options);
  * @pm_state: new state
  *
  * Locking: port->mutex has to be held
+ *
+ * Returns 0 on success, negative error code on failure.
  */
-static void uart_change_pm(struct uart_state *state,
-			   enum uart_pm_state pm_state)
+static int uart_change_pm(struct uart_state *state,
+			  enum uart_pm_state pm_state)
 {
 	struct uart_port *port = uart_port_check(state);
 
 	if (state->pm_state != pm_state) {
-		if (port && port->ops->pm)
-			port->ops->pm(port, pm_state, state->pm_state);
+		if (port && port->ops->pm) {
+			int ret = port->ops->pm(port, pm_state, state->pm_state);
+
+			if (ret)
+				return ret;
+		}
 		state->pm_state = pm_state;
 	}
+	return 0;
 }
 
 struct uart_match {
@@ -2364,9 +2385,7 @@ int uart_suspend_port(struct uart_driver *drv, struct uart_port *uport)
 	if (uart_console(uport))
 		console_suspend(uport->cons);
 
-	uart_change_pm(state, UART_PM_STATE_OFF);
-
-	return 0;
+	return uart_change_pm(state, UART_PM_STATE_OFF);
 }
 EXPORT_SYMBOL(uart_suspend_port);
 
@@ -2408,8 +2427,12 @@ int uart_resume_port(struct uart_driver *drv, struct uart_port *uport)
 		if (port->tty && termios.c_cflag == 0)
 			termios = port->tty->termios;
 
-		if (console_suspend_enabled)
-			uart_change_pm(state, UART_PM_STATE_ON);
+		if (console_suspend_enabled) {
+			int ret = uart_change_pm(state, UART_PM_STATE_ON);
+
+			if (ret)
+				return ret;
+		}
 		uport->ops->set_termios(uport, &termios, NULL);
 		if (!console_suspend_enabled && uport->ops->start_rx) {
 			guard(uart_port_lock_irq)(uport);
@@ -2423,7 +2446,9 @@ int uart_resume_port(struct uart_driver *drv, struct uart_port *uport)
 		const struct uart_ops *ops = uport->ops;
 		int ret;
 
-		uart_change_pm(state, UART_PM_STATE_ON);
+		ret = uart_change_pm(state, UART_PM_STATE_ON);
+		if (ret)
+			return ret;
 		scoped_guard(uart_port_lock_irq, uport)
 			if (!(uport->rs485.flags & SER_RS485_ENABLED))
 				ops->set_mctrl(uport, 0);
@@ -2541,7 +2566,12 @@ uart_configure_port(struct uart_driver *drv, struct uart_state *state,
 			console_lock();
 
 		/* Power up port for set_mctrl() */
-		uart_change_pm(state, UART_PM_STATE_ON);
+		if (uart_change_pm(state, UART_PM_STATE_ON)) {
+			dev_err(port->dev, "failed to power up port\n");
+			if (uart_console(port))
+				console_unlock();
+			return;
+		}
 
 		/*
 		 * Ensure that the modem control lines are de-activated.
@@ -2578,8 +2608,10 @@ uart_configure_port(struct uart_driver *drv, struct uart_state *state,
 		 * Power down all ports by default, except the
 		 * console if we have one.
 		 */
-		if (!uart_console(port))
-			uart_change_pm(state, UART_PM_STATE_OFF);
+		if (!uart_console(port)) {
+			if (uart_change_pm(state, UART_PM_STATE_OFF))
+				dev_err(port->dev, "failed to power down port\n");
+		}
 	}
 }
 
@@ -2608,7 +2640,9 @@ static int uart_poll_init(struct tty_driver *driver, int line, char *options)
 		return -1;
 
 	pm_state = state->pm_state;
-	uart_change_pm(state, UART_PM_STATE_ON);
+	ret = uart_change_pm(state, UART_PM_STATE_ON);
+	if (ret)
+		return ret;
 
 	if (port->ops->poll_init) {
 		/*
@@ -2626,8 +2660,11 @@ static int uart_poll_init(struct tty_driver *driver, int line, char *options)
 		console_list_unlock();
 	}
 
-	if (ret)
-		uart_change_pm(state, pm_state);
+	if (ret) {
+		if (uart_change_pm(state, pm_state))
+			dev_err(port->dev,
+				"failed to restore power state after poll init failure\n");
+	}
 
 	return ret;
 }
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index bdc214386e4a..c82839028220 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -269,8 +269,8 @@ struct gpio_desc;
  *
  *	Locking: caller holds tty_port->mutex
  *
- * @pm: ``void ()(struct uart_port *port, unsigned int state,
- *		 unsigned int oldstate)``
+ * @pm: ``int ()(struct uart_port *port, unsigned int state,
+ *		unsigned int oldstate)``
  *
  *	Perform any power management related activities on the specified @port.
  *	@state indicates the new state (defined by enum uart_pm_state),
@@ -282,6 +282,8 @@ struct gpio_desc;
  *	closed, except when the @port is also the system console. This will
  *	occur even if %CONFIG_PM is not set.
  *
+ *	Returns 0 on success, negative error code on failure.
+ *
  *	Locking: none.
  *	Interrupts: caller dependent.
  *
@@ -391,7 +393,7 @@ struct uart_ops {
 	void		(*set_termios)(struct uart_port *, struct ktermios *new,
 				       const struct ktermios *old);
 	void		(*set_ldisc)(struct uart_port *, struct ktermios *);
-	void		(*pm)(struct uart_port *, unsigned int state,
+	int		(*pm)(struct uart_port *port, unsigned int state,
 			      unsigned int oldstate);
 	const char	*(*type)(struct uart_port *);
 	void		(*release_port)(struct uart_port *);
@@ -464,7 +466,7 @@ struct uart_port {
 	void			(*throttle)(struct uart_port *port);
 	void			(*unthrottle)(struct uart_port *port);
 	int			(*handle_irq)(struct uart_port *);
-	void			(*pm)(struct uart_port *, unsigned int state,
+	int			(*pm)(struct uart_port *port, unsigned int state,
 				      unsigned int old);
 	void			(*handle_break)(struct uart_port *);
 	int			(*rs485_config)(struct uart_port *,

-- 
2.34.1

