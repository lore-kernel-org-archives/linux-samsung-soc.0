Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C821C195980;
	Sun, 20 Oct 2024 17:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729446656; cv=none; b=KhT/v2fKG9TR0ypd/8ol/pMb7p2D8pX8CHMGRBnYNLuaK0T9Xffk9SqWtDZq4kuFJFrNzCMy+FR8ugUcd84Gr9u86knWT5p9jWR+/3YZmvIwjuPsL0F8R+20yCdqTka9rUrXtRH/c7N1RRyZg6YhKbrMWZyiFub4LQNgUNqRve4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729446656; c=relaxed/simple;
	bh=bUnM6SCBloIi98qw1qx271SQ4Neg3aYy44THKfB5wbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nx1+feer6sfjfFifJ3/1WIblF9QypmkdcWv3FwUePaX44hywhBznx8ZlMdev89jzXn1ZPyUj00Atp3/ZUKaHvefEtW1ybZeUuCm6yFlaHUdV94j5Lep6VmzJzhP5qYeMBwpdKn9MawbZqIumRIwZClpvEO3W2oPHh5CnNZ8skh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJRx1j3Q; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJRx1j3Q"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43158625112so35766975e9.3;
        Sun, 20 Oct 2024 10:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729446653; x=1730051453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7M6ABe/6WouilEc7iXWO5GcsNmJOcdEHOWh1MsYJ4c=;
        b=TJRx1j3QQjCHU5haJLmSnTqeaOh9EXfJAIW9Un07gthfmn3imlGaNikKiUwcNDLyan
         KKqNvq/fj5gAfqMFDLSMfYeK29ZPcj0uG1v0J7GlKWMPVAAQRE193hqszgL4PcaHDdzA
         epg9BhfJZpcLtK+1ghLCe806ZGilZMcl4MwQmcN85EN5EQn8BdpZxB97A0vdeyAP1aA9
         quOQyO/+db3pmdAfq+jZXFVADqBRRKtVSK3ymeJHxcbUIThjjvVUrSR6S+S/syfG6+wJ
         Rob6hYKQ5Uc6iDtyavqRUdery0nk38qWRG7NWYzp2IBpk4/qQQgOTvofE7jqtEHopodk
         BGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729446653; x=1730051453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7M6ABe/6WouilEc7iXWO5GcsNmJOcdEHOWh1MsYJ4c=;
        b=B+8KxqnGvFoyLEkmrkgSrlHXoYiTAh3863SR9Uyn08fh1gMq547utp3hlklVgnOJs9
         b86phfAlmsukof4XpbNG1gCwSUNfdu/FP1d+dbljZlgUPtUDW8+E6QaLQhsE3HEmviJ6
         qKrfodhnxeeOx88of10z8f5IKQ+CVSYq7L0eOmIw69ZN0ixzikV6W7fQSCVwBpdDyYSH
         wVIqahKvMYiKVohOv6U+nyrF3t9jsNsdJ5dyMYmA3zuKD91ppwv9Uuuor8x5cuzLU9jH
         KCSzWe2uAcIW5XxDZG6ubfdggcu9Y99H3/mLm2Xw7VZUCY2JFU2dVghYBzC4a0JeDK4s
         Pv4w==
X-Forwarded-Encrypted: i=1; AJvYcCVZGJHCypKpPXnriUqU+ftX5xkiHuN2JmCIKKpbFzR+GDitGvOvNz+00XA5xURiV8LTyzrlOFBLIsoS@vger.kernel.org, AJvYcCVl/7L8rmxLQ86czGq/h9dzljKEMYG+3aRYAWvSwANXhlAhXSVdBlALTDF6xp2yVV8sNulz+WfNN+w5@vger.kernel.org, AJvYcCWFNs9DnOHQshZolvXvfMBYFrNOQxx+WjDh19DfNsplQHzG8RUS4qWZuRdVD/lTag5czbybk8tZQ0e+NH6d@vger.kernel.org
X-Gm-Message-State: AOJu0YxOa/RxIVkZtnPFkcz2GdDY/Df3QJJENYZK6O72vYMjzA7NOSlD
	bJBeJqz4L8+vWpHmlU7fvW3UFTY2elMppXG83y1LCG/affRckU8R
X-Google-Smtp-Source: AGHT+IFfOMZJpQ/zOpQBQA+1zXQEopzsYEMIdXGeOmm98O7VoVNL7THbuFQjybOpMDhz5YIa4VpbXw==
X-Received: by 2002:a05:600c:1c1e:b0:431:5f3b:6ae4 with SMTP id 5b1f17b1804b1-4316165c74bmr69591575e9.17.1729446652767;
        Sun, 20 Oct 2024 10:50:52 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f57f89fsm29794305e9.16.2024.10.20.10.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 10:50:51 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] clk: samsung: clk-pll: Add support for pll_{1051x,1052x}
Date: Sun, 20 Oct 2024 20:48:24 +0300
Message-ID: <20241020174825.375096-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241020174825.375096-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241020174825.375096-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These plls are found in the Exynos8895 SoC:
 - pll1051x: Integer PLL with middle frequency
 - pll1052x: Integer PLL with low frequency

The PLLs are similar enough to pll_0822x, so the same code can handle
all.

Locktime for 1051x, 1052x is 150 - the same as the pll_0822x
lock factor. MDIV, SDIV, PDIV masks and bit shifts are also the same
as 0822x.

When defining a PLL, the "con" parameter should be set to CON0
register, like this:

PLL(pll_1051x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
    PLL_LOCKTIME_PLL_SHARED0, PLL_CON0_PLL_SHARED0,
    pll_shared0_rate_table),

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/clk/samsung/clk-pll.c | 2 ++
 drivers/clk/samsung/clk-pll.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index cca3e6309..be6b51694 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -1370,6 +1370,8 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 		break;
 	case pll_1417x:
 	case pll_1418x:
+	case pll_1051x:
+	case pll_1052x:
 	case pll_0818x:
 	case pll_0822x:
 	case pll_0516x:
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 3481941ba..858ab367e 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -43,6 +43,8 @@ enum samsung_pll_type {
 	pll_0517x,
 	pll_0518x,
 	pll_531x,
+	pll_1051x,
+	pll_1052x,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
-- 
2.43.0

