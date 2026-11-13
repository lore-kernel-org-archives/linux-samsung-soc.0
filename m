Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554311;
	b=qiQdJ8eBToildZw7y+uVvZlU/1mNkUoEogJE6uM7l5i+o8x2l2k3YnvdcBxp7T9+jp+u
	 kwZ9gksbids3AItU15NbY2MF+WdxWEpIFfy9uQiG2dRptgbg14AgWtWFGyHSRUa/MV+R2
	 ELuBNau8PQ4PWZ/i63mxFoYY6v7WTcYXsXPPDWJsIavjNmvqDbz10A2OX8zMsMYTn3CuZ
	 i44yOqQATX9d8BMjETu5EdxovuNJD48e3wd6/4VspaZvesDSWZ5rsfLfPu5h9Rc7JEQyU
	 Gx1B+MFCoag3sWe7MXjmAkhJOotD4krmL52JXh90XK4w7BEreYL01wlR+zd1l9LWnaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554311;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=hGCfbyCJsatkOZcGyPvaz22z0CZVHI0yVRmeT7Qfv/0=;
	b=aGkMGuhUTsdefXCrjE2CQaYh3/AVJGKXkaD3TTZURtwNe+Fry7jyrghXOB/jnv+YAsDH
	 3o7mLpZ1N6xuGgTbU4PxtxkDLwxIGAIUyZNOCW6T1vgRmRPFMlBFzA7gtTyZmqj1LGdtO
	 BcD2zgaunEzirljAMIqEy4GZ5HkNYOShXG0r4idAHViNr/J1oxw82/4fHpnbhj/h14OTP
	 JqDNu91kmm01ECoEHnrLF2ZG0DOjI3K4EnnmCvsUL2x3qBwy1xcz1KWJ+xGzHcQOBQoW3
	 w35cwXQZekudJJFNNWIG6e8gFzZK7TpRuu0/vZtqeY8IYj5BHLa6YYJpvdulM4maTQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VqepA2xz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7057606A321;
	Fri, 13 Nov 2026 07:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VqepA2xz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8648D1F000C6;
	Fri, 13 Nov 2026 07:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794554310;
	bh=hGCfbyCJsatkOZcGyPvaz22z0CZVHI0yVRmeT7Qfv/0=;
	h=From:To:Cc:Subject:Date;
	b=VqepA2xz0eaGF4+ni23s0aMGQdeIqpeCt8t8EIaAE//wNxgHc996tFmoDFJUsARWT
	 GzdOPDG/BdruxK0YOfMj4eQ56a9lCF+VAeD7mw7xx3rXgJmHfexzBDy5LB86QB16Xl
	 eIQrEJ2RurtWs2WKush7eRFxjeGazR7cax7rjLkpx9OML3Ot5rxBrKpOTh3rD696yp
	 p+SV5tEHrZxgNXvnv1S/VoCozF475SjRmTR7QU+M9LuP4AaDxJPg6lYu9P1lt/ghlE
	 nq/+YzbHi4zASXTv34M9wpvmclLJTjY2EhferYGFweAgMR8igiPnGU/RKxn1D4982T
	 vWpOJjdSjMsHA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: samsung: fixes for v7.4
Date: Fri, 13 Nov 2026 08:18:18 +0100
Message-ID: <20261113071818.14923-2-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388; i=krzk@kernel.org; h=from:subject; bh=QbdDdxnPdZV3D1DrHdQyyiRI9zlwNeF0YbmXq17qR/s=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9rm645q+UnPMfPgsn7fdEiEBwkwRsQErpRJbw 7KTwI0QBeuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCava5ugAKCRDBN2bmhouD 1yZ0EACZ5XXxrXy3WArKICb+kjvjDZjd4C0yMcueBsvZoWd9G0blpYbagdLcuk3q8GDrBVE8DiN Z8rtfJyJraVWhqCrbfGj6HBGdlveDfj57+KRfoRYqWEEuohGk03m4HXLSX1TlbZGfqSJoj17Sbt UtCYxVkJFv9hjs6P/B4+1tGJ5UhBPHu/4RdYBKDgqW5nECPQHC6sSbom98PdFhFkvNPaOcppBp8 gdmRrZNBIMay10d2YfHXVaqI3uQ9cKMtVZtzpeVV/7/g3lhb+YUwb6L3n+acE/afzfUBJql8b42 XjyJT4+Li6RowkXQvQflfHShqLeLa/G/RTtm3rLZbFyqLRDQlnk8xy4CDXAhUC3nINcLBtCpm6V RNlQPuNW0tng1PlotrpVQiXzwguafCQQAjKQ3u9k4v67vm2ZHGS+DF/jmUt7SKzpCVd1o6RfFfF Njhdr+mxk3CI8heQV4NiX6Zttm6DWqGVgMvZOY0i0bAwNjRRxyAGlQi2cZAdZ8z/jxJ+cJF0KPp Pibm7Mz9J5LY1ge/TGY0ONUCLRErpIaHoruNePPMWEtYABohy67xw7mZSSrTZevyBM61eqIO3RJ 7TUPZeBLCQ5omARFwnf5HRb1Dwn+J1YtZfzPuQGJpZzCyrt+p/RMYmt/oJbSFbM/oMF0JfsHvMo r9RouQfIELHujVQ==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-fixes-7.4

for you to fetch changes up to 5fbe2d229bd3738ed63c7c9177466ad6bc130f18:

  clk: samsung: exynos5-subcmu: Defer probe until power domains are available (2026-11-02 13:24:59 +0100)

----------------------------------------------------------------
Samsung clock drivers fixes for v7.4

1. Properly handle deferred probe of the Exynos AudioSubsystem clock
   controller.
2. Fix integration of clock controller and power domains on Exynos5250
   and Exynos5420: be sure device runtime resumed before proceeding with
   probe and defer probe till the power domain is available.

----------------------------------------------------------------
Marek Szyprowski (3):
      clk: samsung: exynos-audss: Propagate -EPROBE_DEFER from input clocks
      clk: samsung: exynos5-subcmu: Use pm_runtime_get_sync() during probe
      clk: samsung: exynos5-subcmu: Defer probe until power domains are available

 drivers/clk/samsung/clk-exynos-audss.c   | 33 +++++++++++++++++++++++---------
 drivers/clk/samsung/clk-exynos5-subcmu.c | 27 ++++++++++++++++++++++----
 2 files changed, 47 insertions(+), 13 deletions(-)
