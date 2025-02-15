Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EAD1C32EA;
	Sat, 15 Feb 2025 11:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739620494; cv=none; b=tMGsLDQ/fj+4QP3XBVFvbckmWNuDLTpSqlT6q1YLIXDJS4b3DvH44cVl/UgWKThejLgf/Z+Aq0PTefwuM8IRHbOTf/xjhVycLq2LZ7JlvMwZVR0GANEVQdx4Uj6EMPvsrZZrlkuZig5UWMgS5MzWEN3ZZx8ABs8eIFDWvWrBKCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739620494; c=relaxed/simple;
	bh=CFnG8ErpXvU35KlccJq/LsKC1MCEnVyycw4tteBdqYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dFGLmfwRpNYVeB3tp/FbQeqUdDY/GuaMcWvzadcyHodD6jPFYvzD2HmtWi9iu83rN16DRLk1kMgnHwFUq4yweJCOIeAv8KmaH1NzjVWzCg5Pnp/PWNYe338YImLxcDFnN063LigP9v1Qi3EYsfpI9eRFkKzw/PMa0F1Y4q+NfJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzYNN7LS; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzYNN7LS"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38f31f7732dso620561f8f.1;
        Sat, 15 Feb 2025 03:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739620491; x=1740225291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EW+FFkohFLZUywRBd1iermeEhpJS/y57/9ZtdC+gJsU=;
        b=lzYNN7LS5y5VZB6agm4RMzt1Q/75YmHc1sr7NdHxM38+thRtgMChK0QhBd2SQ2DfFe
         wf5zcQFgMjZwtB79cMQ9JGLeFXyy5ypUkF8endK2luD02VWpsEnHbZiV60R5IxLrE/QR
         /e6EqG6HO9lhFf5+1EjxUDZ8GYC8sK1Ail6mGM69Husycykfl0r2XrlJ83pw0ExAE5tO
         Q32dZEaqyuigXIJoHmDQS1pWJfJmS08Op2EjBCmHlxvz4vaN96w8QBaabaiJP7ra60qK
         WNv/z+Xco3fKgfuzj8l3+dA7K/HuApB2uqh9mTInIvjuhKOzlpGlMaZ0sjlWRS77Mwm7
         eSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739620491; x=1740225291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EW+FFkohFLZUywRBd1iermeEhpJS/y57/9ZtdC+gJsU=;
        b=pyPOEGPjC+MhgPTcQ0tCx5/JmvCxO+buLqKBDAPUtDb5nin/LAxvuLXeiJaS+TYTKg
         tLvo4igKOfQRUZ5IlZCoi2V1A/mDFb2l2DNtj9s8ZHsv9r0plypCd/Z3R9aBmcHhN5ha
         kFi+1PYfGFhidmbgMw/totSui13Wgoorr04abARrScXCysC+73mduIB8tBY93KCt3UH1
         Al2LSKv1cjty6cUS5i7B6Q4CW8uQL/qQO0JCA1/4t3a01lY+9Pi0lWGWfvaj3yUtfNIS
         yITJdEnZKzkno5s0O1Qst8FUeCr/Ncw6u0KwXCIJebsIKBI8IvUQ2Jpf/B1x9PItRkh3
         A4nA==
X-Forwarded-Encrypted: i=1; AJvYcCULDSZgSv+hbKjJafYFUnM/Pqr+LZszYKUFs21Jt+N8oOd1VA2qXR/BFYmtqgbAEanxl57JaNVKS3fK@vger.kernel.org, AJvYcCW1IqfsIbNQn1vB+UMssc2l2oyvI6tUO3VvTAlQa5DjP3cDq6kYcMFQKg3T0oFaTQxCdLcuEcUT6Uxv5HKkIvb8nyk=@vger.kernel.org, AJvYcCWxX4UDuoht7N4/zmm1lCQfwCDVkiL3QAHRre/m/DlQ7U9CwyppPV58hErvYO8AIRJVVz/J2zDKGrnj@vger.kernel.org, AJvYcCXtBJjWUvM41XGc+N3hgFEocZ2+ZtH7XB5xy/d3aKW94XNUWjIQz4dcdQP+CrgFIEPVMITgP9pZfo+cIks+@vger.kernel.org
X-Gm-Message-State: AOJu0YylV5lok2P1V3b7faOk2An9jggJb4n+ctDBBWjhSixFfyKYkU/z
	j+L+Wps7RNeEGCSwfx+Pcps8luMJrZdnaPNCuTrBsd5JmBoHHnY9
X-Gm-Gg: ASbGncsGU6WGto/bsjICZQHSVDFO59/HUNJaw9vZnnFF4X+QGZghgF3Fid0LaFgy2+Q
	9vNki/cmBUq4Inv7k4RDlA79TMI3Fi5/6q2+f+kRD/eoXyazPCjC0xMuHajNdS5lnCde0AVmH6S
	HXw5UhYgKOsArF8GRtwQFEp16ms8x42brihfrnWEcBs+tA2uRyrVBLY9Ac/wE/JG0jdMb2RKbtW
	Ym162as2NEk+qibl1iRDhUPXbeO8yEAy/BFYhLEwlFYV0b/HgEkTEQ5AQXPio5+R797qcufow84
	skPZdMRTWTErjlehGMaUsfr7BuB4kjPqVbt6rAK/WSPBJ/n2b6w7GCmG3UUeSOhK5vM=
X-Google-Smtp-Source: AGHT+IGtSkctEza0dKSOIixIcOufz2eGxo1df2lpCX1G3Aw8hhbF82zgRAPbKop68dIC1Sp8EvAv9g==
X-Received: by 2002:a5d:6d0a:0:b0:38d:e363:494b with SMTP id ffacd0b85a97d-38f24cfa3f1mr14272116f8f.8.1739620491037;
        Sat, 15 Feb 2025 03:54:51 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439617de5b6sm70029875e9.1.2025.02.15.03.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 03:54:50 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] clk: samsung: clk-pll: add support for pll_4311
Date: Sat, 15 Feb 2025 13:54:32 +0200
Message-ID: <20250215115433.161091-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215115433.161091-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215115433.161091-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pll4311 (also known in the vendor kernel as frd_4311_rpll) is a PLL used
in the Exynos2200 SoC. It's an integer/fractional PLL with mid frequency
FVCO (650 to 3500Mhz).

The PLL is functionally similar enough to pll531x, so the same code can
handle both.

Locktime for pll4311 is 500 - the same as the pll531x lock factor. MDIV,
PDIV, SDIV and FDIV masks and bit shifts are also the same as pll531x.

When defining a PLL, the "con" parameter should be set to CON3
register, like this:

PLL(pll_4311, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
    PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0, NULL),

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/clk/samsung/clk-pll.c | 1 +
 drivers/clk/samsung/clk-pll.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 2e94bba6c..d2b5b525c 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -1460,6 +1460,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 			init.ops = &samsung_pll2650xx_clk_ops;
 		break;
 	case pll_531x:
+	case pll_4311:
 		init.ops = &samsung_pll531x_clk_ops;
 		break;
 	default:
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 6ddc54d17..e9a5f8e0e 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -48,6 +48,7 @@ enum samsung_pll_type {
 	pll_0717x,
 	pll_0718x,
 	pll_0732x,
+	pll_4311,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
-- 
2.43.0

