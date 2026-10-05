Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CF946AF08;
	Mon,  5 Oct 2026 10:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196362; cv=none; b=isE63CsyvdhMGStl5+pCERREiQVldSOf815U435uOKwHJJ9jUUnpxV/p9rEXv63ujnMmLAiN8L+z3chzbgo29thDipNBkpzENRbYieDrTO1dB/kjbBdLg0NT9bxfiE7RspAfQbCPrW8BtN4lZ0PCSsPnN5tGrG4NM6/gvLo57EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196362; c=relaxed/simple;
	bh=cF7kn8sbCTjHjPAnkFXtSa+cYcnQlfglW+sMPEYeiXI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NCWnRYNM2jQqjRShpAaHbThd1Sq4SOgZIAMSSyWRXF8zTGfYSyto0FAYrS7aGDqjsSKgiz6VWr9mXGarbqvNdnP8tVQCszzUhyLCvFCYb9FnQPNvZ3l9KpF9AkayjTqlLI1bgjR1t81OmdtQa8U4e+KKh/IF2u3ggIVR75Cicf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iM0QOHD5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iM0QOHD5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4525C1F000FF;
	Mon,  5 Oct 2026 10:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791196360;
	bh=T/lUy849mj6VnNKpU9WpJMDBkHN9KlFh1cVOi8EQynU=;
	h=From:To:Cc:Subject:Date;
	b=iM0QOHD5DvGs59THN9N6wk73MIj4DjMjq9RJG4Tb8ym+t3Pjbi0gG9zPd4VrsHF7W
	 zKtupEpmxEze17lWyCefCiEG6jW9jQggkYEUbO7tyTWsXsnRwnwQsnaqhqhEZS6FP6
	 J40VEVbmVSupNlovnBCyTF3IFr5LuqAij8hzhx/MFLPVq6Kr+mQHBm4RCc7VMoWDYt
	 Q33Mb+IVe6cp/sfIZF/BuPr+GhWRe7S1/Ehn2RtMzgBGH+d4/zwJ02nS/CfOc8Gtjo
	 5LIjKPWYFrXDOxINesT183zCBgnTz9YCXTtae5gCOY94UctV33KRSJsvyml/GcEwvX
	 35RBGqTZj/UXQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 1/2] arm64: dts: dt cleanup for v7.4
Date: Mon,  5 Oct 2026 12:32:31 +0200
Message-ID: <20261005103232.37247-3-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124; i=krzk@kernel.org; h=from:subject; bh=cF7kn8sbCTjHjPAnkFXtSa+cYcnQlfglW+sMPEYeiXI=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqw3zAIe0E9u+XD4chZ5ixi+pEkbiLCoKR9ddth QazU1Khd6SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCasN8wAAKCRDBN2bmhouD 13NKD/9aotDiwjLm1cz4/dH/DhuK2z9l4a7AcETMf895hiW3q6u6sIfOkqfM5Tco8D0IIH5N/wi 2gN8q00h03nNRurpqUR2E0DQra+WnEJ7ecmTlb8gjMvyMogEmAjsdxtvrbIcHxT1JlHyk72uA9q S9dAAxRa6XrJj7oi5KJ4NmhzXVoHJMfd8KS6hXz1/R7bsYV8lxg+xTRkgq7MdbQld5bmwOYuROe qUtAfrL4jMkdzJVd0pa9f6Dl38bnxP/y6qDDvCHkpGxaLvPxCHSJVzQSRBvpIRtC9uQxmj0CEVF lQj7vcKBRnenRIfnMuNYsgqfN43r3qsKmdJkrSo1b2ZZuk29V9spq79W4aA2CCAvPwHiC7hrEcf Tpb53enXgyn4NXcLociQRLh0xU3tUhdGDCHqmw8jBBNMc1zglmiYPWtE+xEztZfCr2a01ZCmqkz rinoe2rT5+p5AFrDpJk3xViZtEtP3AhnoSZGY8Ike1fViP9Cyk/F7FrhVG7UItPzJEmgGUmbOZz HdZBBEVjVDwll8En8WqXf2k6EBQxK+1dIFuHCBCeNGsROPpR7c6/bQ10Z2/P0mZNhneJdoOXUfv J2yYtDY3iP+eaducth/XmKp+rRhx4k5v7zM79NnQ49XN2mCCnzbOUwuskF0NzR+cpV1qAKtTY33 SJFj0n2+PH/2kJg==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-7.4

for you to fetch changes up to 1f6101ae9560c381bb6e3b4322b51d784a648019:

  arm64: dts: cavium: thunder-88xx: Replace spaces indentation with tabs (2026-09-19 08:41:31 +0200)

----------------------------------------------------------------
Minor improvements in arm64 DTS for v7.4

A few more or less trivial style cleanups pointed out by dt-check-style
for Actions and Cavium platorms.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      arm64: dts: actions: Replace spaces indentation with tabs
      arm64: dts: cavium: thunder-88xx: Replace spaces indentation with tabs

 arch/arm64/boot/dts/actions/s700.dtsi        | 6 +++---
 arch/arm64/boot/dts/actions/s900.dtsi        | 6 +++---
 arch/arm64/boot/dts/cavium/thunder-88xx.dtsi | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)
