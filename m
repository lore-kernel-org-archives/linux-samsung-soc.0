Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB6E219CB4;
	Tue, 12 Nov 2024 19:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731439943; cv=none; b=cEgTEt7xcOIJNylCZph4PtuQk6OI6H4dfLWQglV1zYsBhqCTbIfimT7SivQBu9qaUjMxL2P8B+51FmzRVwqAaDLKcLh/E42KSDtrm/rUm34YWn2ILWEM7wwgEIg1e8u+IR1ovAubeuccvdNdupIyg2PZA/YuSAz9q/rZIYFr2oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731439943; c=relaxed/simple;
	bh=qiEs9UfwYLCUVE87QmWnGVgFSfuKAZ1ZwFNa5B5iCJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N8ow815iRwGJ1g6TXklQMN1hNZO2lPEQBQcEgUeKiizgJo1n3wKjUeMPNZ3qsSWDcTOPQD+51RIy5aty97DlQHrTkMyoe8V6mlBk8kZjTQXypO+lz+BQXkZt1CK3JWwekQ2KcT5qccSm0OHbh42WYyW2KJ2rLFVCy98O3tGONMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhPScdjv; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhPScdjv"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7cd8803fe0aso4016901a12.0;
        Tue, 12 Nov 2024 11:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731439942; x=1732044742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19kL+yPDKYdJPy/Ps5/CpYlnCiQbXdTiYWnn6mrqU7Q=;
        b=MhPScdjv0mrBnPGajs//kuvIZ7uYSXvNy73VjwBu+Vddp58aJgawRnz9e3Aeunbaj7
         G5VSb2rr3RPYbsFcHsYzgOAwnWe8OfJClHnQ2QlAp1JZvLMwIdyNleKINbW4/gZ8LCJo
         e42hrN82XGqefJ/P9acUj2cf6sAlSRFoc6XSEBNRWqexERNfUhlWjIqSqtJCwfaBBXQG
         MXWb0MBOYrwTd5mzbsqDc7jRAjwEg02oG8Tzad0s6i4rg0skQ/GIcYzbLteCDWdKA9Uv
         xgjJnZU2uPcl8D3xQaax+h5w1Ts8xa/rW/H8aPNH0qLjsuh8NwUqw4btk3Hw4vtboMc7
         d7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731439942; x=1732044742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19kL+yPDKYdJPy/Ps5/CpYlnCiQbXdTiYWnn6mrqU7Q=;
        b=kqFI2ayG0K3ZvGD4oM83DJkdBiV/IIQ0ee7AID11lpSW1CojwMLllsH2BbfSDIwPwl
         RO2Qjsm3VjdOznAhaZMaNJr5Kuaus+ampuXMu9hGOSbhBoTeHrMUeieUpFAvo0T3AliZ
         uNt196g0951Zv5yHqYTHaftuuxrr9mFTJxnnMRxyI5AeAAlzfiTXu8oKAP+N7tDHX0yt
         ll6birSZO1Wf39TFGgupfG9SLPwrvLHO2Wev7wCzJQM9mwKoSIZaeEUCbydflDYMN3pU
         35mauleNmnQ2FhXVLNlljnbdT16l0jY5CetallQyD6wjqwsH9p5/9imDwduiLfuhipzN
         sFpA==
X-Forwarded-Encrypted: i=1; AJvYcCUdV6cRHVUX4MgtSmE5K8lzLm4pKhdRD+vjbQUti4ytqqVUOUXARTCIyO2U+hlGOCB6M6+pVWb5qbMT55Dq@vger.kernel.org, AJvYcCWgfJjcpKztHei1wyuMZzCDkg9YqvpDwceqWD8OEGoDs3/tv8isVQnzNygfKu+mRanAARnAy0wW5XJ4@vger.kernel.org, AJvYcCX7fU1sML8nNSal4EbN0/Oum0Idcf/D1SDdUF5NR/geUJXTvYCKBHs/2BaWxgNJ1kXQFK1zpeeyS8DlBtFLouIWVMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPXWXdHOOVmmB6DUPtwc66X1wdCrw49iP6oKWtP1mfclnpF1fN
	sAoMyuWfAxRXkOBMh68/b7PBQnRXfRNtuNuFHd9oB7PjwsS8nuKr
X-Google-Smtp-Source: AGHT+IFf79q5WRlc870dE1XfS8Cl2qWdeeJWxdyPIWkzC5LukXp5+Hkgc11rMLrKxmPlUnOKzi4/dw==
X-Received: by 2002:a17:90b:2651:b0:2da:8c28:6561 with SMTP id 98e67ed59e1d1-2e9e4bed741mr5162412a91.22.1731439941658;
        Tue, 12 Nov 2024 11:32:21 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fd17d8sm10988958a91.41.2024.11.12.11.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 11:32:21 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: samsung: Add compatible for Samsung Galaxy S20 FE (SM-G780F)
Date: Tue, 12 Nov 2024 19:31:48 +0000
Message-Id: <20241112193149.1262-2-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112193149.1262-1-wachiturroxd150@gmail.com>
References: <20241112193149.1262-1-wachiturroxd150@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for the Samsung Galaxy S20 FE (SM-G780F) board, which is
based on the Samsung Exynos990 SoC.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index b5ba5ffc3..168e77375 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -240,6 +240,7 @@ properties:
         items:
           - enum:
               - samsung,c1s                     # Samsung Galaxy Note20 5G (SM-N981B)
+              - samsung,r8s                     # Samsung Galaxy S20 FE (SM-G780F)
           - const: samsung,exynos990
 
       - description: Exynos Auto v9 based boards
-- 
2.34.1

