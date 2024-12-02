Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044AA17E8E2;
	Mon,  2 Dec 2024 16:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733156553; cv=none; b=E2X9TvUwBR3J8oEhEWZ5KoM3l7CDw8EB21YWtMMxjshX+G5Yu5pRvx9Z7vzHOTuY5wATOkjCf42d4tB4HUqirTPSqCp1qLrHH7LJ7775O9Sl8OqU6ymS8Rqk5r0XYMtCdKDz5ZL6ewfSQCvHeIY8JhqopW984/itICCXsm8Rxn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733156553; c=relaxed/simple;
	bh=bleGnqFW/nojxtVk6PiL3yVMjQJYewvoq2RILsSbpZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DGSD6znWK8lohMeeZl3Hdy57jvHJdjftSQTcZVpvq0fwlfwxQsNSz2WayevFRZdemdcieP+3jB94otX2kLXPsz0OD5pLIeysRhjIg+GwmSE3AI5lmn/dccZmoFAb/A7mwHaD7uFZ/nQ48kSDvJIz3vAdBCgXX2Lj8yI1UygToQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=IbC+QJwJ; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="IbC+QJwJ"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y28FZ6nGnz4wHX;
	Mon, 02 Dec 2024 16:22:26 +0000 (UTC)
Received: from umer-b550pro4.lan (host-213-78-252-153.as13285.net [213.78.252.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y28FQ4Vwwz6tkM;
	Mon,  2 Dec 2024 16:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733156541;
	bh=bleGnqFW/nojxtVk6PiL3yVMjQJYewvoq2RILsSbpZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IbC+QJwJsZEgxKRvcBKZ/dtuZIGsADG1JKUb82opxWYmvWFhaPH7ujnNmS33ZTUoe
	 Zz0y5/6dBL0GhQS/QDFdXNXFj0JJZjfkAiabZC/J5mGpKiF+U40aijxrP3ai72oiYb
	 zUdyLmI7GIzn8KuoBzXa74ZpWFd9Wy+QVLk65mkA5uVxjKsLfkUiHZAV0S5uaUEpxA
	 Q5ol5bdcvlUbLxnlCxlHAfqBcvl7Leq/ekd39iEM2bOFFxYOBW+NOzE34shfhTUMSE
	 Ow2/pSjX0rQxm93lGNFaFYJQ+2gmvy17GXpekp0PtahrAQpLlw6rib/723Q/6UesSk
	 NAp8JC2MR3QMg==
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v3 1/4] dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B and SM-G980F board
Date: Mon,  2 Dec 2024 16:21:55 +0000
Message-ID: <20241202162158.5208-2-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202162158.5208-1-umer.uddin@mentallysanemainliners.org>
References: <20241202162158.5208-1-umer.uddin@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree bindings for Samsung Galaxy S20 5G
and Samsung Galaxy S20 board.

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index b5ba5ffc3..f15228d5c 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -240,6 +240,8 @@ properties:
         items:
           - enum:
               - samsung,c1s                     # Samsung Galaxy Note20 5G (SM-N981B)
+              - samsung,x1s                     # Samsung Galaxy S20 5G (SM-G981B)
+              - samsung,x1slte                  # Samsung Galaxy S20 (SM-G980F)
           - const: samsung,exynos990
 
       - description: Exynos Auto v9 based boards
-- 
2.47.1

