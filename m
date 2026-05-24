Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4085212566;
	Sun, 24 May 2026 19:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779651627; cv=none; b=RmMKXCjTJO0xLUG4B30uJHZQoitNeMqbV5CLy5WHnc54nnKkmm5vuvI/SBdI5dkWRqtgspOWHaoUF2qz0fIAGKnf7ZiEZR15ei3GEBVWlkH9iKtUCkL0vfUt0AmYT5/PUWvn6LVpBfXnsCXPkiPccyXbWDFAhxHDpQxRiLw9sRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779651627; c=relaxed/simple;
	bh=pZi3EF6xN37OjVhYJB8UhsAvxbJn68Ognpf5Zqdr4AQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WKnw4KOg0/u8Atd+d7brqK5/NF4GAPRvWdprXf8mWg2sIE5TQw5Y8LqlcanK7p54CjNvShxHIjD5e3JAOH33sl4Iz1LBJLC4v+Z/YGn0cirtCz7UV4BGi5TT+FKZBJ9VheXX0u1hneQZoWa1+WkhOOdKSRcGEYkjXaoB8nTM8Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MFGzQLmp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MFGzQLmp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240FA1F000E9;
	Sun, 24 May 2026 19:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779651626;
	bh=zBoEyETmzb2pJlpxlvi4ncneIXhLBRL6QQqybLVV9FE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MFGzQLmpiaeKnuF+BM8KzwbenS20tYHbSkw9xPD5TPep2Z52ZXIAiiTGOIFoZUaKY
	 2lqwKU+6CuTMJOT2WSJrsMSVBDNLBgi8itVkoaKVTZU3Knl2g+tpnSSVSXCtybX8Y8
	 2yubHksc0qDF22CiyV7AMjpBGWMH53ovGgUkUCi4LHLZDhuZYo3aEub0ziAh16RxjB
	 gDY63PCt6vbFeJW9ka1ZoI6MJCTABHb03My+oFUI9qIuG3QkPUkOBDpFkL4NYZuNjS
	 mgeVM3Om4MdM/d6JUjcgHg4i7A7CzKRAhPsk0VssE4AvxrQmYEhXD0cIPmsQthzBqU
	 kpYMQuvafXklQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	peter.griffin@linaro.org,
	jyescas@google.com,
	kernel-team@android.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/6] firmware: samsung: acpm: TMU support and cleanups
Date: Sun, 24 May 2026 21:40:10 +0200
Message-ID: <177965159562.32222.17454581524471571236.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
References: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1595; i=krzk@kernel.org; h=from:subject:message-id; bh=EMNz44iBB8o+uKlLf5742Rp89BhbFRUqwRB/9Ltg7nE=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqE1QaXz5H4urOzMhB25S55CD9H55mMZKGNh5/A 6Pysa50nMyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCahNUGgAKCRDBN2bmhouD 132zD/sHKWyAZBE34mXd5FejTh7Fp9zwjblu8FUeHimyj2wPWqEWm2ZivqZFjMyn7aA5uymbheH KS06Gcbkkqi1a9chSXmVVQ6MyUU3v5R1Sd6OrYPZlg6WyKzAMfcYB5eC/WF3nnHsVEDlO4Y3A+o qRYUMWnr2tIGbMihwIf3t3duzY8ZC9uAH/hsdA+Nid4qgsBiVqf9q3D8lTWxyZesYn4VEGOZHEX OPpKHKUM0W7QFbLIH9YKjUFMAnSugU+CG9miEVJ9G57vJiGI2adzMRvOya6txYbg7nOxgvZxTuA Ovogrp8uSpDpK0orOoiCoQg0YQVk1dFpLjky1DGMlsGXtqVoV3AYT56O35tDdAh7jZeJwCFfymz fvSwOUhtDd5urBSLed1KXW/BGitK2RclcGIWzOKnZjEeiyvYK1sgh6w/l0EJEH03DOgmRMEp99Y Jx73K+7Duc63/iRPAjAkv+td67OrUOgQJxSUmG5bp0HDj5dDbNjO3g8vm4rfHahNdm+c6g2xSto b7sC7N4Sk5+XfGvhcE0EDMqmqeec/pXsLYyna8M9XLpXiu0U3h2X01sOHC6lHFVqJ/NgElO5sv8 Iuu1woUxKNOojkzuItonSAoHuzZFMwXNWpHznWexhfLT9aVeVjoon/v8Ap7HkHq5wgLgFmT8VMJ oqfWZgPJIkBRi
 2A==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Fri, 15 May 2026 09:32:24 +0000, Tudor Ambarus wrote:
> This series introduces protocol support for the Exynos
> Thermal Management Unit (TMU) to the ACPM driver, alongside several
> cleanups.
> 
> Dependencies
> ============
> Krzysztof, these patches together with the acpm fixes from your `fixes`
> branch will be needed by the thermal maintainers. I'm going to send the
> ACPM TMU (thermal) driver for review. In case they'll take it for the
> next release, we'll need an immutable tag with the acpm fixes, cleanup
> and thermal helpers. Thanks!
> 
> [...]

Applied, thanks!

[1/6] firmware: samsung: acpm: Consolidate transfer initialization helper
      https://git.kernel.org/krzk/linux/c/43d3733b7ffd82b2bfeda69befa2a179335dfe6c
[2/6] firmware: samsung: acpm: Annotate rx_data->cmd with __counted_by_ptr
      https://git.kernel.org/krzk/linux/c/7b20fd06f783c1e901d34305c68df16212cdf669
[3/6] firmware: samsung: acpm: Drop redundant _ops suffix in acpm_ops members
      https://git.kernel.org/krzk/linux/c/ef1109e4b6120a52be1ea66d486d6744d0c5ac47
[4/6] firmware: samsung: acpm: Make acpm_ops const and access via pointer
      https://git.kernel.org/krzk/linux/c/e694e19bf7db26ee324ff6bb450cc523592f5bee
[5/6] firmware: samsung: acpm: Add TMU protocol support
      https://git.kernel.org/krzk/linux/c/f6af402de525d0848fc4a50f25ff01f56fc68d98
[6/6] firmware: samsung: acpm: Add devm_acpm_get_by_phandle helper
      https://git.kernel.org/krzk/linux/c/8ad2c29d53e69df5cc1c1d00513c6a0f96d2d452

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
