Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02081189F43;
	Mon,  3 Feb 2025 20:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738614764; cv=none; b=AhbLmIXwr4opBidqO2W2tVjjGpq+1LzrL7Pv23Q3coYF2/ImZ+3VjUzXDy7bqaNLEqlJ9lJrT/tt0cMVHaRZJrPBPFqVoJLD/2+Bgi5WGetWD7Glx2K2dKX4votuvQAFhORGWfrdvu0+YNRybW2R4COCo1X4qDtClY2s1aymoq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738614764; c=relaxed/simple;
	bh=rn9baAKmyjlLutADSxQ9BFJcAwJNMgiRNTgHRQpBPKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mAmD0lWBX5nhiUkZQKdAXWgVREem4WzejHiXJN66/a1ZbP/flY6W12+V1i0UKRkd5Qw9+hG2dz+Ss7VogZAwtRC/sPZTK6WIIR+b16JJQN1+URMjenAVa6QaSaqJzZ2DQamzcKYw4RQfMMChyI3CylL2dHdInVWQfkeek24Rwng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=i6zW8Oie; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="i6zW8Oie"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6734125BF2;
	Mon,  3 Feb 2025 21:32:41 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jMAJ8vHInC3W; Mon,  3 Feb 2025 21:32:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738614760; bh=rn9baAKmyjlLutADSxQ9BFJcAwJNMgiRNTgHRQpBPKM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=i6zW8Oie9CpulE+0qQwJK1MfFkCVQGCNPCKDUAGFk7RmIJfhXGHgc/MyVK7b5XnpC
	 6PZyyzOcr32g5ybqODJEqBA4wb0xQQjJS4d3Gtg2MXzjpkknR0WyYcTScDsSKYWqMD
	 aOb+DyscDIJinu71Qi4U37rz/Wgmh0ihf7VdK1lgAm+dN4mE60LiG3FMlbCXTO1uNE
	 977LbdGdC93RYI9oe8jqueNudFkUybEf7JGDMQPpVRiuk7Zv3n078X7604aKFFkFT7
	 WUdbS//j2JscS8rT699b2i4RxJJmsbZGMg4NfGvXmWQqy9GGgl/91/LfgEmH3JMXcI
	 S3JsOyIBDToqQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:02:19 +0530
Subject: [PATCH 1/2] dt-bindings: hwinfo: samsung,exynos-chipid: add
 exynos7870-chipid compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-chipid-v1-1-0bf2db08e621@disroot.org>
References: <20250204-exynos7870-chipid-v1-0-0bf2db08e621@disroot.org>
In-Reply-To: <20250204-exynos7870-chipid-v1-0-0bf2db08e621@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738614748; l=992;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=rn9baAKmyjlLutADSxQ9BFJcAwJNMgiRNTgHRQpBPKM=;
 b=HpLDq1EjNxJtOco0JipxcK8+SICDVTUYAnsZuGhx9L0rgkxWC0XVb+/lyhIU1rwI+y5YRuxO1
 +Jn++oczCMWAMArS5rEcB26YUYuIUFUXHYrs8P/YkAZSjvG3k+B7LKG
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Document the compatible string "samsung,exynos7870-chipid". The
registers are entirely compatible with "samsung,exynos4210-chipid".

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index 385aac7161a0db9334a92d78a57a125f23ca1920..9105ad48563a42ecaeb3dbca37df734d5b93f52c 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - samsung,exynos5433-chipid
               - samsung,exynos7-chipid
+              - samsung,exynos7870-chipid
           - const: samsung,exynos4210-chipid
       - items:
           - enum:

-- 
2.48.1

