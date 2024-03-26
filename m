Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EB01CFBE
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 17:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711474107; cv=none; b=Dox+4nBXgdIXwXPJV9dHw3CGhuiSs4KaqVCzpxs/KEk81Gs7LbAWojJGM+s1hp1CRlK5ehj4rIle6z5XHxfdu9he7GodEHN7ojOU+y2i95d2k1MPh33GQWG9aXFqrIv228TtGUahPJyMXVeQ+oLbqfzC8fBFstHEpALrUY72bJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711474107; c=relaxed/simple;
	bh=xoTsh3aeOv8XhHRVrPVuSVJ11UwxjQebM/JAdfQjjZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ESLTVrP23+QOwBX58aSYl+dpQLlH9xxoAJa4PRivyPu3bPLE8BTDVykE4QWiyjlU0CWxhZnblK0fjy+2gCUnMYYEidS4fGt3AdRIAa+sET822ku5QA6TpT7Cpkf9DFiN0rvqFr7Bgq9UrCOzy/wcuUwQSJcs0B0CZXgESdJ/gec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XV5/FFQs; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XV5/FFQs"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41491106419so2711135e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 10:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711474101; x=1712078901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7lIFUT2uGkcduxNxLmUjJPBnfs9b4J3U1Pfn7bN2fY=;
        b=XV5/FFQsXuJAvqtO+Ly2yEic+Nyz/6LdjBnNDUh87IJUwg8sT4YhMf3Xvr+u+M3z5+
         smnqfCqVI5Tj7c4F0bxGYh5/ZQeERpO78Lyycjc5m4HxvHsPfapNtY+x13k6CSB6WAAm
         NegjoBJEam0TLQWRSZAAAOHMk5TsfpkeIgUfliHo/Y4kvlr6NMgAzksF1kFEoCPEeOya
         nPO174T914v4YlnGe4elbS2N6JLUIC61f6AoTMRM9gFS1GSrrFoGr3Dqh7ZJt4CevjIQ
         cgWG3qHws08zRex1KLRerBzrrUkGGZib1htlwprd2XwJ4+d2I5mgDbzdolfOgpBBdbSZ
         dxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711474101; x=1712078901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7lIFUT2uGkcduxNxLmUjJPBnfs9b4J3U1Pfn7bN2fY=;
        b=DyTlh6OAOnPg1VxZVB0qQ5MXmY0jSlXL4//CgcbKzoExPgo4Q1cKEvhFt9wgstAcY7
         cyC7cb7mkH+GXNOWtm1/DbF/JkVvdjqtYWQegm9kIQ0+8RzKPuo6yi+zYnAd2q3P3E1U
         qgwGRTYrRr8REse+0cZDImtnuiLvp7lBM/o0mt6geZL7Q3dgpf7RvxtVyua/Ehn2eJE6
         qU5FIDvd6qHo4NuxOdXR+Rg9JP17e9c4zVeo0mYhKAwUe2G1dG1ebviLmmrX0cTx4uBk
         PxHhbp1UzqOUrhs6l+IzoY+1KJmuNPdp29CM+KZAZNUfET+CD5VAmqj0s1lQyfgMLMQc
         y44w==
X-Forwarded-Encrypted: i=1; AJvYcCVRmPFEKKScXhU0xAWbVMTwUHDpmng3de9Lz77oYAxc3+j9vuGc8UdR1Ngr4ariLLI+nyPFRM50tnAB2RrUknj7FH7f0cV3auYq9+gS2muLmmk=
X-Gm-Message-State: AOJu0YzblhMd+GydG6Ixd2PWgZT1fuM1wKfNvhr0Dc3IkLQTRuXmx1Qq
	fGvNWpDs/sdXOu89sNxh2udjxZl+EU7nlCqs/H/FbW9szFXIMNIzpgmes+XtFdTPJ6Efl60mGQ3
	IPX8=
X-Google-Smtp-Source: AGHT+IFXanQRS29xAVVCXFYCQE7Xeg9LKVBsEdMS/yyZP4E3p09uw5Uk19K2dwta7QRhedGmdYWogg==
X-Received: by 2002:a05:600c:1c04:b0:413:2c4b:35d1 with SMTP id j4-20020a05600c1c0400b004132c4b35d1mr8100793wms.31.1711474100371;
        Tue, 26 Mar 2024 10:28:20 -0700 (PDT)
Received: from ta2.c.googlers.com.com (158.100.79.34.bc.googleusercontent.com. [34.79.100.158])
        by smtp.gmail.com with ESMTPSA id fl12-20020a05600c0b8c00b004148f9c5822sm2063281wmb.22.2024.03.26.10.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 10:28:20 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	krzysztof.kozlowski@linaro.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	willmcvicker@google.com,
	kernel-team@android.com,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	semen.protsenko@linaro.org,
	linux-clk@vger.kernel.org,
	jaewon02.kim@samsung.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 1/3] clk: samsung: introduce nMUX for MUX clks that can reparented
Date: Tue, 26 Mar 2024 17:28:11 +0000
Message-ID: <20240326172813.801470-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
In-Reply-To: <20240326172813.801470-1-tudor.ambarus@linaro.org>
References: <20240326172813.801470-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All samsung MUX clocks that are defined with MUX() set the
CLK_SET_RATE_NO_REPARENT flag in __MUX(), which prevents MUXes to be
reparented during clk_set_rate().

Introduce nMUX() for MUX clocks that can be reparented. One user of
nMUX() will be GS101. GS101 defines MUX clocks that are dedicated for
each instance of an IP (see MUX USI). The reparenting of these MUX clocks
will not affect other instances of the same IP or different IPs
altogether.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/clk/samsung/clk.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index a70bd7cce39f..01f58b7686db 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -146,6 +146,26 @@ struct samsung_mux_clock {
 #define MUX_F(_id, cname, pnames, o, s, w, f, mf)		\
 	__MUX(_id, cname, pnames, o, s, w, f, mf)
 
+/* Used by MUX clocks where reparenting is allowed. */
+#define __nMUX(_id, cname, pnames, o, s, w, f, mf)		\
+	{							\
+		.id		= _id,				\
+		.name		= cname,			\
+		.parent_names	= pnames,			\
+		.num_parents	= ARRAY_SIZE(pnames),		\
+		.flags		= f,				\
+		.offset		= o,				\
+		.shift		= s,				\
+		.width		= w,				\
+		.mux_flags	= mf,				\
+	}
+
+#define nMUX(_id, cname, pnames, o, s, w)			\
+	__nMUX(_id, cname, pnames, o, s, w, 0, 0)
+
+#define nMUX_F(_id, cname, pnames, o, s, w, f, mf)		\
+	__nMUX(_id, cname, pnames, o, s, w, f, mf)
+
 /**
  * struct samsung_div_clock - information about div clock
  * @id: platform specific id of the clock
-- 
2.44.0.396.g6e790dbe36-goog

