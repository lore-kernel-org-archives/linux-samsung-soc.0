Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7EC30C176;
	Sun, 24 May 2026 18:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779648973; cv=none; b=LYpPOWvF2b5AqWdH7STodFZ0E7lJVROwunxFnDsBYGwQ0beDVIuFM9p7PE85UckPVpRzSvesfqQVUjTG4shidwuG+e6+hxN1buZyng5N0krL5/O7SDR7RiVVd5B/rOFhj/DF/gwmXcm3BalRotirakmefcwW/f0nM5OqN8SXhm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779648973; c=relaxed/simple;
	bh=wTrUwjrzKt9uWx10hAT8NYnO+2kpOmUiSrsRnf4udwM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LLYM5LdZ5UqmGKfQiZGi5vALcAplEGhGw4EJY+P1Zi6ekgdjQlrFivz2/1m8narA0KfdXeQ52sM2XLhmH+2xBMbMzp6SM9xLdUvywN0B1YBO497ytEm3lE4MRJ+zK3+W4jqONTFVVpP6gMKl002lBEJ129POQ9V3XoFdSouoy1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VyqMcrGD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VyqMcrGD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DBFD1F000E9;
	Sun, 24 May 2026 18:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779648971;
	bh=YyKZjNbaHLwDKPrtbrYcM09pSTjLvLotHazDOtjm1SY=;
	h=From:To:Cc:Subject:Date;
	b=VyqMcrGD33O1bmv/LoY6CA/aTnLRVd2JcUxO2iMHB1AAqAW6LwxE7ukrFvRAPmmOn
	 0hrNyUybAADQLC1jXmTGF59zvprNeDIN7KQcbM6rFK9NUvYFKPszBvms9h5R/NjiTN
	 T+hKTzOoZw55sxVC4+R6EQ586bzBZ2vTdypHXq+RapsQCKZA2oMwc9v49mM2+pL8L7
	 rfeoYDoa7DWuI9JuOx8xjDpv9/GysI1roOWo/HWPR/ec7Pyz2mteofAewy0WEEAiDr
	 Jw6GVCvGObBUrSXw6uqFHdHWwj/vnmIHGYhumSH9U6nFBlKC5POJ+5rvqoK4if6tDK
	 3mWCFU2/b3T+A==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] samsung: drivers firmware for v7.1
Date: Sun, 24 May 2026 20:56:05 +0200
Message-ID: <20260524185605.18583-2-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1889; i=krzk@kernel.org; h=from:subject; bh=wTrUwjrzKt9uWx10hAT8NYnO+2kpOmUiSrsRnf4udwM=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqE0nFbtpCX9u6rkqyFVoDP7YKC1IYXvuPd2n9P Db9xfTWSN2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCahNJxQAKCRDBN2bmhouD 17tHEACXTLzXExmrbvCW1l+01kPG3UUgZp0Mx0wjZmgjkNXurdMy/Z3/ecN/9aL9j03PivVwSpN xJhdjqTZpo2eK0R/YGRFW9KsdekspGPDSDcQMX8zKuN7569txcnyMOSps11frD7Iknl8ccBEHGZ BVJ2ly3aPAYQ9angH7ecqQGtHXQ4+W9k7Do4epQnN9gU7ufWt0EttQduM26/T+kfzT2RrUiRw/0 8ap2O7ywDRSIyAf6YHuzvZk5gMkfU4jSTvp1JUr3iP4pJfZZgO1b82zTGKFls0RM4czaKjHaEDe 9q1O9ffekVeUeB0fKB5uLjrDUILdCIl0fR+SKjHGP+99qZCBXJ6LBpJpTnXw8ycOMPeDe6cVJkF zbka2hpb7qV5AztwbHxVV3iGpNxzccjIpVRH4rxP/gNBaEv0RVGtQfIkKAwXaPX6KW8q1xsuVKo aQq3YyHRCbJ66IlvigOxY20tnw5xV8RtIn76tBkuTLCGygf7RUkC7qh2sNdLbfoWfJZBiLwKYB1 9pWoQTRmRNgMbvlVW9zGuvOdjb0KqgMmoaxzD3jlmDdjuhHmI4WR4wdWuH0ws0ehck0d9cafu9Q oh8EqhgDQ2ybmPJkqFgmjfDNxqJ3ZjMFoqZMx+prdZ5c7Lq+rX6peJL8RCXMSUgIAC1Vr989tF6 Wr9U1A4/WFwNDfw==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi Arnd and SoC folks,

Few driver fixes for current cycle.

Best regards,
Krzysztof


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-fixes-7.1

for you to fetch changes up to 10313b4cca783ef2e38b2a76dc42dda481d7ebf3:

  firmware: samsung: acpm: Fix infinite loop on sequence number exhaustion (2026-05-14 18:55:00 +0200)

----------------------------------------------------------------
Samsung SoC driver fixes for v7.1

Fix several concurrency issues present in Samsung ACPM firmware drivers,
used currently only on Google GS101.  Tudor with help of Sashiko
identified several missing barriers and incomplete synchronization,
leading to possible transfer data corruption or use after free.  Few
other issues related to probe, including missing mailbox cleanup, were
also fixed.

----------------------------------------------------------------
Tudor Ambarus (7):
      firmware: samsung: acpm: Fix cross-thread RX length corruption
      firmware: samsung: acpm: Fix mailbox channel leak on probe error
      firmware: samsung: acpm: Fix dummy stubs to return ERR_PTR
      firmware: samsung: acpm: Add memory barrier before advancing RX pointer
      firmware: samsung: acpm: Fix false timeouts and Use-After-Free in polling
      firmware: samsung: acpm: Fix missing LKMM barriers in sequence allocator
      firmware: samsung: acpm: Fix infinite loop on sequence number exhaustion

 drivers/firmware/samsung/exynos-acpm-dvfs.c        |   3 +
 drivers/firmware/samsung/exynos-acpm.c             | 145 ++++++++++++++-------
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |   3 +-
 3 files changed, 106 insertions(+), 45 deletions(-)
