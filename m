Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425830;
	b=WPdBhrgMtZZCm/BcroWJQGo5ieiph1bgmDifT3zTckunzs22u+xMaR88jiO5XsCTyVSO
	 QcyOApfEDyFh4V9Uh+wxqLGPdBcK2xcrzMXqV74NZsVn6OuRi1hQuhRBHmL5feeDerh9q
	 yJp/LIPwXDcMjJfry/QH7w4FW5neX2vkpGBKPesWDy+uSy0UQoi//eXPz6JzEmhwcdcyF
	 GNRveCnxTPrMPjfysCpVFhdrZD7km1fs8kD1u1H4GxNzxYMEXxOXYpIQ8dC9h24qr3BIw
	 DwmqpT3YB0kDWOk0fovEASLy3t0MvxpZ7xrA4FnjsrqLbU877oc5SsewtcxymBR9t+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eklyttWk1u0PJELvwASOzqqyz2Z6Z/tZtmPAub2HSPM=;
	b=LrEXjAlsR3oIN2ygUTeBZPA99UP5ODcb5RACTPplUwsRbk8DeQQhNCbHTRdUQeQg6lzv
	 Rtgh7WxWbJ28XYx8baLMr3D8tvcBDCUkxPeUfP+Ux6YCL8pIUNRnIzjktXXRqNWYS/1RA
	 CA1ppD+CGZy60VhfyeoRoUzFNHRuz5QpsbBTX451CWD1ryDCWw/x1fESGBbDGbY/JHkQ4
	 w2MfnYSF849pJribUT56/fS9XDzxzZsk3CMfIvdmCnftYmrAygAHvpYMJHDgUEdE5zWpZ
	 hrRBRVVUMOHqCcBGcHDzkmg+8bTghhREZwsu9xKYVFrkochL3Uw6GfV/OTH8FOISZ0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BXpTUxX2;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BAC606A33D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 09:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5BAC606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BXpTUxX2
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so1606282f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 01:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425828; x=1796030628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eklyttWk1u0PJELvwASOzqqyz2Z6Z/tZtmPAub2HSPM=;
        b=BXpTUxX2De0BQxbcL/ZbS9dBhDjsFhMj+8T9ThbS0Mzo42yWqmILbmSxz/iv29e9Hg
         GgpzECqIc7dFPXNyXmJYYPrpwNXyMwFpwgPY5GwqPKiYaSOR2ZHDdsZwNYX5/1syY1R5
         KKbv1nLdvakMAsNWbwhLQYFk3ykSuHhmNjhHY+cjm54NsUzUXZcgjNma/AlF4AE0lb8v
         DCTe3qnSM/jAYevI9JtGLW+tsJMEt63w4M6yLKUGCBjzjLbFggHop1bcd30kMCu9berl
         axxdrSE3dsEByZBJdplS52mRYVxBRbNSnXTi8lxPtPjFZChdPm1EwoydwWq519y+HdeQ
         9l0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425828; x=1796030628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eklyttWk1u0PJELvwASOzqqyz2Z6Z/tZtmPAub2HSPM=;
        b=aTIlY2p/Q+03GfDhgNvkQOJ7kaBrnUmS66zcbcwB+tzvoMWrBOakSogkY/U+e5MaNU
         oOYy8683aAc2xq+m3wQXGp1bRYxbmHmQLnWBfIR/BSBF+vqbwq2UfMs/EOMNPM7WSNn4
         VMI4v3KZ47iIhhWFeCzR0Q6lWjKQLAg55buNQ0FmAU8f+ymoRwwGfWFNlYeJC0WXKeEv
         Fy+5Os9CKF3gJggWmB+S8HiRyENFVU4WmWo8TkcpuGTIkCtvsWg4iJeEkRQk4N4QyOwE
         nECoqpTV1Q805uSUIT8fX9loSC8s2WMD05tqd0Ba8kNIY6RQPkf6f9cWZ05lzkQTlVJx
         5U6Q==
X-Forwarded-Encrypted: i=1; AL+hErFOZLtVnD1YfxqmjQ/pl3m/WwaOHe145xOyfPkVPTyyBlF9YBa1r6uonfjRJWFNjKAQqPemGFKy/Fi5axt54f5+Eg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ID1SvfuZQ9J/M19njBXMBFaNa8iNzyJkJiQcZRYqpo4IXMpeZ
	3K+yB3kDMV/Xy6z1jF4X1Y0IDFhCRMuYwoSBnuQvadnkk3bJY7gdVzFD
X-Gm-Gg: AZFdTZdgsCT+T96EkJtczsdAp6yCBUuhW/+1Lgd4D2UvskvDTd5SJJ0whYEUG07k1YQ
	8LyWefhURgDlbMlpnnAmsG1GKVGrFfPo11lJHDlfxRSqPweCGupwJ3ohj6QQPZllzCr3blBkyX2
	89QdURsYd78WK3VE0IFAu2jnm6MjhiulV2sRKh2PqiiB7uhOrKMkYQoeIQ+PbV/IBoYwUovPNN3
	7ei7SpTEUDFqbynixGsj7LyCbJxl+VkNHQ567Gae5KDbsg1UBicerqY22O4OmxnaxRtPz4t+FOB
	zFzs2iLj9viNO4AOGGWqTldVQoIgrEd6wCu/xmsAcxV74F/w6rKg5IbdVZeB975KpWbz7XOh0oq
	aCKdEpWP4Tiw45GTp/hYJA8/S1Q2Yc0rG7pyl3Rkf8oblz1/hQxkgSiFcA/y8oKRsxYQjdN0w6b
	ZSJFWFN9Uv+gjWG8VSGIC3VgALQW81LCu48CRtkFaQj5NEF/IuN8tgT38mjlEEnnaOn8kolZLj0
	fgsL1kxYl2tiFysmUEjgGvkYKABbAD6eF/n7I6gOTu0hpT9YN5t4tjRtwDEnD2zcBA0nvvbO4Sh
	rwZbTEKIdezVVQzxoLIC0WxqV/R9NOgLxdb4spK5FyBVajIctHMyggTKCqZTa3SwmepihbAilgJ
	5/9dQoEKQFVnqeeBYptlRBiFMl99pcRHU8Q==
X-Received: by 2002:a5d:5f41:0:b0:4b4:510c:519e with SMTP id ffacd0b85a97d-4b4510c5231mr2688118f8f.27.1795425827893;
        Mon, 23 Nov 2026 01:23:47 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm21060655f8f.50.2026.11.23.01.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:23:47 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 2/5] dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885 support
Date: Mon, 23 Nov 2026 10:22:39 +0100
Message-ID: <20261123092244.1792040-3-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123092244.1792040-1-virag.david003@gmail.com>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
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

Exynos7885 SoC has a DWC3 compatible USB controller, so it can reuse the
existing Exynos glue layer. It is also compatible with the Exynos850
variant. Document Exynos7885 compatible.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
 - Use samsung,exynos850-dwusb3 fallback compatible

 Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 8af0143c3e47..f62e3ed82257 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -24,6 +24,9 @@ properties:
       - items:
           - const: samsung,exynos8890-dwusb3
           - const: samsung,exynos7-dwusb3
+      - items:
+          - const: samsung,exynos7885-dwusb3
+          - const: samsung,exynos850-dwusb3
       - items:
           - const: samsung,exynos990-dwusb3
           - const: samsung,exynos850-dwusb3
-- 
2.56.1

