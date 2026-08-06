Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1173EF0BD;
	Thu,  6 Aug 2026 08:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786004360; cv=none; b=fgfzv9CMGelb7tbnWuHpKjFCgYQBtzwmouzrLbafOhy3zkcM4ScY4lt7NyehDBW6WpVA7do8Sicsl8xHq2uH3NMtr/V7b1TZjZYlJ6DzHQaXEinx5YtEAuTzhjaTXdcz8fIcZOhPE713lUEm+WYH/xS8ncQ+J5E6XsDl2Ddac+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786004360; c=relaxed/simple;
	bh=ltZzOOnh/qfs9F1SKre0GKeQ59g2TlOHTQyPYAcP8xI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JlizUV6fs+G1fMa+JDbC5M3HGeQB8CeVwswtN3AANuVhgSKxQov3jYLUG6U5S4OSLlnme9SdBo8oaYc96FmtiDXB4Wj0RzqrtuDkySH8Uclz5vmNfRg7voatONQMPZJDxWUQdeytfE6ZlLfch7iek4NO7xlpgKPFgIEIrURdiSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WbpAugg8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbpAugg8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA0841F00A3A;
	Thu,  6 Aug 2026 08:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786004358;
	bh=z5P80yRKNrlYquBxRicfrAaD3b5AK0W4qjEeMTHYgOA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WbpAugg8S00Qpei6gXsuzpNSTVMpNIJrK0CPO1RIqMyUkIC6p7Qpl1k5uF6w+XuGH
	 StaUR/WgpSVVH5TVEzmnnDbszk5F0EVxo32uxTUNB9/viuLY7mea8J40pweCXETTcW
	 o9OHmxCWdFUN4IcLDaqyQO9UxRV7ha7xJxm1teFOyJ3MmiLNvKhbWhvisunzA84n8+
	 PXLK8oh5dmfgbAQIi+T4zOaN/5HQu4fWvrQn3bx3J+0RL7SkKoHLGv5M31IrVzyHAF
	 +Q8WoFVXuumQhU7CmCY602vSb98/grH1m0V+vwO/Jdscji71l36NJunFA3BL50CZHU
	 V2mMcMGHzLWjQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 2/3] ARM: dts: samsung: dts for v7.3
Date: Thu,  6 Aug 2026 10:19:02 +0200
Message-ID: <20260806081903.165005-5-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806081903.165005-4-krzk@kernel.org>
References: <20260806081903.165005-4-krzk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=864; i=krzk@kernel.org; h=from:subject; bh=ltZzOOnh/qfs9F1SKre0GKeQ59g2TlOHTQyPYAcP8xI=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqdEN4pHKKZGPshaCMz/8QNwR3DTlgJ9J8b2Hbg 5t/Al8p/oCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanRDeAAKCRDBN2bmhouD 138oD/kBGvzT6G3+YD/2TIbaeYugcPufbrKz0aFWysCX5jAGUnbsR4xvqIW8gryDczd92IYqygC 2bWRmd3IyOb+cts5WhffhEaOR8Zc5kQ9vNbaSM1IG3Xn4394e1HskTt39nX+daWa0cGBxh8/5t1 MfZbTrwjXCZotDYYx0+FdTpkzZEm2iXYgTJDckT1iGJzZmhu/uRpkD6kYockLp1R+8d1D5Xy6W7 ry9YBprDJNwJMC28sltmUfcwMKTC5DnOl7zF90JAO1iYvlgxW4/LcB6R4EtpLOCktiQHjYq6PvR BB6ErjMZ4LEMSVXPLpAWgRY1ysjVhRrKpjZZ66G49xv/comEzl803nIQuLPEgBHNKTDGHDokBEw C9URWPGI2cz5DjUzdNPN3BeYrwas8eXDQiPVQ5PxXoOl3DiKK4HKqvyxYsfWhVcHFWKmJsnI8hx 2lqKodrP+EcyeTV7/elKtRyuBDPlBa+zLukmY17+nTZcY966+k+F/8dnswDgjc92ikHuj5llHnC 1ceZhWOxnEYbs8zNfL+xHkWUi+Rp+b2RtJ3WyaxaOLNRJHjxDHWHavTSfyweRNQ1koNlcHSDWOy V4g+yp1Dh8N6u8ogOEsuu+qjqTV9MMCXXU0kwJUOZWp0mUrrCyTPP7wCNfzZwgGEcWF1V+s+PUE 080yTc1YgILVbCg==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-7.3

for you to fetch changes up to b78d749d4ba7c217d2be644619a79a72e1fd5dfd:

  ARM: dts: exynos: Add bluetooth support to manta (2026-06-29 12:23:04 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v7.3

Add Bluetooth to Exynos5250-based Google Manta (Nexus 10) board.

----------------------------------------------------------------
Lukas Timmermann (1):
      ARM: dts: exynos: Add bluetooth support to manta

 arch/arm/boot/dts/samsung/exynos5250-manta.dts | 41 +++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)
