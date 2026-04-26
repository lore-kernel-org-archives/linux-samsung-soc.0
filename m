Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2254E27587D
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Apr 2026 21:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777237404; cv=none; b=ZjvKn7HS7wXSZg7cRy+dH0urTzm2JkWVShbDRauEh8V6Ye0YkwqhtOAXN17kSO3Oz11DPibnqMY6JhJpnqJd6YOC6AJQm/24Z6jiPYTH6mlaNZqUkRUzKlOjlCBBY9Vwyg54QpYcIOROlbUGfgLlbG6pOinWk9E2daqqexzTjiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777237404; c=relaxed/simple;
	bh=nDAHUl8LbqkMx2jGaC+t193qiEUgqoec6Fx8K0ArPn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=luQEZk7p4FrOtS3CaanhYBs5rXD+KDdGnK+9UEN5M1Ak6V4obBil6kU/tC9X7tlE0d5xN+ctu8/pbnvTggrX1b0NYGUsA6a3BYXrgIo/IhxxkvdiQHunHtxD8NPsmK2/NvdI073CokoKDclH92xtkttcuN93JPK5jUT6//ITNmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MdVqwF4J; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MdVqwF4J"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488ba840146so86122755e9.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Apr 2026 14:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777237401; x=1777842201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xZ30A4JRrqrMCt4Ckf3/WljJoHffiX5vavkFJli0OJM=;
        b=MdVqwF4JYtcKeUNAaceT7wyMisvEYx1abwYYjUAuNSdhV8OTNKLckdhMDsGEPEuZdB
         a4bKXYIn0Sd+gr38VgpxI4kfhEAA0Rl6PKtll6C+CJ7jzl/CUS0G5ug8+95s/eKlFdRq
         YgShg1G8/rDEqe9cf4CeGWTW2yLCcSQHI2NSWbxaj5dLfKMLDc4q1dnoKmmwXo6wfmor
         C/X1qHUqSLjGW6LJ41Ax9+qO4TmIn2a462C2H21dRyJKglkYtGCJDpsR3OxtwgJH1cmS
         w8/he/x6YE9B/H74xcZzCMbtmw04N1Z5ifHdwFUlkn5i23ag7uk3UVJfOLTAEkvDfzvU
         00Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777237401; x=1777842201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZ30A4JRrqrMCt4Ckf3/WljJoHffiX5vavkFJli0OJM=;
        b=i0Dg3v7/IFRJH3G9HP5DXhc+tMLrDHoRETUjVB69ZhPfLq6qP3gmlmz/bvZoDnFeGH
         MX0uJwtncOY0JiweGwKMFVE3XL3cah3AsYxLo44RWLLoEp5Ur5cFDw5Z9yDxHiMW/MhH
         SQSTZhKyg1cv4Vo3Eqpx4PlmqDWU5R1RYRlu8KmxKEdwcG4MB0UGxUnl0P2SYpC+A3jb
         9W9SyYedde4T+nWtSrog/Cmtug1Qjuop2EsL1wNE0cv+Y5ouUPJNuMmHZNWTEl8cdrG2
         w4VXcPd3SINpZMrvkz93QTt4feLoCawQ+zRw0V1OW5GYc616pRU0TE5m/HEpxmmaZghT
         FQRw==
X-Forwarded-Encrypted: i=1; AFNElJ//VFBswyTczcVogcESg4IA698VEONqQ+59Cv2h20CVquiKFkzgpsxTg51Pl04Moc1Tg1kAe63NmRn7zirLKwoeZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZGUjvJTUng2hfCENHpexuukc61PvYfHIavTMLCoJOKQwG/j/f
	YYhX+DSAtkZzvD7p5hqBDwPjHw+hcyV1diJ52O8bjVK6hFoHKojmiZpY
X-Gm-Gg: AeBDievB79nOOBtZ7OFsFbFL/iBCIIw1eoEKbdC1g4yTBCZskbHBQUSAA5zeNoMQsWU
	PyyMmRXKEEV9BUR3dcFrrjfzDzk9uwmM4V/K5nldlsEFRZnVEeuS+spy9GAGcF7TTHVzpcaC0u3
	GjFU5egesA49jwrn5I9/WcyiPMsiRsznXMD1eO/h+gyyAcgYWWrezDU07vbiZKmmoLRQuY1KfeL
	g0ND0l7bP4iwQkYOBoZbEaTlN0hi/zoydrRPGH8FRRg2Hfy5q/4wqCSyojBR8p/AIufUKdgEpkM
	YQ9mYKCjo3XGvAJeTK3YrmWlnPquaDPRW8hIVNj37Ib95yyvAby+SqFjL9L4NAL7DjreTRlygME
	Xn+Nrj6apoLpNrXGzse4fNs5j3hwnqY4BlrUzZ+CqrDQAJK+gGmQ/W8FtVIKX5wmmkaxpA7JL81
	Hvq7wuYVrojS+/1wcDtwN3jeVcUc35mioyelcYzOC/n2s/VWQvaSJaIXjhAsTHR31Tgwbb
X-Received: by 2002:a05:600c:4a15:b0:489:1aed:1658 with SMTP id 5b1f17b1804b1-4891aed16d8mr256485525e9.23.1777237401330;
        Sun, 26 Apr 2026 14:03:21 -0700 (PDT)
Received: from nixos.numericable.fr (38.42.3.89.rev.sfr.net. [89.3.42.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6114f2cfsm81640525e9.35.2026.04.26.14.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 14:03:20 -0700 (PDT)
From: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
To: tudor.ambarus@linaro.org
Cc: krzk@kernel.org,
	alim.akhtar@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
Subject: [PATCH] firmware: samsung: fix stale response flag in acpm_prepare_xfer()
Date: Sun, 26 Apr 2026 23:02:55 +0200
Message-ID: <20260426210255.73674-1-titouan.ameline@gmail.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

acpm_prepare_xfer() only ever set rx_data->response to true, never
false. A reused sequence number slot could therefore inherit a stale
true from a previous transfer that expected a response, causing
acpm_get_rx() to enter the response-copy path for a fire-and-forget
transfer whose rxd is NULL.

Unconditionally assign the correct boolean value so the slot is fully
reset on every reuse.

Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Signed-off-by: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
---
 drivers/firmware/samsung/exynos-acpm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 16c46ed60837..2fee6bb60efc 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -380,8 +380,7 @@ static void acpm_prepare_xfer(struct acpm_chan *achan,
 	/* Clear data for upcoming responses */
 	rx_data = &achan->rx_data[achan->seqnum - 1];
 	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
-	if (xfer->rxd)
-		rx_data->response = true;
+	rx_data->response = !!xfer->rxd;
 
 	/* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) */
 	set_bit(achan->seqnum - 1, achan->bitmap_seqnum);
-- 
2.44.2

