Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793392453;
	b=LPwa85vBmQtFGPy50Xu0Ey3lpKY/7qUj7GipCEb0RTZNz1thEVH7+B6tDoXlsaiuw2zD
	 yAdJHRYd1L1W1N7119cfGxX8kvqYvpyRtnIGSNaJg8KjLzbnioG2f5A5NG8tMJZaUcZoT
	 Jwvavte+KZ+CDxIrH3nTbEluUyMc8FnMB6+2bfBNkmhYhz7tM9QIYjkJv+EOBDmYMoghf
	 ElJe0VJkpP4JYf29yCK3Rkhv/szYlLBpVzISwu+m4Xpe517w/BV5uufYBkT+k/0KVdpMc
	 5Y8R+MVoefye+mChLgGu9E6/jZi3J+ubi/Any12JBfX4bykjelvVIsZ7g9EVlKSLHKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793392453;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=soIhMh1dJ9HVRlujdDktbU1BG+4MBhLl+PUVrnyOGB0=;
	b=WJcrUSUUo7lnu29xbjT9UIHIwOMYMwXa0jZG1Dmd7hPIQwAt2YnobPkmNEu7NVJ+w8E6
	 Bg5TC4JCQuO7ydi5fWnI7X4H+VTM/63bJiuEf64lwMnGHpRiwr4bWbJR4Y0+aHnfWyLv2
	 04G1grsQ45TrbZZqO6J44Ix0rUhypPJNHTpfFarWikHYmYLoaokVqwtCg3c+dg1PebRRy
	 +s3zH0Kkh9INKo5zZ8xgXVP3ODjxAKv/hT8evtPIAX+0qSujAYZpyEk6sEZ8bzpMBvdvV
	 7F9E8w+BbpVcPLSNsPX+bNe+ldIIvQF2Gc2QcJEO+otiZbrEtKny2dMuvwXYsKU96Pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EmIcvfgw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57450606A332;
	Fri, 30 Oct 2026 20:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EmIcvfgw
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793392452;
	b=NFzbHwRF//zl2Xyj1HSwPKvAuFp8RKnz6GgaRrghHcha0ISS3eTiQWl+5gowbVXz+YLv
	 DPyTBZadBHOyFU59m+8u5KaDkuUk1DUPtqZ6O2v7Z3Uu4lvwFtZdxikH0wZf+a/8dWcj8
	 HOT10ULRdLIPO+ttBt3XxD2oQDGRL8FfX4GxT+S4pECGwPqHaM99ZRSsEci52UHMkjDQL
	 Lri4oHhGxcxnKB0R9radglTXySug4rxINeeLHPe6SNo3iCsXnGdcCShnyWAv5oDg1Hxfk
	 8lpsj4iyXJW55m5Lz/ibbjMB4q370TFgUFd/RWfNM0l4uj8GCpy236EPL2kaX01RkIA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793392452;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=soIhMh1dJ9HVRlujdDktbU1BG+4MBhLl+PUVrnyOGB0=;
	b=Omy9BHE1zrFC6arZhYGHOA+mP+AVMEePu/pPUtgNaXns/B6cVcikWyDeULt3KIxAnm6E
	 TZVteDysp9O2FJdBV0v17lw2B/GIAMML/Oew/f5hC0gFF9ivAk+AbokwmWwjiEmL8igRj
	 qH3XjAthMAbOWhNlhr19FhxDPnyB9NJCFvWuShsya3gmSEhmU0LO0C+rCGgsnHyT8Y2LQ
	 Km07/9aJICQc2scrPE3oExyaq+W6qmpBQsanLAna0fe/pb3tHUhShNw8B1//+McGdl3NM
	 k617gUSazI54wsCJwt4+Jo6q10LQUG0oRnZLNkKn/nsKqBjXo0KcShahNzTNatNB/dQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4455E1F00A17;
	Fri, 30 Oct 2026 20:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793392452;
	bh=soIhMh1dJ9HVRlujdDktbU1BG+4MBhLl+PUVrnyOGB0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EmIcvfgwXeHxHmykw8dAguK01MfyJSqWqDPAllGKxY6xTE7hTfmFcHPYpJ4Xel/fk
	 VR9UHe4X+Ryp14f2LJYvJWOnPlgMffFICwocBeHlohvaLPj8o2GDAD+sDsGGiiL2Ln
	 qo1u+8TCoi0o3abJm9lBNQx6KC8tAqeMtkfZ1c56Jc70q/dIctlr9OA6Ts5kbnxIps
	 5nLHCx7wJvdUfRPxljGB0AGBpP+MBuBMnEHGgXDteLEX76X5cZWIuF7P5TZCNMSOXK
	 ZZhGSJGTYV4qruC9fhMZrFhbnTL5WHUZzOQXrmeT0Lmi/E9iyLnfXGR2LDmrQpdZdc
	 93QJw1PRqMrog==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A59D04425E;
	Fri, 30 Oct 2026 20:34:11 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Fri, 30 Oct 2026 20:33:56 +0000
Subject: [PATCH v3 1/5] dt-bindings: soc: samsung: exynos-sysreg: Add
 compatibles for Exynos5515
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
Message-Id: <20261030-for-next-lucky7-v3-1-81e02272ce69@member.fsf.org>
References: <20261030-for-next-lucky7-v3-0-81e02272ce69@member.fsf.org>
In-Reply-To: <20261030-for-next-lucky7-v3-0-81e02272ce69@member.fsf.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=QtI7rR1JE5JZ0IsGeNkyOHtQG1QoQSmhMzQKfhBONkY=;
 b=owEBiQJ2/ZANAwAIAUknAbLEetfrAcsmYgBq5P9BRwnhwKnh1lcLA8zegpISzuoxVtpp5hFSk
 J2zaklXBzqJAk8EAAEIADkWIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCauT/QRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQSScBssR61+sUcw/+KAI+HUyt1z+19ZMIG5gRCEjE44sucKH
 KNHTSOx64D+bNnnirR/IWS6DGiL4OCtHgBLgaaYoTu2rcjjPkARscI3n1BFNH3qknQNcNVLPagG
 JEdMikMNvIjTYc0+RKLMTV4hOAKGxNdk5ycDH5P/d0aWZNi4LZzS9DeC/ID+KJg5TyYWBhZv1hM
 mzi+Jq65JmDFFAcZ0hKi+hS7gJHMgzP9ewAwwRQor464RYTR66m/eGMbXCSKNJc+HgY+ErFpXH/
 lTk3aD6t4CdFYYN+SxUKbtbJqZydCMmEZVWBAoFn7VfD7loooEx6BknS65WU0cT1HeeD8J/J//e
 bRgPFtQm0bQgKesqdoccbIxtlW+Kl9w0tuR1tXn/BxCpL6dZ+QH9gGbK0eSMxx/1atIHAQAPL14
 HheUfUJM5JsInrfZyVBtGqDXlF1IPkJv+Y6912ZctsOSkCejwHcJ72MSe+Wc7nO5kZivxgc02Et
 86RTXf9QUjRMUWwQQ3cb9QXpxVGsiOJ9nLE9cvXU0CgGaAhGhTdseWBH78WC9vVhk6MUbHTm2va
 S289sjykEYRGVGW6Qxkcle8PBMO6/LulZ6ijDXmCpedKRWsfu7JPYBhDD4N/1EMvqpVAEN/WNEf
 iD+X7Wg83J2zPnp5nq5rKGNiCrr4sTqk6Qo6OQaCioJNT+st9uk0=
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
Reply-To: aidenisik@member.fsf.org
Content-Transfer-Encoding: 7bit

From: Aiden Isik <aidenisik@member.fsf.org>

Add Exynos5515 compatibles for the following sysreg controllers:
- top
- peri
- fsys

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index fcdb9ffd2644..9e698d065820 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -29,6 +29,9 @@ properties:
               - samsung,exynos3-sysreg
               - samsung,exynos4-sysreg
               - samsung,exynos5-sysreg
+              - samsung,exynos5515-fsys-sysreg
+              - samsung,exynos5515-peri-sysreg
+              - samsung,exynos5515-top-sysreg
               - samsung,exynos7870-cam0-sysreg
               - samsung,exynos7870-disp-sysreg
               - samsung,exynos8895-fsys0-sysreg
@@ -100,6 +103,8 @@ allOf:
               - google,gs101-misc-sysreg
               - google,gs101-peric0-sysreg
               - google,gs101-peric1-sysreg
+              - samsung,exynos5515-fsys-sysreg
+              - samsung,exynos5515-peri-sysreg
               - samsung,exynos850-cmgp-sysreg
               - samsung,exynos850-peri-sysreg
               - samsung,exynos850-sysreg

-- 
2.54.0


