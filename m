Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971085;
	b=1UlEThllWw7ps0u+MkoTlvew5rmU8gGSntpzEdW2b0hYWsARd7Tpg2q1tD+E8zbraYt8
	 Z7HFpig+tXTrZ+zKjwGxW89Ca7x8LW6vj6QwGWeSu062Pmo6T60pWNoRfK9VeDtJuGSaV
	 OPCU3cGcu6epZZiZnZiDEnSzLJWusq+9Lx+6ToBPpbQd+vRcLGs+p0twU115CRyWw7DWZ
	 ORXc11+yDQum3aO+NtXchkqIdNPMLy1fxcJy8a3PO70E1+VD5+rcyf2BRrBYR2A3N895t
	 p5Pa5NXcHhkH5/GOLrDOjEImQJS8AXF/VKbdEhD5nkxJYnznuJk/OVLwQ1VkyCSOW/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Dz7o2nl3YbVAvhy6+Qf4x0LfNDPFm8y7nAlJp4YSP1Q=;
	b=0+5bV1m0zBD+buL129m8y7D8Viksh9MF3WkmvFK/ylkWycSZtBl+1fPAH0tbtCb+il+Q
	 TxzSg6Std2TFaKPlnlWLFJow5ioT2+m51zLL74vzSy/eSv0IfRay9RRHnvXm3Oe2mdiNZ
	 6J5sn40DfRi3y99SnVsJ5WIdjNaF12VFPt7K20WmGImE0UAJLJzsH8yhCbPxiberQSgh5
	 sE3wHKON/7eAzBEsQse5N1ZjsUcHGi7kpRgLnG+dE7+3uLfL5KkNaeNdrvNjgh3HnwVFh
	 4UAFF4BOCbWZ4WL2x7+5qELP+5E7CIhrnFq+S2DEHLUQrO/cTNMq7VjEvGIj0+aQeNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="A/CMeiFO";
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261F3606A326
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Nov 2026 13:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 261F3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A/CMeiFO
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so360912a91.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Nov 2026 05:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793971084; x=1794575884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dz7o2nl3YbVAvhy6+Qf4x0LfNDPFm8y7nAlJp4YSP1Q=;
        b=A/CMeiFOpwChXu+gGgOnhDCfiXDypN1UICLSZACPhx5cv7EENCB7NnLkEnA+YSiAF3
         OY3jcSURjpf6OO2+qspOv7CQTuoSUIqtWtOOuSJKTssTGtIZQO+Utdshl6kO+yVAYnFX
         2jr96VKUbNi8h/xVMsog0LwbAS4BVHyci6ZQ7Pk94BlE2zlje9hq2bJfj68FneHdQZC/
         vMh25aYAVS+CLD2xCJS8iQiQTjU3FX9ya8DZlSl/NsaB27ZFasPtQJG3wjOvwwqw785p
         EYWxeYuoDXleahTrASk0Z0stV8NR14gNs2wlOe0bj4lzHc3+xAV8kfocfrMnSsA1MpCQ
         ahxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793971084; x=1794575884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dz7o2nl3YbVAvhy6+Qf4x0LfNDPFm8y7nAlJp4YSP1Q=;
        b=Tz9I6S/BzAoICf6k9PKe6T2b0Zij/fTU3fbVmrciXW2tm35GLp83nsjQzT/QFYJuoP
         tQBEYz2/lGcayRfEO4sCMZmmnUdzGY0UiH07CyPxl+aER+KsHTtkclgnywMsW+URuCZ6
         fF13XnXfId33iVdaH4SvkrVDbT26vSToOsnBGfbXBRDWO6yDijZMtvcobmiVKj51vKwM
         cZEX0agtcdlaun5VUNa01h7jKu9hAsWqvLP/23NHaQjPswOpsxmOeFYOAcx2HnHbjDza
         JHdMrXmVsiv6opRxQXUYFpsljYWpLNpdflP28H+Jz8xMwv/fWEOoCgVBbnp1nNqeVOfs
         wJdg==
X-Forwarded-Encrypted: i=1; AL+hErGNQtkW6YA3+b0776ne8GnlKYPfN3cWVcygGumLWQa7wWtbPsbDziJQBl0hOYzHsAb7Wwhj91RvXhn6Zf3Lg2wRLQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8i6tQM/A6XiawDkK+jpG5dP9Mo7rOv9QKS9HoLit3JI3OcN7UW
	RBjE/hZl30xkkxWC1594IvIw5zAKS7t6E4BQrLaJArotTxjrzul7NNwA
X-Gm-Gg: AYBFou2Rsd+rZgRm4yiPy/ZK5XMt/rGJD8V59kv7LykneYnhX4l+Xgp4t/3kYnJ/Nmx
	AjA5KFw73JkV+a0FlZtqSvALIAWPetxz+7O/hQDpDFEAbbYZyVqlM8jSSCkVtlCskzLeBEEYRV+
	RVN5XAatCwWwbgftldykdojXMclhPyzosNMFcm40nVPpWHrSN9pBLZEJV9yvMsiTMul+cG5Tkry
	o5lTc4yMjx3TKAQ6HGK7DkZIlddWkNUQf/SSLjnmWtKEROK4XiKlXtMIneOqsznDBEro6FrMXhT
	s0s9bORYJ7NPpWJTAoqgaCWjjqMGU9hwKU+S1csm3CO9FRYzgF3h2Wu7TVxDosDc82fXQJKXfk/
	G+cvJ1bnIbPWWtGfQUH32luWw7QM29XKCw7+/h7egx2kPU78vGOOCW+eHvdMDnovp4G/ZHwlN7t
	HsKMY0hQncE/9mo/ORLJt/OBcl+arGPSs0P35OJpBUt24JcDJVwxxSQr6fxFq20lhLA3Dk6BvBZ
	yUhtSDnpZemnSqvs6+bKXUXRtlEWYB4WkXPHIObNOGU6Kvp7G081VVFscEB22yyULrTLRIpDmcW
	Jfyszrv9evGUii/xKWj40kBeF0lEbogMet5TWZK82hM0Yqhu/U6qOzH37yy3DpWyh+be4g==
X-Received: by 2002:a17:90b:584e:b0:3a0:d82b:237b with SMTP id 98e67ed59e1d1-3b0db6e8c8cmr1498160a91.25.1793971084246;
        Fri, 06 Nov 2026 05:18:04 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e2a8d6fbsm1025636a91.1.2026.11.06.05.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:18:03 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/5] extcon: max8997: drain MUIC IRQ work before extcon device is freed
Date: Fri,  6 Nov 2026 22:17:28 +0900
Message-ID: <20261106131730.2633139-4-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106131730.2633139-1-hj351016@gmail.com>
References: <20261106131730.2633139-1-hj351016@gmail.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hyunjung Ko <hj351016@gmail.com>

max8997_muic_probe() registers the MUIC interrupt work for device-managed
cancellation before it allocates and registers the extcon device that the
work handler dereferences:

	INIT_WORK(&info->irq_work, max8997_muic_irq_work);
	devm_work_autocancel(&pdev->dev, &info->irq_work, ...);
	...
	devm_request_threaded_irq(&pdev->dev, virq, ...);	/* arms work */
	...
	info->edev = devm_extcon_dev_allocate(&pdev->dev, ...);
	devm_extcon_dev_register(&pdev->dev, info->edev);

devres releases resources in reverse registration order, so on unbind the
extcon device is torn down first and the work is cancelled last:

	/* free_irq() */
	devm_extcon_dev_unregister() / extcon freed
	...
	cancel_work_sync(&info->irq_work);		/* too late */

max8997_muic_irq_handler() queues irq_work with schedule_work() on every
MUIC interrupt, so a work instance can be pending or running at unbind.
The handler max8997_muic_irq_work() dereferences info->edev via
extcon_set_state_sync(). Its only early-return guard tests info->edev, but
info is itself devm-allocated and freed last, so in the teardown window
info->edev is a dangling (non-NULL) pointer rather than NULL and the guard
does not fire. If the work runs after the extcon device has been freed but
before the work is cancelled, it dereferences freed memory, i.e. a
use-after-free.

Allocate and register the extcon device before registering the work for
cancellation (the redundant INIT_WORK() is moved up with it), so devres
(LIFO) frees the IRQs first, then cancels the work, and only then frees
the extcon device. devm_work_autocancel() still performs INIT_WORK()
before the work is first queued (the IRQ handler, requested below, is the
only queuing site).

Found by static analysis / code review; compile-tested only, not
reproduced on hardware (requires a MAX8997 MUIC).

Fixes: 87ee8de23c9d ("extcon: extcon-max8997: Simplify driver using devm")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
diff --git a/drivers/extcon/extcon-max8997.c b/drivers/extcon/extcon-max8997.c
index 9cddf08..a54e7c4 100644
--- a/drivers/extcon/extcon-max8997.c
+++ b/drivers/extcon/extcon-max8997.c
@@ -650,6 +650,19 @@ static int max8997_muic_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, info);
 	mutex_init(&info->mutex);
 
+	/* External connector */
+	info->edev = devm_extcon_dev_allocate(&pdev->dev, max8997_extcon_cable);
+	if (IS_ERR(info->edev)) {
+		dev_err(&pdev->dev, "failed to allocate memory for extcon\n");
+		return PTR_ERR(info->edev);
+	}
+
+	ret = devm_extcon_dev_register(&pdev->dev, info->edev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register extcon device\n");
+		return ret;
+	}
+
 	INIT_WORK(&info->irq_work, max8997_muic_irq_work);
 	ret = devm_work_autocancel(&pdev->dev, &info->irq_work,
 				   max8997_muic_irq_work);
@@ -678,19 +691,6 @@ static int max8997_muic_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* External connector */
-	info->edev = devm_extcon_dev_allocate(&pdev->dev, max8997_extcon_cable);
-	if (IS_ERR(info->edev)) {
-		dev_err(&pdev->dev, "failed to allocate memory for extcon\n");
-		return PTR_ERR(info->edev);
-	}
-
-	ret = devm_extcon_dev_register(&pdev->dev, info->edev);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to register extcon device\n");
-		return ret;
-	}
-
 	if (pdata && pdata->muic_pdata) {
 		struct max8997_muic_platform_data *muic_pdata
 			= pdata->muic_pdata;
