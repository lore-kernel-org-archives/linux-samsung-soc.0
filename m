Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A7C1B87C6;
	Wed,  4 Dec 2024 14:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733324385; cv=none; b=NRlm6bUdwWMF3S7rQdR/pp8nIkETkJyBlNoWWe6kZQZKYq37pfDeebCkUz546Z/acpPjG1QWrSqnGINBnWUNIO3pTCvgxF1nb3UtFviJICpH8l4le4t277iltFHeqxdNmW8efCK8cnXtKanKX1a9QdlwQOfgdU3wVZqiYrBsRv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733324385; c=relaxed/simple;
	bh=xO9FfRnXogXsKagT1s91UTrFV6QVAy00nXwpxknoUZU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s+OW2iYhnQtzuMmNjWowRqvGO5eB5ZplPk7ra8KU36FE2PdJw8Emc5afHF1ILiC/B5DqMfnFASult4OWLOSsk80T2YQImgm13WbR07O1flQe03kNUmCWaLNRXRHlFYPedfACkZsx5ySHM2eYLdLPhA+10ts+HLBjJgMLsCHAH5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=d2bJkY/v; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="d2bJkY/v"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y3LK95QMwz4wVV;
	Wed, 04 Dec 2024 14:59:41 +0000 (UTC)
Received: from localhost.localdomain (83.21.102.241.ipv4.supernova.orange.pl [83.21.102.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y3LK25jlsz8sWT;
	Wed,  4 Dec 2024 14:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733324376;
	bh=xO9FfRnXogXsKagT1s91UTrFV6QVAy00nXwpxknoUZU=;
	h=From:To:Cc:Subject:Date:From;
	b=d2bJkY/v1AH+WRJBuTIvpf1BtUbHPCNO2AmEEJBah+7pFmJq4WG2i3a/Uib2ub1mJ
	 rcCqqlFIYlj0wN9J5SltOpz7hxyjLChIHJB5BS5JO3DEiaQmtx2XoCo8n6Cz5ngXk2
	 pe5O1et6LClWZfeC/3GfrCl0QAVzOFKvSbLWB4eF9/P6QudQUdYnpQSTY6zS/72BEg
	 PR42xTG5wKvTJv7LwKc1Cp7e+hRU34Chm0xTS4foYDnflkns0WjkmuNvs99+vqlDeL
	 TM8rIH7k+5x9/2cWo8MAKrg/csqYehG2vBSMKUaMfiQ1m2r1rpjwa63vClMgkCo/9P
	 cS1U8TD2LjB5g==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Add pmu and syscon-reboot support to Exynos990
Date: Wed,  4 Dec 2024 15:55:57 +0100
Message-ID: <20241204145559.524932-1-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This small series adds support for the pmu, as well as syscon-reboot
support to the Exynos990 SoC. It has been tested with the reboot command
in an initramfs.

Typically, this would be added during the initial SoC bringup,
however I was unsure as to if the syscon would work correctly until I
could test it (especially when it comes to reboot), which I just got
around to doing.

---
Changes since v1:
- Wrote a description for the PMU in the dt-bindings commit (thanks Krzysztof!)

Kind regards,

Igor

Igor Belwon (2):
  dt-bindings: soc: samsung: exynos-pmu: Add exynos990-pmu compatible
  arm64: dts: exynos990: Add pmu and syscon-reboot nodes

 .../bindings/soc/samsung/exynos-pmu.yaml           |  1 +
 arch/arm64/boot/dts/exynos/exynos990.dtsi          | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

-- 
2.45.2

