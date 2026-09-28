Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD0A40B36D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Sep 2026 07:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790581671; cv=none; b=u8n5Jl4E5pPvdAE3F5MFlgbsfAbkhFhbYtp3D+EhZ3kAIVIz8q94hLPXULmKPeqvUU2RS3QKNCwPYzTVu+e+fMIw1h4JW7Dio+7eK3lBj7iwskBwXYq0dj9qUioHQ6l58kOklK6r2Jfbw6hgEQqGjxTvvm2ZTkCUPXrFEi1b2TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790581671; c=relaxed/simple;
	bh=fiMLttTfalhCTAYlHNGOdhisfxhBpO88GtQc6y2H3dE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IeM7fTY9PxW2vN97GRt1hFXNn6yrdNtKn8oRMv2gauiujFrZHukEA+kb5fUZgyfiIrqJCSFPmwi5EknQE0EsA1tlGO0y0lYiKaTF+ZhDiPmG+DafH6bKHiCHboiCsdGfm5b9VtsC+qelKdVR1ZSLagoV+lPGEQGTeEhcSK6r1UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UyuUziL5; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UyuUziL5"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso19195645e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Sep 2026 00:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790581667; x=1791186467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAmEOBD3v0bnVlYcFrfguXtEbxOwMvuvxDB7riQNPhw=;
        b=UyuUziL53Jh/NI9XmkFhvmTFCgjoO+za1rYZaWX2Cdvs3jGYeb0OuWUgjcWT67UurX
         //4solEEw9Dx0wC0r/NkVD+mbfS/LOXu2ATiwdvH0wy7bLgRpoQu0/9CYjkrJ5/xa1XD
         1JDCIRpPj5N/scpn884kLEnJWyA5Cbgxi3MQoi03K8k0Q5smPURG+NUjTGkSw2bwXn4q
         +xUFnO+PWdyi9PO5n2L23vchOfS862XF2H+WAjyJHJD+DPaWa39QmpGei0ARfsjP1Nb+
         yHaM6U2782UhxQWZ+vxkNjEvkr6iAzjjkCVhIBDSvUrzu36OO//VQr04USajcyMnLC8z
         Puxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790581667; x=1791186467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wAmEOBD3v0bnVlYcFrfguXtEbxOwMvuvxDB7riQNPhw=;
        b=Wv2DkmFJgN22RU7WH4bWQBVy3xusf/B+xFOIdrymJEoAR+gTaEmDWZKuYvFCDe0xpf
         yaB+d/8NGz7EhoLgCvyAG/jaTbezqQKG4VA2f/IwNE8WQPmkAUQnCeHh01KWIO3G1/lp
         e7C6Rf5/k6ZRVg8FPJNV8/0NyXQjaCoWP5bM+fxnXgemc5MaR9UTo3yTKoO21AGTRG3g
         yv1zHIfLtw1WW7I6wI63YaYNmvC9hMG0Jsjhc0cdOf6W6hwFvmvWERcdQ3U7gN2HOe4g
         +NUbzQiHLyu7aTEJiqXDG5itl0UyvZniPAXJs+oSl2A+LgCn8aZ2roSa/pzFF7RCncMK
         s+GA==
X-Forwarded-Encrypted: i=1; AKwUvBzxaHPUKiNBb/WCRtEtGaNCsBwqR/a3GeEn8BLB8WSXhxmSx/lbbBse1aLNEsSnAUwnCmDkPA7ADyev5osMpj3x3g==@vger.kernel.org
X-Gm-Message-State: AFuF++lIqk6JjpAVk7hyxzRUBVSwaC8S6QqnyzBlRJBPger+fsk60Kcc
	v2m+f5H01i4H+F7iPoV7qUXjOQi9bLd8nexivHbEYkHkBMZqJjkEzzOd
X-Gm-Gg: AYBFou0iPcA/NbhzC4ixi5wCYF2P6M1ifbsxmjLmUPooQvcZ4IAmANTYHIT+qoYU+Uo
	Wx8TdxIRC3WLUwzF+bXjkAx6dyRBCIIh01HlbuiLne9ruCElj960U1+YNNi6R8q2263yAkR2Tyr
	yFY4fQb6UG2RZyb3NLXvz1Ft2F3RlNW/8pDNODabiOvv2CKO9I4VHYLOm1xYI1BMxDVRYi6wz/d
	fPomgDG5JK/u1PmGs0xoPkM15pcF5mIM+W1x6Qi5OmqlNY+yFz7VQ4hVYJz/Ratg8nJPSnYmVvK
	kFYEPAj0BlUMQzcyVjxVrgsy25XAsDf1nOJPtMbfML3WwMalmVMoQ/86ijgEsXwIG5h89eY2iPx
	z/rgS4xKrijTw0l04TQE7wmwJYURhFcxipLG8PRVV6eiXGMGEnDB4rQr94Io3hdm5gre+f2KRq8
	yls+TOGHKxinjgkcxSb8bcQQQvSdzDpfUaTMHLwcjBaKpbPfyK5zGxACfBUB96SW3rCSMnTGET2
	bK1l1DmGm7hFFfEplBPZ3e5lgLqF33gqrQUgbHKrLVLyB/JDCa2mUJIQg==
X-Received: by 2002:a05:600c:8b71:b0:4a0:328:43df with SMTP id 5b1f17b1804b1-4a0032847fcmr36162805e9.21.1790581666994;
        Mon, 28 Sep 2026 00:47:46 -0700 (PDT)
Received: from localhost.localdomain (host-081.salzburg-online.at. [213.153.56.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64ef3asm25817668f8f.30.2026.09.28.00.47.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 00:47:46 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: s.nawrocki@samsung.com,
	alim.akhtar@samsung.com
Cc: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus.Elfring@web.de,
	stable@vger.kernel.org
Subject: [PATCH v2] media: exynos4-is: Fix a race between s_stream(0) and the interrupt handler
Date: Mon, 28 Sep 2026 09:47:44 +0200
Message-ID: <20260928074744.23378-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260923083729.64831-1-ginger.jzllee@gmail.com>
References: <20260923083729.64831-1-ginger.jzllee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fimc_lite_subdev_s_stream(on = 0) sets ST_FLITE_OFF outside of the
fimc->slock protected region, and only then stops the capture in the
hardware.  flite_irq_handler() runs under fimc->slock and clears
ST_FLITE_OFF, so an interrupt can be handled in between: the handler finds
ST_FLITE_OFF already set, clears it and wakes up fimc->irq_queue before the
capture has actually been stopped.  The wait_event_timeout() right after it
then returns immediately and the driver continues as if the capture had
stopped.

Set ST_FLITE_OFF in the same critical section that stops the capture, as
fimc_lite_stop_capture() already does.

Fixes: 6319d6a002be ("[media] fimc-lite: Add ISP FIFO output support")
Cc: stable@vger.kernel.org
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
v2:
 - Fixes: expanded to 12 hex digits, as the media CI asks (the commit it
   points at is unchanged)
 - Cc: stable@vger.kernel.org added; the bug goes back to a commit that is in
   stable releases
 - commit message rewrapped to 75 columns
---
 drivers/media/platform/samsung/exynos4-is/fimc-lite.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
--- a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
@@ -1209,9 +1209,8 @@ static int fimc_lite_subdev_s_stream(struct v4l2_subde
 			spin_unlock_irqrestore(&fimc->slock, flags);
 		}
 	} else {
-		set_bit(ST_FLITE_OFF, &fimc->state);
-
 		spin_lock_irqsave(&fimc->slock, flags);
+		set_bit(ST_FLITE_OFF, &fimc->state);
 		flite_hw_capture_stop(fimc);
 		spin_unlock_irqrestore(&fimc->slock, flags);
 
-- 
2.43.0

