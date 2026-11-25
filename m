Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618566;
	b=390+EpLXwzaOJ1kX+QmffEnSUc/RFWjPbgqfaWeE6JI/boI6zC2BWauvE5+72WJGy4y7
	 3K/VubMRhCHJHh5G3HXVIF48EeQ+qzqSr0aBj1Ne9fL/+cNxl8/ti8O1jqcsZIqezipSk
	 8MZ3HSoIv9MRbT3QzqZaSo1Ny6U/gClk/K8aIITwFYBXu3hW/JMHgN+uBA7D019DpTUSO
	 bVobrB1/FY124A83GCgr4VttmkuY+o0lbl9IqIOYcXsM8mehmi51bhJ8mMt7DVzDKWB9P
	 qFbcIFasx19B5ruvYT6ElxM89Ud4MkRETVgXD8h7OzzFLbVNSPoTYIc5VMwmWjKgYTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rl+da9c1jVCl3abcm6KB+EmJX5u9xp02QveVywSw2go=;
	b=W7pZPns7yEErCeXRvbb/eYjZArWifAq7lfev19uUZw2cUuOaERSkvKF1cmBwvqzUe5o7
	 nAnGFwTZVgjF7rgzVpyWrnDH1Dszj9MPbJugiAZDyqECD7jJzd7PRUBLWHV9ROZxkQzU+
	 DFL2UB3qOWX39pQwPeCwz8yGGZAGOdXFA+Tlt6T9dCLaWmEPxjK0RzeGvByv6o1+YpmYu
	 QhSne0b9ZW96RaxrFr3lCIZaRvGRtXp4RyufKv4ISZ8ibwm8qFnOLELOmj/qqxkvHfOEC
	 Kr9AL2jBc7Vmg7JzTlJ8MBXFwnYBJvaqlxr0MfMG98N5NDifdU8YucIaIiKqGGemoWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rP3+wvtv;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6622E606A687
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 14:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6622E606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rP3+wvtv
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso5185841f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 06:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795618565; x=1796223365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rl+da9c1jVCl3abcm6KB+EmJX5u9xp02QveVywSw2go=;
        b=rP3+wvtvUd5BSIItbmrOs+fMb/0tNd75RRq96JkoqhT2eRlsZpvHYs58csYL9y6jC6
         23pnbPaWHTI7RwfuLJWrG+fVkrzK1tNpTfHSaYctf3Iqve72h8d4lReRmROahuOsvu/T
         suSTKS09GzA1gOQ1e4myNrKP+7403yLnbs/XIJmiFg5fGdEjknPDIozsIJEW30Rb2LZF
         B/LOHyMnSajEVKjqKUfTUHyaIWT5ZAKRHNAMaPDCzBshEJVslfraeBKopAJEhsswOIpH
         EuxLM3ZDnQHzClCqb6tZJBtxYNu6l433fvIlgFI9OWyHQo46c09tLu3U1mNY4OBKBG0C
         2jvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618565; x=1796223365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rl+da9c1jVCl3abcm6KB+EmJX5u9xp02QveVywSw2go=;
        b=fjEyALJSaVIlBnD24X9YqcypCKVY777AUKUFh9f7yYfJNuSS+KsBAgyl1eBhsd9JRq
         uvNa7w1mHACBnc0i5RidOjFZ73/2ypHbDLPU1pfz+GyeFwR52BWSZFdQQ/+Kx4MY2YPY
         xwl+qsTgNs6Pw4BWnqjmA8XaP2ES/rpnnFODhZKeRkxNjo+tlESNwdCae4ulHgMu6jIt
         +yYujPA7s8jsWGI3o25xIgwsUI9LefF1NRhe/5TUsTIcuMLlQ4vnj5i+SUECHtty8kg9
         wecTPOsiUcYk15RGUpjlTx8mGrUVuzHTUl19J0QBOmKyJLzpcOtQ6+H6E83dDZHianCR
         5Q7w==
X-Forwarded-Encrypted: i=1; AL+hErHKAwu4F0R6I5l5lCXsgNV3LfbA98LtGKcklVpsCrsYMf1/XRGNjuwLxdxQCOzuGBQkz0aUTYWd6eLR8aexxkJlzw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+gHWfdl4LlWSA6BLVXKgwW0tnIdibPQcdYHgte132YagvgfmCe
	h/BwlLvVWLce0c+PguCthGsSCD43FmdTyLND57ENE133gedNJbj/AT29
X-Gm-Gg: AZFdTZdyACf0W5WLW+8/w0VzcQclry9UnnAJtJzhRkrtQuCAczK9HqijKa1wBOTGs6P
	qM/iB7IPGpRiAD76YDIVbC6YMXszL2my0wSW8HyqARYkUCXG7C0pS1IfdwDc8RPYGiz2DGy4UQ2
	pVdFC737XMxmBzuVlnXKw6W51A9BBHC1abYD4/asMWQgmZei+kEA9V0XJQQGsfoPtoUR9r508tq
	8eWoqHNahX5dQefCqvhigfNq5t1sXI2t1ehLh7VqJKVwT+Gj8/0kRS7+VLMqVO0X/4Ct0bVTJ5y
	uRS4yK+6SKWbFtTLMtQbD1ptxUIGMrMJBc0aTaRBL+UF4X8i7TGCl+hIS5LjDM0/9ROWnwUcXGm
	ZoDNKgRXAL7umFRejk0FWVTf9PV+36FMAbvhGRaNtKuzVDo7GbB2U5PgrCImPyWwewU5WXYMQnP
	sT3DzDNm/HklUg+3TphHtWZPznvXp9yY+ETFI6IqtswT26BMwTN/QJGyOzehwsQ16sBg+wKvctY
	eU8HYZQkAw/yUBEJte+OeOgjT9aDcyvC3/cmIXm3sXQFzoc+sWGAJUf6P0Jh5VJKBkl7DUyQ/Ax
	T0cqJnxGFiTL0cY9fnTJpCVYhsJhY5Y6j/udNg9pbM/SnLSH5bsrTTDfMNMQuC5to9y058XX2nd
	5mZjX89Z4R86PDJTIfpuGBhR0oesw1lc2Xw==
X-Received: by 2002:a5d:5888:0:b0:4a9:4dfa:c151 with SMTP id ffacd0b85a97d-4abb683b6c2mr32518885f8f.26.1795618564618;
        Wed, 25 Nov 2026 06:56:04 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm36036139f8f.31.2026.11.25.06.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:56:04 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/5] dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885 support
Date: Wed, 25 Nov 2026 15:54:53 +0100
Message-ID: <20261125145458.2594179-3-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125145458.2594179-1-virag.david003@gmail.com>
References: <20261125145458.2594179-1-virag.david003@gmail.com>
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

Changes in v3:
 - Use an enum with the exynos990 entry to keep the exynos850-compatible
   entries together and keep code clean.

 .../devicetree/bindings/usb/samsung,exynos-dwc3.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 8af0143c3e47..25536859e5dd 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -25,7 +25,9 @@ properties:
           - const: samsung,exynos8890-dwusb3
           - const: samsung,exynos7-dwusb3
       - items:
-          - const: samsung,exynos990-dwusb3
+          - enum:
+              - samsung,exynos7885-dwusb3
+              - samsung,exynos990-dwusb3
           - const: samsung,exynos850-dwusb3
 
   '#address-cells':
-- 
2.56.1

