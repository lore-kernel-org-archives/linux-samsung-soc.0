Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB7C82C60;
	Thu,  5 Dec 2024 19:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733427707; cv=none; b=oTOMGcB7DUKWIJzgPrf/F1lGe2cW3nXvJlsRNW+7ywKszGMG0ThjAtGiHHkAbcxPoWJJVhegwd1iDxj+/WHZHlhuBAr/tAsyRRfNt6GP6gOHCBjdrKwwzJ6AQZAVaWLDrahCKOkGcs0xTEqDgcQ38Ix6VZ8ncMc7Hz76b1oquBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733427707; c=relaxed/simple;
	bh=Q7xMfkFo7t/4uxU5Y5f24KfnUdQXtb6PJXk40TdRHGA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dNz+vtJlvygqbG5A5tOmaaiscD/w/rv8NF8SZgYgO4JtSYdmou6ZnKw4xXZD1CIIWpUchETKvhJ9kxy66J2z2w8tL/6K2+jwB1DdCRSM66VjdRBacw4JpBrIS8aWNkhslNRB8X4f5dt5lJ3IP4isgAtYPLimiNwPtY7LPaft7io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=i9XRK5Mz; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="i9XRK5Mz"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y44X54BMtzGp8c;
	Thu, 05 Dec 2024 19:41:41 +0000 (UTC)
Received: from localhost.localdomain (83.21.102.241.ipv4.supernova.orange.pl [83.21.102.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y44Wy33YNz2x9D;
	Thu,  5 Dec 2024 19:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733427696;
	bh=Q7xMfkFo7t/4uxU5Y5f24KfnUdQXtb6PJXk40TdRHGA=;
	h=From:To:Cc:Subject:Date:From;
	b=i9XRK5MzgXd9PEU3tX6DNn9anUgbBfWIic6dajU61zhk/WLteEv5cZLhMG1UJbWsw
	 GiADDYisAHgdZ8XCP7GeU31XoulauHQXOdkFyEOt46aa+1UhxpssUvV9ZkjZLNolMI
	 ySkhcCet/iAuFcTIOdR5qEZqIWzXEEymiS5w0+IhYBImsnQEC1jBnYdWg55DPflRau
	 h/gF4JqkSqB21fM6wV9fiya/pjvcxZMo6NhA51U7LxF/TDPUrJ7zCR2wYqx80NXgZ6
	 xRnmR+I7njDUADSSKNdnJ6KSQOGeXLjZcR302guX3/eWFus7qo8BjTVLo2RbW0avEH
	 si4Aa7cxKr8gg==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] arm64: dts: exynos990: Add cmu nodes
Date: Thu,  5 Dec 2024 20:40:19 +0100
Message-ID: <20241205194020.785846-1-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patchset adds device tree nodes for Exynos990 CMUs (TOP and HSI0).

This patchset is compile-time and runtime dependent on [1], which adds
driver support for CMU.

[1] https://lore.kernel.org/linux-samsung-soc/20241205193423.783815-1-igor.
belwon@mentallysanemainliners.org/T/#t

Igor Belwon (1):
  arm64: dts: exynos990: Add clock management unit nodes

 arch/arm64/boot/dts/exynos/exynos990.dtsi | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

-- 
2.45.2

