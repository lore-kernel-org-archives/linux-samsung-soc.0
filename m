Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9555F3EE1EA;
	Thu,  6 Aug 2026 08:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786004362; cv=none; b=l2i3LZHMpn2ateQRRfWzpJ7pjspA/UD7OfvU0AxL0VmeZ82mwuweNvk0GamI9HO3+FjzVVEbH0nydtd+yGY1E/kh/6Ya3QUMPLmVhC8lrTkBjpGDdQQNaa1MM6p153ehYQGYvjaIwbidHQTIBz7OzjnQhSoJtcnSRPZgQNXfAl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786004362; c=relaxed/simple;
	bh=Xyhmj+aDFTtIRlFLPpMbuYd/nr59AXNjT07GC2bojFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sksCPXkTFI5ji+XmenceO2Had2UXyMs4n5mNEhhJrevla6gCsqtYsBlLrIrYMJCSF6ipAeSdqf6FHBxADlYxTsnaPiNTkGC/bNUYKxqoY5RAOZISSbZ8GcT5mxin7N1fuUK4MJyBK6I6351fSmwJQmjjeXFJEgALXLiPMggfa7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CukeG4Jh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CukeG4Jh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28941F00A3F;
	Thu,  6 Aug 2026 08:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786004361;
	bh=D+0heS499WMn8/ZDqYM9hynjje4Gw8ZJl6CgmV7QoF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CukeG4Jh6Z+V6Oy1eflG+QopdQZjFiSuYrgKfTThB+wMYSsAMZXXg5V7yGbIjI57e
	 opMfEKIUh7Mt1eQbVQOWSjHKQm3JfsPPPv89BcqELF/QPjGqNtUOQ4xAX2H7Ipj0Cp
	 7ATv1oj6k0QRP2f+28BrlvqwM2RAzS/fu2iYfRWcJIpR3XwLoevAoJ1wi1lUbMd392
	 Cdzt/pSJbGlfDjP4JEcMij58xB7OMfPMgdODVV3lNYcf8F24padsB9XG4aQG0iNjBk
	 lg6ozPyo1tsZDcKN3EusTgOeRyCHN/GoNRFjrFwagwzeVgx+Sh3jfbVdxRG+qc/9o7
	 bgohRLxrAV5Wg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 3/3] ARM: samsung: mach for v7.3
Date: Thu,  6 Aug 2026 10:19:03 +0200
Message-ID: <20260806081903.165005-6-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806081903.165005-4-krzk@kernel.org>
References: <20260806081903.165005-4-krzk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1196; i=krzk@kernel.org; h=from:subject; bh=Xyhmj+aDFTtIRlFLPpMbuYd/nr59AXNjT07GC2bojFY=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqdEN56v25JrMudRGF2XtGiuv5Lr8TEXdThEYxn 44nLXXXfCGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanRDeQAKCRDBN2bmhouD 18epD/4w6HXLRLqbAjooYqlbReI4D+KYr9ghpD050JWUX+MOsPTIq9Uxf+uNOi2XWcYwaWSB9m5 1QgKbHj8y0ZbsqT3NSlxr2nbGgvieEtsQQ7OiqhGKuT+JiPi1/8bL/I8TXbb/PKiRa3Wl8h7548 6vFE4YbopDwhGKChogkZX1hDU1w5yE/ibbgYf8YX6uIxdiG3+lbHw+Ljy2fjO1KOzqUzG6edg03 CTTL/8KtNxvUMApQrR496TticUqpyQGeN6t1oYvboE5XUVNAAPSWWsRcnu91C3UjjJE/oG3nuFM OcRZeCMPyaR6nyd/NSlYFKvTyQiph/tuscahH9dbGGgxbalh73gzhH/gL29E0axyWEfdqRqXcaK ff8kYqGSlA0uJk4zrlBtQdONbXb1f18cf2EIvd7LiLFsGKAtKHLQeX8WVTlXCQIu4kNNu7cwDdJ 8EZJTrjoo1pYBASLH+kouwO+Zybn1/F2WoSXvD+2SDyCb3DDlKouc4fOtugFksNogg9sWHwgAwj XTGZEWLgM9IlPk+zw5XEW29x2mLmj/ayJiqcTjdrsg1j7vn+9zyLtVyEKiVqqCfk9xbQ4Av2utA pzt69EVaILgS5YgDm/go4FctQ8dLZ6WhZ7UrR3Z7rMna5JX27QN/jESJZ/OozoAnu+pAuD7sdCX xVMNJxLQq76rBTQ==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-7.3

for you to fetch changes up to f839968769b64bb81878a626d34097959ab79295:

  MAINTAINERS: Drop redundant lists from various Samsung entries (2026-08-01 17:07:51 +0200)

----------------------------------------------------------------
Samsung mach/soc changes for v7.3

Two minor cleanups:
1. Replace __ASSEMBLY__ with __ASSEMBLER__ in headers to have
   consistency with what compilers define.

2. Drop redundant mailing lists from Samsung MAINTAINERS entries (less
   code).

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      MAINTAINERS: Drop redundant lists from various Samsung entries

Thomas Huth (1):
      ARM: s3c: Replace __ASSEMBLY__ with __ASSEMBLER__ in header files

 MAINTAINERS                  | 21 ---------------------
 arch/arm/mach-s3c/map-base.h |  2 +-
 include/linux/serial_s3c.h   |  4 ++--
 3 files changed, 3 insertions(+), 24 deletions(-)
