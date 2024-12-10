Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E9F86357;
	Tue, 10 Dec 2024 18:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733853745; cv=none; b=Z1KKgwd+fRF6bM5VyYAzaXRqYNUKSM2S5N2MLZ92dQMqfaRr+f1eYeIS9w0WjfgUAj5Jgco7VWN8n+560BD7UVR+0ekPRDJbegg7etDouGFOLJdNJRdpIb1WeSejHNEf6/B08bemZG0SWg2GUdoR4nZHosbWWXkqbUvYxUU8sgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733853745; c=relaxed/simple;
	bh=GbTFieq30Tp3qpHIb/Fq1WHJxQBwEO2fnhKu6VM3Pg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n3ysPBmHoa5yp24BI7i1PgAJN6PFemnLVEWulF60Ctc3chF+wyWmppOjKDHvSrO/PnjxA9XwIoejH0ImHDDWMQcGZhdtGHbxxJGE6h3PBy6uDe8A+C/2ozMv6XPSE8VGLYykWFjUUGeYPRQ/nWTRbvnrDZjn6DmhB4JJjNp+XYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSYSvkzC; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSYSvkzC"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5cf6f804233so7434761a12.2;
        Tue, 10 Dec 2024 10:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733853742; x=1734458542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZXwQI7YS6Q3F5RUIqA6y7OiUdvPTyw1jR4jWoj37sI=;
        b=eSYSvkzCNRmdA4pjMN67wD3WebEz8yoObpN7aQYDTHa4CJxTNW8ZhCES5pVWUoRhml
         o77IHZec45fdTXXXUzh1tMSVkI4qZPM1ojAMzCvMp8PA7HVa9sDTNqJmqcQbPiQbO4Ab
         2e+Ihqo035BX6QJuku73E4ncVVrx8fw6Y3i2GtGwER79THuRLZL4XrCHHE9N752S6DWU
         6G2DftpiC0dCTZLNtmiqcqmJU2wZVuC22C+AIKhsC9nuPJKYQCPDA91JJab1SB4nmRLv
         utuu/8LU8UaWEjGVFNJ7Fj/eby2m1Ebj/1CcpznGHWjUvBipgLzq+Fhu+ETsOmJNrRLm
         jmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733853742; x=1734458542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZXwQI7YS6Q3F5RUIqA6y7OiUdvPTyw1jR4jWoj37sI=;
        b=RplpE8a5mBb60/3CLzvJux8L0j9L9iySYLu2xXJ58WvMsVW07xQTvP9oaFT3//J6c0
         9SRLIe42N8xa11ZihTeJA9SAvrl+jHLEQJ5GMwhpjXTESdIyznkcwr77xywgAQ7Ye54t
         3EOw/1wsnE9Z10InGOemyeYbytFqJqowVsBqUJB0A75PD7UdxluLdEvn1No886J+WTkV
         OFq97wm6rx/Amtyp+Na3erj7XJI+IihvKtBSRH8+TXcbUDJV90rCa1IoOUdOceKcBNnw
         nY/eHiTDQpVW9ApffaldJztaedq2p6hQf3zG+TkCd3ll/QFZ7a4+tS1faXyWgjESXxr/
         pR7w==
X-Forwarded-Encrypted: i=1; AJvYcCUsp+D3ydj7FrHXaevel2VPVZC/lVEAEtoypeWswTPxWqf3o5E+zDlzLQ0vgow6VizpPGVuI9RMjp7T@vger.kernel.org, AJvYcCXeiy0u9eJfqGMllLhKzUBH6/gMhVj+BCrpXeEnO6goz4g6iGppbLJ9qtbF0f+nWXBUoZpOrqY3vNWdLTlq@vger.kernel.org
X-Gm-Message-State: AOJu0YwdOngMPBrJAiEUnbu9WYIXX5NlLnmDhNzOWhyW9nfLjcW4c0k3
	iOhfqaTDV+Sj3rl8IJoEFezZFl57iS8xaY/8E7ryn5jTzbk9qWZv
X-Gm-Gg: ASbGncs8qi/XVcKmI26Px+FWxHa2bw1c4dmrLg2xSJVpSZzt7fvgChWtgrvicBlVUlh
	xQnDdZ0xIhdpFQW0tgOkT5b1E9vsNxVSDBExp/YFUtPiCEw5WJ0748kLFb31w9YvZi6Dis4HHtA
	EN6w8Oqu0KlVioM7/ZauL/WpYaWkjttEBJcVcSQbBpcQ29SAdZNbKzljlxIZCDRGyNGoC44T5ck
	95ePDVwY87R32RdzxYxk1Blue6o7pHPjJ4deRT+bRrzQ20r9sSvSehOKP87HlkkBz8CF6OzDDF2
	4sn/yKUi/YhsqnNVM2pa/VwvuYqz4w==
X-Google-Smtp-Source: AGHT+IEC+sHuk12I+fxgj70sSzKLNbgdxZmltXdSj0c428j3LQYmmPpr+f5+VpccA3NjQUiUDdy7BQ==
X-Received: by 2002:a17:906:1bb1:b0:aa6:5d30:d971 with SMTP id a640c23a62f3a-aa69cd37734mr498078366b.11.1733853741535;
        Tue, 10 Dec 2024 10:02:21 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa69448304asm276347066b.45.2024.12.10.10.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 10:02:21 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] arm64: dts: exynos8895: Add a PMU node for the second cluster
Date: Tue, 10 Dec 2024 20:02:15 +0200
Message-ID: <20241210180216.398165-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210180216.398165-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241210180216.398165-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since we have a PMU compatible for Samsung's Mongoose cores now, drop
the comment that explains the lack of it and define the node.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index ee393f4f0..90b318b2f 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -38,7 +38,17 @@ arm-a53-pmu {
 				     <&cpu3>;
 	};
 
-	/* There's no PMU model for the Mongoose cores */
+	mongoose-m2-pmu {
+		compatible = "samsung,mongoose-pmu";
+		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu4>,
+				     <&cpu5>,
+				     <&cpu6>,
+				     <&cpu7>;
+	};
 
 	cpus {
 		#address-cells = <1>;
-- 
2.43.0

