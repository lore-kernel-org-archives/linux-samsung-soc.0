Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD99481A82;
	Thu,  4 Jun 2026 16:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780591659; cv=none; b=BOdOu14U0UVyujQdGVhXe+gd4FFi+7eJAb6IlCJ7scSbp2wg3Be6vyx6YiynK00PGJxJQJ4+P1opT0v7YvQVi/tHVnx0lQcgqOmRTvr0LaavSU/t2B42PdpdsH1aGUu00lCMje1N+uUIA5GdTuEYEGOKJfQo9LChPd6znzyuKN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780591659; c=relaxed/simple;
	bh=YPPo8chYFB6K+I/VduhClAFbvZ2Q8inq9cNixSn75as=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cCdo8/Rfnp9BTCDJSZDvT0LMome8P31/i8u0Mg4W4vV99yiDaM21F+Jhnfd0zB12P4aDdfmfwM4Ihs0IBHyOpHp2XqhJqAgjxEGcBNPv6INDjjcysOevAJ14v11fonGtz4iFysxVxzp5xJn7SFQUJe/Lr0RTDMGrl+lgjQjO9Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCPsq6i+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCPsq6i+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3415C1F00893;
	Thu,  4 Jun 2026 16:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780591658;
	bh=bzUqB8Gc1l3ZB4Tk3EJ59Avlc95OFGNMp6MXOzHPn0U=;
	h=From:To:Cc:Subject:Date;
	b=HCPsq6i+V09pfMmfGxWoKNEYyGxwupz2Nu52t1RkNAdF0kK3rtYxslp0ZSIfYJwjG
	 t0njQ6W8KVpDccxS4UAO0yQ5QWxPy/Li6Bt3Pw+rvZ+ip7+V9CCcxKwTOBaMSaMbS0
	 VApU/XyCYuFzcbM3k/qM9OAlp1HHzwV1ZIe1snH1WbUjUJgSfdl+soXu1hcwt6NqBK
	 MgayyiNn4hPA+oEXQTo+3WxhbKroODaEmIuLhfdQiPUR571FnRn/EU585VxiDrWvwO
	 DziRfjP0JoOHrkNK5rsvvTg0aQrjFHcMyLWf950Jwjm255LGlPuRU0PKTUucw+CVC0
	 aWCid2xG/b3VQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: samsung: drivers for v7.2
Date: Thu,  4 Jun 2026 18:47:25 +0200
Message-ID: <20260604164729.83284-2-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1535; i=krzk@kernel.org; h=from:subject; bh=YPPo8chYFB6K+I/VduhClAFbvZ2Q8inq9cNixSn75as=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqIawh9/qRh5P2EStG1jdge75NoukzkQxSp+Gpe IfafIhNgjaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaiGsIQAKCRDBN2bmhouD 12e/D/9szn7IdgDb1ogfGC/rerXAt1JQ4TLsuhxza6M0m9A8mUSAkPEjmH8D3/SjgR9EJM92b4N /AZOU25nzgNc0veD0E4Yt0l/aY/Ps83KdeBpEn3Q3ey80UG68fveDunU1f/aFLh4cgNpV+jgQrG KZQ7AbJ5D+KpKFfktUI5TOIbukRejrH7NwFgO4AKKvrvzmFyifnbReU4Tv8jq/dlAPKAmqeqRNe 12XfhjCPlspltebls8uOcxn7PUslM1E2y4XyTWWfmV4ZcCFjNnV01zKpWSMp4P8SIPZYk4+xaVl g5eDDH3eFHQRc/LHQTKjh1UUintVsRY/wNmRBoQftQU6QxZAdE09Pergeu73vG64ffR2W5VRP+Z Pkc5zqX0w3Fl9tzgCLxgfLGIJ+YhPbhfksbAAp/15+hJYpoqEOQOeaFm++3KibgreHRG/cGdhKO qTijaAot/jnJESCkR8CivFAUOv0CBDO5eHR6QDMmemppuySXwUKFcEjRGlsxdnYNRSVY91bMSnG p7GhKnar2ddumN3iY7jo0Kqk6ICq2RxPfMLCD6YO7U2HQmcNF499evxPTz3p9F2PH+r+04MDM4G Tc/2wEEsZBpLpu88chn8lZMQeQGO09JILx37TP6wsSmNEoDDTdgIkS69RO8CRf/XDbRM0Z1q8gT fKAx3kUWHjepdFw==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi Stephen and Michael,

Notable change outside of this pull: Peter Griffin was added as co-maintainer
to Samsung SoC and Samsung SoC clocks.  See also commit 20550601bf4 in
linux-next and
https://lore.kernel.org/all/178015858043.36212.8088079079471293822.b4-ty@b4/

Best regards,
Krzysztof


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-7.2

for you to fetch changes up to e11560b050ce867bd7d3ccea138231db54e2250a:

  clk: samsung: exynos990: Fix PERIC0/1 USI clock types (2026-05-30 18:50:36 +0200)

----------------------------------------------------------------
Samsung SoC clock drivers changes for v7.2

1. Exynos850: Mark APM (Active Power Management) I3C clocks as critical,
   because they are necessary for communication with firmware but we do
   not have any consumer of them so far.

2. Exynos990: Correct the parents of a few muxes and propagate rate
   requests up.

----------------------------------------------------------------
Alexey Klimov (1):
      clk: samsung: exynos850: mark APM I3C clocks as critical

Denzeel Oliva (1):
      clk: samsung: exynos990: Fix PERIC0/1 USI clock types

 drivers/clk/samsung/clk-exynos850.c |   5 +-
 drivers/clk/samsung/clk-exynos990.c | 307 +++++++++++++++++-------------------
 2 files changed, 146 insertions(+), 166 deletions(-)
