Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6325722B5A3
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Jun 2025 15:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748965406; cv=none; b=BH0ub3kXJ94bqkeLXcXHKJYpjxJmnUsvZJ3HR7DDCG7yvp6ay627hXH77r0gjpzYqWZyqPgqmzF5II+d1z1Ng/5jK6RPXX+1MWtZqcSpjbYlUeGZQ5wpFw6ME9nrCcTqaarlywxxkuaMWiQbMiGToWB1KB6q1pfuXhBMJTXUKYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748965406; c=relaxed/simple;
	bh=mkMTj06O7I1L9PURSG3BNAMbohNB+Tx9IJ0AE7abtkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p9ASyj7KA65x0vktCTQo4mD2iwOmmPNuqPQCkTwS3rcmGTAeiDwrJmyD5kk+PXbipt94Jp7pTl1tSxO4VtHbrvjnV47W82gaPQs4VRBg5bs2mi7NbKudEFOTN/CJ5XImDuZsM+qZ471vfNk+RII48MfbjGwLs4QkGASMSdmjnfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CdnhC7g6; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CdnhC7g6"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad89f9bb725so1155699466b.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Jun 2025 08:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748965402; x=1749570202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FhF2cjF5zAzV18nEabakJ1UzQ/GrNdWmpvarqiPCL7M=;
        b=CdnhC7g6HTA5vVqW4+Yh06/p4CQ5jKKnTPKcn/kxHayDitdoWpXM47JMCdIgYFH/Zr
         mOfMKs2FynPZIfpUOp0rwx6XXN98vDdX2loNp9EicwzKYGpRr1f8LOmxFQ7f1HH+6Xqv
         DL3aFB1/wck8kjaaWzV95l+kKSkj3b83g9fKBwSwEK63PeBISj4WJ9PN8yvmGxbPt/oP
         5E3EduLzvIv2z27fR8WsWw+sE1S8Xh40Fdx4zqH2B1JHebzeoYBzzd2Mkaeqx6Md5dsg
         kGdov6Hlvcgf4Ml4KHh3Uk7cD2Ui8jXJADfhePZVtGPSKIrzqLrJkGFW+vAtksARWeVH
         z7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748965402; x=1749570202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhF2cjF5zAzV18nEabakJ1UzQ/GrNdWmpvarqiPCL7M=;
        b=eykLLtPNMjHMwSiUF+OebkvCmuFEflurUfw9gctrFZpbNvryAP9ri4LOef1xzPkrBl
         3FdHiS5ZualeN/RmZ7Hqs7pULc3CiJ+SFKaTq5NVERg6N3rBxq3l0WrAaude4XNH3oj0
         3pROWBq7yqaU5LHcmzTpYckumyuooxOEp4v2wZzlAaa8m3JYgHYpZo3Ql4uVkG6JjyGt
         2fMSk5qNCdNmuxxjyrLFHyk0ywx318Pz8pEmnIVSIIOLynbFn2tVuOfYORaM3d8Vz3WE
         FM8Oo0C8KvmrHavpYYZrlnXtd5qqoeMwYgmCVPTZRtH+5h5pBcqapwK8mJhpJSgv4/da
         803Q==
X-Forwarded-Encrypted: i=1; AJvYcCVC86tSnni2YV67Vrex9SocfC2sqRN5c7cSmYEy7jrnKHglm6lidZAKjitEY9Wf36piUO0xtCIqi2MZgG5TQfsvbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfbw6s6VezVYtyGA91OtJuJTf9Nkb1liwJB3ALaEpaguOVVueM
	bBXObw+Al3Gd7hVzKwtLPrHgWJUHEvQmFRialnBwr6C1mfDnZDRqsRz+ejJEDOkMu3w=
X-Gm-Gg: ASbGncu6RbdSgIYYwYjaFu09u3mUM3sYRRLu6I2NSpA4DO0iqdRmMt0L/1U62Y1pkfN
	zZIpMZmf3PfJNsIINrXVxDMoTL3uNjw4RGFHSSENikJHgvYRprXK59lVK488LsEA1MxEnie7Oul
	pWlL3FgCIq35/kt06LIWjWrMXjUkVs+nsUh7Q0pb3warZhtQj7+YT7zB43cfNC2TWd6d14mh27A
	8iKUASOKNje2x4rlWifcfVavVEmx/diZ46xljyNLpvua9eZN/2gJHMLvtfmdTlzt7yB6gjbmgwU
	TZNmkh1fvcr7f6cv7bRuKH8zwA9HWPze3O+3rNVKYR5IjkYcRCpg4pv1vDLsB1DUQt5da1VsKpb
	u0dsR9fS+s7uTYEWWLpcIhEVmfBD8FJ/xN3s=
X-Google-Smtp-Source: AGHT+IHdbH5nQxzalWh/NsDVZb6FCYdDH3rQaVkOJ6uhuni+aK7sz1J/yFbrtIh3WrzPAg01pUI1GQ==
X-Received: by 2002:a17:907:971c:b0:adb:2ef9:db38 with SMTP id a640c23a62f3a-adb36be2060mr1662069466b.36.1748965401532;
        Tue, 03 Jun 2025 08:43:21 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82de9bsm959277166b.47.2025.06.03.08.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 08:43:21 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Jun 2025 16:43:19 +0100
Subject: [PATCH 1/3] clk: samsung: gs101: fix CLK_DOUT_CMU_G3D_BUSD
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250603-samsung-clk-fixes-v1-1-49daf1ff4592@linaro.org>
References: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
In-Reply-To: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2

Use the correct Linux clock ID when instantiating the G3D_BUSD
div_clock.

Fixes: 2c597bb7d66a ("clk: samsung: clk-gs101: Add cmu_top, cmu_misc and cmu_apm support")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index f9c3d68d449c356019aee569fbe289259624da70..12ee416375ef31deed5f45ea6aaec05fde260dc5 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -1154,7 +1154,7 @@ static const struct samsung_div_clock cmu_top_div_clks[] __initconst = {
 	    CLK_CON_DIV_CLKCMU_G2D_MSCL, 0, 4),
 	DIV(CLK_DOUT_CMU_G3AA_G3AA, "dout_cmu_g3aa_g3aa", "gout_cmu_g3aa_g3aa",
 	    CLK_CON_DIV_CLKCMU_G3AA_G3AA, 0, 4),
-	DIV(CLK_DOUT_CMU_G3D_SWITCH, "dout_cmu_g3d_busd", "gout_cmu_g3d_busd",
+	DIV(CLK_DOUT_CMU_G3D_BUSD, "dout_cmu_g3d_busd", "gout_cmu_g3d_busd",
 	    CLK_CON_DIV_CLKCMU_G3D_BUSD, 0, 4),
 	DIV(CLK_DOUT_CMU_G3D_GLB, "dout_cmu_g3d_glb", "gout_cmu_g3d_glb",
 	    CLK_CON_DIV_CLKCMU_G3D_GLB, 0, 4),

-- 
2.49.0.1204.g71687c7c1d-goog

