Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8807260F;
	Wed, 19 Nov 2025 11:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763552439; cv=none; b=rxU4R5o/biD0uMM4Ly7AvEafwappI9mkvPd25Ht188YBL4eYqkOfElGd9R+45reGqX2sa3K0Xn4Td4nnf9kochEf5mDz5S7t63yzv97cCKAEMBLPM5ayW+L5+ZlNrorJkrwtYhs4GKT1dLdoZUscmQp2qQRbB/Ci12TaGdbUCfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763552439; c=relaxed/simple;
	bh=j8y0p3t50uO8yovm4KUuNPEx5NfrhdqpEjWhf0tKHUc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mDFAII4y+cd4VfB85+YIX7UTCsne59P0hgBoSC/+eG3ad5wfKChDAhJlMMLoDOkj0levG0S87NDSBdWMcyL/N+NMvveyS08v2OGP9gYMYeA5ThLPsRWg+iMWwFnNSR9Pqu1c7nUR9x+RUSdezX0v9cqJJ+1M7oC1GdgKQ0PXwd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ercPpsKt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ercPpsKt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31432C2BCB7;
	Wed, 19 Nov 2025 11:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763552437;
	bh=j8y0p3t50uO8yovm4KUuNPEx5NfrhdqpEjWhf0tKHUc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ercPpsKtZGUSKEOqZFFItNgPN/UTqpTObdDN6yopy/DDzSOkLGjidB6lqNaBhh5ko
	 byW7aRW5dYzRmCCVe3sKnJTgV5mcjWyEjwAXdWHjr7hwmzmix98Ud8E4xsyhFTn4SZ
	 T8zoukJ0zYRW23Bc5lAWPL147OXd7VJmB/oT5aUMQRRN3k26gMxyH0+zDczvqXEm+a
	 7b+cEwhQxzQNgpdjNH210VcYx2k3lLW8WiOsVjF4SDxsk/gksCn+0Ti0jOihIgpy8Q
	 ii+sCpYaOdhv51mfMm/4gbjp4RHzjdwfRD6ibU5i8No2Bgs3L3q0kNms9DGZWhG3EE
	 EgYVyHyC2atEg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 jesper.nilsson@axis.com, lars.persson@axis.com, mturquette@baylibre.com, 
 sboyd@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com, 
 cw00.choi@samsung.com, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, smn1196@coasia.com, linux-arm-kernel@axis.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, pjsin865@coasia.com, gwk1013@coasia.com, 
 bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com, 
 lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 shradha.t@samsung.com, swathi.ks@samsung.com, kenkim@coasia.com
In-Reply-To: <20251029130731.51305-2-ravi.patel@samsung.com>
References: <20251029130731.51305-1-ravi.patel@samsung.com>
 <CGME20251029130826epcas5p180506ff38fb57ecca0e33b2f5c57ed6c@epcas5p1.samsung.com>
 <20251029130731.51305-2-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 1/4] dt-bindings: clock: Add ARTPEC-9 clock
 controller
Message-Id: <176355242978.116968.261312419155141714.b4-ty@kernel.org>
Date: Wed, 19 Nov 2025 12:40:29 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 29 Oct 2025 18:37:28 +0530, Ravi Patel wrote:
> Add dt-schema for Axis ARTPEC-9 SoC clock controller.
> 
> The Clock Management Unit (CMU) has a top-level block CMU_CMU
> which generates clocks for other blocks.
> 
> Add device-tree binding definitions for following CMU blocks:
> - CMU_CMU
> - CMU_BUS
> - CMU_CORE
> - CMU_CPUCL
> - CMU_FSYS0
> - CMU_FSYS1
> - CMU_IMEM
> - CMU_PERI
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: clock: Add ARTPEC-9 clock controller
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

