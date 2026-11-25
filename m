Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795583010;
	b=cDPzGzF8QKVu59DvqH7djyB1+gIvsu15QsHc7mQJepJFS5+tZ0EQUwr3fbqIS79GSe2G
	 ZYVGERkvjjfyrSRK6O1Rm05cty2S2RDf9KUgISZUGErsIFBcGWMbvhpnIytVzLD6BkMaD
	 uAmypMlG3L/uAXa2+LP6SiQ6vt61XeHPmuk16Kv29aTOlACMvQ45gCt4jUFmcy2cUJuvC
	 3i+jisjEtZ2yFPIjdqCpdN2ACKf4lFM2HMb5Bw0vh041sbAOwanSndow+GQ+YNwV8yZ8z
	 j6L4XAS/yl7e+AoIKs2iFvqTISJGC2d70ZPWPsL2KZkOYBm7bx12hYNUxgonCLihtCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795583010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mmzsQ8yQcEKYwO9cJ8eT25DvK0anvv/VF+Yi20LWU3s=;
	b=afINEzEuVb7PWbYnT2L35x39DNuEuFuAcqgTwG2sQGhO5c6f3VRIEmlHDtlyYG0Y8fIJ
	 wN88ehI3u9SIyP+boO7CsZGQnzeJn1PxlMJSYWrA8y1gVZDakYc6gYDF920HwSowvn3qY
	 LzpOeKbOVvyOKusZygK7QcQDH5OS0J6C09EEPCDGiSqaVXc50gfb/CjKwTEpWOXMNw9pQ
	 FJC/19Ki/mUP8xFXQyHpQEKN3w5TVsLOAQsr3LowTDtaamxThkbGaBGGlL7qxC6OjnhZG
	 P28LEdSQZkSqJefZbv2KfItYdQx8WTcMKajNo9CsBlxnqbAqrfXeDoE02wEZocxnDyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cBPeSCmQ;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB2B606A31E
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 05:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAB2B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cBPeSCmQ
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a070755c8cso2561900b3a.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Nov 2026 21:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795583009; x=1796187809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mmzsQ8yQcEKYwO9cJ8eT25DvK0anvv/VF+Yi20LWU3s=;
        b=cBPeSCmQXaI/3E2+NAPOpz2aK1M7tN1WZemYq0lqZ7Ie76pICCMIJ/0QGCZG7Z7vfU
         sH9BvxwqlkLWMOzauxVMKBx3lhRHCIZm8x+mkgxnbebfciHgw6DduRomlgkg2f6AgWsB
         BcfDl6kbrKAVmcea6mN7sALkcEo9FywPyveYV46+ICCEBMflt4VDTS99potbJZyL2Hrr
         6BSCbMeL3zuPuqshssJSCynpZN/8hmsQ4AaOf0FzBQkTOytY6lUk6cn3v3uQEp0wkCPe
         Pi1h1V1gY0zbsFpNYkAX1TZT6WFScrUcExemyxU569CHovLtlMGJ5fhMTwLsxB/Sk60M
         6F5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795583009; x=1796187809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmzsQ8yQcEKYwO9cJ8eT25DvK0anvv/VF+Yi20LWU3s=;
        b=nVS36HjnMskf/KTdz84TM3KbkEkwVQVIO+aZxZXsKMiKZNifUy/NiJAXBD+XntywKK
         5yyHk1X+/3RZHjEcNLQUDRxG6WAWo7U9YAxt70klAE8K55ccBMuTt5tfkGRkbfDKBtKt
         GRZuHh48RZfnTbaoTBNscksdLGNDv8T8NljDstSfBH+dJyZRHpat+GWIzdzqjsOZcN71
         rI3ZCb2lnulVNJ8baD7pB50itLariecnxATKs5ftcyLISE3jCcDNucKHDJcmM4S7xwM1
         /VaWQCszay9kjGLHSB4BI1SaIvU0rSRAUi35nxIA1x1DKfpZv6Fx5UXNEpSHy2mU/FhS
         Hycw==
X-Forwarded-Encrypted: i=1; AL+hErE3JGFGNrirwK5eCND2jgP4C2igjz7s9XnJQeU92M9aG5VvfGyaVEjrDSM0k7sXL9SGY75yu+Q5UL411Bigp1FEhQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8D2oMVx4jlQRjOTinq84u246zLcdQGT8VApvYIaH6Ue0jz0Z+K
	7sDPdVN8IU+JviMe79bLYaAFl8mAsgtHoFbnG2EWqTuBadPLBTi7gnKC
X-Gm-Gg: AZFdTZeu3IscBE79Ns6TIzylKyp6d7IOS4WSmK8UyTfBAhH9dgvi68Z4oZhi4YJRIp6
	WckP0SDHbej4uq9dFhblHsEqMfhk49GXkYlt1l7FzyLzM0XWdsbazl/WNDJNI4ETsOZ+cVM7/ee
	JEqV6HHEjnPUn5PCjxcXIVIp87n5FnlP2QxHAqH7RIDbveioZkxZpj2srUEN2mljV4iUY2Ili+H
	TYeyxOokrMJaph1bWI2I5Cj9orwngpHs6Ek+djzx4chaoXXQ1Sqk6NEK+rw4su07m9ib3DELO+c
	owhbOMAkh9e/mQQQ79S2JF0Rt4e8RLOVECXwDTulL/gdTks7xFe7gkevX9GovXwb7xy3wZtvaX+
	JIutXYwHTtFj846KSmAAVFssjuH0GmJffnDW7nJktBgXXd+PSTjgwbh+MwkXAwyrSjNvfmo44XX
	f7oA7FLQa4yDNwIn+ou/kw+BtiSq1x2PzOR6RB0BmPIm0YcoJu25IwFKPPNw0jh5AEG8D5ahC//
	fSl9gymhaqgjKuoPjr720G93lbPSEdpZU0G8hoyA+qFrVNjMUJAOzgbG13zczOWK5nqfTLU8M8F
	Ahv0glDVj8DxO1OHXblrzTCV4kLa9D+dibneYl+1cgIfAzxzHz0co2SFwfRCtAUzV34wTQI6syf
	c1s1NDnOq3yW+k3Fn6TKrJhTESVjCxoBPzC4KHidK
X-Received: by 2002:a05:6a20:7f8e:b0:3e2:9dee:42cd with SMTP id adf61e73a8af0-4014bc4e175mr17405476637.36.1795583008860;
        Tue, 24 Nov 2026 21:03:28 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([2a09:bac5:cad3:119::1c:2e7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c14fsm8180394b3a.15.2026.11.24.21.03.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 21:03:28 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: krzk@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH] clocksource/drivers/exynos_mct: reject malformed local-timers property
Date: Wed, 25 Nov 2026 13:03:23 +0800
Message-ID: <20261125050323.83620-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
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

The samsung,local-timers property is optional. When it is not present,
mct_init_dt() should keep using the default local timer indices.

of_property_count_u32_elems() returns a negative error both when the
property is absent and when it is present but malformed. The current
code handles any negative value as if the property were absent, so a
bad samsung,local-timers property is silently ignored instead of being
rejected.

Check for the property first. If it is present, propagate the parser
error or reject an empty array before programming the explicit local
timer indices. This preserves the default path for device trees that
omit the optional property.

I found this issue and reviewed the code change that OpenAI Codex
helped draft.

Fixes: 47dbe4eb9822 ("clocksource/drivers/exynos_mct: Support local-timers property")
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 drivers/clocksource/exynos_mct.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index da09f467a6..aee3d88ad3 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -645,10 +645,13 @@ static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
 	int nr_local;
 	int ret;
 
-	nr_local = of_property_count_u32_elems(np, "samsung,local-timers");
-	if (nr_local == 0)
-		return -EINVAL;
-	if (nr_local > 0) {
+	if (of_property_present(np, "samsung,local-timers")) {
+		nr_local = of_property_count_u32_elems(np, "samsung,local-timers");
+		if (nr_local < 0)
+			return nr_local;
+		if (!nr_local)
+			return -EINVAL;
+
 		if (nr_local > ARRAY_SIZE(local_idx))
 			return -EINVAL;
 

base-commit: 7ccb044c27720d48175577080b851f047ddcfd1c
-- 
2.54.0 (Apple Git-157)

