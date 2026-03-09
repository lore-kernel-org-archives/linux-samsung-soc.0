Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012E93D667B
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Mar 2026 14:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067189; cv=none; b=VFkTji8TsX/WrP7JJ1PKfaJftJc+mOrkxuD8wieyyK9zlttUlhLwb3Mj/VaeJ1JZViiI1V1Ew+Z3ibqrsmxMaf3S3IByd7melxs+cgddJUF+ikbXIXeTZN6Ay8ISwYCEgHsXvRfAxcE7toxXfel/kynQ19YXKAtmIgZ2fegdm4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067189; c=relaxed/simple;
	bh=AfEZfqh1V0t+rt0dmTRJcPIGeDmqixXE2Caq7Fy3w7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bPCUh+7rN4YTLLLPtCI+ql+uSphYILn2XnKswMEzvUlcFuQLXKBt73RdEjGiTA+f+vqKY1zHc9TEavfNu1PRkZnSwJ8XjbnKXgzs0NwY/pEJJqoUIgN6tywdurxk/HEZwNixF40K33cCk635Cwvx+GDFO4FmYqjvWn93X5e/r+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XPOTCwl5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bgLCwjN9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XPOTCwl5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bgLCwjN9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BSC76DdZcmGTKEKzvuRw2/Klyw70AVZ8QD1QgQnIJw4=;
	b=XPOTCwl5n9nSq2XfBvTNC5gDOu45+lzErFoFLYRnpdiuEuCKFLlhdzs+JRYL3P7mf+Cpja
	bXDVDoO//uNh0JPPZO4oUfnBq77S854BN9CWuy7xiHQCJ5mvG65qs5haI8fKIwZtwgVAJd
	q8+tQLHdpUiR4gARZoSolp490a5oj3w=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-sP-VKORaMheMj6OqojBSsQ-1; Mon, 09 Mar 2026 10:39:42 -0400
X-MC-Unique: sP-VKORaMheMj6OqojBSsQ-1
X-Mimecast-MFC-AGG-ID: sP-VKORaMheMj6OqojBSsQ_1773067182
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7d66afceso1042950385a.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Mar 2026 07:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773067182; x=1773671982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSC76DdZcmGTKEKzvuRw2/Klyw70AVZ8QD1QgQnIJw4=;
        b=bgLCwjN9yp3KUnIXoVeXQSw1Om9tQuZu+yHIC3++4WMh+uM2TuZJeG1NF7Xtzo4ytH
         N7nfPbllXeCxquOscecdjU+idpkBaXteStynYKthijWLrHmGZixVK6PPL7gMceqMnX0w
         qyhlRI+j7bSf9GSPZKgD84YW2+nppJLFnjcC0QoDMN88SP6oEjisjaIjNx0N+o9+sT6h
         Y92msHR9g4i7v+wEUNqgHhUeXxXTAslzjTG6mKCa2CjgiS/wMpOMBB+h+Uu92Co8trAL
         a4oXMf9sujK3/I1megMc922AtWDrb+YIRZuMvf6pDm+/pCRl3CYFehKqkOLK2Au1HO1f
         d0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067182; x=1773671982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BSC76DdZcmGTKEKzvuRw2/Klyw70AVZ8QD1QgQnIJw4=;
        b=MepoIWivXNVdwTVvV/Wh3dSaIwllt2a8Kk4BJZ+N2B+na2IiCWqNxsWAi5Fe4/KsK2
         R2qDEXlFGPCH5g54xQfBkwknSDCeD+Cvr48QUXsQobRlsNHjdSAM5UXTVy6wcR/N6gbI
         qn7Y+irIS5lCn0REpjIKZljvAU8CXFBRoYtOBcWc9ad6SmA7yXgINezD0pXwYbGPOuqp
         LIkVRDZw4sgZwtnVeGPLs2Dn59UI7eZrGXFO5EaOBpQw0JDI2+y374/Mp2QpLEVwbmYi
         3PuL7pDgLjxmbb7ALY8yj/VePBMrr4ZyxuvHJ2xHy9v3AP4JJa72iviAC64A7aXhGCWg
         aplw==
X-Forwarded-Encrypted: i=1; AJvYcCWXOL3Rpd/57+AyuxZU2oo8gn1jOJxbISPvx8LkXvmVaU1GOOa1Zp7qYRmk09a2HR1336SqMM+PD3Xpbi2+yGZxnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxY44d2wvjgApDYsZg4R/2l8UoX/75ScGWdOPO1k/OE5IgIlMom
	55jSy8cy/X+5YTJfKgNJ0cxkb1h87bo2u+EfCs3Y3BVxem6VeojXvxQBTlotB8H+cchQjRzlt7k
	TIwZ1SFMncrvhO9iCW6k+yu6cx2SdMPaCWv1W733w1Tux3CdrWARmTrE4JXXKbD3KO7u/fsst
X-Gm-Gg: ATEYQzw25t2n8uAKWNc4oloTjZZfTVwluwNki8Tomtv3zqrBb0sGIDpfOBqNV844+/L
	EJG+s+H2AIQH4krs6AA7hHPjbA5YTiblwIuSkm/4UsfMlMdkCnHSfXdg1H2SB83VpxYawULaDxa
	eokYvGaNYDRPWli/STl3+yjlgv1yWBcaIhkdgJErc+nAx54tuYD8Uv7ddJTT+ibQLjD3RME+PpC
	EumHEi4diUo5Lfyoctbb7qVmhSL/Cy4ECN3dsJDfu59wkjZ0tk3FETMq2Z82m9CIHswcL6gX1vh
	FA6dzjDqEXOZj5d5BbGihIBgpBiLBFupXtLnqryl+UnrMZNhp1MPz4l1QPgkRlDNfXvEg9hYKGq
	iG0j+nQe688eRAazCyBloW0cc0Xz7Xa/T2TEjRPvQzwVUhnaWeMD5OaQygbYU4A==
X-Received: by 2002:a05:620a:459f:b0:8cd:9231:8b51 with SMTP id af79cd13be357-8cd923192famr115581285a.5.1773067182210;
        Mon, 09 Mar 2026 07:39:42 -0700 (PDT)
X-Received: by 2002:a05:620a:459f:b0:8cd:9231:8b51 with SMTP id af79cd13be357-8cd923192famr115577985a.5.1773067181776;
        Mon, 09 Mar 2026 07:39:41 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f49fcafsm756064985a.16.2026.03.09.07.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:39:41 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 09 Mar 2026 10:38:50 -0400
Subject: [PATCH v2 11/12] clk: samsung: acpm: drop determine_rate op and
 use CLK_ROUNDING_NOOP flag
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-clk-det-rate-fw-managed-v2-11-c48ef5a3100a@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2150; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=AfEZfqh1V0t+rt0dmTRJcPIGeDmqixXE2Caq7Fy3w7c=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLX3Z7c7Nf0ONFpyx9lJY+0jkclwRkHZ+cGvvr85rvC0
 3ubLMuUOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjI7mpGhsm/z/lfT91dr3b1
 3w6ub5rvrv75Ez9l1fvuvtxKZmFPs0ZGhkaWLf8fm1zpuPSyxDdI+5GWYY8W5+8j4T7KQRFnaxP
 eswAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_NOOP flag.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
index b90809ce3f882c489114c9d7299417d7fe373749..b79d973eaa0c275c508a51926ecde5349f00feba 100644
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
+	init.flags = CLK_ROUNDING_NOOP;
 	aclk->hw.init = &init;
 
 	return devm_clk_hw_register(dev, &aclk->hw);

-- 
2.53.0

