Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840775;
	b=e2PptXGHbAOyBidB6d9eY8TIzW5bVkkubOvqaxK8YfuWDEZHaj8fUOT2QQMb68zFF2Cr
	 /mRZ6qkB5jCIqFHOK+SdCTRComRJ1TDh7zDntUydGkU7LSgaPnTGdUpe+UucmAVVEAgVE
	 LwPADimdiJqh+67m42emdd2//C53be/BcjovUU8cwK33JVFS22mcRI13N0AT4C8EsVA8B
	 cOAqDxt3PagcEeJ/Ikz/QV1Vzf1hvgqBp+O+N3CNqIFUEhahrjxaUGv3b5sZdONzSbNV6
	 Yi1gJfudyCINcfFiSs3Id3jTqGUVMLHtYz849HnP0BaP1a+X5+POiCVH4Z+TprBgb7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Op6Celd0vr0W4RZ4RM+PObegGMYvdt9q1CeYgOR1cR0=;
	b=tp9cduaNRx+4cq3wbitC0yhVKX18sq0pp1X7wTJAWf51Pg57UsIPajs7wU62dkdb+dSl
	 GAEYqJDPDj7e4/TaVoMRwYkxiJP2MlN6qUAL4T2v/5cWempiPRSCxI43J20DztCgcJLO3
	 9JmRjL9WufPsWF6JAVfCQAylQb9p8oRGYjC4a8bURwwrxWSfuqotfO+zwNs//crarbtqi
	 1YK+P4Tkzk31kuVl8GPYqQDd7cjOKyXgs84Jjw+mcWP2BEBDM+nA5KgSZ8jbw9dCkVyiN
	 JXk1bw5ZpG8Hdym45qrXJw3Bgjzj27FS7e64INLrbd5S7w/imvjUUloIxw4am3PDdsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JXHbl2eA;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FFF606A32A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Nov 2026 14:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0FFF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JXHbl2eA
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso4316873eec.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Nov 2026 06:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794840774; x=1795445574; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Op6Celd0vr0W4RZ4RM+PObegGMYvdt9q1CeYgOR1cR0=;
        b=JXHbl2eAJPxkWt+l++ykB67rQRdfT4dR7ea73HpyIH2a0aW0Aexq0JbEJX60h1i4xp
         tolBGgs4g6vV/aF6Nng/KX7bF2zJwaiHsW8v+E4SB4w8ceRJhI8aXufF8LTPNQLFQpBH
         DpRCOeSjvK/wgASIcAs2RB/zYo2drCL0FJ6KmgcaBi1hqwDbe76PqPGWKFa3QqWHgL1Z
         aRr0SfaQRhsmGvqRkLL7TkuNS7xpBTGYsJXOEtIFCNcaQEMDFORP76t+3Sbi99m/EuXp
         HgBOGBJDeA/JPbwIrQsV0B+fQilgpzxTHK6Gi7BubArD0TjRVK6thcG7J+LL1sDZBN//
         Rd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840774; x=1795445574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Op6Celd0vr0W4RZ4RM+PObegGMYvdt9q1CeYgOR1cR0=;
        b=jgR1sO869gmsdk3YA7F3WbAhZA/PZ4UcMsp1MxCnAjk1F677AtEJFKCUUnrPKlHkJs
         TYspH1i1bbZMRo3ktlowGLJXmO9/vb+fIJGwd1ARYQmIX8z3xpGIdws3f+/Gg4HnSI/i
         CCfEHt7IjFkNuPsC1+HDAR5lDOeV842XhjT9ftS/76tGbRYhGaW/euAX9CclHBoROe8C
         ngt0+jza0SlzLGnpwTgYjxWUEFxnO68IEGqqxW8pQH+gNN2unY/+gqSkDzJr/OUob1/S
         dshi362Jj+mNkH6UNuxW8ODgLG3e+ZsomAY1xq5oYiIBx8XjOtVSUjbzvQ5EzxRQLXKy
         I8ZA==
X-Forwarded-Encrypted: i=1; AL+hErFMCt6vTR7/ZIqnMARXBjf7Cm5Q4lns3tTU3fyRAprzdE118zkoyQB/WnF1sIcyLROXu//UUlkpj4Se+id5E5SlTQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+74jGHNwOn6gBunXfZ8iaeoQmLcHOazq6kF0VT/NmQg92ogv52
	CTAFiwAbK+UCn1TnyFO/Nb9n2Vp7W5cFkbcF4ySTAgbe3GtkM5BXPhN2
X-Gm-Gg: AZFdTZflxuIRy+ORwp8JxG6b1BuNMWo9GShHMFoWwMXbGQ3Ccg7LVV3YNq5tCwNkbC1
	yFGIxbGJ7Ef+mgOH4d0GXOyAeaJP0/3FMGv2a6xI3GVIuOjeH6XiWhW+1QtFXHymwWHCt+kWZ3N
	uO9intfocRsDpFiK+fZaqtw329rDEbvwCZYog7NDmT1flU+Kc2aka+2DRJx2gwt3GLNiBTtlS5/
	oxARzBf/GgdNe5/wtegYCM6bmA5kN2kRqTJDGQJLdOyI5L7pSCwdRyF/J1vuClrmwWNtFJhuzjg
	INIV1SeZCZaTVV1qCQnOtfiqyb7rmgogTWquvuQXBO6FfEFGYuKT28Nj3GzZCdIjOE98g+j0Uqh
	dHn0OhDPRLOsbKyg8RsOywOXxt2tPK05shbBbgWVwS83WqLECqqwnjIPYy5np/Sv7pkiuZsQYmi
	o4kVXgQzTpxS4uAYJW6PVM0llbUjtINBkihMZAvoFNrcyXHe/aax+EmZVRzYBnz9Fw/Ju9BzrTk
	HrnJo/pB4C9dAKoL3cnQAYu5nOAC7LA5M1gYtvD5WTDsjkX+qgA9K4c9YFMlXzimSDw+WE/BjWr
	PmWaQBJbCRZGD2trdC6gsn57
X-Received: by 2002:a05:7300:cca2:b0:36e:371:8255 with SMTP id 5a478bee46e88-379603825bemr9856188eec.0.1794840773662;
        Mon, 16 Nov 2026 06:52:53 -0800 (PST)
Received: from [0.0.0.1] ([1.54.0.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm69003540eec.20.2026.11.16.06.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:52:53 -0800 (PST)
From: nhansp <nhan.094.vn@gmail.com>
Date: Mon, 16 Nov 2026 21:50:33 +0700
Subject: [PATCH 1/2] dt-bindings: arm: samsung: Document greatlte board
 binding
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-upstream-greatlte-dts-v1-1-768d49fb7d85@gmail.com>
References: <20261116-upstream-greatlte-dts-v1-0-768d49fb7d85@gmail.com>
In-Reply-To: <20261116-upstream-greatlte-dts-v1-0-768d49fb7d85@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 nhansp <nhan.094.vn@gmail.com>
X-Mailer: b4 0.16.0

Add a compatible for the Samsung Galaxy Note8 (SM-N950N), codenamed
greatlte, which is based on the Exynos 8895 SoC.

Signed-off-by: nhansp <nhan.094.vn@gmail.com>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 6ac7f895351e..088995a32a03 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -247,6 +247,7 @@ properties:
         items:
           - enum:
               - samsung,dreamlte                # Samsung Galaxy S8 (SM-G950F)
+              - samsung,greatlte                # Samsung Galaxy Note8 (SM-N950N)
           - const: samsung,exynos8895
 
       - description: Exynos9810 based boards

-- 
2.43.0

