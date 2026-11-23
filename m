Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795443517;
	b=X5O2zMGAilf6JjgsFwvdp+JtVwEZrWQHzeKX9aOAeIQ+yC2VrPX0qSInRoT34VLzWziJ
	 fT7caiSX3h1EyCoJYHcuuYiFAkYHDjOC7CkrgupN0wV1S6B7mVck9VIy38jsEZEXag+Oi
	 uBTrrs1sXFS9huR40+d0aXTn6Qn575lBd/E6O3eEORGDQvKw/6VlY6EmqrbgDqGkGlCm2
	 xoazx7viIP9KJMLmU/UAslQ3TBTd6qvBx+H0Nj6C4m2crBtzjc805AeIGHD/Jl9FHnVmF
	 FzEkQKmm6d953Lg4lWuc3/2SE3M/w4zigoE+1bsF13s7uKm9vB5Fj6GKFyD9QHfGbeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443517;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=ZAbdU1E0UWlF0B5Kvmlnc2ciXN2DI05pM1hOa18PycY=;
	b=dIC+GneIlQiwmbRVrVzfOdWLKm3QD2fXfN5dw5Vdd5yUmM15y1+0HihXV8KaCnJ8k8w5
	 GcOALqPQeP2adhZWjYA/59CV4jg8TTchdyyM1PGPv2bhap7oWkY68AvQNF370wMjIweel
	 XEGm9IEP7KatvLXpry3MgkFLA8anh2lCTToUjb7bL3OY7NDEdqLvLJMzdj2GSXf/9tVdE
	 QoodbSlcAcrpPTLVFph8nlqE/8EykVjJynYyiT5cM2ibXIZUVYNB6MAIDqKF91fGtsr3C
	 sQP0lQq8Wh4nV89MN81quw3Are9bkJWbcG4zmdYB3tm7TZSbxAfP2UMZz1Zez9fL71Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mMhKPGRZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DC9606A68C;
	Mon, 23 Nov 2026 14:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mMhKPGRZ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795443516;
	b=GTwSx9P5T7WaZ2l91GMmDPl46gkjY+KHZrLc8vDg67TjXrObo/h51dMbfsojkK8sFIvD
	 YD60c1GqvAJVURcLrRboIEXuT8K5tiDT8welKf8cC0DXm/g86vLh4MZ1TpSC+w2TLto+i
	 +2GweywvlLkTBkjPmAskriD1ZazsqCG4X/WEoRRdJOqWiO8xwuFUdLKal4lKUF4Lppj1N
	 SIIVvOtc6kuiWq1Iy1wBwQfyIRn7hJ9JVptLdkeECE+2WlM4bPSHAJK0yza4rl6xSNhYb
	 /aN2h4jDVev/ujT8A88NHqDTBYkn7l6AMKixhn6tuSI4ImCCxYuENkCfP6opvxY7jrg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795443516;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ZAbdU1E0UWlF0B5Kvmlnc2ciXN2DI05pM1hOa18PycY=;
	b=FEqIDQzGnA11AoSoRqxdGJskGg2Y1DCNBbEhTR7ljUB0Jx3p4VInvzLlkmBQh0z5Fen0
	 PHIp4oK1Ir8wnkTBH5gHbzKZfEzKmGWjlBYPgD7cJkrKZCigLRpzTMuNwm4xWhxS/+cZ1
	 61usgE4TqkTBbbBThiXxzSIhI8MHaAcPEcqaLgFTso0seiyvfRnQtr71hMRnkznOk8Ue4
	 6IhtxfTyNKEuph6JtJFNlgRrblTNhuzjSSXqsHB4DBDONAm3kZpR8PuUxnHsY6wcTaI+o
	 ML4wXCwM0IS9MUhgVMgguWqaq51Kdk3Nzm+EbR7iiAmcQQJ0zeWhpJcprnxAQEBod7Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D7D4B1F00A19;
	Mon, 23 Nov 2026 14:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795443516;
	bh=ZAbdU1E0UWlF0B5Kvmlnc2ciXN2DI05pM1hOa18PycY=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=mMhKPGRZCBdRU3x+yhjyMjxT7JzQSBXuezi0ea8HtQStG++iCCTGhCucp4EOHkfc0
	 RChQXaQrPGWcng2ArQt4M+zmo53LbOolXwBWebXemXS1xXFFqfhAbiSLd+wjAb0n3/
	 k2crfwZF9h+DDY7LRDhCBr3vdGJqBfjSQ1hea/dX6eWW5F51ArmYfp51JlzPtIGpmW
	 FIJU9YFwR5FPb3evCilcN4DVVwzQ7QYkeCDjXOoPgnaeqOEuT/aDVnHpTXpsAeOBDm
	 PLffiqHVKvo1acf5tHjgC9XlhCseOXT9/mcsRRaYDEH1evoWaEtWLKitaZSC8ks2J/
	 LzHKVjFILcfTw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6D56B4C4D0;
	Mon, 23 Nov 2026 14:18:25 +0000 (UTC)
From: Shigeaki Asai via B4 Relay <devnull+y-asai.0816.docomonet.jp@kernel.org>
Subject: [PATCH RFC 0/2] clk: samsung: exynos5: fix sub-CMU power domain
 attach
Date: Mon, 23 Nov 2026 23:18:22 +0900
Message-Id: <20261123-exynos5-subcmu-defer-v1-0-43aef47d4f2b@docomonet.jp>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC5LBGsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyNj3dSKyrz8YlPd4tKk5NxS3ZTUtNQiXfOUROM0CxMLi2SzFCWg1oK
 i1LTMCrCx0UpBbs5KsRBBoKas1OQSkIFKtbUA2Mmnmn0AAAA=
X-Change-ID: 20261123-exynos5-subcmu-defer-7da3f8488c6d
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Shigeaki Asai <y-asai.0816@docomonet.jp>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795443504; l=2873;
 i=y-asai.0816@docomonet.jp; s=20261004; h=from:subject:message-id;
 bh=4fZjdy8kIZ+rBxv7aI3zGOWNd3D+cxfIlXqC2oK3nDA=;
 b=HnVIZ4Tampt3/AOjtHc5tpxc+IWZgY08VU6KnqF08rIqiTeEJ6rz4aW+mQCiM0dsnMBxTxwS1
 e4NEMZ8T+leBElW7vK9J+Yl0JUnTk069tm9KfAOLR7wcvhMhc/Vdgqt
X-Developer-Key: i=y-asai.0816@docomonet.jp; a=ed25519;
 pk=jkd95ViSn8i/X3oPMHYG1A8mae8IOwOKGE64kzLqC5c=
X-Endpoint-Received: by B4 Relay for y-asai.0816@docomonet.jp/20261004 with
 auth_id=1110
X-Original-From: Shigeaki Asai <y-asai.0816@docomonet.jp>
Reply-To: y-asai.0816@docomonet.jp

Since commit c09a3e6c97f0 ("soc: samsung: pm_domains: Convert to regular
platform driver"), the exynos-pd platform driver registers the power
domains too late for exynos5-subcmu, so the sub-CMUs are not attached to
them and their clock setup is not restored. On ODROID-XU4 this drops the
GPU performance badly (about 3.5 fps in the Kodi menu, with repeated
panfrost "gpu sched timeout").

This series fixes it as follows:
- Make the exynos5-clock probe wait until the power domains are
  registered, so the sub-CMUs are attached to them.
- Also make audss wait for pll_in. As a side effect of making the
  sub-CMUs wait, audss would otherwise probe before pll_in exists and
  generate audio from the 24 MHz pll_ref, which causes audio stuttering.

However, this relies on deferred probe, which conflicts with the move 
towards platform_driver_probe(), and the sub-CMU clock data is
__initconst, so the deferred probe has to finish before init memory is
freed. So I would like to discuss the preferred way to fix it.

This may also explain the oopses seen in the RFC series "clk: samsung:
Use platform_driver_probe() to avoid __refdata". Krzysztof saw them
when converting exynos5-subcmu, and Stephen pointed out that
platform_driver_probe() is incompatible with deferred probe. The
sub-CMUs have to wait for their power domains, so exynos5-subcmu
probably cannot use platform_driver_probe() as long as exynos-pd is a
regular platform driver.
https://lore.kernel.org/all/20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org/

Testing:
- Tested on ODROID-XU4 with a Linux 7.3 based LibreELEC kernel:
  every power domain now has an exynos5-subcmu device attached in
  pm_genpd_summary, the Kodi menu went from about 3.5 fps to 25-30 fps,
  "gpu sched timeout" went from 17 to 0, and there is no audio
  stuttering.
- On next/clk, only build-tested (exynos_defconfig, W=1) and checked
  with checkpatch. I have not booted next/clk on the hardware.
- These patches are already carried in LibreELEC.

I investigated the root cause and wrote these patches and the commit
messages with the help of Claude (claude-opus-5-5). I reviewed the
changes and tested them on the hardware as described above.

Thanks,
Shigeaki

Signed-off-by: Shigeaki Asai <y-asai.0816@docomonet.jp>
---
Shigeaki Asai (2):
      clk: samsung: exynos-audss: defer probe until pll_in is available
      clk: samsung: exynos5-subcmu: defer probe until power domains are registered

 drivers/clk/samsung/clk-exynos-audss.c   |  3 ++
 drivers/clk/samsung/clk-exynos5-subcmu.c | 85 ++++++++++++++++++++++----------
 2 files changed, 61 insertions(+), 27 deletions(-)
---
base-commit: 783214e3268f71296cb6f62669b0daced0ac249d
change-id: 20261123-exynos5-subcmu-defer-7da3f8488c6d

Best regards,
--  
Shigeaki Asai <y-asai.0816@docomonet.jp>


