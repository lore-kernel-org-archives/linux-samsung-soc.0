Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C3D2701BB
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 00:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778028662; cv=none; b=iVXogZClN/xbwCmuVZT2ZDQ8A4sIW25N9QanNd2CKVHVPgW3QK6tK6MNlVVk3kuyYoG0aIPBTtD8PtHXW5hmDZ0znBUPkf1yiuA+FWM3Y+obR6UFT3YhMztkAw/aOdGx1wqzF1Rtn3CeiJ13nBPjMADIXRcK/JlfdW32eLsW8o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778028662; c=relaxed/simple;
	bh=9+dWo3P6i930wtAZ+AOHqGxAhsjeZTnxyrmISWm/cVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YNVHbgQB/0DPX92CDmshfF7t0nTRyRxh1BouirMIsbbVJhnZbb0VRbhZ/aT5ZCFN3os4nsI0G8L6jChvY9akUW9gzuZD38+BL98TQ5SMtC97Mr77rOT7pIslMRybpitqBaGppj9ihiEf0y06A1AU5ZXjK8e2gn5xjrQPfDUnW2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J7wsDzxQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jauGgNDp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J7wsDzxQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jauGgNDp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aZeX6iFBf1nkmyImOCq6RWtGrK4u2/IP/5qCjN0mbak=;
	b=J7wsDzxQHMomBpHGNTDiHh0tINc0IzcE3eO5Fb1pn/64XBckL+j0XZLly8N6Z49GgjtjaU
	X6R4WnQ9q6u/hkABBG56eSRKgOVzuWI4qSToIAy9xrrN/98HYM7ftshkhH85+AKzoFv00C
	YTFCC0qY2LzQnChpoP5ubv/BX7c9334=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-srO0ld29N0Oc0Wa-TwcWXg-1; Tue, 05 May 2026 20:50:52 -0400
X-MC-Unique: srO0ld29N0Oc0Wa-TwcWXg-1
X-Mimecast-MFC-AGG-ID: srO0ld29N0Oc0Wa-TwcWXg_1778028651
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d5b5d607d1so800118885a.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 May 2026 17:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778028651; x=1778633451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZeX6iFBf1nkmyImOCq6RWtGrK4u2/IP/5qCjN0mbak=;
        b=jauGgNDpQcY/yt6ReJmg7cneciaSSh4eZjdheOzI5Y6yBXrUZoLWF1D1qPlsozL/Y+
         eifi+VKRjIy1AgslJO8P0AeBomxudjujiPGxlRickNfvGbbKSITswBDh+jFlLszrDjuK
         QvAfss1Q5TjjOXvoqED0X+D3nhPFRQZ5JS5Hz7vnTNjj2YriI1Q5mVHYvA/ZIwyRPIrd
         AoVSyBhmb5kNWDowg9TdmghvJMeWlQqEEeVwCYieMPQxvpO7hz1l00OCbPT/WM76HDpi
         Cn9djafxL7jYmTAmYkRABwxO4TNL6ekyXjf5gwF7ePYot3E/A8HFwNo3ib2DmyA9cEez
         ozNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028651; x=1778633451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aZeX6iFBf1nkmyImOCq6RWtGrK4u2/IP/5qCjN0mbak=;
        b=pKpb9OPl3r6N8f1xuHiBP4mNCd1SFRdyKW7nza/kuKiNCTkZ1iYB7J2ESulKo82yMM
         JHFRBmvo/7BVjnEqiuCIZT7GlEwanXSlzgOuy5ochuxZjC5ZE4pRkXdMV2eXqajLTLem
         FgNyAI/xZfuqArFBe/l1qL0Ukv43Fk7v6o2cKOxQrMf5g2IX1WlPF7nSuzkxSbcDe7Gy
         eWFGmGHVQag4S9gwCnqS76q9am6IbA9noqB7u0sLdjzs3ctOovlKtLv6fkhX5meF9X3F
         kmCSvW60T0AwR9FM5OAOsVPr3b9HMRSsjnQS4Z5mmaaf2ng+43/Cp/k5mWZPaAQ1FTHu
         haJg==
X-Forwarded-Encrypted: i=1; AFNElJ/7INurlM+vC7JvjA96v6uL7AoD8PwrVuAYiSMsOKeeiu8V30Yg/QZOqcmTJcHPyjfPdcxcHaupciXJ7KqZSJfKKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7P6/38DPbsnryE6WnL7qyfGbWJ/+DpKXdy2+bizxHGltfSUOX
	Wb0h633NTTLm8aELVipbrnnootr9VTPEEM2pDY4pxrYow3gTCrw29u+CA5JeZIZD2ZBHu6nQMb3
	NxW3rtWT8CytVTfl8hCCr4pU6ptUwU7GbwFXIZ82rdoDVkHyH2TRcDnPt0zaUlzI2qfFSvvX3
X-Gm-Gg: AeBDieuej27dQi46G5vNCKWuR5a2lHomeZLNjtd5ugUSLfY3lg9MAjW1NkWJOl9gYOj
	w/jNlR1h7cOo9CpOwWFlV5u2p0WehWBGg14/Jq9uaMoYVVNPAHt9BojJR/BR7xUHPbvyRb3ikoW
	A9606Bgq6kjMkxpm21rm6SZS/tWY4lF4YYyfff+A2HZxuFC9H/Zpr+hX49nk8VRVioVUc0pq7PO
	z7Filrj9HB7gH6GvyMgyRReAfPBHlicMZfu+d7jZ63tZcwYbb8G03LQaHCGR8M7Ox4Zz8RIbIHi
	qzSMsqamAJGp3AycYOLa5QzgT6k7QzbQfPUshflbmaAvLToCbFN2y0ODB7yJQg7HPgr6ZjBUr9+
	GbqFvbWhLrlNkigasy6VLU80pXpNGDLbULnWmUqPBzGNIPYrTWINHkYkOMUMdSM0Coprts3wP
X-Received: by 2002:a05:620a:4449:b0:8ee:eb50:4f51 with SMTP id af79cd13be357-904d6ece2ffmr208266585a.54.1778028651481;
        Tue, 05 May 2026 17:50:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4449:b0:8ee:eb50:4f51 with SMTP id af79cd13be357-904d6ece2ffmr208263685a.54.1778028651020;
        Tue, 05 May 2026 17:50:51 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:50 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:49:06 -0400
Subject: [PATCH v3 10/15] clk: samsung: acpm: use clk_determine_rate_noop()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-clk-determine-rate-noop-v3-10-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1848; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=9+dWo3P6i930wtAZ+AOHqGxAhsjeZTnxyrmISWm/cVU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TfAWaa85Hf5k3XRZo2dLT/odZvodaeC7weJGhJ9tf
 HLRHRGTjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACaSc5qRoa3TRMDH+2rZrk92
 52Z5aL2dPsdnn8DX30cKvH34KrasVGVk+Ldjqu8Ua7ny+b93uh7W8rv1rSzh49yiaTNaa/sdPpx
 7wwQA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Drop the driver-specific empty determine_rate() function and use the new
shared clk_determine_rate_noop() helper.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: Chanwoo Choi <cw00.choi@samsung.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org
---
 drivers/clk/samsung/clk-acpm.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
index d8944160793a..7a07bfd4948b 100644
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
@@ -95,7 +83,7 @@ static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops acpm_clk_ops = {
 	.recalc_rate = acpm_clk_recalc_rate,
-	.determine_rate = acpm_clk_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.set_rate = acpm_clk_set_rate,
 };
 

-- 
2.54.0

