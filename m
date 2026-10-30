Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793392455;
	b=uvgiju5z5w8N8ShjRSwAjmT06VZHM+aR7HCgwGvy26rDPf69AHXPZFM5arYp2YVzyv/c
	 /s6Pe8fuK6AD57xE3zxlsWkiQmmfdY9oGCCfw6f0KK7EoKCvFYLhYVMQy3rz4XYtMKSH6
	 x0zkA2BWKlo3WSTffWFGQjYX+FVwNJK4ciWcPGnsTS5YM7PlMCaMijwWiZgzNwUqkm2Jn
	 +g6xMBDfZcinZm8LtxvxyEWTSv14pCHWv9pg0XEkbjsvn74WQuBKfY9FM+oNSRdSW2gLI
	 tULNx+jUfiqwcrSCMiWQKTwAcNlU9rlIGgqszqAl+cn/UGd8hPPe8OVl2zatphlQLJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793392455;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HeL+KPss/XWXAKPl/eTROBTm4k2yu734wKYuHO19n+Y=;
	b=aTQREYi5ROiZ8ViJMW4He1bABhsriRn2rnze0BwvgP2UIs/aIvmxTvxzEjLT9aW84j9j
	 1WhZ8BiFLX52mudFijJ4S4faHgjlWcW4Bez/GoSCBBTMVc6eYVmZFxgprOL3ZxRZiUNSU
	 ru/3Inam/kI61QorrizTY3weDr2ZEcHIkI0ceLTWq6KjL58vk2KSyVfx6ux3aWY3+F0J7
	 jHw7SgNW4KyMPPF2gFBsR98qma5xVOjfTD1KG5EX7TjscjtQuHbiMhoLUxKZWBqYtKOqR
	 EJ0VWVsfpXaehCR+kiTAqKoOmyAFOtLHZ2eBppRNmwoxsgEmH550Juui4O2WnHV4a8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YVUBXlHh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAED60A260B;
	Fri, 30 Oct 2026 20:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YVUBXlHh
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793392453;
	b=fo2NFwDiZnK7fLMXD1rKdrdHFfEAnvJ1rXw7SxWD6L8Bde0v3XDXzZ5NE9b3up/7lawq
	 iMeHND6/r7X5xHvoMdSMfuI1cqNJAzdggm7hX5POCuanODWqEhxpzJD1WSp5P/yd//sIp
	 ovCfLgWjQ5mu4F0h2c/yk9OsU0Ix7iUQJC8vHOAgrp5gVDrkc7KEJA1LJ3tD3F61RYnZ6
	 lUY7X/CGp2esRzHZZiWdEhhvJsPFnasqS5F1yyyeKal3KLwovJUu4gGjDgI1ngqkkRoM5
	 OWwULk0VXwVJTCaAaB2S0m4g5UynNe7Fxi/qfpTT0cMRhPCo42OucxiHccDyiblWBzw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793392453;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HeL+KPss/XWXAKPl/eTROBTm4k2yu734wKYuHO19n+Y=;
	b=Afmk8rIwfL4+TbCYwTmQBqXcvhJBBHdRhl5BFgOumkf5TdSkTq7x6MNEh9APd5lcoJJ9
	 AJOQzS7iCUg47QOs9WipwvyNdP7gJbf4RcRNzppVhTWQMVVhnUGwKaUoNzCycLzPwZWsC
	 P1xt4oj7KmXhoM0/Q94nwDEhPQXkRT0t5/xOCOPC4QC4vt85382vkfuyT+qf5ZS099d8i
	 QHoOFw3RigSVIHpLeVPasu4h9MILsTqhcEZrvVeOesaAlnQ3eQBwBOrgWmsqdVSayL4tl
	 AaWvqUScNLGdgeTSvFOpOGiwiS1bSyj0++tJP+HAqWCS0ehvWJaEI1i1ncfSP0O4KSQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 448771F00A18;
	Fri, 30 Oct 2026 20:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793392453;
	bh=HeL+KPss/XWXAKPl/eTROBTm4k2yu734wKYuHO19n+Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=YVUBXlHhA4Yf0UXTlcLhw6vM+ZxYNYW3WMQwUOALUIrzhiaJxnfSMc8zHLw76k3bH
	 cNqGQpPs9nvCfaDKs6xEz1QwEwIaubCIOBpBfCg1Wt8zOz6Rk1UL/QLP9ZXnw1omnm
	 Qj1pWK9ZwJ7l+AMLhY9FvWavDB/6ANuzuwQipfa/25kpFlZJaWR9EyAFYdLiDxiMqO
	 ZX5xzzODwfduSMb+smZ/+7R1PBC6DnWAWd5fhoYV49ExISZb6Q5R7IQjMDuV4o9dvN
	 PD5fIz6C7km/sGe72BW52CD6u4h/4CCNkp0qzcuzs/CS/tH5ycw3WiKEK8tgqZg9kA
	 sxFSyBHeyeGOA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B131344283;
	Fri, 30 Oct 2026 20:34:11 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Fri, 30 Oct 2026 20:33:57 +0000
Subject: [PATCH v3 2/5] dt-bindings: soc: samsung: exynos-pmu: Add
 Exynos5515 compatible
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
Message-Id: <20261030-for-next-lucky7-v3-2-81e02272ce69@member.fsf.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=956;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=u5w9oDBuV+q/JxmEewB9ecAjYkFIvHtUgbXKYE3snfg=;
 b=owEBiQJ2/ZANAwAIAUknAbLEetfrAcsmYgBq5P9BWj3cp07eny7nWeYelC5iwoGlylEEAbuTD
 jG3RYJC+xSJAk8EAAEIADkWIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCauT/QRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQSScBssR61+tHVg/+M1rsIcz0uUNK/8caEG3ZIfganwEVCQ/
 ufqay8FMzfjgwt5TkdJoAwDFfyj7KpfPHGtW7hLE//0EAhIyWCkw/yYWqliLSUGNoJzRFODEG/M
 WkxRu4eSum8WFC02NxTmkw+0KcBsV5FiIe+WZKkPT6FVr5aNukxAAVMnwIK+P4IE7P3RoHUwXtY
 kIZE5FP0WSckxgoz/9l96VUVF8sesk/QVR/PyeTYq5wkjxLXjJwqzL8ZsECrft0ah5V3vcf41XJ
 MBo95k0+GigXF14NBr4xarZRfrSStoYa7WvwFzNgsJlKqS3YoUGnrAqAIq/eCGee7NNA9OKo9LZ
 J2ASn84vHf/RhwwDduRDu2HMApjdbIWp8j1zUErwzCVuzad9urxaczGNhatcw64h5n8WndkDEAF
 YJVopq6IP4Bh2ZJ4FCQsa3k5q0iX/Bf3KUc/IK4V5aB8uDeN6fho9zVXaBHwU6neFeN9Ift/fNm
 I6Ely7lNsz64JZchDj/NFyc09KSIMVQQSSLD9hGOQir4EYYH5neY3Nc/IqQ46BXQoz3VCHtr81G
 uJTnbbZ8/Ej8kkvRqY2IWr2MTkj1pOzOFE5bhIOC7VQN9fIp+y3l6Egf6pEn0LS67IuvZbBu1s7
 R0ziopYG9tWdYrQw7hGnknX/s7UzheDB9y9l/1+WceR5ooJMz7WI=
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
Reply-To: aidenisik@member.fsf.org
Content-Transfer-Encoding: 7bit

From: Aiden Isik <aidenisik@member.fsf.org>

Add exynos5515-pmu compatible to the device tree bindings documentation.
Use the samsung,exynos7-pmu compatible, as it works the same for Exynos7
and Exynos5515.

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 5bd39876e3b3..1a0d9de79696 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -33,6 +33,7 @@ properties:
           - enum:
               - axis,artpec9-pmu
               - samsung,exynos2200-pmu
+              - samsung,exynos5515-pmu
               - samsung,exynos7870-pmu
               - samsung,exynos7885-pmu
               - samsung,exynos8890-pmu

-- 
2.54.0


