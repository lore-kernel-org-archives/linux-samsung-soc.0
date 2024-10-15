Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78C81FE0F7;
	Tue, 15 Oct 2024 21:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729026151; cv=none; b=jVXzF4Ifwl9iDQdfyuf3eal7jrAn1F37pU7wzatgHsjRLkEQjo9+iQYbhVrMv7L85bDCE5WaT+02jlQ9n2dd0KvedB/ZR31At8F2k1kgQ6hq/SYg0t8HgBokfp1JTH7bAdATNkmuMuI/oW32a6Kko+15GLX6RiodGCgyXI5w5iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729026151; c=relaxed/simple;
	bh=N1tK/Gf1hqrbHvTeOFOJ9O1O9vrudZVyOkpSwb3tzr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ct8+PWRten0UypaqxGlWQBn1HY9fqfQP2wMJkgH2890a4wODHEE9uB2+B6SlgVhQSOpm6tRkZxQwAaNO1mJ+eBso7yBe8DLwlGz/AvflMd96174k0E50hzeLiy+StDZMj6BsOZ8lCqzlPrjvbrRuU2rMzUnDFwtZAiWiUk7MtX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=MVIoD02E; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="MVIoD02E"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XSmkn0PT1z4wgv;
	Tue, 15 Oct 2024 21:02:25 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.240.202.ipv4.supernova.orange.pl [83.8.240.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XSmkd4yy7z8sWR;
	Tue, 15 Oct 2024 21:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729026139;
	bh=N1tK/Gf1hqrbHvTeOFOJ9O1O9vrudZVyOkpSwb3tzr4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MVIoD02EBq+55XXshEPKmNglsUQfELF0xV9D92IsW4eIys6ji1anvj8XHtcgKw/Ok
	 z0uEklcCb+aCF8MYD6bV46bBbgY2adD/OKT9s4WnTz7JNzPz1Z5VbpNLcI6jzElffw
	 oMeU79A3YR8wSbbaRH+HUDf6tfsw4/qX7nnf9s3jYIjV12IrTye342e8s0u9bpyJrY
	 vK8zMWcyJePN+nJOan5L0+u7XMcoLZVvaqmAv33FTgonDx5wsRTJQvMNpeoUi47xRN
	 q5RxHvzPqxDah7O8nWI1LzCEeokoZ8Kq+UOiInun0OygGKsrPJKVcMANHUhDlmW0qm
	 /J+3qbd95YRfg==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	David Wronek <davidwronek@gmail.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] dt-bindings: hwinfo: exynos-chipid: Add compatible for Exynos 990 chipid
Date: Tue, 15 Oct 2024 23:02:01 +0200
Message-ID: <20241015210205.963931-3-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241015210205.963931-1-igor.belwon@mentallysanemainliners.org>
References: <20241015210205.963931-1-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for the exynos990-chipid node, used by
Exynos 990 platforms.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 .../devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index c50ee587dc1e..47a8d98346eb 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -24,6 +24,7 @@ properties:
           - enum:
               - samsung,exynos7885-chipid
               - samsung,exynos8895-chipid
+              - samsung,exynos990-chipid
               - samsung,exynosautov9-chipid
               - samsung,exynosautov920-chipid
           - const: samsung,exynos850-chipid
-- 
2.45.2

