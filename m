Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C0B426D0C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 18:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129896; cv=none; b=m+zBZ2/cW+mZ8E/shMbwLtj20rc3uhPW9c/yx8pXQL3rxJUoJkADHJ2mZ8yxM14TnFvFhzP+bJEL8NjLNNLOeGH0Z5E9wXjiqRyO/gYu94OEL7VHXXdtFTO69FsByQ0EAVAxH8h0F9aRpAAnFeNoPYWBZUogh5WMIudiQNsiIrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129896; c=relaxed/simple;
	bh=EKn4D9pfsoVqno50Wtt27Q3vdRSw/o5+RFfqCp9TomM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dPqzjz1QcaRzYftUeThFlsTgD2b4lFlwFnkkHBHETtGSuYi3W/959d4snW4VY06tNj/gmjrSyfcPAlwsnpBU4ars/AG73WxJ5VYp0lpWrvymZ/KUS4APcNJQlRHvwfJH8qCjpQf1Xlr7G24VR6ZHHsHv4kc4azgGD0HTwUShqBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gqgCwhjU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pQrubWb+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gqgCwhjU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pQrubWb+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R8/8h7E8+kTx8XExpctGhWPiJ0TZXQbqGj0doBuTluE=;
	b=gqgCwhjUBfEaLLTbBK+32B6lxt7UophBJNJ0IHIPpgFfhD/Yq+SKPf6/G1wJjHU1sS11sH
	KoL76qK/TaEs4XxnDrggTz0W+timy1Hs4RvUU07G1lfzKicojEsGgAJGFCl8szdDMWG8+H
	w+Fhw1OICiAOGZf5Y6Kk+ZRwda3UVTs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-OZeRjKyfMmGP1pxCaQkpeg-1; Thu, 26 Feb 2026 13:18:09 -0500
X-MC-Unique: OZeRjKyfMmGP1pxCaQkpeg-1
X-Mimecast-MFC-AGG-ID: OZeRjKyfMmGP1pxCaQkpeg_1772129889
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb42f56c4aso1010527585a.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 10:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772129889; x=1772734689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R8/8h7E8+kTx8XExpctGhWPiJ0TZXQbqGj0doBuTluE=;
        b=pQrubWb+5jWEM5aYtJOrfuSBBVKf6uGuJrO9aYVUr3Y1jyR268vNVQRtkeCXjA8wEb
         kQvpRofLlDkvyMHxHD8OTpPaMfSfMoSuVepWWVx4cV9g9vHD7DdN7fA0n8HTXx0h3EEf
         GyRMi03piGMRPpz3wzgKO2lWwHlSEpRJ0FiPup23NBLp4gmJ9LhQ77SAzh0fleMljGtd
         ZEcwzTBg3uF0uXuHVX5rUojsd4e+W6CyNukv8UcGOGAQLaWISk/+bXAAZtXz3pds8G1r
         FUax7il4PODzodK3JvAKPbaD/DfhWk4+T5IiSbH5RBSuoHFopu/MPLWjC5tNx1gptnyz
         cTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129889; x=1772734689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R8/8h7E8+kTx8XExpctGhWPiJ0TZXQbqGj0doBuTluE=;
        b=wu94cHSuOk3BzIxb61fMWvk+K0f979b2cCNBZ+0HqCVcTJjk+yEdZuOBvUEcLiQqBa
         M9gCJ3v4hncotuuhLj7deW/kFPf/D+8nzhJld4lQiv82TsfAonyJXUVKzki5zo4Iizjd
         OQ/0yQK7YtBkJrdzNELy2sBDq62uFaGL9b/SMlZXaMYhtqDpkAKOQAzpfV34YTRuSdr9
         SN/XcR9xw8drgEkXFCHeqc/L4TAYF/gvjAH4uW6fTlK38xNTgShJ5QWzl2aNpE4UYFlZ
         XFOUagEea+ZkxC18nIlu87KNBW66c8E3zsbXo83uLrsUO7r4pejHHsBTP1x3Xpi6kdLP
         6b+A==
X-Forwarded-Encrypted: i=1; AJvYcCWefNVwjOAt0k9EyjTWvTyzPOASGGzGUOblbRIhnYk9Qo82yf3IExjAReJI+Iy/zBPJnUDEv3YvN1Tn87qK7A2P8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB5eNfv8aCQyEPq82aLyiC97mvBgvHWFdlSnCWCHl3xAq+mdmE
	uKT01nw4XeerCk0QAsee5wvH04XPRWmS/oosoiRqlERPvhQBUezfa0RXNo8WmgADXPETzcNUOVn
	LnHBx4wBfogXFgzlWbBISP6hZrCxxljsPgLTh+2n8tTas0X04v6f8vJ8hOOl5WrEjTulWbJfU
X-Gm-Gg: ATEYQzxrUbAVhYBXk27ChP9uJ9NoYfafdlr/IACR7Nt1uyn7lb3m23M1NW544Z3Cmd1
	DuDXXNQYsIWdpkIWWpuL/qH1gfN5kDlDGd9d3BtC9M+iLUsKbLDIkwv6/yF8VsSGkvG7yRhSrnq
	1W0hbbI7FZDL3Lx2dmU7Aw94wY5ycnkpd1LyD313KbC42P0c4dTqk3ABRWC+QmzA1VbFpQrrrgs
	r26KbN3GlOq03b8trZtnQZ7G8c2tLbo634QUIWxudkAHnymP1yn/jIrse0+JbLG7HjXxp4Km3dr
	S5BEz/Y1q2sh6OOJ4aOmF5Hb0xQb2PMMEZdC+fjyu2/XaJWg4sovdojAUdFSZWWQBxm/8Vf0nP5
	ckEDqyCLTAQU8D/RHbAUrore/7EhWXuxtrboSu8Z19rqPLwYoRuO0sU7ZRxR6
X-Received: by 2002:a05:620a:1929:b0:8c7:1119:2994 with SMTP id af79cd13be357-8cbc11c90edmr372520785a.64.1772129888714;
        Thu, 26 Feb 2026 10:18:08 -0800 (PST)
X-Received: by 2002:a05:620a:1929:b0:8c7:1119:2994 with SMTP id af79cd13be357-8cbc11c90edmr372514385a.64.1772129888155;
        Thu, 26 Feb 2026 10:18:08 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:18:07 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 26 Feb 2026 13:16:56 -0500
Subject: [PATCH 12/13] clk: samsung: acpm: drop determine_rate op and use
 CLK_ROUNDING_FW_MANAGED flag
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-clk-det-rate-fw-managed-v1-12-4421dd2f6dc6@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2091; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=EKn4D9pfsoVqno50Wtt27Q3vdRSw/o5+RFfqCp9TomM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9JnE56s1Tph83jdWa1ac1Xd1ndm6PdfP9a954bFZU
 u7qtmrljlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACYyk4Xhn1mY9srEzJmn5rw2
 sTu028dALKgiO9zoj86bnu7Itz0FLgx/hVjYW249tN4UzXhUxVZ7JXeVc79zU9+1uvMnjU3v3rF
 jBAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_FW_MANAGED flag.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: Chanwoo Choi <cw00.choi@samsung.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org
---
 drivers/clk/samsung/clk-acpm.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
index b90809ce3f882c489114c9d7299417d7fe373749..e2dffbfcdf221e31a4302074475a42481d6a829b 100644
--- a/drivers/clk/samsung/clk-acpm.c
+++ b/drivers/clk/samsung/clk-acpm.c
@@ -72,18 +72,6 @@ static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
 					clk->mbox_chan_id, clk->id);
 }
 
-static int acpm_clk_determine_rate(struct clk_hw *hw,
-				   struct clk_rate_request *req)
-{
-	/*
-	 * We can't figure out what rate it will be, so just return the
-	 * rate back to the caller. acpm_clk_recalc_rate() will be called
-	 * after the rate is set and we'll know what rate the clock is
-	 * running at then.
-	 */
-	return 0;
-}
-
 static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 			     unsigned long parent_rate)
 {
@@ -95,7 +83,6 @@ static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops acpm_clk_ops = {
 	.recalc_rate = acpm_clk_recalc_rate,
-	.determine_rate = acpm_clk_determine_rate,
 	.set_rate = acpm_clk_set_rate,
 };
 
@@ -106,6 +93,7 @@ static int acpm_clk_register(struct device *dev, struct acpm_clk *aclk,
 
 	init.name = name;
 	init.ops = &acpm_clk_ops;
+	init.flags = CLK_ROUNDING_FW_MANAGED;
 	aclk->hw.init = &init;
 
 	return devm_clk_hw_register(dev, &aclk->hw);

-- 
2.53.0

