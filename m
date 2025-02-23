Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913E6207A18;
	Sun, 23 Feb 2025 12:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740313855; cv=none; b=La1BHt7AH9MVyz0C4hZnANVv/hlUNBt8KZ25Pa2zCiizvew6AAqfS5OR2g5vzwg0OItLEfLdlKzVhohJZYPTG6EFjLuxle5x3dWr6qx3sixx5tQkKKBWBtSnh9mLcHl7TO4hNIeCqgciLgNYkoNQ27KX4R1EBfPXHOcWoSqUBc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740313855; c=relaxed/simple;
	bh=ItpKhObgOdeJnkFiwSno1WfU/vR8b6bYIBhKXZsHcw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qfctTp3z8qn5UpBSvGBwJJNPgRRO0QaT31evV21hj9F2DON/p5syK9I2ioRysahT5z79Lb80f3NJrBn8Mn1IWegZp1J43qz/X11IPJRA4fS7Md0Nqe1z+lYXGWvubK22Aef+UPtB+e1hKOr9p9idv01Wktnlwxz+8ncoQ+HPzTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LF3lHoPO; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LF3lHoPO"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38f325dd9e6so1824823f8f.1;
        Sun, 23 Feb 2025 04:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740313852; x=1740918652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANwi8Daw8t76xwibNngEAjRselsFlEuOLFRfQhaCOVA=;
        b=LF3lHoPOIBeW3S4n6CZKi7cjEGyhOnEwbCHWiGGCeRIqvgs+S5rdz23KnrKYpts5Uh
         OCfwJklx67RacHZAkxTVisY0vvjphx5u+O8xyZMpr8w0kckepEWrDcXT9gxX4Mskxehi
         7i06BhPRdQZqf91ghJ/AIvYoKjrjqBybxM2NKpsVD6LUN90BOcJtQc/cAVs/Wo5NDnMa
         yzvRhmIljp/J7OtN3H/vQBwbBhMHfJDV/1Hzg9M7noUFfyLLsiosfpGBktsJFmRWxooi
         0zn0TuAcb+NMfJYwculPYGZD48zanh/2npL7ljM7Gn308w8T9CQAbY9CSXpwT7hDSyn7
         tv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740313852; x=1740918652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANwi8Daw8t76xwibNngEAjRselsFlEuOLFRfQhaCOVA=;
        b=Zcn7MSv6QSubdeRd+nQR7KnNjv5bBH8A8On2SUnll7S+7BrJF59C1dpGzhh+KcGBVO
         v1rkSGPIvvVxAdTKWKDhZTYozIGdgIu7/uqdHN8e1Uw0dp8YezmzD0jG0pWPuSfosXkJ
         upYd5uKspM5cfZXYXmSXr0zvUa515ImjgRjScg4JvndSDZ/pja88wy95o1srwnvNW0uD
         RHGk2CcR2aMiUCa0LT5BoFHLo09eYtvzR5rNm1pQtR0h1smGxkzykZEwqrogqQz/HM1z
         +AcKxAGEaK3PTMuOB3OViKMbrMo0ONFDs/fNWKUJAv4Unz90oqMbe0llLx3I5I1js3Nh
         MH0g==
X-Forwarded-Encrypted: i=1; AJvYcCUpz6a8VltYuw7dcrXpN3pAIPVFs7XD2zm2kCZbwgqz+T61n8jMbEc0+FrxCMqS8fstflBO6X998BiK@vger.kernel.org, AJvYcCVWzPV7+s93d7IM6FDSEnDdpTxxFSeGpQLuRex5sJBqkw67CqHE5L6jXAX0c+gRQ+OyFsWJlGsrdI8QjWA+@vger.kernel.org
X-Gm-Message-State: AOJu0YwXdHA0id1yBy1jcCY6nwdkg1uddNKHbqFFCf8Xtg8ZS5oUVXk6
	06AJH43VyW83G2/yKJXd3brx+Xf8k3TIGBpBbmFR2PLGQriY1WqG
X-Gm-Gg: ASbGncv+5enzzX0QNhObzTSpicBAA62OY8mAJXJkR72aZPLFUbvUvM+Z86QMtaz82yU
	YPyo/0GJQZu26pmxXwErcQhvEjdATyvcYOvGsmHOnX2BdltbQrQiqBBnqARP5reB/WMuGxn2thb
	JrVkke+ABR9DLISxgi5yLyP8o96RCy2Hu+/Ch9JDMLfr/UWMNrmC8a1CX9z0pGIYq22nIkYPWgw
	nEGBknmzWultwbGOvY7vnZBRrTilxfvZcORQpX1VE1QZFWvx8+wYbSaDySZFKGxcZUyT7mm9bf3
	Z3tI6zPHxNHPhRX4DRdzwA++Ylol6DUyc0QNE3kTWYflhchbCJoHfoUJhNWwbESa+skcVy8Y0Ki
	vIQ==
X-Google-Smtp-Source: AGHT+IGYhvYztyYsvJwTwSXXLYbt3cnGgl7CixfgnQsza534vfgcgsMdLx4kBCCU9Ct/VLgMbHQzUw==
X-Received: by 2002:a5d:522b:0:b0:38f:2403:8e98 with SMTP id ffacd0b85a97d-38f6e95b4cfmr5832643f8f.20.1740313851743;
        Sun, 23 Feb 2025 04:30:51 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b030b2c8sm77061935e9.25.2025.02.23.04.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:30:51 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] MAINTAINERS: add entry for Samsung Exynos2200 SoC
Date: Sun, 23 Feb 2025 14:30:44 +0200
Message-ID: <20250223123044.725493-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250223123044.725493-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250223123044.725493-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add maintainers entry for the Samsung Exynos2200 SoC based platforms.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e4f5d8f68..7da20faf7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20937,6 +20937,18 @@ B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/sound/samsung*
 F:	sound/soc/samsung/
 
+SAMSUNG EXYNOS2200 SoC SUPPORT
+M:	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/samsung,exynos2200-cmu.yaml
+F:	Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
+F:	arch/arm64/boot/dts/exynos/exynos2200*
+F:	drivers/clk/samsung/clk-exynos2200.c
+F:	drivers/phy/samsung/phy-exynos2200-usbcon.c
+F:	include/dt-bindings/clock/samsung,exynos2200-cmu.h
+
 SAMSUNG EXYNOS850 SoC SUPPORT
 M:	Sam Protsenko <semen.protsenko@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.43.0

